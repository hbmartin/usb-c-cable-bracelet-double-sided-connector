; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 18m 51s; total estimated time: 25m 8s
; total layer number: 85
; total filament length [mm] : 1522.11
; total filament volume [cm^3] : 3661.10
; total filament weight [g] : 4.54
; model label id: 394,405
; object max height: 17.00,8.40
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
M73 P0 R25
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
M73 P2 R24
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R24
G1 X-48.2 F3000
M73 P4 R24
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
M73 P5 R23
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
    
M73 P6 R23
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
M73 P23 R19
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
M73 P24 R19
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
    G29 A1 X103.5 Y113 I48.9999 J30
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
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M73 P24 R18
G1 X151.582 Y113.918 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X151.582 Y142.082 E1.04899
G1 X140.418 Y142.082 E.41584
G1 X140.418 Y113.918 E1.049
G1 X151.522 Y113.918 E.41361
M204 S6000
G1 X151.86 Y113.501 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X152.039 Y113.808 I-.161 J.301 E.01393
G1 X152.039 Y142.192 E1.05718
G3 X151.713 Y142.539 I-.351 J-.003 E.01952
G1 X140.308 Y142.539 E.42476
G3 X139.961 Y142.188 I.003 J-.351 E.02044
G1 X139.961 Y113.808 E1.05703
G3 X140.287 Y113.461 I.351 J.003 E.01952
G1 X151.733 Y113.462 E.42629
G3 X151.804 Y113.478 I-.034 J.339 E.00274
; WIPE_START
G1 X151.962 Y113.585 E-.07257
G1 X152.024 Y113.702 E-.05022
G1 X152.039 Y113.808 E-.04088
G1 X152.039 Y115.377 E-.59633
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 1 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer1 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X151.4 Y115.039 F42000
M73 P25 R18
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5066
G1 F6300
M204 S500
G1 X150.667 Y114.306 E.03913
G1 X150.012 Y114.306 E.02478
G1 X151.194 Y115.489 E.06317
G1 X151.194 Y116.144 E.02478
G1 X149.356 Y114.306 E.09821
G1 X148.7 Y114.307 E.02478
G1 X151.194 Y116.8 E.13325
G1 X151.194 Y117.456 E.02478
G1 X148.044 Y114.307 E.16829
G1 X147.389 Y114.307 E.02478
G1 X151.194 Y118.112 E.20333
G1 X151.194 Y118.767 E.02478
G1 X146.733 Y114.307 E.23836
G1 X146.077 Y114.307 E.02478
G1 X151.194 Y119.423 E.2734
G1 X151.194 Y120.079 E.02478
G1 X145.422 Y114.307 E.30844
G1 X144.766 Y114.307 E.02478
G1 X151.194 Y120.735 E.34348
G1 X151.194 Y121.39 E.02478
G1 X144.11 Y114.307 E.37851
G1 X143.454 Y114.307 E.02478
G1 X151.194 Y122.046 E.41355
G1 X151.194 Y122.702 E.02478
G1 X142.799 Y114.307 E.44859
G1 X142.143 Y114.307 E.02478
G1 X151.194 Y123.358 E.48363
G1 X151.194 Y124.013 E.02478
G1 X141.487 Y114.307 E.51866
G1 X140.832 Y114.307 E.02478
G1 X151.194 Y124.669 E.5537
G1 X151.194 Y125.325 E.02478
G1 X140.806 Y114.937 E.55506
G1 X140.806 Y115.593 E.02478
G1 X151.194 Y125.981 E.55506
G1 X151.194 Y126.636 E.02478
G1 X140.806 Y116.249 E.55506
G1 X140.806 Y116.904 E.02478
G1 X151.194 Y127.292 E.55506
G1 X151.194 Y127.948 E.02478
G1 X140.806 Y117.56 E.55506
G1 X140.806 Y118.216 E.02478
G1 X151.194 Y128.604 E.55506
G1 X151.194 Y129.259 E.02478
G1 X140.806 Y118.872 E.55506
G1 X140.806 Y119.527 E.02478
G1 X151.194 Y129.915 E.55506
G1 X151.194 Y130.571 E.02478
G1 X140.806 Y120.183 E.55506
G1 X140.806 Y120.839 E.02478
G1 X151.194 Y131.227 E.55506
G1 X151.194 Y131.882 E.02478
G1 X140.806 Y121.495 E.55506
G1 X140.806 Y122.15 E.02478
G1 X151.194 Y132.538 E.55506
G1 X151.194 Y133.194 E.02478
G1 X140.806 Y122.806 E.55506
G1 X140.806 Y123.462 E.02478
G1 X151.194 Y133.85 E.55506
G1 X151.194 Y134.505 E.02478
G1 X140.806 Y124.118 E.55506
G1 X140.806 Y124.773 E.02478
G1 X151.194 Y135.161 E.55506
G1 X151.194 Y135.817 E.02478
G1 X140.806 Y125.429 E.55506
G1 X140.806 Y126.085 E.02478
G1 X151.194 Y136.472 E.55506
G1 X151.194 Y137.128 E.02478
G1 X140.806 Y126.741 E.55506
G1 X140.806 Y127.396 E.02478
G1 X151.194 Y137.784 E.55506
G1 X151.194 Y138.44 E.02478
G1 X140.806 Y128.052 E.55506
G1 X140.806 Y128.708 E.02478
G1 X151.194 Y139.095 E.55506
G1 X151.194 Y139.751 E.02478
G1 X140.806 Y129.363 E.55506
G1 X140.806 Y130.019 E.02478
G1 X151.194 Y140.407 E.55506
G1 X151.194 Y141.063 E.02478
G1 X140.806 Y130.675 E.55506
G1 X140.806 Y131.331 E.02478
G1 X151.169 Y141.693 E.55371
G1 X150.513 Y141.693 E.02478
G1 X140.806 Y131.986 E.51867
G1 X140.806 Y132.642 E.02478
M73 P26 R18
G1 X149.857 Y141.693 E.48364
G1 X149.201 Y141.693 E.02477
G1 X140.806 Y133.298 E.4486
G1 X140.806 Y133.954 E.02478
G1 X148.546 Y141.693 E.41356
G1 X147.89 Y141.693 E.02477
G1 X140.806 Y134.609 E.37853
G1 X140.806 Y135.265 E.02478
G1 X147.234 Y141.693 E.34349
G1 X146.579 Y141.693 E.02478
G1 X140.806 Y135.921 E.30845
G1 X140.806 Y136.577 E.02478
G1 X145.923 Y141.693 E.27341
G1 X145.267 Y141.693 E.02477
G1 X140.806 Y137.232 E.23838
G1 X140.806 Y137.888 E.02478
G1 X144.612 Y141.694 E.20334
G1 X143.956 Y141.694 E.02477
G1 X140.806 Y138.544 E.1683
G1 X140.806 Y139.2 E.02478
G1 X143.3 Y141.694 E.13327
G1 X142.644 Y141.694 E.02478
G1 X140.806 Y139.855 E.09823
G1 X140.806 Y140.511 E.02478
G1 X141.989 Y141.694 E.06319
G1 X141.333 Y141.694 E.02477
G1 X140.6 Y140.961 E.03915
; OBJECT_ID: 394
; WIPE_START
G1 X141.333 Y141.694 E-.3937
G1 X141.989 Y141.694 E-.24916
G1 X141.771 Y141.476 E-.11714
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S6000
G1 X135.186 Y137.616 Z.6 F42000
G1 X125.387 Y131.871 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X115.848 Y130.616 E.35837
G2 X115.148 Y130.616 I-.347 J3.578 E.02611
G1 X105.613 Y131.871 E.35821
G1 X104.756 Y125.363 E.24451
G1 X114.271 Y124.11 E.35744
G3 X115.801 Y124.036 I1.376 J12.537 E.05709
G3 X116.729 Y124.11 I-.374 J10.513 E.03472
G1 X126.242 Y125.363 E.35735
G1 X125.395 Y131.812 E.24228
M204 S6000
G1 X125.782 Y132.376 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X125.706 Y132.374 I-.033 J-.241 E.00284
G1 X115.798 Y131.07 E.37221
G2 X115.2 Y131.07 I-.298 J2.979 E.0223
G1 X105.294 Y132.374 E.37214
G3 X105.218 Y132.376 I-.043 J-.241 E.00284
G1 X104.247 Y124.976 E.27798
G3 X104.314 Y124.96 I.101 J.271 E.00257
G1 X114.216 Y123.656 E.372
G3 X115.81 Y123.579 I1.439 J13.159 E.05951
G3 X116.784 Y123.656 I-.381 J10.938 E.0364
G1 X126.686 Y124.96 E.372
G3 X126.756 Y124.978 I-.043 J.32 E.00267
G1 X125.79 Y132.317 E.27571
; WIPE_START
G1 X125.706 Y132.374 E-.03871
G1 X123.824 Y132.127 E-.72129
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.929 Y126.337 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5
G1 F6300
M204 S500
G1 X125.211 Y125.619 E.03784
G1 X124.467 Y125.521 E.02797
G1 X125.671 Y126.725 E.06344
G1 X125.596 Y127.296 E.02146
G1 X123.722 Y125.423 E.0987
G1 X122.978 Y125.325 E.02797
G1 X125.521 Y127.868 E.13396
G1 X125.446 Y128.439 E.02146
G1 X122.233 Y125.227 E.16922
G1 X121.489 Y125.129 E.02797
G1 X125.371 Y129.011 E.20447
G1 X125.296 Y129.582 E.02146
G1 X120.745 Y125.031 E.23973
G1 X120 Y124.933 E.02797
G1 X125.221 Y130.153 E.27499
G1 X125.146 Y130.725 E.02146
G1 X119.256 Y124.835 E.31025
G1 X118.511 Y124.737 E.02797
G1 X125.071 Y131.296 E.34551
G1 X125.052 Y131.436 E.00524
G1 X124.49 Y131.361 E.02114
G1 X117.767 Y124.639 E.35411
G1 X117.022 Y124.541 E.02797
G1 X123.745 Y131.263 E.35411
G1 X123.001 Y131.165 E.02797
G1 X116.288 Y124.453 E.35358
G2 X115.614 Y124.425 I-.876 J13.066 E.02513
G1 X122.256 Y131.067 E.34988
G1 X121.512 Y130.969 E.02797
G1 X114.981 Y124.438 E.34403
G1 X114.386 Y124.49 E.02222
G1 X120.768 Y130.871 E.33613
G1 X120.023 Y130.773 E.02797
G1 X113.812 Y124.563 E.32715
G1 X113.241 Y124.638 E.02146
G1 X119.279 Y130.675 E.31803
G1 X118.534 Y130.577 E.02797
G1 X112.67 Y124.713 E.30891
G1 X112.099 Y124.788 E.02146
G1 X117.79 Y130.479 E.29978
G1 X117.045 Y130.381 E.02797
G1 X111.527 Y124.863 E.29066
G1 X110.956 Y124.939 E.02146
G1 X116.301 Y130.283 E.28154
G2 X115.581 Y130.21 I-.893 J5.175 E.02698
G1 X110.385 Y125.014 E.2737
G1 X109.814 Y125.089 E.02146
G1 X114.972 Y130.247 E.27172
G1 X114.401 Y130.323 E.02146
G1 X109.243 Y125.164 E.27172
G1 X108.671 Y125.239 E.02146
G1 X113.83 Y130.398 E.27172
G1 X113.259 Y130.473 E.02146
G1 X108.1 Y125.315 E.27172
G1 X107.529 Y125.39 E.02146
G1 X112.687 Y130.548 E.27172
G1 X112.116 Y130.623 E.02146
G1 X106.958 Y125.465 E.27172
G1 X106.386 Y125.54 E.02146
G1 X111.545 Y130.699 E.27172
G1 X110.974 Y130.774 E.02146
M73 P27 R18
G1 X105.815 Y125.615 E.27172
G1 X105.244 Y125.691 E.02146
G1 X110.403 Y130.849 E.27172
G1 X109.831 Y130.924 E.02146
G1 X105.281 Y126.374 E.23969
G1 X105.379 Y127.118 E.02797
G1 X109.26 Y130.999 E.20444
G1 X108.689 Y131.075 E.02146
G1 X105.477 Y127.863 E.16919
G1 X105.575 Y128.607 E.02797
G1 X108.118 Y131.15 E.13394
G1 X107.547 Y131.225 E.02146
G1 X105.673 Y129.351 E.09869
G1 X105.771 Y130.096 E.02797
G1 X106.975 Y131.3 E.06344
G1 X106.404 Y131.375 E.02146
G1 X105.63 Y130.601 E.04077
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X106.404 Y131.375 E-.416
G1 X106.975 Y131.3 E-.21893
G1 X106.743 Y131.067 E-.12507
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 2/85
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S198.9
; open powerlost recovery
M1003 S1
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I.439 J1.135 P1  F42000
G1 X151.787 Y113.637 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X151.843 Y113.683 E.00238
G1 X151.877 Y113.746 E.00239
G1 X151.885 Y113.81 E.00212
G1 X151.881 Y142.236 E.94295
G3 X151.702 Y142.384 I-.19 J-.047 E.00826
G1 X140.264 Y142.381 E.3794
G3 X140.115 Y142.178 I.043 J-.188 E.00912
G1 X140.119 Y113.764 E.94253
G3 X140.298 Y113.616 I.19 J.047 E.00826
G1 X151.718 Y113.616 E.37879
G1 X151.73 Y113.62 E.00042
M204 S250
G1 X151.902 Y113.262 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4800
M204 S5000
G1 X151.921 Y113.267 E.0006
G3 X152.277 Y113.8 I-.223 J.535 E.02086
G1 X152.277 Y141.595 E.85406
G3 X152.274 Y142.257 I-6.743 J.3 E.02035
G3 X152.109 Y142.606 I-.654 J-.094 E.01206
G1 F5700
G3 X151.813 Y142.766 I-.5 J-.577 E.01043
G1 F4800
G1 X140.905 Y142.777 E.33515
G3 X140.243 Y142.774 I-.301 J-6.719 E.02035
G3 X139.723 Y142.192 I.062 J-.58 E.02629
G1 X139.723 Y114.405 E.85381
G3 X139.726 Y113.743 I6.743 J-.3 E.02035
G3 X139.891 Y113.394 I.654 J.094 E.01206
G1 F5700
G3 X140.187 Y113.234 I.5 J.577 E.01043
G1 F4800
G1 X151.1 Y113.223 E.33532
G3 X151.756 Y113.226 I.3 J6.397 E.02017
G1 X151.844 Y113.248 E.00277
; WIPE_START
M204 S6000
G1 X151.921 Y113.267 E-.03017
G1 X152.108 Y113.392 E-.08548
G1 X152.233 Y113.579 E-.08556
G1 X152.277 Y113.8 E-.08545
G1 X152.277 Y115.045 E-.47334
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 2 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer2 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.288 Y114.552 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42456
G1 F9432.973
M204 S6000
G1 X140.891 Y113.949 E.02651
G1 X141.431 Y113.949 E.01678
G1 X140.458 Y114.922 E.04279
G1 X140.458 Y115.462 E.01679
G1 X141.97 Y113.949 E.06653
G1 X142.51 Y113.949 E.01678
G1 X140.457 Y116.002 E.09028
G1 X140.457 Y116.542 E.01679
G1 X143.05 Y113.949 E.11402
G1 X143.589 Y113.949 E.01678
G1 X140.457 Y117.082 E.13776
G1 X140.457 Y117.622 E.01679
G1 X144.129 Y113.949 E.16151
G1 X144.669 Y113.949 E.01678
G1 X140.457 Y118.161 E.18525
G1 X140.456 Y118.701 E.01679
G1 X145.209 Y113.949 E.209
G1 X145.748 Y113.949 E.01678
G1 X140.456 Y119.241 E.23274
G1 X140.456 Y119.781 E.01679
G1 X146.288 Y113.949 E.25649
G1 X146.828 Y113.949 E.01678
G1 X140.456 Y120.321 E.28023
G1 X140.456 Y120.861 E.01679
G1 X147.367 Y113.949 E.30397
G1 X147.907 Y113.949 E.01678
G1 X140.455 Y121.401 E.32772
G1 X140.455 Y121.941 E.01679
G1 X148.447 Y113.949 E.35146
G1 X148.986 Y113.949 E.01678
G1 X140.455 Y122.481 E.37521
G1 X140.455 Y123.021 E.01679
G1 X149.526 Y113.95 E.39895
G1 X150.066 Y113.95 E.01678
G1 X140.455 Y123.561 E.4227
G1 X140.455 Y124.1 E.01679
G1 X150.605 Y113.95 E.44644
G1 X151.145 Y113.95 E.01678
G1 X140.454 Y124.64 E.47018
G1 X140.454 Y125.18 E.01679
G1 X151.552 Y114.083 E.48808
G1 X151.552 Y114.623 E.01679
G1 X140.454 Y125.72 E.48808
G1 X140.454 Y126.26 E.01679
G1 X151.551 Y115.163 E.48808
G1 X151.551 Y115.702 E.01679
G1 X140.454 Y126.8 E.48808
G1 X140.453 Y127.34 E.01679
G1 X151.551 Y116.242 E.48808
G1 X151.551 Y116.782 E.01679
G1 X140.453 Y127.88 E.48808
G1 X140.453 Y128.42 E.01679
G1 X151.551 Y117.322 E.48808
G1 X151.55 Y117.862 E.01679
G1 X140.453 Y128.96 E.48808
G1 X140.453 Y129.5 E.01679
G1 X151.55 Y118.402 E.48808
G1 X151.55 Y118.942 E.01679
G1 X140.452 Y130.04 E.48808
G1 X140.452 Y130.579 E.01679
G1 X151.55 Y119.482 E.48808
G1 X151.55 Y120.022 E.01679
G1 X140.452 Y131.119 E.48808
G1 X140.452 Y131.659 E.01679
G1 X151.549 Y120.562 E.48808
G1 X151.549 Y121.102 E.01679
G1 X140.452 Y132.199 E.48808
G1 X140.451 Y132.739 E.01679
G1 X151.549 Y121.641 E.48808
G1 X151.549 Y122.181 E.01679
G1 X140.451 Y133.279 E.48808
G1 X140.451 Y133.819 E.01679
G1 X151.549 Y122.721 E.48808
G1 X151.548 Y123.261 E.01679
G1 X140.451 Y134.359 E.48808
G1 X140.451 Y134.899 E.01679
G1 X151.548 Y123.801 E.48808
G1 X151.548 Y124.341 E.01679
G1 X140.45 Y135.439 E.48808
G1 X140.45 Y135.979 E.01679
G1 X151.548 Y124.881 E.48808
G1 X151.548 Y125.421 E.01679
G1 X140.45 Y136.518 E.48808
G1 X140.45 Y137.058 E.01679
G1 X151.548 Y125.961 E.48808
G1 X151.547 Y126.501 E.01679
G1 X140.45 Y137.598 E.48808
G1 X140.45 Y138.138 E.01679
G1 X151.547 Y127.041 E.48808
G1 X151.547 Y127.581 E.01679
G1 X140.449 Y138.678 E.48808
G1 X140.449 Y139.218 E.01679
G1 X151.547 Y128.12 E.48808
G1 X151.547 Y128.66 E.01679
G1 X140.449 Y139.758 E.48808
G1 X140.449 Y140.298 E.01679
G1 X151.546 Y129.2 E.48808
G1 X151.546 Y129.74 E.01679
G1 X140.449 Y140.838 E.48808
G1 X140.448 Y141.378 E.01679
G1 X151.546 Y130.28 E.48808
G1 X151.546 Y130.82 E.01679
G1 X140.448 Y141.918 E.48808
G1 X140.448 Y142.042 E.00387
G1 X140.863 Y142.042 E.01291
G1 X151.546 Y131.36 E.46981
G1 X151.545 Y131.9 E.01679
G1 X141.403 Y142.043 E.44609
G1 X141.942 Y142.043 E.01677
G1 X151.545 Y132.44 E.42236
G1 X151.545 Y132.98 E.01679
G1 X142.481 Y142.044 E.39864
G1 X143.02 Y142.044 E.01677
G1 X151.545 Y133.52 E.37491
G1 X151.545 Y134.059 E.01679
G1 X143.56 Y142.044 E.35118
G1 X144.099 Y142.045 E.01677
G1 X151.544 Y134.599 E.32746
G1 X151.544 Y135.139 E.01679
G1 X144.638 Y142.045 E.30373
M73 P28 R18
G1 X145.178 Y142.046 E.01677
G1 X151.544 Y135.679 E.28
G1 X151.544 Y136.219 E.01679
G1 X145.717 Y142.046 E.25628
G1 X146.256 Y142.047 E.01677
G1 X151.544 Y136.759 E.23255
G1 X151.544 Y137.299 E.01679
G1 X146.795 Y142.047 E.20882
G1 X147.335 Y142.047 E.01677
G1 X151.543 Y137.839 E.1851
G1 X151.543 Y138.379 E.01679
G1 X147.874 Y142.048 E.16137
G1 X148.413 Y142.048 E.01677
G1 X151.543 Y138.919 E.13765
G1 X151.543 Y139.459 E.01679
G1 X148.953 Y142.049 E.11392
G1 X149.492 Y142.049 E.01677
G1 X151.543 Y139.998 E.09019
G1 X151.542 Y140.538 E.01679
G1 X150.031 Y142.05 E.06647
G1 X150.57 Y142.05 E.01677
G1 X151.542 Y141.078 E.04274
G1 X151.542 Y141.618 E.01679
G1 X150.94 Y142.22 E.02647
; OBJECT_ID: 394
; WIPE_START
G1 X151.542 Y141.618 E-.32344
G1 X151.542 Y141.078 E-.20516
G1 X151.112 Y141.509 E-.2314
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X143.945 Y138.884 Z.8 F42000
G1 X125.762 Y132.226 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.818 Y130.917 E.33268
G2 X115.182 Y130.917 I-.318 J4.271 E.02114
G1 X105.238 Y132.226 E.33268
G1 X104.303 Y125.117 E.23783
G1 X114.233 Y123.81 E.33224
G3 X115.868 Y123.735 I1.41 J12.821 E.05435
G3 X116.768 Y123.81 I-.54 J11.857 E.02995
G1 X126.697 Y125.117 E.33223
G1 X125.769 Y132.167 E.23586
M204 S250
G1 X125.798 Y132.623 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4800
M204 S5000
G3 X125.113 Y132.536 I.718 J-8.436 E.02119
G1 X115.772 Y131.306 E.28952
G1 F5250.435
G1 X115.68 Y131.296 E.00282
G1 F4800
G2 X114.633 Y131.385 I-.143 J4.56 E.03236
G1 X105.864 Y132.539 E.27178
G1 F5700
G1 X105.269 Y132.617 E.01844
G1 F3715.011
G1 X105.18 Y132.623 E.00274
G1 F3000
G1 X105.112 Y132.624 E.0021
G1 F2760
G1 X105.057 Y132.618 E.00169
G1 F2520
G1 X105.016 Y132.61 E.00128
G1 F2400
G1 X104.988 Y132.602 E.00092
G1 F2160
G1 X104.949 Y132.583 E.00132
G1 F2040
G1 X104.923 Y132.565 E.00097
G1 F1920
G1 X104.902 Y132.544 E.00091
M106 S255
G1 F1800
G1 X104.889 Y132.524 E.00075
M106 S198.9
M106 S255
G1 F1680
G1 X104.88 Y132.5 E.00077
G3 X103.965 Y125.559 I1077.71 J-145.574 E.21511
G1 X103.891 Y124.909 E.02012
M106 S198.9
M106 S255
G1 F1800
G1 X103.904 Y124.879 E.00101
M106 S198.9
G1 F1920
G1 X103.912 Y124.867 E.00044
G1 F2040
G1 X103.945 Y124.834 E.00144
G1 F2280
G1 X103.99 Y124.803 E.00167
G1 F2640
G1 X104.049 Y124.776 E.00201
G1 F2880
G1 X104.145 Y124.748 E.00305
G1 F4800
G1 X104.541 Y124.693 E.01229
G1 X104.849 Y124.65 E.00955
G1 X113.591 Y123.499 E.27093
G3 X115.877 Y123.343 I1.949 J11.704 E.07052
G3 X117.409 Y123.499 I-1.587 J23.144 E.04735
G1 X126.127 Y124.647 E.27018
G1 X126.46 Y124.693 E.01032
G1 X126.856 Y124.748 E.01229
G1 F2880
G1 X126.95 Y124.776 E.00302
G1 F2640
G1 X127.014 Y124.805 E.00215
G1 F2400
G1 X127.039 Y124.821 E.00092
G1 F2160
G1 X127.061 Y124.839 E.00086
G1 F2040
G1 X127.078 Y124.855 E.00072
G1 F1920
G1 X127.1 Y124.887 E.00119
M106 S255
G1 F1800
G1 X127.112 Y124.916 E.00097
M106 S198.9
M106 S255
G1 F1680
G1 X126.201 Y131.889 E.21607
G3 X126.12 Y132.5 I-4.907 J-.343 E.01896
G1 X126.107 Y132.531 E.00103
M106 S198.9
M106 S255
G1 F1800
G1 X126.091 Y132.553 E.00084
M106 S198.9
G1 F1920
G1 X126.067 Y132.573 E.00096
G1 F2040
G1 X126.054 Y132.582 E.00049
G1 F2160
G1 X126.013 Y132.601 E.0014
G1 F2400
G1 X125.983 Y132.611 E.00095
G1 F2520
G1 X125.936 Y132.619 E.00146
G1 F2880
G1 X125.863 Y132.624 E.00225
G1 F3000
G1 X125.857 Y132.624 E.00017
; WIPE_START
M204 S6000
G1 X125.113 Y132.536 E-.28473
G1 X123.873 Y132.373 E-.47528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.94 Y131.953 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42358
G1 F9457.259
M204 S6000
G1 X125.54 Y131.353 E.02633
G1 X125.622 Y130.733 E.0194
G1 X124.616 Y131.739 E.04415
G1 X124.14 Y131.676 E.01488
G1 X125.704 Y130.113 E.0686
G1 X125.785 Y129.493 E.0194
G1 X123.664 Y131.614 E.09304
G1 X123.188 Y131.551 E.01488
G1 X125.867 Y128.873 E.11749
G1 X125.948 Y128.253 E.0194
G1 X122.713 Y131.489 E.14194
G1 X122.237 Y131.426 E.01488
G1 X126.03 Y127.633 E.16639
G1 X126.112 Y127.013 E.0194
G1 X121.761 Y131.363 E.19084
G1 X121.286 Y131.301 E.01488
G1 X126.193 Y126.393 E.21529
G1 X126.275 Y125.773 E.0194
G1 X120.81 Y131.238 E.23974
G1 X120.334 Y131.175 E.01488
G1 X126.131 Y125.379 E.25429
G1 X125.655 Y125.316 E.01488
G1 X119.858 Y131.113 E.25429
G1 X119.383 Y131.05 E.01488
G1 X125.18 Y125.253 E.25429
G1 X124.704 Y125.191 E.01488
G1 X118.907 Y130.988 E.25429
G1 X118.431 Y130.925 E.01488
G1 X124.228 Y125.128 E.25429
G1 X123.752 Y125.066 E.01488
G1 X117.956 Y130.862 E.25429
G1 X117.48 Y130.8 E.01488
G1 X123.277 Y125.003 E.25429
G1 X122.801 Y124.94 E.01488
G1 X117.004 Y130.737 E.25429
G1 X116.528 Y130.674 E.01488
G1 X122.325 Y124.878 E.25429
G1 X121.85 Y124.815 E.01488
G1 X116.053 Y130.612 E.25429
G2 X115.56 Y130.566 I-.598 J3.759 E.01536
G1 X121.374 Y124.752 E.25503
G1 X120.898 Y124.69 E.01488
G1 X114.98 Y130.607 E.25959
G1 X114.361 Y130.689 E.01939
G1 X120.422 Y124.627 E.26592
G1 X119.947 Y124.565 E.01488
G1 X113.741 Y130.771 E.27224
G1 X113.121 Y130.852 E.01939
G1 X119.471 Y124.502 E.27857
G1 X118.995 Y124.439 E.01488
G1 X112.501 Y130.934 E.2849
G1 X111.881 Y131.015 E.01939
G1 X118.52 Y124.377 E.29122
G1 X118.044 Y124.314 E.01488
G1 X111.261 Y131.097 E.29755
G1 X110.641 Y131.178 E.01939
G1 X117.568 Y124.251 E.30387
G1 X117.092 Y124.189 E.01488
G1 X110.021 Y131.26 E.3102
G1 X109.401 Y131.342 E.01939
G1 X116.612 Y124.131 E.3163
G1 X116.115 Y124.09 E.01546
G1 X108.781 Y131.423 E.3217
G1 X108.162 Y131.505 E.01939
G1 X115.598 Y124.068 E.32622
G2 X115.056 Y124.072 I-.248 J3.148 E.01685
G1 X107.542 Y131.586 E.32962
G1 X106.922 Y131.668 E.01939
G1 X114.466 Y124.124 E.33093
G2 X113.856 Y124.196 I.517 J7.037 E.01906
G1 X106.302 Y131.749 E.33137
G1 X105.682 Y131.831 E.01939
G1 X113.236 Y124.277 E.33136
G1 X112.616 Y124.359 E.0194
G1 X105.479 Y131.496 E.31309
G1 X105.416 Y131.02 E.01488
M73 P28 R17
G1 X111.996 Y124.441 E.28864
G1 X111.376 Y124.522 E.0194
G1 X105.353 Y130.545 E.26419
G1 X105.291 Y130.069 E.01488
G1 X110.756 Y124.604 E.23974
G1 X110.136 Y124.685 E.0194
G1 X105.228 Y129.593 E.21529
G1 X105.165 Y129.118 E.01488
G1 X109.516 Y124.767 E.19085
G1 X108.896 Y124.849 E.0194
G1 X105.103 Y128.642 E.1664
G1 X105.04 Y128.166 E.01488
G1 X108.276 Y124.93 E.14195
G1 X107.656 Y125.012 E.0194
G1 X104.977 Y127.69 E.1175
G1 X104.915 Y127.215 E.01488
G1 X107.036 Y125.094 E.09305
G1 X106.416 Y125.175 E.0194
G1 X104.852 Y126.739 E.0686
G1 X104.79 Y126.263 E.01488
G1 X105.796 Y125.257 E.04415
G1 X105.176 Y125.338 E.0194
G1 X104.576 Y125.939 E.02634
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9457.259
G1 X105.176 Y125.338 E-.32265
G1 X105.796 Y125.257 E-.23762
G1 X105.424 Y125.628 E-.19973
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 3/85
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I.306 J1.178 P1  F42000
G1 X151.751 Y113.609 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X151.81 Y113.636 E.00214
G1 X151.864 Y113.69 E.00255
G1 X151.898 Y113.815 E.00427
G1 X151.893 Y142.239 E.94288
G3 X151.702 Y142.397 I-.203 J-.051 E.00881
G1 X140.262 Y142.393 E.37951
G3 X140.102 Y142.178 I.045 J-.2 E.00969
G1 X140.107 Y113.761 E.94263
G3 X140.298 Y113.603 I.203 J.051 E.00881
G1 X151.691 Y113.609 E.37794
M204 S250
G1 X151.868 Y113.243 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X152.026 Y113.312 E.00529
G3 X152.29 Y113.805 I-.336 J.497 E.01788
G1 X152.29 Y142.195 E.87234
G3 X151.727 Y142.789 I-.602 J-.007 E.02767
G1 X140.305 Y142.79 E.35094
G3 X139.71 Y142.193 I.012 J-.607 E.02865
G1 X139.71 Y113.805 E.87226
G3 X140.273 Y113.211 I.608 J.012 E.02761
G1 X151.813 Y113.222 E.35457
; WIPE_START
M204 S6000
G1 X152.026 Y113.312 E-.08808
G1 X152.156 Y113.426 E-.06565
G1 X152.264 Y113.629 E-.08741
G1 X152.29 Y113.805 E-.06762
G1 X152.29 Y114.992 E-.45123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 3 start: 394,405
M624 AwAAAAAAAAA=
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
; object ids of this layer3 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X151.734 Y114.535 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X151.141 Y113.942 E.02575
G1 X150.608 Y113.942 E.01639
G1 X151.564 Y114.898 E.04156
G1 X151.564 Y115.431 E.01638
G1 X150.074 Y113.941 E.06473
G1 X149.541 Y113.941 E.01639
G1 X151.564 Y115.964 E.08791
G1 X151.564 Y116.497 E.01638
G1 X149.007 Y113.941 E.11108
G1 X148.474 Y113.941 E.01639
G1 X151.563 Y117.03 E.13426
G1 X151.563 Y117.563 E.01638
G1 X147.94 Y113.94 E.15743
G1 X147.407 Y113.94 E.01639
G1 X151.563 Y118.096 E.18061
G1 X151.563 Y118.629 E.01638
G1 X146.873 Y113.94 E.20378
G1 X146.34 Y113.939 E.01639
G1 X151.563 Y119.162 E.22696
G1 X151.562 Y119.696 E.01638
G1 X145.806 Y113.939 E.25013
G1 X145.273 Y113.939 E.01639
G1 X151.562 Y120.229 E.27331
G1 X151.562 Y120.762 E.01638
G1 X144.739 Y113.939 E.29649
G1 X144.205 Y113.938 E.01639
G1 X151.562 Y121.295 E.31966
G1 X151.562 Y121.828 E.01638
G1 X143.672 Y113.938 E.34284
G1 X143.138 Y113.938 E.01639
G1 X151.561 Y122.361 E.36601
G1 X151.561 Y122.894 E.01638
G1 X142.605 Y113.938 E.38919
G1 X142.071 Y113.937 E.01639
G1 X151.561 Y123.427 E.41236
G1 X151.561 Y123.96 E.01638
G1 X141.538 Y113.937 E.43554
G1 X141.004 Y113.937 E.01639
G1 X151.561 Y124.493 E.45871
G1 X151.56 Y125.026 E.01638
G1 X140.471 Y113.936 E.48189
G1 X140.446 Y113.936 E.00076
G1 X140.446 Y114.445 E.01562
G1 X151.56 Y125.559 E.48296
G1 X151.56 Y126.092 E.01638
G1 X140.446 Y114.978 E.48296
G1 X140.445 Y115.511 E.01638
G1 X151.56 Y126.625 E.48296
G1 X151.56 Y127.158 E.01638
G1 X140.445 Y116.044 E.48296
G1 X140.445 Y116.577 E.01638
G1 X151.559 Y127.691 E.48296
G1 X151.559 Y128.224 E.01638
G1 X140.445 Y117.11 E.48296
G1 X140.445 Y117.643 E.01638
G1 X151.559 Y128.757 E.48296
G1 X151.559 Y129.291 E.01638
M73 P29 R17
G1 X140.444 Y118.176 E.48296
G1 X140.444 Y118.709 E.01638
G1 X151.559 Y129.824 E.48296
G1 X151.558 Y130.357 E.01638
G1 X140.444 Y119.242 E.48296
G1 X140.444 Y119.775 E.01638
G1 X151.558 Y130.89 E.48296
G1 X151.558 Y131.423 E.01638
G1 X140.444 Y120.308 E.48296
G1 X140.443 Y120.841 E.01638
G1 X151.558 Y131.956 E.48296
G1 X151.558 Y132.489 E.01638
G1 X140.443 Y121.374 E.48296
G1 X140.443 Y121.908 E.01638
G1 X151.557 Y133.022 E.48296
G1 X151.557 Y133.555 E.01638
G1 X140.443 Y122.441 E.48296
G1 X140.443 Y122.974 E.01638
G1 X151.557 Y134.088 E.48296
G1 X151.557 Y134.621 E.01638
G1 X140.442 Y123.507 E.48296
G1 X140.442 Y124.04 E.01638
G1 X151.557 Y135.154 E.48296
G1 X151.556 Y135.687 E.01638
G1 X140.442 Y124.573 E.48296
G1 X140.442 Y125.106 E.01638
G1 X151.556 Y136.22 E.48296
G1 X151.556 Y136.753 E.01638
G1 X140.442 Y125.639 E.48296
G1 X140.441 Y126.172 E.01638
G1 X151.556 Y137.286 E.48296
G1 X151.556 Y137.819 E.01638
G1 X140.441 Y126.705 E.48296
G1 X140.441 Y127.238 E.01638
G1 X151.555 Y138.352 E.48296
G1 X151.555 Y138.885 E.01638
G1 X140.441 Y127.771 E.48296
G1 X140.441 Y128.304 E.01638
G1 X151.555 Y139.419 E.48296
G1 X151.555 Y139.952 E.01638
G1 X140.44 Y128.837 E.48296
G1 X140.44 Y129.37 E.01638
G1 X151.555 Y140.485 E.48296
G1 X151.554 Y141.018 E.01638
G1 X140.44 Y129.903 E.48296
G1 X140.44 Y130.436 E.01638
G1 X151.554 Y141.551 E.48296
G1 X151.554 Y142.064 E.01576
G1 X151.534 Y142.064 E.00062
G1 X140.44 Y130.969 E.48208
G1 X140.439 Y131.503 E.01638
G1 X151 Y142.063 E.45889
G1 X150.466 Y142.063 E.0164
G1 X140.439 Y132.036 E.43571
G1 X140.439 Y132.569 E.01638
G1 X149.932 Y142.062 E.41253
G1 X149.399 Y142.062 E.0164
G1 X140.439 Y133.102 E.38935
G1 X140.439 Y133.635 E.01638
G1 X148.865 Y142.061 E.36616
G1 X148.331 Y142.061 E.0164
G1 X140.438 Y134.168 E.34298
G1 X140.438 Y134.701 E.01638
G1 X147.798 Y142.06 E.3198
G1 X147.264 Y142.06 E.0164
G1 X140.438 Y135.234 E.29661
G1 X140.438 Y135.767 E.01638
G1 X146.73 Y142.059 E.27343
G1 X146.196 Y142.059 E.0164
G1 X140.438 Y136.3 E.25025
G1 X140.437 Y136.833 E.01638
G1 X145.663 Y142.058 E.22706
G1 X145.129 Y142.058 E.0164
G1 X140.437 Y137.366 E.20388
G1 X140.437 Y137.899 E.01638
G1 X144.595 Y142.058 E.1807
G1 X144.062 Y142.057 E.0164
G1 X140.437 Y138.432 E.15751
G1 X140.437 Y138.965 E.01638
G1 X143.528 Y142.057 E.13433
G1 X142.994 Y142.056 E.0164
G1 X140.436 Y139.498 E.11115
G1 X140.436 Y140.031 E.01638
G1 X142.46 Y142.056 E.08796
G1 X141.927 Y142.055 E.0164
G1 X140.436 Y140.564 E.06478
G1 X140.436 Y141.098 E.01638
G1 X141.393 Y142.055 E.0416
G1 X140.859 Y142.054 E.0164
G1 X140.266 Y141.461 E.02578
; OBJECT_ID: 394
; WIPE_START
G1 X140.859 Y142.054 E-.31888
G1 X141.393 Y142.055 E-.20281
G1 X140.95 Y141.611 E-.23832
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.465 Y137.586 Z1 F42000
G1 X125.876 Y132.254 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.81 Y130.929 E.33677
G2 X115.183 Y130.93 I-.309 J3.312 E.02084
G1 X105.124 Y132.254 E.33656
G1 X104.185 Y125.12 E.23868
G1 X114.231 Y123.797 E.33612
G3 X115.922 Y123.723 I1.412 J12.854 E.05619
G3 X116.769 Y123.797 I-.431 J9.786 E.02822
G1 X126.815 Y125.12 E.33612
G1 X125.884 Y132.194 E.23669
M204 S250
G1 X125.94 Y132.658 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.768 Y131.319 E.31527
G2 X115.23 Y131.319 I-.267 J2.789 E.01655
G1 X105.05 Y132.659 E.31549
G1 X105.032 Y132.661 E.00058
G1 X104.979 Y132.664 E.00161
G1 X104.946 Y132.662 E.00101
G1 X104.913 Y132.656 E.00104
G1 X104.882 Y132.647 E.00099
G1 X104.866 Y132.64 E.00056
G1 F7543.812
G1 X104.834 Y132.622 E.00111
G1 F7114.649
G1 X104.823 Y132.613 E.00043
G1 F6950.226
G1 X104.801 Y132.591 E.00094
G1 F6600
G1 X104.776 Y132.554 E.00138
G3 X104.761 Y132.497 I.176 J-.08 E.00182
G1 F5700
G1 X103.849 Y125.573 E.21459
G3 X103.769 Y124.944 I4.07 J-.838 E.01951
G1 F6369.158
G1 X103.783 Y124.883 E.00191
G1 F6824.606
G1 X103.803 Y124.848 E.00124
G1 F7115.268
G1 X103.819 Y124.829 E.00077
G1 F7306.922
G1 X103.831 Y124.818 E.0005
G1 F7783.613
G1 X103.863 Y124.795 E.00122
G1 F8422.017
G1 X103.909 Y124.772 E.00157
G1 F9007.401
G1 X103.952 Y124.758 E.00139
G1 F9547.055
G1 X104.015 Y124.747 E.00197
G1 X104.015 Y124.747 E.00001
G1 X114.184 Y123.408 E.31515
G3 X115.939 Y123.331 I1.464 J13.376 E.05402
G3 X116.816 Y123.408 I-.446 J10.14 E.02706
G1 X126.985 Y124.747 E.31515
G1 X126.985 Y124.747 E.00001
G1 X127.048 Y124.758 E.00197
G1 X127.091 Y124.772 E.00138
G1 X127.137 Y124.795 E.00159
G1 X127.169 Y124.818 E.0012
G1 F7090.301
G1 X127.181 Y124.829 E.00051
G1 F6898.432
G1 X127.197 Y124.848 E.00077
G1 F6614.588
G1 X127.217 Y124.883 E.00125
G1 F6165.637
G1 X127.23 Y124.925 E.00134
G1 F5700
G1 X127.231 Y124.956 E.00095
G3 X126.318 Y131.903 I-1078.785 J-138.328 E.21528
G1 X126.239 Y132.497 E.01844
G1 F6600
G3 X126.199 Y132.591 I-.197 J-.029 E.00319
G1 F6948.592
G1 X126.177 Y132.613 E.00094
G1 F7114.422
G1 X126.166 Y132.622 E.00044
G1 F7543.369
G1 X126.134 Y132.64 E.00111
G1 F7764.291
G1 X126.118 Y132.647 E.00056
G1 F8150.45
G1 X126.088 Y132.656 E.00096
G1 F8590.272
G1 X126.053 Y132.662 E.00107
G1 F9015.451
G1 X126.021 Y132.664 E.001
G1 F9289.183
G1 X126 Y132.663 E.00063
; WIPE_START
M204 S6000
G1 X124.017 Y132.402 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.541 Y125.948 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42708
G1 F9371.095
M204 S6000
G1 X125.933 Y125.34 E.02691
G1 X125.308 Y125.257 E.01975
G1 X126.327 Y126.277 E.04512
G1 X126.264 Y126.757 E.01516
G1 X124.682 Y125.175 E.07002
G1 X124.056 Y125.093 E.01975
G1 X126.2 Y127.237 E.09492
G1 X126.137 Y127.717 E.01516
G1 X123.431 Y125.01 E.11982
G1 X122.805 Y124.928 E.01975
G1 X126.074 Y128.197 E.14472
G1 X126.011 Y128.677 E.01516
G1 X122.179 Y124.846 E.16962
G1 X121.554 Y124.763 E.01975
G1 X125.948 Y129.157 E.19452
G1 X125.884 Y129.637 E.01516
G1 X120.928 Y124.681 E.21942
G1 X120.302 Y124.599 E.01975
G1 X125.821 Y130.117 E.24432
G1 X125.758 Y130.597 E.01516
G1 X119.677 Y124.516 E.26922
G1 X119.051 Y124.434 E.01975
G1 X125.695 Y131.077 E.29412
G1 X125.632 Y131.558 E.01516
G1 X118.425 Y124.351 E.31902
G1 X117.8 Y124.269 E.01975
G1 X125.383 Y131.853 E.33573
G1 X124.758 Y131.77 E.01975
G1 X117.174 Y124.187 E.33574
G2 X116.557 Y124.113 I-1.153 J7.056 E.01945
G1 X124.132 Y131.688 E.33534
G1 X123.507 Y131.606 E.01975
G1 X115.962 Y124.061 E.33401
G2 X115.414 Y124.056 I-.3 J3.108 E.01718
G1 X122.881 Y131.523 E.33057
G1 X122.255 Y131.441 E.01975
G1 X114.888 Y124.074 E.32614
G1 X114.389 Y124.118 E.0157
G1 X121.63 Y131.359 E.32056
G1 X121.004 Y131.276 E.01975
G1 X113.904 Y124.176 E.31432
G1 X113.424 Y124.24 E.01516
G1 X120.378 Y131.194 E.30788
G1 X119.753 Y131.112 E.01975
G1 X112.944 Y124.303 E.30143
G1 X112.464 Y124.366 E.01516
G1 X119.127 Y131.029 E.29499
G1 X118.502 Y130.947 E.01975
G1 X111.984 Y124.429 E.28855
G1 X111.504 Y124.492 E.01516
G1 X117.876 Y130.865 E.28211
G1 X117.25 Y130.782 E.01975
G1 X111.024 Y124.556 E.27566
G1 X110.544 Y124.619 E.01516
G1 X116.625 Y130.7 E.26922
G1 X115.999 Y130.618 E.01975
G1 X110.063 Y124.682 E.26278
G1 X109.583 Y124.745 E.01516
G1 X115.418 Y130.58 E.25832
G2 X114.923 Y130.628 I.121 J3.853 E.0156
G1 X109.103 Y124.808 E.25764
G1 X108.623 Y124.872 E.01516
G1 X114.443 Y130.691 E.25763
G1 X113.963 Y130.754 E.01516
G1 X108.143 Y124.935 E.25763
G1 X107.663 Y124.998 E.01516
G1 X113.483 Y130.817 E.25763
G1 X113.002 Y130.881 E.01516
G1 X107.183 Y125.061 E.25763
G1 X106.703 Y125.124 E.01516
G1 X112.522 Y130.944 E.25763
G1 X112.042 Y131.007 E.01516
G1 X106.223 Y125.188 E.25763
G1 X105.743 Y125.251 E.01516
G1 X111.562 Y131.07 E.25763
G1 X111.082 Y131.133 E.01516
G1 X105.263 Y125.314 E.25763
G1 X104.783 Y125.377 E.01516
G1 X110.602 Y131.197 E.25763
G1 X110.122 Y131.26 E.01516
G1 X104.603 Y125.741 E.24434
G1 X104.685 Y126.366 E.01975
G1 X109.642 Y131.323 E.21944
G1 X109.162 Y131.386 E.01516
G1 X104.767 Y126.992 E.19454
G1 X104.85 Y127.617 E.01975
G1 X108.682 Y131.449 E.16964
G1 X108.201 Y131.512 E.01516
G1 X104.932 Y128.243 E.14474
G1 X105.014 Y128.869 E.01975
G1 X107.721 Y131.576 E.11984
G1 X107.241 Y131.639 E.01516
G1 X105.097 Y129.494 E.09494
G1 X105.179 Y130.12 E.01975
G1 X106.761 Y131.702 E.07004
G1 X106.281 Y131.765 E.01516
G1 X105.262 Y130.746 E.04513
G1 X105.344 Y131.371 E.01975
G1 X105.952 Y131.98 E.02693
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9371.095
G1 X105.344 Y131.371 E-.32689
G1 X105.262 Y130.746 E-.2398
G1 X105.621 Y131.105 E-.19331
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 4/85
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S201.45
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1 I.432 J1.138 P1  F42000
G1 X151.751 Y113.609 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X151.809 Y113.636 E.00213
G1 X151.864 Y113.69 E.00255
G1 X151.898 Y113.814 E.00424
G1 X151.898 Y127.322 E.44811
G1 X148.222 Y127.322 E.12193
G1 X148.222 Y141.678 E.4762
G1 X151.898 Y141.678 E.12193
G3 X151.893 Y142.238 I-2.827 J.258 E.01863
G3 X151.702 Y142.397 I-.208 J-.056 E.00878
G1 X140.262 Y142.393 E.37951
G3 X140.102 Y142.178 I.045 J-.2 E.0097
G1 X140.102 Y128.678 E.44782
G1 X143.778 Y128.678 E.12193
G1 X143.778 Y114.322 E.4762
G1 X140.102 Y114.322 E.12193
G3 X140.107 Y113.762 I2.845 J-.258 E.01862
G3 X140.298 Y113.603 I.208 J.056 E.00878
G1 X151.691 Y113.609 E.37795
M204 S250
G1 X151.848 Y113.235 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X152.026 Y113.312 E.00598
G3 X152.29 Y113.804 I-.336 J.497 E.01785
G1 X152.29 Y142.195 E.87237
G3 X151.727 Y142.789 I-.609 J-.013 E.02761
G1 X140.305 Y142.79 E.35094
G3 X139.71 Y142.192 I.012 J-.607 E.02866
G1 X139.71 Y113.805 E.87224
G3 X140.273 Y113.211 I.609 J.013 E.0276
G1 X151.79 Y113.222 E.35387
; WIPE_START
M204 S6000
G1 X152.026 Y113.312 E-.09597
G1 X152.156 Y113.426 E-.06572
G1 X152.264 Y113.629 E-.08738
G1 X152.29 Y113.804 E-.0672
G1 X152.29 Y114.972 E-.44373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 4 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer4 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X145.811 Y115.657 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X146.307 Y115.161 E.02155
G1 X146.307 Y114.628
G1 X145.278 Y115.657 E.04472
G1 X144.745 Y115.657
G1 X146.307 Y114.095 E.06789
G1 X146.04 Y113.828
G1 X144.211 Y115.657 E.07946
G1 X144 Y115.335
G1 X145.507 Y113.828 E.06549
G1 X144.974 Y113.828
G1 X144 Y114.802 E.04233
; WIPE_START
M204 S6000
G1 X144.974 Y113.828 E-.52346
G1 X145.507 Y113.828 E-.20253
G1 X145.444 Y113.891 E-.03401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.326 Y115.482 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145458
G1 F15000
M204 S6000
G1 X146.132 Y115.676 E.0023
; WIPE_START
G1 X146.326 Y115.482 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P30 R17
G1 X143.981 Y113.963 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.355051
G1 F11533.64
M204 S6000
G1 X140.306 Y113.963 E.09349
; WIPE_START
G1 X142.306 Y113.963 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.605 Y121.484 Z1.2 F42000
G1 X144.126 Y124.498 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X144.126 Y126.126 E.05401
G1 X145.12 Y127.12 E.04665
G1 X145.47 Y127.12 E.01161
G1 X145.47 Y126.261 E.0285
G1 X145.711 Y126.02 E.0113
G1 X147.98 Y126.02 E.07523
G1 X151.55 Y122.45 E.16748
G1 X151.55 Y125.874 E.11356
G1 X144.126 Y118.45 E.34826
G1 X144.126 Y122.198 E.12433
G1 X151.55 Y114.774 E.34826
G1 X151.55 Y118.198 E.11356
G1 X147.307 Y113.955 E.19904
G1 X146.529 Y113.955 E.02579
G1 X146.529 Y114.805 E.02823
; WIPE_START
G1 X146.529 Y113.955 E-.32335
G1 X147.307 Y113.955 E-.29542
G1 X147.57 Y114.218 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.442 Y121.548 Z1.2 F42000
G1 X143.555 Y128.045 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X143.145 Y128.455 E.01783
G1 X142.612 Y128.455
G1 X143.555 Y127.512 E.041
G1 X143.507 Y127.027
G1 X142.078 Y128.455 E.06208
G1 X141.545 Y128.455
G1 X143.507 Y126.493 E.08525
G1 X143.507 Y125.96
G1 X141.012 Y128.455 E.10843
G1 X140.479 Y128.455
G1 X143.507 Y125.427 E.1316
G1 X143.507 Y124.894
G1 X139.945 Y128.455 E.15477
G1 X139.917 Y127.95
G1 X143.507 Y124.36 E.15599
G1 X143.507 Y123.827
G1 X139.917 Y127.417 E.15599
G1 X139.917 Y126.884
G1 X143.507 Y123.294 E.15599
G1 X143.507 Y122.761
G1 X139.917 Y126.35 E.15599
G1 X139.917 Y125.817
G1 X143.507 Y122.227 E.15599
G1 X143.507 Y121.694
G1 X139.917 Y125.284 E.15599
G1 X139.917 Y124.751
G1 X143.507 Y121.161 E.15599
G1 X143.507 Y120.628
G1 X139.917 Y124.217 E.15599
G1 X139.917 Y123.684
G1 X143.507 Y120.094 E.15599
G1 X143.507 Y119.561
G1 X139.917 Y123.151 E.15599
G1 X139.917 Y122.618
G1 X143.507 Y119.028 E.15599
G1 X143.507 Y118.495
G1 X139.917 Y122.084 E.15599
G1 X139.917 Y121.551
G1 X143.507 Y117.961 E.15599
G1 X143.507 Y117.428
G1 X139.917 Y121.018 E.15599
G1 X139.917 Y120.484
G1 X143.507 Y116.895 E.15599
G1 X143.507 Y116.361
G1 X139.917 Y119.951 E.15599
G1 X139.917 Y119.418
G1 X143.507 Y115.828 E.15599
G1 X143.555 Y115.247
G1 X139.917 Y118.885 E.15808
G1 X139.917 Y118.351
G1 X143.555 Y114.714 E.15808
G1 X143.191 Y114.545
G1 X139.917 Y117.818 E.14225
G1 X139.917 Y117.285
G1 X142.658 Y114.545 E.11908
G1 X142.124 Y114.545
G1 X139.917 Y116.752 E.0959
G1 X139.917 Y116.218
G1 X141.591 Y114.545 E.07273
G1 X141.058 Y114.545
G1 X139.917 Y115.685 E.04956
G1 X139.917 Y115.152
G1 X140.525 Y114.545 E.02639
; WIPE_START
M204 S6000
G1 X139.917 Y115.152 E-.32631
G1 X139.917 Y115.685 E-.20264
G1 X140.347 Y115.255 E-.23105
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.379 Y122.26 Z1.2 F42000
G1 X146.307 Y129.026 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X145.576 Y129.757 E.03177
M204 S10000
G1 X148 Y127.866 F42000
G1 F9547.055
M204 S2000
G1 X147.209 Y128.657 E.03436
G1 X146.676 Y128.657
G1 X148 Y127.333 E.05753
; WIPE_START
M204 S6000
G1 X146.676 Y128.657 E-.71147
G1 X146.804 Y128.657 E-.04853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.9 Y127.1 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X151.676 Y126.324 E.03372
G1 X151.223 Y126.243
G1 X150.366 Y127.1 E.03724
G1 X149.833 Y127.1
G1 X150.69 Y126.243 E.03724
G1 X150.157 Y126.243
G1 X149.3 Y127.1 E.03724
G1 X148.766 Y127.1
G1 X149.623 Y126.243 E.03724
G1 X149.09 Y126.243
G1 X148.233 Y127.1 E.03724
G1 X148.557 Y126.243
G1 X145.043 Y129.757 E.15271
G1 X144.509 Y129.757
G1 X148.024 Y126.243 E.15271
G1 X147.49 Y126.243
G1 X143.976 Y129.757 E.15271
G1 X143.443 Y129.757
G1 X146.957 Y126.243 E.15271
G1 X146.424 Y126.243
G1 X145.693 Y126.974 E.03177
G1 X145.324 Y127.343
G1 X144 Y128.667 E.05752
G1 X144 Y128.133
G1 X144.791 Y127.343 E.03435
; WIPE_START
M204 S6000
G1 X144 Y128.133 E-.42482
G1 X144 Y128.667 E-.20264
G1 X144.247 Y128.42 E-.13254
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.767 Y128.9 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X142.91 Y129.757 E.03724
G1 X142.376 Y129.757
G1 X143.233 Y128.9 E.03724
G1 X142.7 Y128.9
G1 X141.843 Y129.757 E.03724
G1 X141.31 Y129.757
G1 X142.167 Y128.9 E.03724
G1 X141.634 Y128.9
G1 X140.777 Y129.757 E.03724
G1 X140.324 Y129.676
G1 X141.1 Y128.9 E.03372
; WIPE_START
M204 S6000
G1 X140.324 Y129.676 E-.41697
G1 X140.777 Y129.757 E-.17457
G1 X141.09 Y129.444 E-.16845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.113 Y128.779 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101465
G1 F15000
M204 S6000
G1 X143.879 Y129.013 E.00158
; WIPE_START
G1 X144.113 Y128.779 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.181 Y127.1 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.105286
G1 F15000
M204 S6000
G1 X148.05 Y127.076 E.00068
G1 X147.887 Y127.221 E.00111
; WIPE_START
G1 X148.05 Y127.076 E-.47173
G1 X148.181 Y127.1 E-.28827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.791 Y126.276 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.108028
G1 F15000
M204 S6000
G1 X148.609 Y126.243 E.00098
; WIPE_START
G1 X148.791 Y126.276 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.874 Y131.502 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X147.874 Y129.874 E.05401
G1 X146.88 Y128.88 E.04665
G1 X146.529 Y128.88 E.01161
G1 X146.529 Y129.739 E.0285
G1 X146.289 Y129.98 E.0113
G1 X144.02 Y129.98 E.07523
G1 X140.45 Y133.55 E.16748
G1 X140.45 Y130.126 E.11356
G1 X147.874 Y137.55 E.34826
G1 X147.874 Y133.802 E.12433
G1 X140.45 Y141.226 E.34826
G1 X140.45 Y137.802 E.11356
G1 X144.691 Y142.043 E.19893
G1 X145.47 Y142.043 E.02587
G1 X145.47 Y141.195 E.02815
; WIPE_START
G1 X145.47 Y142.043 E-.32246
G1 X144.691 Y142.043 E-.2963
G1 X144.428 Y141.78 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148 Y141.198 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X147.027 Y142.171 E.04227
G1 X146.494 Y142.17
G1 X148 Y140.665 E.06542
G1 X147.788 Y140.343
G1 X145.962 Y142.17 E.07938
G1 X145.693 Y141.905
G1 X147.255 Y140.343 E.06789
G1 X146.722 Y140.343
G1 X145.693 Y141.372 E.04471
G1 X145.693 Y140.839
G1 X146.189 Y140.343 E.02154
M204 S10000
G1 X145.868 Y140.324 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.145375
G1 F15000
M204 S6000
G1 X145.674 Y140.518 E.00229
; WIPE_START
G1 X145.868 Y140.324 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.019 Y142.038 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.355204
G1 F11527.999
M204 S6000
G1 X151.694 Y142.037 E.09353
M204 S10000
G1 X151.475 Y141.455 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X152.083 Y140.848 E.02639
G1 X152.083 Y140.315
G1 X150.942 Y141.455 E.04956
G1 X150.409 Y141.455
G1 X152.083 Y139.781 E.07274
G1 X152.083 Y139.248
G1 X149.876 Y141.455 E.09591
G1 X149.342 Y141.455
G1 X152.083 Y138.715 E.11908
G1 X152.083 Y138.182
G1 X148.809 Y141.455 E.14225
G1 X148.445 Y141.286
G1 X152.083 Y137.648 E.15808
G1 X152.083 Y137.115
G1 X148.445 Y140.753 E.15808
G1 X148.493 Y140.172
G1 X152.083 Y136.582 E.15599
G1 X152.083 Y136.049
G1 X148.493 Y139.638 E.15599
G1 X148.493 Y139.105
G1 X152.083 Y135.515 E.15599
G1 X152.083 Y134.982
G1 X148.493 Y138.572 E.15599
G1 X148.493 Y138.039
G1 X152.083 Y134.449 E.15599
G1 X152.083 Y133.916
G1 X148.493 Y137.505 E.15599
G1 X148.493 Y136.972
G1 X152.083 Y133.382 E.15599
G1 X152.083 Y132.849
G1 X148.493 Y136.439 E.15599
G1 X148.493 Y135.906
G1 X152.083 Y132.316 E.15599
G1 X152.083 Y131.783
G1 X148.493 Y135.372 E.15599
G1 X148.493 Y134.839
G1 X152.083 Y131.249 E.15599
G1 X152.083 Y130.716
G1 X148.493 Y134.306 E.15599
G1 X148.493 Y133.773
G1 X152.083 Y130.183 E.15599
G1 X152.083 Y129.65
G1 X148.493 Y133.239 E.15599
G1 X148.493 Y132.706
G1 X152.083 Y129.116 E.15599
G1 X152.083 Y128.583
G1 X148.493 Y132.173 E.15599
G1 X148.493 Y131.64
G1 X152.083 Y128.05 E.15599
G1 X152.054 Y127.545
G1 X148.493 Y131.106 E.15477
G1 X148.493 Y130.573
G1 X151.521 Y127.545 E.13159
G1 X150.988 Y127.545
G1 X148.493 Y130.04 E.10842
G1 X148.493 Y129.506
G1 X150.455 Y127.545 E.08525
G1 X149.921 Y127.545
G1 X148.493 Y128.973 E.06208
G1 X148.445 Y128.488
G1 X149.388 Y127.545 E.041
G1 X148.855 Y127.545
G1 X148.445 Y127.955 E.01782
; OBJECT_ID: 394
; WIPE_START
M204 S6000
G1 X148.855 Y127.545 E-.22042
G1 X149.388 Y127.545 E-.20264
G1 X148.761 Y128.172 E-.33695
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X141.248 Y129.517 Z1.2 F42000
G1 X125.928 Y132.261 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.816 Y130.93 E.33831
G2 X115.184 Y130.93 I-.316 J4.23 E.021
G1 X105.072 Y132.261 E.3383
G1 X104.133 Y125.127 E.2387
G1 X114.231 Y123.797 E.33785
G3 X115.922 Y123.723 I1.416 J12.944 E.05618
G3 X116.769 Y123.797 I-.441 J9.906 E.02823
G1 X126.867 Y125.127 E.33784
G1 X125.935 Y132.201 E.23671
M204 S250
G1 X126.064 Y132.674 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.77 Y131.319 E.31905
G2 X115.23 Y131.319 I-.27 J3.636 E.01659
G1 X104.863 Y132.673 E.32127
G3 X104.807 Y132.653 I.041 J-.199 E.00183
G1 X104.791 Y132.643 E.00059
G1 X104.756 Y132.612 E.00143
G3 X104.709 Y132.505 I.2 J-.151 E.00363
G1 X103.797 Y125.58 E.21461
G3 X103.717 Y124.947 I4.227 J-.859 E.01962
G1 X103.729 Y124.886 E.00191
G1 X103.76 Y124.833 E.00191
G1 X103.775 Y124.818 E.00062
G1 X103.782 Y124.811 E.00033
G3 X103.896 Y124.762 I.159 J.214 E.00383
G1 X114.184 Y123.408 E.31886
G3 X115.939 Y123.331 I1.468 J13.46 E.05401
G3 X116.816 Y123.408 I-.456 J10.258 E.02706
G1 X127.104 Y124.762 E.31886
G3 X127.225 Y124.819 I-.023 J.208 E.00418
G1 X127.24 Y124.833 E.00062
G1 X127.271 Y124.887 E.00193
G1 X127.283 Y124.955 E.00212
G3 X126.369 Y131.91 I-630.56 J-79.311 E.21554
G3 X126.284 Y132.539 I-4.267 J-.259 E.01953
G3 X126.244 Y132.612 I-.201 J-.063 E.00256
G1 X126.21 Y132.643 E.00142
G1 X126.193 Y132.652 E.00059
G3 X126.125 Y132.675 I-.097 J-.18 E.00222
; WIPE_START
M204 S6000
M73 P31 R17
G1 X124.142 Y132.415 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.088 Y131.985 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43349
G1 F9217.297
M204 S6000
G1 X125.71 Y131.363 E.028
G1 X125.793 Y130.727 E.02042
G1 X124.751 Y131.77 E.04693
G1 X124.263 Y131.706 E.01567
G1 X125.877 Y130.091 E.07267
G1 X125.961 Y129.455 E.02042
G1 X123.775 Y131.641 E.0984
G1 X123.287 Y131.577 E.01567
G1 X126.045 Y128.819 E.12414
G1 X126.128 Y128.183 E.02042
G1 X122.798 Y131.513 E.14988
G1 X122.31 Y131.449 E.01567
G1 X126.212 Y127.547 E.17562
G1 X126.296 Y126.911 E.02042
G1 X121.822 Y131.384 E.20135
G1 X121.334 Y131.32 E.01567
G1 X126.38 Y126.275 E.22709
G1 X126.463 Y125.639 E.02042
G1 X120.846 Y131.256 E.25283
G1 X120.358 Y131.192 E.01567
G1 X126.178 Y125.372 E.26194
G1 X125.69 Y125.308 E.01567
G1 X119.87 Y131.127 E.26194
G1 X119.522 Y131.082 E.01117
G1 X119.546 Y130.899 E.00587
G1 X125.202 Y125.243 E.25455
G1 X124.713 Y125.179 E.01567
G1 X119.63 Y130.263 E.22881
G1 X119.714 Y129.627 E.02042
G1 X124.225 Y125.115 E.20307
G1 X123.737 Y125.051 E.01567
G1 X119.797 Y128.991 E.17734
G1 X119.881 Y128.354 E.02042
G1 X123.249 Y124.986 E.1516
G1 X122.761 Y124.922 E.01567
G1 X119.965 Y127.718 E.12586
G1 X120.049 Y127.082 E.02042
G1 X122.273 Y124.858 E.10012
G1 X121.785 Y124.794 E.01567
G1 X120.132 Y126.446 E.07438
G1 X120.216 Y125.81 E.02042
G1 X121.297 Y124.729 E.04865
G1 X120.809 Y124.665 E.01567
G1 X120.103 Y125.371 E.03178
M204 S10000
G1 X119.744 Y126.395 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.956 Y124.78 E.05401
G1 X119.712 Y124.536 E.01146
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
G3 X115.5 Y130.56 I4.231 J22.208 E.09772
G3 X118.421 Y130.921 I-1.31 J22.57 E.09772
G1 X111.949 Y124.449 E.30364
G1 X111.288 Y124.536 E.02211
G1 X111.044 Y124.78 E.01146
G1 X111.256 Y126.395 E.05401
M204 S10000
G1 X110.747 Y131.349 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42051
G1 F9534.15
M204 S6000
G1 X111.424 Y130.672 E.02948
G1 X111.362 Y130.2 E.01464
G1 X110.329 Y131.233 E.04495
G1 X109.714 Y131.314 E.01908
G1 X111.3 Y129.728 E.06901
G1 X111.238 Y129.256 E.01464
G1 X109.099 Y131.395 E.09307
G1 X108.484 Y131.476 E.01908
G1 X111.175 Y128.784 E.11712
G1 X111.113 Y128.312 E.01464
G1 X107.869 Y131.557 E.14118
G1 X107.254 Y131.638 E.01908
G1 X111.051 Y127.84 E.16523
G1 X110.989 Y127.369 E.01464
G1 X106.639 Y131.719 E.18929
G1 X106.024 Y131.8 E.01908
G1 X110.927 Y126.897 E.21334
G1 X110.865 Y126.425 E.01464
G1 X105.409 Y131.881 E.2374
G1 X105.359 Y131.887 E.00155
G1 X105.302 Y131.454 E.01346
G1 X110.803 Y125.953 E.23935
G1 X110.741 Y125.481 E.01464
G1 X105.24 Y130.982 E.23935
G1 X105.178 Y130.51 E.01464
G1 X110.679 Y125.009 E.23935
G1 X110.626 Y124.608 E.01245
G1 X110.534 Y124.62 E.00286
G1 X105.116 Y130.038 E.23575
G1 X105.054 Y129.566 E.01464
G1 X109.919 Y124.701 E.2117
G1 X109.304 Y124.782 E.01908
G1 X104.992 Y129.094 E.18764
G1 X104.929 Y128.622 E.01464
G1 X108.689 Y124.863 E.16359
G1 X108.074 Y124.944 E.01908
G1 X104.867 Y128.15 E.13953
G1 X104.805 Y127.679 E.01464
G1 X107.459 Y125.025 E.11547
G1 X106.844 Y125.106 E.01908
G1 X104.743 Y127.207 E.09142
G1 X104.681 Y126.735 E.01464
G1 X106.229 Y125.187 E.06736
G1 X105.614 Y125.268 E.01908
G1 X104.619 Y126.263 E.04331
G1 X104.557 Y125.791 E.01464
G1 X105.196 Y125.152 E.02783
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9534.15
G1 X104.557 Y125.791 E-.34368
G1 X104.619 Y126.263 E-.18086
G1 X105.057 Y125.825 E-.23546
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 5/85
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-.066 J1.215 P1  F42000
G1 X146.29 Y128.06 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X146.29 Y126.84 E.03749
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.35 Y128.06 E.17084
; WIPE_START
M204 S6000
G1 X146.29 Y126.84 E-.46416
G1 X147.069 Y126.84 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.162 Y134.394 Z1.4 F42000
G1 X149.09 Y140.81 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X149.09 Y128.19 E.38778
G1 X152.06 Y128.19 E.09126
G1 X152.06 Y140.81 E.38778
G1 X149.15 Y140.81 E.08942
; WIPE_START
M204 S6000
G1 X149.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.843 Y131.531 Z1.4 F42000
G1 X145.71 Y127.94 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.91 Y127.81 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X139.94 Y127.81 E.09126
G1 X139.94 Y115.19 E.38778
G1 X142.91 Y115.19 E.09126
G1 X142.91 Y127.75 E.38593
; WIPE_START
M204 S6000
G1 X140.91 Y127.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.603 Y120.649 Z1.4 F42000
G1 X145.71 Y115.06 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.228 Y113.701 Z1.4 F42000
G1 X151.751 Y113.609 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X151.81 Y113.636 E.00213
G1 X151.864 Y113.69 E.00255
G1 X151.898 Y113.813 E.00421
G1 X151.898 Y126.448 E.41914
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.691 Y113.609 E.1854
; WIPE_START
G1 X151.81 Y113.636 E-.04612
G1 X151.864 Y113.69 E-.02919
G1 X151.898 Y113.813 E-.04817
G1 X151.898 Y115.488 E-.63651
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.931 Y123.059 Z1.4 F42000
G1 X148.698 Y140.548 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18696
G3 X140.102 Y142.178 I.045 J-.2 E.00971
G1 X140.102 Y129.552 E.41881
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.488 E.39925
; WIPE_START
G1 X146.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.255 Y133.407 Z1.4 F42000
G1 X151.827 Y113.226 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X152.026 Y113.312 E.00667
G3 X152.29 Y113.803 I-.336 J.497 E.01781
G1 X152.29 Y142.195 E.87241
G3 X151.726 Y142.789 I-.602 J-.007 E.02768
G1 X140.305 Y142.79 E.35093
G3 X139.71 Y142.192 I.012 J-.607 E.02866
G1 X139.71 Y113.805 E.87225
G3 X140.274 Y113.211 I.608 J.012 E.02761
G1 X151.768 Y113.222 E.35318
; WIPE_START
M204 S6000
G1 X152.026 Y113.312 E-.10398
G1 X152.156 Y113.426 E-.06566
G1 X152.264 Y113.629 E-.0874
G1 X152.29 Y113.803 E-.06679
G1 X152.29 Y114.95 E-.43618
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 5 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer5 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X146.45 Y114.726 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.45 Y113.952 E.02568
G1 X147.304 Y113.953 E.02833
G1 X151.55 Y118.198 E.19915
G1 X151.55 Y114.774 E.11356
G1 X144.205 Y122.119 E.34454
G1 X144.205 Y118.529 E.11907
G1 X151.55 Y125.874 E.34454
G1 X151.55 Y122.45 E.11356
G1 X147.9 Y126.1 E.1712
G1 X145.55 Y126.1 E.07798
G1 X145.55 Y127.2 E.03649
G1 X145.2 Y127.2 E.01161
G1 X144.205 Y126.205 E.04665
G1 X144.205 Y124.577 E.05401
M204 S10000
G1 X143.754 Y127.096 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F7253.678
M204 S6000
G1 X143.754 Y115.964 E.45022
; WIPE_START
G1 X143.754 Y117.964 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279428
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10817
G2 X140.138 Y113.549 I.059 J.898 E.00303
; LINE_WIDTH: 0.215056
G1 X140.089 Y113.566 E.00073
; LINE_WIDTH: 0.177456
G1 X139.949 Y113.626 E.00167
; WIPE_START
G1 X140.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.026 Y120.611 Z1.4 F42000
G1 X146 Y127.744 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
; WIPE_START
G1 X146 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.366 Y135.253 Z1.4 F42000
G1 X148.246 Y140.096 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F7253.969
M204 S6000
G1 X148.246 Y128.964 E.45021
M204 S10000
G1 X145.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X140.45 Y137.802 E.19924
G1 X140.45 Y141.226 E.11356
G1 X147.795 Y133.881 E.34454
G1 X147.795 Y137.471 E.11907
G1 X140.45 Y130.126 E.34454
G1 X140.45 Y133.55 E.11356
G1 X144.1 Y129.9 E.1712
G1 X146.45 Y129.9 E.07798
G1 X146.45 Y128.8 E.03649
G1 X146.8 Y128.8 E.01161
G1 X147.795 Y129.795 E.04665
G1 X147.795 Y131.423 E.05401
; WIPE_START
G1 X147.795 Y129.795 E-.61876
G1 X147.532 Y129.532 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.689 Y137.118 Z1.4 F42000
G1 X146.094 Y142.475 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F15000
M204 S6000
G1 X151.707 Y142.475 E.10844
G2 X151.795 Y142.466 I-.013 J-.604 E.00171
; LINE_WIDTH: 0.236046
G2 X152.039 Y142.399 I-.334 J-1.684 E.00398
M204 S10000
G1 X152.052 Y142.373 F42000
; LINE_WIDTH: 0.171761
G1 F15000
M204 S6000
G1 X151.554 Y142.593 E.00571
; OBJECT_ID: 394
; WIPE_START
G1 X152.052 Y142.373 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X144.818 Y139.937 Z1.4 F42000
G1 X119.514 Y131.417 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.81 Y130.929 E.12391
G2 X115.19 Y130.929 I-.31 J2.805 E.02063
G1 X111.486 Y131.417 E.12391
G1 X110.547 Y124.282 E.2387
G1 X114.231 Y123.797 E.12325
G3 X115.922 Y123.723 I1.419 J13.016 E.05619
G3 X116.769 Y123.797 I-.427 J9.738 E.02822
G1 X120.453 Y124.282 E.12326
G1 X119.522 Y131.357 E.23671
; WIPE_START
G1 X117.535 Y131.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.045 Y132.489 Z1.4 F42000
G1 X126.076 Y132.676 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.768 Y131.319 E.31947
G2 X115.232 Y131.319 I-.268 J2.342 E.01649
G1 X104.854 Y132.674 E.3216
G3 X104.703 Y132.506 I.041 J-.189 E.00744
G1 X103.713 Y124.986 E.23306
G1 X103.714 Y124.916 E.00215
G1 X103.754 Y124.833 E.00283
G3 X103.883 Y124.764 I.153 J.133 E.00459
G1 X114.184 Y123.408 E.31925
G3 X115.939 Y123.331 I1.472 J13.541 E.05402
G3 X116.816 Y123.408 I-.441 J10.084 E.02706
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.02 J.192 E.00961
G1 X126.297 Y132.506 E.23305
G3 X126.136 Y132.675 I-.193 J-.022 E.00773
; WIPE_START
M204 S6000
G1 X124.153 Y132.416 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.45 Y125.138 Z1.4 F42000
G1 X126.527 Y124.896 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X127.025 Y125.393 E.02163
G1 X126.963 Y125.865
G1 X125.913 Y124.815 E.04562
G1 X125.299 Y124.734
G1 X126.901 Y126.336 E.06961
G1 X126.838 Y126.807
G1 X124.685 Y124.653 E.0936
G1 X124.07 Y124.572
G1 X126.776 Y127.278 E.11759
G1 X126.714 Y127.749
G1 X123.456 Y124.491 E.14158
G1 X122.842 Y124.41
G1 X126.652 Y128.221 E.16557
G1 X126.59 Y128.692
G1 X122.228 Y124.33 E.18956
G1 X121.614 Y124.249
G1 X126.528 Y129.163 E.21355
G1 X126.466 Y129.634
G1 X121 Y124.168 E.23754
G1 X120.666 Y124.367
G1 X126.404 Y130.105 E.24935
G1 X126.342 Y130.577
G1 X120.647 Y124.882 E.24748
G1 X120.585 Y125.353
G1 X126.28 Y131.048 E.24748
G1 X126.218 Y131.519
G1 X120.523 Y125.824 E.24748
G1 X120.461 Y126.295
G1 X126.156 Y131.99 E.24748
G1 X126.094 Y132.462
G1 X120.399 Y126.766 E.24748
G1 X120.337 Y127.238
G1 X125.489 Y132.389 E.22387
G1 X124.874 Y132.309
G1 X120.275 Y127.709 E.19988
G1 X120.213 Y128.18
G1 X124.26 Y132.228 E.17589
M73 P32 R17
G1 X123.646 Y132.147
G1 X120.151 Y128.651 E.1519
G1 X120.089 Y129.123
G1 X123.032 Y132.066 E.12791
G1 X122.418 Y131.985
G1 X120.027 Y129.594 E.10392
G1 X119.965 Y130.065
G1 X121.804 Y131.904 E.07993
G1 X121.19 Y131.823
G1 X119.903 Y130.536 E.05594
G1 X119.841 Y131.007
G1 X120.576 Y131.743 E.03194
; WIPE_START
M204 S6000
G1 X119.841 Y131.007 E-.39506
G1 X119.903 Y130.536 E-.18061
G1 X120.246 Y130.879 E-.18432
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.384 Y127.536 Z1.4 F42000
G1 X111.186 Y126.465 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.973 Y124.851 E.05401
G1 X111.286 Y124.538 E.01469
G1 X111.952 Y124.452 E.02226
G1 X118.421 Y130.921 E.30351
G2 X115.5 Y130.56 I-4.124 J21.367 E.09772
G2 X112.579 Y130.921 I1.202 J21.728 E.09772
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X120.027 Y124.851 E.01478
G1 X119.814 Y126.465 E.05401
; WIPE_START
G1 X120.027 Y124.851 E-.61876
G1 X119.764 Y124.588 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.132 Y124.674 Z1.4 F42000
G1 X110.328 Y124.695 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X109.825 Y124.191 E.02189
G1 X109.353 Y124.253
G1 X110.409 Y125.309 E.04588
G1 X110.49 Y125.923
G1 X108.882 Y124.315 E.06987
G1 X108.411 Y124.377
G1 X110.571 Y126.537 E.09386
G1 X110.652 Y127.151
G1 X107.94 Y124.439 E.11785
G1 X107.468 Y124.501
G1 X110.733 Y127.765 E.14184
G1 X110.813 Y128.379
G1 X106.997 Y124.563 E.16583
G1 X106.526 Y124.625
G1 X110.894 Y128.994 E.18982
G1 X110.975 Y129.608
G1 X106.055 Y124.687 E.21381
G1 X105.584 Y124.749
G1 X111.056 Y130.222 E.2378
G1 X111.137 Y130.836
G1 X105.112 Y124.811 E.26179
G1 X104.641 Y124.873
G1 X111.274 Y131.506 E.28821
G1 X110.913 Y131.678
G1 X104.17 Y124.935 E.29301
G1 X103.957 Y125.256
G1 X110.442 Y131.74 E.28177
G1 X109.97 Y131.802
G1 X104.038 Y125.87 E.25778
G1 X104.119 Y126.484
G1 X109.499 Y131.864 E.23379
G1 X109.028 Y131.926
G1 X104.2 Y127.098 E.2098
G1 X104.281 Y127.713
G1 X108.557 Y131.988 E.18581
G1 X108.085 Y132.051
G1 X104.362 Y128.327 E.16182
G1 X104.442 Y128.941
G1 X107.614 Y132.113 E.13783
G1 X107.143 Y132.175
G1 X104.523 Y129.555 E.11384
G1 X104.604 Y130.169
G1 X106.672 Y132.237 E.08985
G1 X106.201 Y132.299
G1 X104.685 Y130.783 E.06586
G1 X104.766 Y131.397
G1 X105.729 Y132.361 E.04187
G1 X105.258 Y132.423
G1 X104.847 Y132.011 E.01788
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.258 Y132.423 E-.22108
G1 X105.729 Y132.361 E-.18061
G1 X105.063 Y131.694 E-.35831
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 6/85
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I.142 J1.209 P1  F42000
G1 X146.29 Y126.84 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F7435
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.728 Y134.499 Z1.6 F42000
G1 X149.09 Y140.81 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F7435
M204 S5000
G1 X149.09 Y128.19 E.38778
G1 X152.06 Y128.19 E.09126
G1 X152.06 Y140.81 E.38778
G1 X149.15 Y140.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.843 Y131.531 Z1.6 F42000
G1 X145.71 Y127.94 Z1.6
G1 Z1.2
M73 P32 R16
G1 E.8 F1800
G1 F7435
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.91 Y127.81 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F7435
M204 S5000
G1 X139.94 Y127.81 E.09126
G1 X139.94 Y115.19 E.38778
G1 X142.91 Y115.19 E.09126
G1 X142.91 Y127.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X140.91 Y127.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.603 Y120.649 Z1.6 F42000
G1 X145.71 Y115.06 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F7435
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.228 Y113.701 Z1.6 F42000
G1 X151.751 Y113.609 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7435
M204 S6000
G1 X151.81 Y113.636 E.00213
G1 X151.864 Y113.69 E.00255
G1 X151.898 Y113.812 E.00417
G1 X151.898 Y126.448 E.41917
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.691 Y113.609 E.18541
; WIPE_START
G1 F8843.478
G1 X151.81 Y113.636 E-.04614
G1 X151.864 Y113.69 E-.0292
G1 X151.898 Y113.812 E-.04776
G1 X151.898 Y115.488 E-.6369
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.931 Y123.059 Z1.6 F42000
G1 X148.698 Y140.548 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F7435
M204 S6000
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.102 Y142.178 I.045 J-.2 E.0097
G1 X140.102 Y129.552 E.41881
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.488 E.39925
; WIPE_START
G1 F8843.478
G1 X146.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7435
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.251 Y133.407 Z1.6 F42000
G1 X151.815 Y113.222 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F7435
M204 S5000
G1 X151.818 Y113.222 E.0001
G3 X152.29 Y113.802 I-.128 J.586 E.0248
G1 X152.29 Y142.195 E.87243
G3 X151.726 Y142.789 I-.609 J-.013 E.02761
G1 X140.305 Y142.79 E.35094
G3 X139.71 Y142.192 I.012 J-.607 E.02866
G1 X139.71 Y113.805 E.87224
G3 X140.274 Y113.211 I.603 J.007 E.02767
G1 X151.755 Y113.222 E.35278
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.818 Y113.222 E-.02402
G1 X152.028 Y113.31 E-.08638
G1 X152.156 Y113.426 E-.06576
G1 X152.264 Y113.629 E-.08742
G1 X152.29 Y113.802 E-.06646
G1 X152.29 Y114.933 E-.42997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 6 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer6 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X145.906 Y113.525 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279619
G1 F7435
M204 S6000
G1 X140.293 Y113.525 E.10826
G2 X140.163 Y113.543 I.021 J.653 E.00254
; LINE_WIDTH: 0.232374
G1 X140.119 Y113.556 E.0007
; LINE_WIDTH: 0.202528
G1 X139.955 Y113.616 E.00227
; WIPE_START
G1 F15000
G1 X140.119 Y113.556 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.772 Y120.712 Z1.6 F42000
G1 X144.205 Y124.577 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7435
M204 S6000
G1 X144.205 Y126.205 E.05401
G1 X145.2 Y127.2 E.04665
G1 X145.55 Y127.2 E.01161
G1 X145.55 Y126.1 E.03649
G1 X147.9 Y126.1 E.07798
G1 X151.55 Y122.45 E.1712
G1 X151.55 Y125.874 E.11356
G1 X144.205 Y118.529 E.34454
G1 X144.205 Y122.119 E.11907
G1 X151.55 Y114.774 E.34454
G1 X151.55 Y118.198 E.11355
G1 X147.304 Y113.953 E.19915
G1 X146.45 Y113.952 E.02833
G1 X146.45 Y114.726 E.02568
M204 S10000
G1 X143.754 Y127.096 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F7253.678
M204 S6000
G1 X143.754 Y115.964 E.45022
; WIPE_START
G1 X143.754 Y117.964 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.462 Y125.403 Z1.6 F42000
G1 X146 Y127.744 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7435
M204 S6000
G1 X146 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X146 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.795 Y131.423 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7435
M204 S6000
G1 X147.795 Y129.795 E.05401
G1 X146.8 Y128.8 E.04665
G1 X146.45 Y128.8 E.01161
G1 X146.45 Y129.9 E.03649
G1 X144.1 Y129.9 E.07798
G1 X140.45 Y133.55 E.1712
G1 X140.45 Y130.126 E.11356
G1 X147.795 Y137.471 E.34454
G1 X147.795 Y133.881 E.11907
G1 X140.45 Y141.226 E.34454
G1 X140.45 Y137.802 E.11356
G1 X144.697 Y142.049 E.19924
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
G1 F7435
M204 S6000
G1 X151.707 Y142.475 E.10845
G2 X151.795 Y142.466 I-.013 J-.602 E.00171
; LINE_WIDTH: 0.242843
G2 X151.881 Y142.444 I-.104 J-.597 E.00145
; LINE_WIDTH: 0.202565
G1 X151.927 Y142.427 E.00064
; LINE_WIDTH: 0.163068
G1 X152.058 Y142.368 E.0014
; WIPE_START
G1 F15000
G1 X151.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.246 Y140.096 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F7253.969
M204 S6000
G1 X148.246 Y128.964 E.45021
; OBJECT_ID: 394
; WIPE_START
G1 X148.246 Y130.964 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X140.615 Y131.103 Z1.6 F42000
M73 P33 R16
G1 X119.985 Y131.479 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7435
M204 S6000
G1 X115.817 Y130.93 E.13947
G2 X115.183 Y130.93 I-.317 J4.253 E.02104
G1 X111.015 Y131.479 E.13947
G1 X110.075 Y124.344 E.2387
G1 X114.231 Y123.797 E.13903
G3 X115.922 Y123.723 I1.423 J13.103 E.05618
G3 X116.769 Y123.797 I-.426 J9.738 E.02823
G1 X120.925 Y124.344 E.13903
G1 X119.993 Y131.419 E.23671
M204 S250
G1 X120.373 Y131.542 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7435
M204 S5000
G1 X121.232 Y125.013 E.20234
G1 X121.315 Y124.384 E.01951
G1 X126.887 Y125.117 E.17269
G1 X125.944 Y132.275 E.22185
G1 X120.432 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X120.675 Y129.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.186 Y131.038 Z1.6 F42000
G1 X110.627 Y131.542 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F7435
M204 S5000
G1 X105.056 Y132.275 E.17269
G1 X104.113 Y125.117 E.22185
G1 X104.644 Y125.047 E.01644
G1 X109.685 Y124.384 E.15625
G1 X110.62 Y131.482 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.64 Y131.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.262 Y132.163 Z1.6 F42000
G1 X126.076 Y132.676 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F7435
M204 S5000
G1 X115.77 Y131.319 E.31939
G2 X115.23 Y131.319 I-.27 J3.666 E.01662
G1 X104.854 Y132.674 E.32152
G3 X104.703 Y132.505 I.041 J-.189 E.00745
G1 X103.714 Y124.916 E.23518
G3 X103.883 Y124.764 I.187 J.039 E.00746
G1 X114.184 Y123.408 E.31925
G3 X115.939 Y123.331 I1.476 J13.629 E.05401
G3 X116.816 Y123.408 I-.44 J10.082 E.02707
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.02 J.192 E.00961
G1 X126.297 Y132.506 E.23306
G3 X126.136 Y132.675 I-.193 J-.022 E.00773
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.153 Y132.416 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.238 Y126.889 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7435
M204 S6000
G1 X120.451 Y125.275 E.05401
G1 X119.712 Y124.536 E.03467
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
G3 X115.5 Y130.56 I4.238 J22.26 E.09772
G3 X118.421 Y130.921 I-1.316 J22.621 E.09772
G1 X111.952 Y124.452 E.30348
G1 X111.285 Y124.539 E.02231
G1 X110.549 Y125.275 E.03454
G1 X110.762 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X110.549 Y125.275 E-.61876
G1 X110.812 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 7/85
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I-.063 J1.215 P1  F42000
G1 X146.29 Y126.84 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7106
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.728 Y134.499 Z1.8 F42000
G1 X149.09 Y140.81 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F7106
M204 S5000
G1 X149.09 Y128.19 E.38778
G1 X152.06 Y128.19 E.09126
G1 X152.06 Y140.81 E.38778
G1 X149.15 Y140.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.843 Y131.531 Z1.8 F42000
G1 X145.71 Y127.94 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F7106
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.91 Y127.81 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F7106
M204 S5000
G1 X139.94 Y127.81 E.09126
G1 X139.94 Y115.19 E.38778
G1 X142.91 Y115.19 E.09126
G1 X142.91 Y127.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X140.91 Y127.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.603 Y120.649 Z1.8 F42000
G1 X145.71 Y115.06 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F7106
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.228 Y113.701 Z1.8 F42000
G1 X151.752 Y113.609 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7106
M204 S6000
G1 X151.81 Y113.636 E.00212
G1 X151.864 Y113.691 E.00256
G1 X151.898 Y113.811 E.00414
G1 X151.898 Y126.448 E.4192
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.692 Y113.609 E.18541
; WIPE_START
G1 F8843.478
G1 X151.81 Y113.636 E-.046
G1 X151.864 Y113.691 E-.02929
G1 X151.898 Y113.811 E-.04745
G1 X151.898 Y115.488 E-.63726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.931 Y123.059 Z1.8 F42000
G1 X148.698 Y140.548 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F7106
M204 S6000
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.102 Y142.178 I.045 J-.2 E.0097
G1 X140.102 Y129.552 E.41881
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.488 E.39925
; WIPE_START
G1 F8843.478
G1 X146.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7106
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.249 Y133.407 Z1.8 F42000
G1 X151.806 Y113.222 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F7106
M204 S5000
G1 X151.818 Y113.222 E.00036
G3 X152.29 Y113.801 I-.128 J.586 E.02476
G1 X152.29 Y142.195 E.87247
G3 X151.726 Y142.789 I-.608 J-.012 E.02762
G1 X140.305 Y142.79 E.35093
G3 X139.71 Y142.192 I.012 J-.607 E.02866
G1 X139.71 Y113.805 E.87224
G3 X140.274 Y113.211 I.608 J.012 E.02762
G1 X151.746 Y113.222 E.35252
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.818 Y113.222 E-.02725
G1 X152.028 Y113.31 E-.08631
G1 X152.156 Y113.426 E-.06572
G1 X152.245 Y113.575 E-.06588
G1 X152.29 Y113.801 E-.08762
G1 X152.29 Y114.925 E-.42721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 7 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer7 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X145.906 Y113.525 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279426
G1 F7106
M204 S6000
G1 X140.293 Y113.525 E.10817
G2 X140.136 Y113.55 I.057 J.883 E.00306
; LINE_WIDTH: 0.214714
G1 X140.089 Y113.566 E.00071
; LINE_WIDTH: 0.177636
G1 X139.949 Y113.626 E.00167
; WIPE_START
G1 F15000
G1 X140.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.65 Y116.346 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7106
M204 S6000
G1 X143.65 Y117.974 E.05401
G1 X151.55 Y125.874 E.37058
G1 X151.55 Y122.45 E.11356
G1 X147.9 Y126.1 E.17121
G1 X145.55 Y126.1 E.07797
G1 X145.55 Y127.2 E.03649
G1 X145.2 Y127.2 E.01161
G1 X143.65 Y125.65 E.07269
G1 X143.65 Y122.674 E.09873
G1 X151.55 Y114.774 E.37058
G1 X151.55 Y118.198 E.11356
G1 X147.304 Y113.952 E.19916
G1 X146.45 Y113.952 E.02833
G1 X146.45 Y114.726 E.02568
; WIPE_START
G1 F8843.478
G1 X146.45 Y113.952 E-.29419
G1 X147.304 Y113.952 E-.32457
G1 X147.567 Y114.215 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.689 Y121.797 Z1.8 F42000
G1 X146 Y127.744 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7106
M204 S6000
G1 X146 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X146 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.477 Y135.232 Z1.8 F42000
G1 X148.35 Y139.654 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7106
M204 S6000
G1 X148.35 Y138.026 E.05401
G1 X140.45 Y130.126 E.37058
G1 X140.45 Y133.55 E.11357
G1 X144.1 Y129.9 E.17121
G1 X146.45 Y129.9 E.07797
G1 X146.45 Y128.8 E.03649
G1 X146.8 Y128.8 E.01161
G1 X148.35 Y130.35 E.07269
G1 X148.35 Y133.326 E.09873
G1 X140.45 Y141.226 E.37058
G1 X140.45 Y137.802 E.11357
G1 X144.697 Y142.049 E.19925
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.787 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280104
G1 F7106
M204 S6000
G1 X151.755 Y142.472 E.1094
; LINE_WIDTH: 0.254843
G1 X151.867 Y142.449 E.00197
; LINE_WIDTH: 0.213451
G1 X151.912 Y142.434 E.00066
; LINE_WIDTH: 0.177345
G1 X152.051 Y142.374 E.00166
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X144.692 Y139.956 Z1.8 F42000
G1 X119.985 Y131.479 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7106
M204 S6000
G1 X115.81 Y130.929 E.1397
G2 X115.19 Y130.929 I-.31 J2.802 E.02061
G1 X111.015 Y131.479 E.1397
G1 X110.075 Y124.344 E.2387
G1 X114.231 Y123.797 E.13903
G3 X115.922 Y123.723 I1.426 J13.183 E.05618
G3 X116.769 Y123.797 I-.426 J9.737 E.02823
G1 X120.925 Y124.344 E.13903
G1 X119.993 Y131.419 E.23671
M204 S250
G1 X120.373 Y131.542 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7106
M204 S5000
G1 X121.01 Y126.699 E.1501
G1 X121.315 Y124.384 E.07175
G1 X126.887 Y125.117 E.17269
G1 X125.944 Y132.275 E.22185
G1 X120.432 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X120.669 Y129.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.18 Y131.039 Z1.8 F42000
G1 X110.627 Y131.542 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F7106
M204 S5000
G1 X105.056 Y132.275 E.17269
G1 X104.113 Y125.117 E.22185
G1 X105.932 Y124.878 E.05638
G1 X109.685 Y124.384 E.1163
G1 X110.62 Y131.482 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.64 Y131.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.262 Y132.163 Z1.8 F42000
G1 X126.076 Y132.676 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F7106
M204 S5000
G1 X115.768 Y131.319 E.3195
G2 X115.232 Y131.319 I-.268 J2.339 E.01648
G1 X104.854 Y132.674 E.32161
G3 X104.703 Y132.505 I.041 J-.189 E.00744
G1 X103.713 Y124.986 E.23304
G1 X103.714 Y124.915 E.00217
G1 X103.754 Y124.832 E.00283
G3 X103.883 Y124.764 I.153 J.133 E.00458
G1 X114.184 Y123.408 E.31925
G3 X115.939 Y123.331 I1.479 J13.715 E.05401
G3 X116.816 Y123.408 I-.44 J10.081 E.02707
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.025 J.195 E.00955
G1 X126.297 Y132.506 E.23306
G3 X126.136 Y132.675 I-.193 J-.022 E.00771
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.153 Y132.416 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.098 Y129.504 Z1.8 F42000
G1 X110.762 Y126.889 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7106
M204 S6000
G1 X110.549 Y125.275 E.05401
G1 X111.285 Y124.539 E.03454
G1 X111.952 Y124.452 E.02231
G1 X118.421 Y130.921 E.30348
G2 X115.5 Y130.56 I-4.119 J21.327 E.09772
G2 X112.579 Y130.921 I1.197 J21.688 E.09772
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X120.451 Y125.275 E.03467
G1 X120.238 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P34 R16
G1 F8843.478
G1 X120.451 Y125.275 E-.61876
G1 X120.188 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 8/85
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-.085 J1.214 P1  F42000
G1 X146.29 Y126.84 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6315
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F6315
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y121.539 Z2 F42000
G1 X145.71 Y115.06 Z2
G1 Z1.6
G1 E.8 F1800
G1 F6315
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.51 Y122.651 Z2 F42000
G1 X143.382 Y127.548 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6315
M204 S6000
G1 X143.302 Y127.548 E.00264
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.752 Y113.609 E.1874
G1 X151.81 Y113.636 E.00212
G1 X151.864 Y113.691 E.00256
G3 X151.897 Y113.79 I-.224 J.129 E.00351
G1 X151.898 Y126.448 E.41987
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.442 Y127.548 E.08148
; WIPE_START
G1 F8843.478
G1 X143.302 Y127.548 E-.05301
G1 X143.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.652 Y129.552 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F6315
M204 S6000
G1 X146.102 Y129.552 E.0481
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.056 J-.207 E.00879
G1 X140.102 Y129.552 E.41963
G1 X144.592 Y129.552 E.14894
; WIPE_START
G1 F8843.478
G1 X146.102 Y129.552 E-.5738
G1 X146.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.223 Y136.694 Z2 F42000
G1 X146.29 Y140.94 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6315
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.403 Y133.913 Z2 F42000
G1 X142.91 Y127.81 Z2
G1 Z1.6
G1 E.8 F1800
G1 F6315
M204 S5000
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.774 E.05811
G3 X140.274 Y113.211 I.594 J.031 E.02679
G1 X151.818 Y113.222 E.35473
G3 X152.289 Y113.771 I-.12 J.58 E.0239
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.81 E.38778
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.85 Y127.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X142.859 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 8 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer8 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X146 Y127.744 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F6315
M204 S6000
G1 X146 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X146 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.746 Y135.372 Z2 F42000
G1 X145.55 Y141.273 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6315
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X140.451 Y137.803 E.19922
G1 X140.451 Y141.225 E.11351
G1 X148.35 Y133.326 E.37054
G1 X148.35 Y130.35 E.09873
G1 X146.8 Y128.8 E.07269
G1 X146.45 Y128.8 E.01161
G1 X146.45 Y129.9 E.03649
G1 X144.1 Y129.9 E.07797
G1 X140.451 Y133.549 E.17119
G1 X140.45 Y130.126 E.11355
G1 X148.35 Y138.026 E.37058
G1 X148.35 Y139.654 E.05401
; WIPE_START
G1 F8843.478
G1 X148.35 Y138.026 E-.61876
G1 X148.087 Y137.763 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278372
G1 F6315
M204 S6000
G1 X151.707 Y142.475 E.10769
G2 X152.037 Y142.402 I-.1 J-1.248 E.0065
M204 S10000
G1 X152.051 Y142.374 F42000
; LINE_WIDTH: 0.177457
G1 F6315
M204 S6000
G1 X151.54 Y142.593 E.0061
; WIPE_START
G1 F15000
G1 X152.051 Y142.374 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.536 Y134.893 Z2 F42000
G1 X146.45 Y114.726 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6315
M204 S6000
G1 X146.45 Y113.951 E.02568
G1 X147.304 Y113.952 E.02833
G1 X151.549 Y118.197 E.19913
G1 X151.549 Y114.775 E.11351
G1 X143.65 Y122.674 E.37054
G1 X143.65 Y125.65 E.09873
G1 X145.2 Y127.2 E.07269
G1 X145.55 Y127.2 E.01161
G1 X145.55 Y126.1 E.03649
G1 X147.9 Y126.1 E.07797
G1 X151.549 Y122.451 E.17119
G1 X151.55 Y125.874 E.11355
G1 X143.65 Y117.974 E.37058
G1 X143.65 Y116.346 E.05401
; WIPE_START
G1 F8843.478
G1 X143.65 Y117.974 E-.61876
G1 X143.913 Y118.237 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279629
G1 F6315
M204 S6000
G1 X140.293 Y113.525 E.10826
G2 X140.163 Y113.543 I.021 J.656 E.00254
; LINE_WIDTH: 0.223432
G1 X140.09 Y113.566 E.00111
; LINE_WIDTH: 0.178603
G1 X139.949 Y113.626 E.0017
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.09 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.392 Y118.643 Z2 F42000
G1 X119.985 Y131.479 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6315
M204 S6000
G1 X115.81 Y130.929 E.1397
G2 X115.19 Y130.929 I-.31 J2.801 E.02061
G1 X111.015 Y131.479 E.1397
G1 X110.075 Y124.344 E.2387
G1 X114.231 Y123.797 E.13903
G3 X115.922 Y123.723 I1.43 J13.277 E.05618
G3 X116.769 Y123.797 I-.426 J9.737 E.02823
G1 X120.925 Y124.344 E.13903
G1 X119.993 Y131.419 E.23671
M204 S250
G1 X120.373 Y131.542 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6315
M204 S5000
G1 X120.788 Y128.384 E.09787
G1 X121.315 Y124.384 E.12398
G1 X126.887 Y125.117 E.17269
G1 X125.944 Y132.275 E.22185
G1 X120.432 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X120.656 Y129.562 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.168 Y131.04 Z2 F42000
G1 X110.627 Y131.542 Z2
G1 Z1.6
G1 E.8 F1800
G1 F6315
M204 S5000
G1 X105.056 Y132.275 E.17269
G1 X104.113 Y125.117 E.22185
G1 X107.221 Y124.708 E.09633
G1 X109.685 Y124.384 E.07636
G1 X110.62 Y131.482 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.64 Y131.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.262 Y132.163 Z2 F42000
G1 X126.078 Y132.676 Z2
G1 Z1.6
G1 E.8 F1800
G1 F6315
M204 S5000
G1 X115.768 Y131.319 E.31955
G2 X115.232 Y131.319 I-.268 J2.339 E.01648
G1 X104.855 Y132.674 E.3216
G3 X104.703 Y132.506 I.041 J-.19 E.00745
G1 X103.713 Y124.986 E.23306
G1 X103.729 Y124.872 E.00354
G3 X103.883 Y124.764 I.176 J.088 E.00603
G1 X114.184 Y123.408 E.31925
G3 X115.939 Y123.331 I1.483 J13.805 E.05401
G3 X116.816 Y123.408 I-.44 J10.081 E.02707
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.022 J.193 E.00959
G1 X126.297 Y132.506 E.23306
G3 X126.138 Y132.675 I-.193 J-.022 E.00766
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.155 Y132.416 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.238 Y126.889 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6315
M204 S6000
G1 X120.451 Y125.275 E.05401
G1 X119.712 Y124.536 E.03467
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
G3 X115.5 Y130.56 I4.119 J21.327 E.09772
G3 X118.421 Y130.921 I-1.197 J21.687 E.09772
G1 X111.952 Y124.452 E.30348
G1 X111.285 Y124.539 E.02231
G1 X110.549 Y125.275 E.03454
G1 X110.762 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X110.549 Y125.275 E-.61876
G1 X110.812 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 9/85
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-.063 J1.215 P1  F42000
G1 X146.29 Y126.84 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7311
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F7311
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y121.539 Z2.2 F42000
G1 X145.71 Y115.06 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F7311
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.51 Y122.651 Z2.2 F42000
G1 X143.382 Y127.548 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7311
M204 S6000
G1 X143.302 Y127.548 E.00264
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.752 Y113.609 E.18741
G1 X151.81 Y113.636 E.00211
G1 X151.864 Y113.69 E.00255
G3 X151.897 Y113.79 I-.225 J.13 E.00352
G1 X151.898 Y126.448 E.41988
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.442 Y127.548 E.08148
; WIPE_START
G1 F8843.478
G1 X143.302 Y127.548 E-.05301
G1 X143.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.652 Y129.552 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F7311
M204 S6000
G1 X146.102 Y129.552 E.0481
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.243 Y142.389 E.18759
G3 X140.103 Y142.202 I.07 J-.198 E.00819
G1 X140.102 Y129.552 E.41963
G1 X144.592 Y129.552 E.14894
; WIPE_START
G1 F8843.478
G1 X146.102 Y129.552 E-.5738
G1 X146.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.223 Y136.694 Z2.2 F42000
G1 X146.29 Y140.94 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7311
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.403 Y133.913 Z2.2 F42000
G1 X142.91 Y127.81 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F7311
M204 S5000
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
M73 P35 R16
G1 X139.711 Y113.774 E.0581
G3 X140.274 Y113.211 I.594 J.031 E.0268
G1 X151.818 Y113.222 E.35473
G3 X152.289 Y113.771 I-.12 J.58 E.0239
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.81 E.38778
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.226 E.05811
G3 X151.726 Y142.789 I-.594 J-.031 E.02678
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.013 J-.609 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.85 Y127.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X142.859 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 9 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer9 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X143.665 Y126.625 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383501
G1 F7311
M204 S6000
G1 X143.665 Y115.974 E.29558
G1 X143.692 Y115.842 E.00374
G1 X143.824 Y115.815 E.00374
G1 X146.306 Y115.815 E.06887
G1 X146.437 Y115.787 E.00374
G1 X146.465 Y115.656 E.00374
G1 X146.465 Y114.126 E.04246
G1 X146.492 Y113.994 E.00374
G1 X146.624 Y113.966 E.00374
G1 X151.375 Y113.972 E.13185
G1 X151.507 Y113.999 E.00374
G1 X151.534 Y114.131 E.00374
G1 X151.535 Y124.369 E.28415
M204 S10000
G1 X151.172 Y121.2 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7311
M204 S6000
G1 X151.172 Y122.828 E.05401
G1 X148.277 Y125.722 E.13579
G1 X151.042 Y125.722 E.0917
G1 X150.665 Y126.1 E.01769
G1 X151.55 Y126.1 E.02935
G1 X151.549 Y125.874 E.0075
G1 X144.027 Y118.352 E.35287
G1 X144.027 Y116.177 E.07212
G1 X146.827 Y116.177 E.09288
G1 X146.827 Y114.329 E.06131
G1 X147.682 Y114.33 E.02835
G1 X151.172 Y117.82 E.16371
G1 X151.172 Y115.152 E.08848
G1 X144.027 Y122.297 E.33515
G1 X144.027 Y126.027 E.12376
G1 X144.822 Y126.822 E.0373
G1 X145.173 Y126.822 E.01161
G1 X145.173 Y125.722 E.03649
G1 X145.351 Y125.722 E.00591
M204 S10000
G1 X144.547 Y127.185 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383609
G1 F7311
M204 S6000
G1 X145.081 Y127.185 E.0148
G1 X145.428 Y127.104 E.0099
G1 X145.535 Y126.986 E.00444
G1 X145.535 Y126.244 E.02057
G1 X145.562 Y126.112 E.00374
G1 X145.694 Y126.085 E.00374
G1 X150.106 Y126.085 E.12249
; WIPE_START
G1 F10566.837
G1 X148.106 Y126.085 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y127.744 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7311
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.597 Y128.8 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7311
M204 S6000
G1 X146.45 Y128.8 E.00486
G1 X146.45 Y128.9 E.00331
G1 X146.802 Y128.802 E.01212
G1 X146.597 Y128.8 E.00682
M204 S10000
G1 X146.465 Y129.272 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383349
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X146.437 Y129.888 E.01708
G1 X146.306 Y129.915 E.00374
G1 X141.852 Y129.915 E.12353
; Slow Down End
M204 S10000
G1 X140.465 Y131.906 F42000
; LINE_WIDTH: 0.383501
G1 F7311
M204 S6000
G1 X140.466 Y141.876 E.27671
G1 X140.493 Y142.008 E.00374
G1 X140.625 Y142.035 E.00374
G1 X145.376 Y142.035 E.13185
G1 X145.508 Y142.007 E.00374
G1 X145.535 Y141.876 E.00374
G1 X145.535 Y140.344 E.04249
G1 X145.562 Y140.212 E.00374
G1 X145.694 Y140.185 E.00374
G1 X148.176 Y140.185 E.06887
G1 X148.308 Y140.158 E.00374
G1 X148.335 Y140.026 E.00374
G1 X148.335 Y129.138 E.30217
M204 S10000
G1 X140.828 Y134.8 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7311
M204 S6000
G1 X140.828 Y133.172 E.05401
G1 X143.722 Y130.277 E.13579
G1 X140.917 Y130.277 E.09307
G1 X141.294 Y129.9 E.01769
G1 X140.45 Y129.9 E.02798
G1 X140.451 Y130.126 E.0075
G1 X140.759 Y130.435 E.01448
G1 X140.828 Y130.367 E.00321
G1 X140.828 Y130.504 E.00454
G1 X147.973 Y137.648 E.33518
G1 X147.973 Y139.823 E.07212
G1 X145.173 Y139.823 E.09288
G1 X145.173 Y141.672 E.06135
G1 X144.32 Y141.672 E.02827
G1 X140.828 Y138.18 E.16382
G1 X140.828 Y140.848 E.08848
G1 X147.973 Y133.703 E.33515
G1 X147.973 Y129.973 E.12376
G1 X147.177 Y129.177 E.03731
G1 X146.827 Y129.177 E.0116
G1 X146.827 Y130.277 E.0365
G1 X146.649 Y130.277 E.00591
; WIPE_START
G1 F8843.478
G1 X146.827 Y130.277 E-.06768
G1 X146.827 Y129.177 E-.41816
G1 X147.177 Y129.177 E-.13292
G1 X147.44 Y129.44 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.656 Y137.032 Z2.2 F42000
G1 X146.094 Y142.475 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F7311
M204 S6000
G1 X151.707 Y142.475 E.10845
G2 X151.795 Y142.466 I-.013 J-.6 E.00171
; LINE_WIDTH: 0.242882
G2 X151.881 Y142.444 I-.104 J-.594 E.00145
; LINE_WIDTH: 0.202496
G1 X151.927 Y142.427 E.00064
; LINE_WIDTH: 0.163002
G1 X152.058 Y142.368 E.0014
; WIPE_START
G1 F15000
G1 X151.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.371 Y134.955 Z2.2 F42000
G1 X145.906 Y113.525 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.279461
G1 F7311
M204 S6000
G1 X140.293 Y113.525 E.10819
G2 X140.138 Y113.549 I.053 J.859 E.00302
; LINE_WIDTH: 0.215018
G1 X140.088 Y113.566 E.00074
; LINE_WIDTH: 0.177315
G1 X139.949 Y113.626 E.00166
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.39 Y118.644 Z2.2 F42000
G1 X119.985 Y131.479 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7311
M204 S6000
G1 X115.81 Y130.929 E.1397
G2 X115.184 Y130.93 I-.309 J3.311 E.02081
G1 X111.015 Y131.479 E.13948
G1 X110.075 Y124.344 E.2387
G1 X114.231 Y123.797 E.13903
G3 X115.922 Y123.723 I1.434 J13.365 E.05618
G3 X116.769 Y123.797 I-.428 J9.757 E.02823
G1 X120.925 Y124.344 E.13904
G1 X119.993 Y131.419 E.23671
; WIPE_START
G1 F8843.478
G1 X118.007 Y131.186 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.098 Y126.356 Z2.2 F42000
G1 X109.685 Y124.384 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7311
M204 S5000
G1 X110.627 Y131.542 E.22185
G1 X105.056 Y132.275 E.17269
G1 X104.113 Y125.117 E.22185
G1 X108.51 Y124.538 E.13627
G1 X109.626 Y124.391 E.03457
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.903 Y126.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.747 Y129.751 Z2.2 F42000
G1 X120.373 Y131.542 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F7311
M204 S5000
G1 X120.566 Y130.069 E.04563
G1 X121.315 Y124.384 E.17622
G1 X126.887 Y125.117 E.17269
G1 X125.944 Y132.275 E.22185
G1 X120.432 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X120.566 Y130.069 E-.56476
G1 X120.633 Y129.56 E-.19524
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.078 Y132.676 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F7311
M204 S5000
G1 X115.768 Y131.319 E.31954
G2 X115.23 Y131.319 I-.267 J2.787 E.01654
G1 X104.854 Y132.674 E.32153
G3 X104.703 Y132.506 I.041 J-.189 E.00745
G1 X103.714 Y124.915 E.2352
G3 X103.883 Y124.764 I.187 J.039 E.00744
G1 X114.184 Y123.408 E.31926
G3 X115.939 Y123.331 I1.487 J13.895 E.05401
G3 X116.816 Y123.408 I-.442 J10.095 E.02707
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.02 J.192 E.00961
G1 X126.297 Y132.506 E.23306
G3 X126.138 Y132.674 I-.195 J-.025 E.00763
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.155 Y132.415 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.099 Y129.504 Z2.2 F42000
G1 X110.762 Y126.889 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7311
M204 S6000
G1 X110.549 Y125.275 E.05401
G1 X111.285 Y124.539 E.03454
G1 X111.952 Y124.452 E.02231
G1 X118.421 Y130.921 E.30348
G2 X115.493 Y130.56 I-4.091 J21.111 E.09797
G2 X112.579 Y130.921 I1.335 J22.705 E.09747
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X120.451 Y125.275 E.03467
G1 X120.238 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X120.451 Y125.275 E-.61876
G1 X120.188 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 10/85
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
M106 S196.35
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-.085 J1.214 P1  F42000
G1 X146.29 Y126.84 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y121.539 Z2.4 F42000
G1 X145.71 Y115.06 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.51 Y122.651 Z2.4 F42000
G1 X143.382 Y127.548 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y127.548 E.00264
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.752 Y113.609 E.18741
G1 X151.809 Y113.636 E.00211
G3 X151.897 Y113.79 I-.112 J.165 E.0061
G1 X151.898 Y126.448 E.41987
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.442 Y127.548 E.08148
; WIPE_START
G1 X143.302 Y127.548 E-.05301
G1 X143.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.652 Y129.552 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X146.102 Y129.552 E.0481
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.049 J-.202 E.00883
G1 X140.102 Y129.552 E.41963
G1 X144.592 Y129.552 E.14894
; WIPE_START
G1 X146.102 Y129.552 E-.5738
G1 X146.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.223 Y136.694 Z2.4 F42000
G1 X146.29 Y140.94 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.403 Y133.913 Z2.4 F42000
G1 X142.91 Y127.81 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.594 J.034 E.02671
G1 X151.818 Y113.222 E.35473
G3 X152.289 Y113.771 I-.125 J.583 E.02387
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.81 E.38778
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.591 J-.031 E.02675
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.85 Y127.81 E.08942
; WIPE_START
M204 S6000
G1 X142.859 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 10 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer10 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X144.899 Y127.381 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40655
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X145.731 Y126.549 E.06223
M106 S196.35
; WIPE_START
G1 X144.899 Y127.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y127.744 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.8 Y128.8 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.802 Y128.802 E.0001
M204 S10000
G1 X147.435 Y128.901 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40763
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X140.472 Y135.864 E.5236
G1 X140.472 Y136.511 E.03441
G1 X147.616 Y129.368 E.53716
G1 X147.677 Y129.429 E.00463
G1 X148.328 Y129.153 E.03762
G1 X148.328 Y129.302 E.00797
G1 X140.472 Y137.158 E.59074
G1 X140.472 Y137.806 E.03441
G1 X148.328 Y129.95 E.59074
G1 X148.328 Y130.597 E.03441
G1 X140.472 Y138.453 E.59073
G1 X140.472 Y139.1 E.03441
G1 X148.328 Y131.244 E.59073
G1 X148.328 Y131.891 E.03441
G1 X140.472 Y139.747 E.59073
G1 X140.473 Y140.394 E.03441
G1 X148.328 Y132.538 E.59073
G1 X148.328 Y133.186 E.03441
G1 X140.473 Y141.041 E.59072
G1 X140.473 Y141.688 E.03441
G1 X148.328 Y133.833 E.59072
M73 P36 R16
G1 X148.328 Y134.48 E.03441
G1 X140.78 Y142.028 E.5676
G1 X141.427 Y142.028 E.03441
G1 X148.328 Y135.127 E.51894
G1 X148.328 Y135.774 E.03441
G1 X142.074 Y142.028 E.47026
G1 X142.722 Y142.028 E.03442
G1 X148.328 Y136.422 E.42159
G1 X148.328 Y137.069 E.03441
G1 X143.166 Y142.231 E.38815
M106 S196.35
M204 S10000
G1 X145.108 Y142.23 F42000
M106 S255
G1 F3000
M204 S6000
G1 X145.528 Y141.81 E.03159
G1 X145.528 Y141.163 E.03441
G1 X144.663 Y142.028 E.06503
G1 X144.016 Y142.028 E.03442
G1 X148.328 Y137.716 E.32425
G1 X148.328 Y138.363 E.03441
G1 X146.513 Y140.178 E.1365
G1 X147.16 Y140.178 E.03441
G1 X148.328 Y139.01 E.08783
G1 X148.328 Y139.657 E.03441
G1 X147.605 Y140.381 E.05439
M106 S196.35
; WIPE_START
G1 X148.328 Y139.657 E-.38872
G1 X148.328 Y139.01 E-.24593
G1 X148.095 Y139.244 E-.12535
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X151.707 Y142.475 E.10844
G2 X151.795 Y142.466 I-.014 J-.605 E.00172
; LINE_WIDTH: 0.236058
G2 X152.039 Y142.399 I-.334 J-1.684 E.00398
M204 S10000
G1 X152.052 Y142.372 F42000
; LINE_WIDTH: 0.171748
G1 F15000
M204 S6000
G1 X151.554 Y142.593 E.00571
; WIPE_START
G1 X152.052 Y142.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.479 Y138.493 Z2.4 F42000
G1 X140.27 Y135.42 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40763
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X145.768 Y129.922 E.41342
G1 X145.12 Y129.922 E.03441
G1 X140.472 Y134.57 E.34953
G1 X140.472 Y133.923 E.03441
G1 X144.473 Y129.922 E.30086
G1 X143.826 Y129.922 E.03441
G1 X140.472 Y133.276 E.2522
G1 X140.472 Y132.628 E.03441
G1 X143.179 Y129.922 E.20354
G1 X142.532 Y129.922 E.03441
G1 X140.532 Y131.921 E.15037
G1 X141.059 Y130.983 E.05724
G1 X140.941 Y130.865 E.00886
G1 X142.087 Y129.719 E.08615
M106 S196.35
M204 S10000
G1 X140.517 Y131.057 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.444675
; LAYER_HEIGHT: 0.2
G1 F8960.685
M204 S6000
G1 X140.49 Y130.96 E.00332
; LINE_WIDTH: 0.403505
G1 F9983.776
G1 X140.463 Y130.862 E.00298
; LINE_WIDTH: 0.402984
G1 F9998.223
G1 X140.486 Y130.795 E.00209
; LINE_WIDTH: 0.443112
G1 F8995.681
G1 X140.508 Y130.727 E.00232
; LINE_WIDTH: 0.48324
G1 F8175.872
G1 X140.531 Y130.659 E.00256
; LINE_WIDTH: 0.523368
G1 F7493.006
G1 X140.554 Y130.592 E.00279
; LINE_WIDTH: 0.580771
G1 F6693.314
G1 X140.576 Y130.524 E.00312
G1 X140.576 Y130.086 E.01921
; WIPE_START
G1 X140.576 Y130.524 E-.65367
G1 X140.554 Y130.592 E-.10633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.481 Y127.387 Z2.4 F42000
G1 X149.873 Y126.281 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40655
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X151.18 Y124.973 E.09779
M73 P36 R15
G1 X151.528 Y124.299 E.04016
G1 X151.528 Y123.98 E.01685
G1 X149.43 Y126.078 E.15695
G1 X148.784 Y126.078 E.03415
G1 X151.528 Y123.334 E.20524
G1 X151.528 Y122.689 E.03415
G1 X148.138 Y126.078 E.25353
G1 X147.493 Y126.078 E.03415
G1 X151.528 Y122.043 E.30183
G1 X151.528 Y121.397 E.03415
G1 X146.847 Y126.078 E.35012
G1 X146.201 Y126.078 E.03415
G1 X151.528 Y120.752 E.39841
G1 X151.528 Y120.106 E.03415
G1 X144.633 Y127.001 E.51571
G1 X144.708 Y126.28 E.03834
G1 X151.528 Y119.461 E.51007
G1 X151.528 Y118.815 E.03415
G1 X143.843 Y126.5 E.57479
G1 X143.672 Y126.553 E.00951
G1 X143.672 Y126.025 E.02793
G1 X151.528 Y118.169 E.58761
G1 X151.528 Y117.524 E.03415
G1 X143.672 Y125.38 E.58761
G1 X143.672 Y124.734 E.03415
G1 X151.528 Y116.878 E.58761
G1 X151.527 Y116.233 E.03415
G1 X143.672 Y124.088 E.5876
G1 X143.672 Y123.443 E.03415
G1 X151.527 Y115.587 E.5876
G1 X151.527 Y114.941 E.03415
G1 X143.672 Y122.797 E.5876
G1 X143.672 Y122.151 E.03415
G1 X151.527 Y114.296 E.58759
G1 X151.527 Y113.979 E.01677
G1 X151.199 Y113.978 E.01736
G1 X143.672 Y121.506 E.56304
G1 X143.672 Y120.86 E.03415
G1 X150.554 Y113.978 E.5148
G1 X149.909 Y113.977 E.03411
G1 X143.672 Y120.214 E.46656
G1 X143.672 Y119.569 E.03415
G1 X149.264 Y113.976 E.41832
G1 X148.619 Y113.975 E.03411
G1 X143.672 Y118.923 E.37008
G1 X143.672 Y118.277 E.03415
G1 X147.974 Y113.975 E.32184
G1 X147.33 Y113.974 E.03411
G1 X146.472 Y114.832 E.06416
G1 X146.472 Y114.186 E.03415
G1 X146.887 Y113.771 E.03105
M106 S196.35
; WIPE_START
G1 X146.472 Y114.186 E-.22311
G1 X146.472 Y114.832 E-.24535
G1 X147.014 Y114.289 E-.29153
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279609
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10825
G2 X140.158 Y113.544 I.022 J.668 E.00264
; LINE_WIDTH: 0.221761
G1 X140.089 Y113.566 E.00105
; LINE_WIDTH: 0.177707
G1 X139.949 Y113.626 E.00168
; WIPE_START
G1 X140.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.393 Y115.619 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40655
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X143.672 Y116.34 E.05395
G1 X143.672 Y116.546 E.01089
G1 X144.02 Y116.546 E.01841
G1 X143.672 Y116.894 E.02603
G1 X143.672 Y116.986 E.00485
G1 X144.836 Y115.822 E.0871
G1 X145.482 Y115.822 E.03415
G1 X143.469 Y117.834 E.15054
M106 S196.35
M204 S10000
G1 X151.424 Y125.974 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.58358
; LAYER_HEIGHT: 0.2
G1 F6658.529
M204 S6000
G1 X151.424 Y125.495 E.02112
; OBJECT_ID: 394
; WIPE_START
G1 X151.424 Y125.974 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X144.014 Y127.802 Z2.4 F42000
G1 X125.934 Y132.262 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.816 Y130.93 E.33852
G2 X115.184 Y130.93 I-.316 J4.258 E.02101
G1 X105.066 Y132.262 E.33852
G1 X104.127 Y125.127 E.2387
G1 X114.231 Y123.797 E.33807
G3 X115.922 Y123.723 I1.438 J13.452 E.05618
G3 X116.769 Y123.797 I-.426 J9.738 E.02823
G1 X126.873 Y125.127 E.33807
G1 X125.942 Y132.202 E.23671
M204 S250
G1 X126.078 Y132.676 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.77 Y131.319 E.31948
G2 X115.23 Y131.319 I-.27 J3.672 E.0166
G1 X104.924 Y132.676 E.31941
G1 X104.81 Y132.66 E.00353
G3 X104.703 Y132.505 I.087 J-.176 E.00603
G1 X103.714 Y124.915 E.2352
G3 X103.883 Y124.764 I.187 J.039 E.00744
G1 X114.184 Y123.408 E.31925
G3 X115.939 Y123.331 I1.491 J13.982 E.05401
G3 X116.816 Y123.408 I-.44 J10.082 E.02707
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.02 J.192 E.0096
G1 X126.297 Y132.506 E.23306
G3 X126.138 Y132.675 I-.193 J-.022 E.00766
; WIPE_START
M204 S6000
G1 X124.155 Y132.416 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.826 Y131.118 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4266
M106 S255
G1 F3000
M204 S6000
G1 X120.589 Y131.218 E.02405
G1 X120.645 Y131.175 E.00221
G1 X125.601 Y131.828 E.15631
G1 X125.645 Y131.497 E.01043
G1 X120.044 Y130.76 E.17661
G1 X120.094 Y130.379 E.012
G1 X125.695 Y131.117 E.17661
G1 X125.745 Y130.736 E.012
G1 X120.144 Y129.999 E.17661
G1 X120.195 Y129.619 E.012
G1 X125.795 Y130.356 E.17661
G1 X125.845 Y129.976 E.012
G1 X120.245 Y129.238 E.17661
G1 X120.295 Y128.858 E.012
G1 X125.895 Y129.595 E.17661
G1 X125.945 Y129.215 E.012
G1 X120.345 Y128.477 E.17661
G1 X120.395 Y128.097 E.012
G1 X125.995 Y128.834 E.17661
G1 X126.045 Y128.454 E.012
G1 X120.445 Y127.717 E.17661
G1 X120.495 Y127.336 E.012
G1 X126.096 Y128.074 E.17661
G1 X126.146 Y127.693 E.012
G1 X120.545 Y126.956 E.17661
G1 X120.595 Y126.575 E.012
G1 X126.196 Y127.313 E.17661
G1 X126.246 Y126.932 E.012
G1 X120.645 Y126.195 E.17661
G1 X120.695 Y125.815 E.012
G1 X126.296 Y126.552 E.17661
G1 X126.346 Y126.172 E.012
G1 X120.745 Y125.434 E.17661
G1 X120.795 Y125.054 E.012
G1 X126.396 Y125.791 E.17661
G1 X126.44 Y125.46 E.01044
G1 X121.483 Y124.808 E.15631
G1 X121.44 Y124.752 E.0022
G1 X120.677 Y124.651 E.02405
M106 S196.35
M204 S10000
G1 X120.168 Y126.819 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.38 Y125.204 E.05401
G1 X119.712 Y124.536 E.03135
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
G3 X115.5 Y130.56 I4.235 J22.239 E.09772
G3 X118.421 Y130.921 I-1.312 J22.589 E.09772
G1 X111.949 Y124.449 E.30364
G1 X111.288 Y124.536 E.02211
G1 X110.62 Y125.204 E.03135
G1 X110.832 Y126.819 E.05401
; WIPE_START
G1 X110.62 Y125.204 E-.61876
G1 X110.883 Y124.941 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I-.092 J-1.213 P1  F42000
G1 X104.386 Y125.433 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4266
M106 S255
G1 F3000
M204 S6000
G1 X110.154 Y124.673 E.18192
G1 X110.204 Y125.054 E.012
M73 P37 R15
G1 X104.604 Y125.791 E.17661
G1 X104.654 Y126.172 E.012
G1 X110.255 Y125.434 E.17661
G1 X110.305 Y125.815 E.012
G1 X104.704 Y126.552 E.17661
G1 X104.754 Y126.932 E.012
G1 X110.355 Y126.195 E.17661
G1 X110.405 Y126.575 E.012
G1 X104.804 Y127.313 E.17661
G1 X104.854 Y127.693 E.012
G1 X110.455 Y126.956 E.17661
G1 X110.505 Y127.336 E.012
G1 X104.904 Y128.074 E.17661
G1 X104.955 Y128.454 E.012
G1 X110.555 Y127.717 E.17661
G1 X110.605 Y128.097 E.012
G1 X105.005 Y128.834 E.17661
G1 X105.055 Y129.215 E.012
G1 X110.655 Y128.477 E.17661
G1 X110.705 Y128.858 E.012
G1 X105.105 Y129.595 E.17661
G1 X105.155 Y129.976 E.012
G1 X110.755 Y129.238 E.17661
G1 X110.805 Y129.619 E.012
G1 X105.205 Y130.356 E.17661
G1 X105.255 Y130.736 E.012
G1 X110.856 Y129.999 E.17661
G1 X110.906 Y130.379 E.012
G1 X105.305 Y131.117 E.17661
G1 X105.355 Y131.497 E.012
G1 X110.956 Y130.76 E.17661
G1 X111.006 Y131.14 E.012
G1 X105.237 Y131.9 E.18192
M106 S196.35
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X107.22 Y131.639 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 11/85
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S201.45
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I.148 J1.208 P1  F42000
G1 X146.29 Y126.84 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y121.539 Z2.6 F42000
G1 X145.71 Y115.06 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.51 Y122.651 Z2.6 F42000
G1 X143.382 Y127.548 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y127.548 E.00264
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.752 Y113.609 E.18742
G1 X151.81 Y113.636 E.00211
G1 X151.864 Y113.69 E.00255
G3 X151.897 Y113.79 I-.23 J.131 E.00352
G1 X151.898 Y126.448 E.41987
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.442 Y127.548 E.08148
; WIPE_START
G1 X143.302 Y127.548 E-.05301
G1 X143.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.652 Y129.552 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X146.102 Y129.552 E.0481
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.049 J-.202 E.00883
G1 X140.102 Y129.552 E.41963
G1 X144.592 Y129.552 E.14894
; WIPE_START
G1 X146.102 Y129.552 E-.5738
G1 X146.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.223 Y136.694 Z2.6 F42000
G1 X146.29 Y140.94 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.403 Y133.913 Z2.6 F42000
G1 X142.91 Y127.81 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.774 E.05811
G3 X140.274 Y113.211 I.594 J.031 E.02679
G1 X151.818 Y113.222 E.35474
G3 X152.289 Y113.771 I-.121 J.58 E.02389
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.81 E.38778
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.012 J-.608 E.02762
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.85 Y127.81 E.08942
; WIPE_START
M204 S6000
G1 X142.859 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 11 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer11 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X143.466 Y126.619 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42156
G1 F9507.712
M204 S6000
G1 X144.062 Y127.215 E.02601
G1 X144.597 Y127.215 E.01652
G1 X143.635 Y126.253 E.04197
G1 X143.635 Y125.717 E.01652
G1 X145.133 Y127.215 E.06534
G1 X145.565 Y127.215 E.01333
G1 X145.565 Y127.111 E.00319
G1 X143.635 Y125.182 E.0842
G1 X143.635 Y124.646 E.01652
G1 X145.565 Y126.576 E.0842
G1 X145.565 Y126.115 E.01423
G1 X145.639 Y126.115 E.00229
G1 X143.635 Y124.111 E.08744
G1 X143.635 Y123.575 E.01652
G1 X146.175 Y126.115 E.1108
G1 X146.71 Y126.115 E.01652
G1 X143.635 Y123.04 E.13417
G1 X143.635 Y122.505 E.01652
G1 X147.245 Y126.115 E.15753
G1 X147.781 Y126.115 E.01652
G1 X143.635 Y121.969 E.1809
G1 X143.635 Y121.434 E.01652
G1 X148.316 Y126.115 E.20426
G1 X148.852 Y126.115 E.01652
G1 X143.635 Y120.898 E.22763
G1 X143.635 Y120.363 E.01652
G1 X149.387 Y126.115 E.25099
G1 X149.923 Y126.115 E.01652
G1 X143.635 Y119.827 E.27436
G1 X143.635 Y119.292 E.01652
G1 X150.458 Y126.115 E.29772
G1 X150.994 Y126.115 E.01652
G1 X143.635 Y118.756 E.32109
G1 X143.635 Y118.221 E.01652
G1 X151.529 Y126.115 E.34446
G1 X151.565 Y126.115 E.00109
G1 X151.565 Y125.615 E.01543
G1 X143.635 Y117.685 E.34599
G1 X143.635 Y117.15 E.01652
G1 X151.565 Y125.079 E.34599
G1 X151.565 Y124.544 E.01652
G1 X143.635 Y116.614 E.34599
G1 X143.635 Y116.079 E.01652
G1 X151.564 Y124.008 E.34599
G1 X151.564 Y123.473 E.01652
G1 X143.877 Y115.785 E.33543
G1 X144.413 Y115.785 E.01652
G1 X151.564 Y122.937 E.31207
G1 X151.564 Y122.401 E.01652
G1 X144.948 Y115.785 E.2887
G1 X145.484 Y115.785 E.01652
G1 X151.564 Y121.866 E.26533
G1 X151.564 Y121.33 E.01652
G1 X146.019 Y115.785 E.24197
G1 X146.435 Y115.785 E.01284
G1 X146.435 Y115.666 E.00368
G1 X151.564 Y120.795 E.2238
G1 X151.564 Y120.259 E.01652
G1 X146.435 Y115.13 E.2238
G1 X146.435 Y114.595 E.01652
G1 X151.564 Y119.724 E.2238
G1 X151.564 Y119.188 E.01652
G1 X146.435 Y114.059 E.2238
G1 X146.435 Y113.936 E.0038
G1 X146.848 Y113.937 E.01274
G1 X151.564 Y118.653 E.20578
G1 X151.564 Y118.117 E.01652
G1 X147.384 Y113.938 E.18239
G1 X147.92 Y113.938 E.01654
G1 X151.564 Y117.582 E.15899
G1 X151.564 Y117.046 E.01652
G1 X148.456 Y113.939 E.1356
G1 X148.992 Y113.939 E.01654
G1 X151.564 Y116.511 E.11221
G1 X151.564 Y115.975 E.01652
G1 X149.529 Y113.94 E.08881
G1 X150.065 Y113.941 E.01654
G1 X151.564 Y115.44 E.06542
G1 X151.564 Y114.904 E.01652
G1 X150.601 Y113.941 E.04203
G1 X151.137 Y113.942 E.01654
G1 X151.734 Y114.538 E.02604
; WIPE_START
G1 X151.137 Y113.942 E-.32065
G1 X150.601 Y113.941 E-.20371
G1 X151.039 Y114.38 E-.23563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279621
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10826
G2 X140.158 Y113.544 I.022 J.667 E.00263
; LINE_WIDTH: 0.221923
G1 X140.089 Y113.566 E.00106
; LINE_WIDTH: 0.17772
G1 X139.949 Y113.626 E.00168
; WIPE_START
G1 X140.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.026 Y120.611 Z2.6 F42000
G1 X146 Y127.744 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
; WIPE_START
G1 X146 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.534 Y129.381 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42169
G1 F9504.448
M204 S6000
G1 X147.938 Y128.785 E.02602
G1 X147.403 Y128.785 E.01653
G1 X148.365 Y129.747 E.042
G1 X148.365 Y130.283 E.01653
G1 X146.867 Y128.785 E.06538
G1 X146.435 Y128.785 E.01333
G1 X146.435 Y128.889 E.00321
G1 X148.365 Y130.819 E.08422
G1 X148.365 Y131.354 E.01653
G1 X146.435 Y129.425 E.08422
G1 X146.435 Y129.885 E.01421
G1 X146.36 Y129.885 E.00232
G1 X148.365 Y131.89 E.08751
G1 X148.365 Y132.426 E.01653
G1 X145.824 Y129.885 E.11089
G1 X145.289 Y129.885 E.01653
G1 X148.365 Y132.961 E.13427
G1 X148.365 Y133.497 E.01653
G1 X144.753 Y129.885 E.15765
G1 X144.217 Y129.885 E.01653
G1 X148.365 Y134.033 E.18104
G1 X148.365 Y134.568 E.01653
G1 X143.682 Y129.885 E.20442
G1 X143.146 Y129.885 E.01653
G1 X148.365 Y135.104 E.2278
G1 X148.365 Y135.64 E.01653
G1 X142.61 Y129.885 E.25118
G1 X142.075 Y129.885 E.01653
G1 X148.365 Y136.175 E.27456
G1 X148.365 Y136.711 E.01653
G1 X141.539 Y129.885 E.29794
G1 X141.003 Y129.885 E.01653
G1 X148.365 Y137.247 E.32132
G1 X148.365 Y137.782 E.01653
G1 X140.468 Y129.885 E.3447
G1 X140.435 Y129.885 E.001
G1 X140.435 Y130.389 E.01554
G1 X148.365 Y138.318 E.34611
G1 X148.365 Y138.854 E.01653
G1 X140.435 Y130.924 E.34611
G1 X140.435 Y131.46 E.01653
G1 X148.365 Y139.389 E.34611
G1 X148.365 Y139.925 E.01653
G1 X140.436 Y131.996 E.34611
G1 X140.436 Y132.531 E.01653
G1 X148.119 Y140.215 E.33538
G1 X147.583 Y140.215 E.01653
G1 X140.436 Y133.067 E.31199
G1 X140.436 Y133.603 E.01653
G1 X147.048 Y140.215 E.28861
G1 X146.512 Y140.215 E.01653
G1 X140.436 Y134.138 E.26523
G1 X140.436 Y134.674 E.01653
G1 X145.976 Y140.215 E.24184
G1 X145.565 Y140.215 E.0127
G1 X145.565 Y140.339 E.00383
G1 X140.436 Y135.21 E.22388
G1 X140.436 Y135.746 E.01653
G1 X145.565 Y140.875 E.22388
G1 X145.565 Y141.41 E.01653
G1 X140.436 Y136.281 E.22388
G1 X140.436 Y136.817 E.01653
G1 X145.565 Y141.946 E.22388
G1 X145.565 Y142.064 E.00365
G1 X145.148 Y142.064 E.01288
G1 X140.436 Y137.353 E.20566
G1 X140.436 Y137.888 E.01653
G1 X144.612 Y142.064 E.18228
G1 X144.076 Y142.064 E.01653
G1 X140.436 Y138.424 E.1589
G1 X140.436 Y138.96 E.01653
G1 X143.541 Y142.065 E.13552
G1 X143.005 Y142.065 E.01653
G1 X140.436 Y139.495 E.11214
G1 X140.436 Y140.031 E.01653
G1 X142.469 Y142.065 E.08876
G1 X141.934 Y142.065 E.01653
G1 X140.436 Y140.567 E.06538
G1 X140.436 Y141.103 E.01653
M73 P38 R15
G1 X141.398 Y142.065 E.042
G1 X140.863 Y142.065 E.01653
G1 X140.266 Y141.469 E.02602
; WIPE_START
G1 X140.863 Y142.065 E-.32039
G1 X141.398 Y142.065 E-.20353
G1 X140.959 Y141.625 E-.23608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278372
G1 F15000
M204 S6000
G1 X151.707 Y142.475 E.10769
G2 X152.037 Y142.402 I-.1 J-1.246 E.0065
M204 S10000
G1 X152.051 Y142.374 F42000
; LINE_WIDTH: 0.177343
G1 F15000
M204 S6000
G1 X151.54 Y142.593 E.0061
; OBJECT_ID: 394
; WIPE_START
G1 X152.051 Y142.374 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X144.934 Y139.618 Z2.6 F42000
G1 X125.934 Y132.262 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.81 Y130.929 E.33873
G2 X115.183 Y130.93 I-.309 J3.31 E.02082
G1 X105.066 Y132.262 E.33851
G1 X104.127 Y125.127 E.2387
G1 X114.231 Y123.797 E.33807
G3 X115.922 Y123.723 I1.441 J13.534 E.05618
G3 X116.769 Y123.797 I-.426 J9.738 E.02823
G1 X126.873 Y125.127 E.33807
G1 X125.942 Y132.202 E.23671
M204 S250
G1 X126.076 Y132.676 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.768 Y131.319 E.31947
G2 X115.23 Y131.319 I-.267 J2.786 E.01654
G1 X104.924 Y132.676 E.3194
G1 X104.853 Y132.674 E.00218
G1 X104.771 Y132.635 E.0028
G3 X104.703 Y132.506 I.132 J-.153 E.0046
G1 X103.714 Y124.915 E.23521
G3 X103.883 Y124.764 I.187 J.04 E.00743
G1 X114.184 Y123.408 E.31925
G3 X115.939 Y123.331 I1.495 J14.071 E.05401
G3 X116.816 Y123.408 I-.44 J10.082 E.02707
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.022 J.193 E.00958
G1 X126.297 Y132.506 E.23306
G3 X126.136 Y132.675 I-.193 J-.022 E.00773
; WIPE_START
M204 S6000
G1 X124.153 Y132.416 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.734 Y131.412 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42435
G1 F9438.167
M204 S6000
G1 X120.049 Y130.727 E.03014
G1 X120.111 Y130.25 E.01494
G1 X121.158 Y131.297 E.04603
G1 X121.78 Y131.379 E.01947
G1 X120.174 Y129.773 E.07057
G1 X120.237 Y129.297 E.01494
G1 X122.401 Y131.461 E.09512
G1 X123.022 Y131.542 E.01947
G1 X120.3 Y128.82 E.11967
G1 X120.362 Y128.343 E.01494
G1 X123.643 Y131.624 E.14421
G1 X124.264 Y131.706 E.01947
G1 X120.425 Y127.867 E.16876
G1 X120.488 Y127.39 E.01494
G1 X124.886 Y131.788 E.19331
G1 X125.507 Y131.869 E.01947
G1 X120.551 Y126.913 E.21786
G1 X120.613 Y126.437 E.01494
G1 X125.696 Y131.519 E.2234
G1 X125.759 Y131.042 E.01494
G1 X120.676 Y125.96 E.2234
G1 X120.739 Y125.483 E.01494
G1 X125.821 Y130.566 E.2234
G1 X125.884 Y130.089 E.01494
G1 X120.802 Y125.007 E.2234
G1 X120.846 Y124.67 E.01055
G1 X121.029 Y124.694 E.00572
G1 X125.947 Y129.612 E.21619
G1 X126.01 Y129.136 E.01494
G1 X121.65 Y124.776 E.19164
G1 X122.271 Y124.858 E.01947
G1 X126.072 Y128.659 E.1671
G1 X126.135 Y128.182 E.01494
G1 X122.892 Y124.939 E.14255
G1 X123.513 Y125.021 E.01947
G1 X126.198 Y127.706 E.118
G1 X126.261 Y127.229 E.01494
G1 X124.135 Y125.103 E.09345
G1 X124.756 Y125.185 E.01947
G1 X126.323 Y126.752 E.06891
G1 X126.386 Y126.276 E.01494
G1 X125.377 Y125.266 E.04436
G1 X125.998 Y125.348 E.01947
G1 X126.6 Y125.95 E.02646
M204 S10000
G1 X110.832 Y126.819 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.62 Y125.204 E.05401
G1 X111.288 Y124.536 E.03135
G1 X111.949 Y124.449 E.02211
G1 X118.421 Y130.921 E.30364
G2 X115.493 Y130.56 I-4.091 J21.116 E.09797
G2 X112.579 Y130.921 I1.336 J22.709 E.09747
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X120.38 Y125.204 E.03135
G1 X120.168 Y126.819 E.05401
M204 S10000
G1 X110.426 Y125.435 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43429
G1 F9198.456
M204 S6000
G1 X109.718 Y124.727 E.03192
G1 X109.229 Y124.792 E.01573
G1 X110.313 Y125.875 E.04887
G1 X110.397 Y126.513 E.0205
G1 X108.74 Y124.856 E.07471
G1 X108.251 Y124.921 E.01573
G1 X110.481 Y127.15 E.10056
G1 X110.564 Y127.787 E.0205
G1 X107.762 Y124.985 E.1264
G1 X107.273 Y125.049 E.01573
G1 X110.648 Y128.425 E.15224
G1 X110.732 Y129.062 E.0205
G1 X106.784 Y125.114 E.17809
G1 X106.295 Y125.178 E.01573
G1 X110.816 Y129.7 E.20393
G1 X110.9 Y130.337 E.0205
G1 X105.806 Y125.242 E.22977
G1 X105.316 Y125.307 E.01573
G1 X110.984 Y130.974 E.25562
G1 X111.006 Y131.144 E.00544
G1 X110.647 Y131.191 E.01156
G1 X104.827 Y125.371 E.26248
G1 X104.5 Y125.414 E.01051
G1 X104.528 Y125.626 E.0068
G1 X110.158 Y131.255 E.25391
G1 X109.669 Y131.32 E.01573
G1 X104.612 Y126.263 E.22806
G1 X104.696 Y126.901 E.0205
G1 X109.18 Y131.384 E.20222
G1 X108.691 Y131.449 E.01573
G1 X104.78 Y127.538 E.17638
G1 X104.864 Y128.175 E.0205
G1 X108.202 Y131.513 E.15053
G1 X107.713 Y131.577 E.01573
G1 X104.948 Y128.813 E.12469
G1 X105.032 Y129.45 E.0205
G1 X107.223 Y131.642 E.09885
G1 X106.734 Y131.706 E.01573
G1 X105.116 Y130.087 E.073
G1 X105.2 Y130.725 E.0205
G1 X106.245 Y131.77 E.04716
G1 X105.756 Y131.835 E.01573
G1 X105.086 Y131.165 E.0302
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9198.456
G1 X105.756 Y131.835 E-.35989
G1 X106.245 Y131.77 E-.18746
G1 X105.85 Y131.375 E-.21265
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 12/85
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I.136 J1.209 P1  F42000
G1 X146.29 Y126.84 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y121.539 Z2.8 F42000
G1 X145.71 Y115.06 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.51 Y122.651 Z2.8 F42000
G1 X143.382 Y127.548 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y127.548 E.00264
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.738 Y113.607 E.18697
G1 X151.839 Y113.66 E.0038
G3 X151.897 Y113.79 I-.143 J.141 E.00481
G1 X151.898 Y126.448 E.41988
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.442 Y127.548 E.08148
; WIPE_START
G1 X143.302 Y127.548 E-.05301
G1 X143.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.652 Y129.552 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X146.102 Y129.552 E.0481
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.05 J-.203 E.00882
G1 X140.102 Y129.552 E.41963
G1 X144.592 Y129.552 E.14894
; WIPE_START
G1 X146.102 Y129.552 E-.5738
G1 X146.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.223 Y136.694 Z2.8 F42000
G1 X146.29 Y140.94 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.403 Y133.913 Z2.8 F42000
G1 X142.91 Y127.81 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.594 J.034 E.0267
G1 X151.756 Y113.213 E.35284
G3 X152.289 Y113.771 I-.065 J.595 E.02576
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.81 E.38778
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.85 Y127.81 E.08942
; WIPE_START
M204 S6000
G1 X142.859 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 12 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer12 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X144.425 Y127.384 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42704
G1 F9372.071
M204 S6000
G1 X151.564 Y120.245 E.31603
G1 X151.564 Y119.702 E.017
G1 X144.051 Y127.215 E.33257
G1 X143.635 Y127.215 E.01302
G1 X143.635 Y127.088 E.00398
G1 X151.564 Y119.159 E.35098
G1 X151.564 Y118.615 E.017
G1 X143.635 Y126.544 E.35098
G1 X143.635 Y126.001 E.017
G1 X151.564 Y118.072 E.35098
G1 X151.564 Y117.529 E.017
G1 X143.635 Y125.458 E.35098
G1 X143.635 Y124.915 E.017
G1 X151.564 Y116.986 E.35098
G1 X151.564 Y116.443 E.017
G1 X143.635 Y124.371 E.35098
G1 X143.635 Y123.828 E.017
G1 X151.564 Y115.899 E.35097
G1 X151.564 Y115.356 E.017
G1 X143.635 Y123.285 E.35097
G1 X143.635 Y122.742 E.017
G1 X151.564 Y114.813 E.35097
G1 X151.564 Y114.27 E.017
G1 X143.635 Y122.199 E.35097
G1 X143.635 Y121.655 E.017
G1 X151.351 Y113.939 E.34155
G1 X150.808 Y113.939 E.01699
G1 X143.635 Y121.112 E.31752
G1 X143.635 Y120.569 E.017
G1 X150.265 Y113.939 E.29349
G1 X149.722 Y113.938 E.01699
G1 X143.635 Y120.026 E.26946
G1 X143.635 Y119.482 E.017
G1 X149.18 Y113.938 E.24543
G1 X148.637 Y113.938 E.01699
G1 X143.635 Y118.939 E.2214
G1 X143.635 Y118.396 E.017
G1 X148.094 Y113.937 E.19736
G1 X147.551 Y113.937 E.01699
G1 X146.435 Y115.053 E.04939
G1 X146.435 Y114.509 E.017
G1 X147.008 Y113.937 E.02536
G1 X146.465 Y113.936 E.01699
G1 X146.266 Y114.136 E.00884
M204 S10000
G1 X145.906 Y113.525 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279632
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10827
G2 X140.158 Y113.544 I.022 J.668 E.00262
; LINE_WIDTH: 0.221975
G1 X140.089 Y113.566 E.00106
; LINE_WIDTH: 0.177795
G1 X139.949 Y113.626 E.00168
; WIPE_START
G1 X140.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.466 Y116.393 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42704
G1 F9372.071
M204 S6000
G1 X144.073 Y115.785 E.02689
G1 X144.616 Y115.785 E.017
G1 X143.635 Y116.766 E.04343
G1 X143.635 Y117.309 E.017
G1 X145.159 Y115.785 E.06747
G1 X145.703 Y115.785 E.017
G1 X143.466 Y118.022 E.09903
M204 S10000
G1 X150.957 Y126.284 F42000
G1 F9372.071
M204 S6000
G1 X151.565 Y125.677 E.02689
G1 X151.565 Y125.134 E.017
G1 X150.584 Y126.115 E.04343
G1 X150.04 Y126.115 E.017
G1 X151.565 Y124.591 E.06747
G1 X151.564 Y124.047 E.017
G1 X149.497 Y126.115 E.09152
G1 X148.954 Y126.115 E.017
G1 X151.564 Y123.504 E.11556
G1 X151.564 Y122.961 E.017
G1 X148.411 Y126.115 E.13961
G1 X147.867 Y126.115 E.017
G1 X151.564 Y122.418 E.16365
G1 X151.564 Y121.875 E.017
G1 X147.324 Y126.115 E.1877
G1 X146.781 Y126.115 E.017
M73 P39 R15
G1 X151.564 Y121.331 E.21174
G1 X151.564 Y120.788 E.017
G1 X146.068 Y126.284 E.2433
M204 S10000
G1 X145.734 Y126.618 F42000
G1 F9372.071
M204 S6000
G1 X144.968 Y127.384 E.03393
; WIPE_START
G1 X145.734 Y126.618 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y127.744 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
; WIPE_START
G1 X146 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.266 Y129.382 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42704
G1 F9372.071
M204 S6000
G1 X146.862 Y128.785 E.02641
G1 X147.405 Y128.785 E.017
G1 X140.436 Y135.755 E.30852
G1 X140.436 Y136.298 E.017
G1 X147.949 Y128.785 E.33257
G1 X148.365 Y128.785 E.01302
G1 X148.365 Y128.912 E.00398
G1 X140.436 Y136.841 E.35098
G1 X140.436 Y137.385 E.017
G1 X148.365 Y129.456 E.35098
G1 X148.365 Y129.999 E.017
G1 X140.436 Y137.928 E.35098
G1 X140.436 Y138.471 E.017
G1 X148.365 Y130.542 E.35098
G1 X148.365 Y131.085 E.017
G1 X140.436 Y139.014 E.35098
G1 X140.436 Y139.557 E.017
G1 X148.365 Y131.629 E.35098
G1 X148.365 Y132.172 E.017
G1 X140.436 Y140.1 E.35097
G1 X140.436 Y140.644 E.017
G1 X148.365 Y132.715 E.35097
G1 X148.365 Y133.258 E.017
G1 X140.436 Y141.187 E.35097
G1 X140.436 Y141.73 E.017
G1 X148.365 Y133.801 E.35097
G1 X148.365 Y134.345 E.017
G1 X140.645 Y142.065 E.34174
G1 X141.188 Y142.065 E.01701
G1 X148.365 Y134.888 E.31769
G1 X148.365 Y135.431 E.017
G1 X141.731 Y142.065 E.29364
G1 X142.274 Y142.065 E.01701
G1 X148.365 Y135.974 E.26959
G1 X148.365 Y136.518 E.017
G1 X142.818 Y142.065 E.24554
G1 X143.361 Y142.065 E.01701
G1 X148.365 Y137.061 E.2215
G1 X148.365 Y137.604 E.017
G1 X143.735 Y142.234 E.20496
; WIPE_START
G1 X145.149 Y140.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.757 Y140.384 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9372.071
M204 S6000
G1 X148.365 Y139.777 E.02689
G1 X148.365 Y139.234 E.017
G1 X147.384 Y140.215 E.04343
G1 X146.84 Y140.215 E.017
G1 X148.365 Y138.69 E.06748
G1 X148.365 Y138.147 E.017
G1 X146.128 Y140.384 E.09903
M204 S10000
G1 X145.734 Y140.778 F42000
G1 F9372.071
M204 S6000
G1 X144.448 Y142.064 E.05696
G1 X144.991 Y142.064 E.01701
G1 X145.565 Y141.49 E.0254
G1 X145.565 Y142.034 E.017
G1 X145.364 Y142.234 E.00887
M204 S10000
G1 X146.094 Y142.475 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
G1 F15000
M204 S6000
G1 X151.707 Y142.475 E.10844
G2 X151.795 Y142.466 I-.014 J-.604 E.00172
; LINE_WIDTH: 0.242816
G2 X151.881 Y142.444 I-.104 J-.593 E.00145
; LINE_WIDTH: 0.202506
G1 X151.927 Y142.427 E.00064
; LINE_WIDTH: 0.163022
G1 X152.058 Y142.368 E.0014
; WIPE_START
G1 X151.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.395 Y138.48 Z2.8 F42000
G1 X140.266 Y135.381 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42704
G1 F9372.071
M204 S6000
G1 X145.762 Y129.885 E.2433
G1 X145.219 Y129.885 E.017
G1 X140.436 Y134.669 E.21174
G1 X140.436 Y134.125 E.017
G1 X144.676 Y129.885 E.18769
G1 X144.133 Y129.885 E.017
G1 X140.436 Y133.582 E.16365
G1 X140.436 Y133.039 E.017
G1 X143.589 Y129.885 E.1396
G1 X143.046 Y129.885 E.017
G1 X140.436 Y132.496 E.11556
G1 X140.436 Y131.953 E.017
G1 X142.503 Y129.885 E.09151
G1 X141.96 Y129.885 E.017
G1 X140.435 Y131.409 E.06747
G1 X140.435 Y130.866 E.017
G1 X141.416 Y129.885 E.04342
G1 X140.873 Y129.885 E.017
G1 X140.266 Y130.493 E.02689
; OBJECT_ID: 394
; WIPE_START
G1 X140.873 Y129.885 E-.32644
G1 X141.416 Y129.885 E-.20643
G1 X140.994 Y130.308 E-.22714
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.385 Y130.908 Z2.8 F42000
G1 X122.29 Y131.782 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.81 Y130.929 E.2168
G2 X115.19 Y130.929 I-.31 J2.802 E.02062
G1 X108.71 Y131.782 E.2168
G1 X107.771 Y124.648 E.2387
G1 X114.231 Y123.797 E.21614
G3 X115.922 Y123.723 I1.445 J13.621 E.05618
G3 X116.769 Y123.797 I-.427 J9.739 E.02822
G1 X123.229 Y124.648 E.21614
G1 X122.298 Y131.722 E.23671
; WIPE_START
G1 X120.312 Y131.48 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.078 Y132.676 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.768 Y131.319 E.31953
G2 X115.232 Y131.319 I-.268 J2.339 E.01648
G1 X104.924 Y132.676 E.31948
G1 X104.81 Y132.66 E.00353
G3 X104.703 Y132.506 I.087 J-.176 E.00603
G1 X103.714 Y124.915 E.23521
G3 X103.883 Y124.764 I.189 J.042 E.00741
G1 X114.184 Y123.408 E.31926
G3 X115.939 Y123.331 I1.499 J14.161 E.05402
G3 X116.816 Y123.408 I-.441 J10.084 E.02707
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.021 J.192 E.0096
G1 X126.297 Y132.506 E.23306
G3 X126.138 Y132.675 I-.193 J-.022 E.00768
M204 S10000
G1 X126.153 Y132.011 F42000
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X125.742 Y132.423 E.01788
G1 X125.271 Y132.361
G1 X126.234 Y131.397 E.04187
G1 X126.315 Y130.783
G1 X124.799 Y132.299 E.06586
G1 X124.328 Y132.237
G1 X126.396 Y130.169 E.08985
G1 X126.477 Y129.555
G1 X123.857 Y132.175 E.11384
G1 X123.386 Y132.113
G1 X126.558 Y128.941 E.13783
G1 X126.638 Y128.327
G1 X122.914 Y132.051 E.16182
G1 X122.494 Y131.938
G1 X126.719 Y127.712 E.18362
G1 X126.8 Y127.098
G1 X122.574 Y131.324 E.18362
G1 X122.655 Y130.71
G1 X126.881 Y126.484 E.18362
G1 X126.962 Y125.87
G1 X122.736 Y130.096 E.18362
G1 X122.817 Y129.482
G1 X127.043 Y125.256 E.18362
G1 X126.83 Y124.935
G1 X122.898 Y128.868 E.17087
G1 X122.979 Y128.253
G1 X126.359 Y124.873 E.14688
G1 X125.887 Y124.811
G1 X123.06 Y127.639 E.12289
G1 X123.14 Y127.025
G1 X125.416 Y124.749 E.0989
G1 X124.945 Y124.687
G1 X123.221 Y126.411 E.07491
G1 X123.302 Y125.797
G1 X124.474 Y124.625 E.05092
G1 X124.003 Y124.563
G1 X123.383 Y125.183 E.02693
; WIPE_START
M204 S6000
G1 X124.003 Y124.563 E-.33298
G1 X124.474 Y124.625 E-.18061
G1 X124.015 Y125.084 E-.24641
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.591 Y129.183 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.378 Y130.798 E.05401
G1 X120.041 Y131.135 E.0158
G1 X118.421 Y130.921 E.05419
G1 X111.949 Y124.449 E.30364
G1 X111.288 Y124.536 E.02211
G1 X109.971 Y125.853 E.06179
G1 X110.622 Y130.798 E.16544
G1 X110.959 Y131.135 E.0158
G1 X112.579 Y130.921 E.05419
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X121.029 Y125.853 E.06179
G1 X120.817 Y127.467 E.05401
M204 S10000
G1 X120.723 Y131.18 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X121.952 Y131.342 E.03809
G1 X122.789 Y124.985 E.19701
G1 X121.56 Y124.823 E.03809
G1 X120.731 Y131.121 E.19517
M204 S10000
G1 X121.177 Y130.832 F42000
; LINE_WIDTH: 0.474275
G1 F8345.795
M204 S6000
G1 X121.604 Y130.889 E.01516
G1 X122.336 Y125.333 E.19696
G1 X121.908 Y125.277 E.01516
G1 X121.184 Y130.773 E.19485
; WIPE_START
G1 X121.445 Y128.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.982 Y130.387 Z2.8 F42000
G1 X110.277 Y131.18 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X109.44 Y124.823 E.19701
G1 X108.211 Y124.985 E.03809
G1 X109.048 Y131.342 E.19701
G1 X110.217 Y131.188 E.03625
M204 S10000
G1 X109.823 Y130.832 F42000
; LINE_WIDTH: 0.47428
G1 F8345.697
M204 S6000
G1 X109.092 Y125.277 E.19696
G1 X108.664 Y125.333 E.01516
G1 X109.396 Y130.889 E.19696
G1 X109.764 Y130.84 E.01305
; WIPE_START
G1 X109.396 Y130.889 E-.14112
G1 X109.183 Y129.274 E-.61889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.968 Y132.066 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X108.459 Y131.575 E.02133
G1 X108.397 Y131.104
G1 X107.354 Y132.147 E.04532
G1 X106.739 Y132.228
G1 X108.335 Y130.633 E.06931
G1 X108.272 Y130.161
G1 X106.125 Y132.309 E.0933
G1 X105.511 Y132.389
G1 X108.21 Y129.69 E.11729
G1 X108.148 Y129.219
G1 X104.906 Y132.461 E.1409
G1 X104.844 Y131.99
G1 X108.086 Y128.748 E.1409
G1 X108.024 Y128.277
G1 X104.782 Y131.519 E.1409
G1 X104.72 Y131.048
G1 X107.962 Y127.805 E.1409
G1 X107.9 Y127.334
G1 X104.658 Y130.577 E.1409
G1 X104.596 Y130.105
G1 X107.838 Y126.863 E.1409
G1 X107.776 Y126.392
G1 X104.534 Y129.634 E.1409
G1 X104.472 Y129.163
G1 X107.714 Y125.921 E.1409
G1 X107.652 Y125.449
G1 X104.41 Y128.692 E.1409
G1 X104.348 Y128.22
G1 X107.59 Y124.978 E.1409
G1 X107.528 Y124.507
G1 X104.286 Y127.749 E.1409
G1 X104.224 Y127.278
G1 X106.929 Y124.572 E.11758
G1 X106.315 Y124.653
G1 X104.162 Y126.807 E.09359
G1 X104.099 Y126.336
G1 X105.701 Y124.734 E.0696
G1 X105.087 Y124.815
G1 X104.037 Y125.864 E.04561
G1 X103.975 Y125.393
G1 X104.473 Y124.896 E.02162
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.975 Y125.393 E-.26741
G1 X104.037 Y125.864 E-.18061
G1 X104.618 Y125.284 E-.31199
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 13/85
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I-.045 J1.216 P1  F42000
G1 X146.29 Y126.84 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y121.539 Z3 F42000
G1 X145.71 Y115.06 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.51 Y122.651 Z3 F42000
G1 X143.382 Y127.548 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y127.548 E.00264
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.738 Y113.607 E.18697
G1 X151.852 Y113.675 E.0044
G1 X151.897 Y113.79 E.00411
G1 X151.898 Y126.448 E.41987
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.442 Y127.548 E.08148
; WIPE_START
G1 X143.302 Y127.548 E-.05301
G1 X143.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.652 Y129.552 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X146.102 Y129.552 E.0481
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.207 I.044 J-.198 E.00872
G1 X140.102 Y129.552 E.41978
G1 X144.592 Y129.552 E.14894
; WIPE_START
G1 X146.102 Y129.552 E-.5738
G1 X146.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.223 Y136.694 Z3 F42000
G1 X146.29 Y140.94 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.403 Y133.913 Z3 F42000
G1 X142.91 Y127.81 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.774 E.05811
G3 X140.274 Y113.211 I.594 J.031 E.02679
G1 X151.756 Y113.213 E.35283
G3 X152.289 Y113.771 I-.059 J.589 E.02582
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.81 E.38778
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.228 I.012 J-.608 E.02756
G1 X139.71 Y127.335 E.45762
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.85 Y127.81 E.08942
; WIPE_START
M204 S6000
G1 X142.859 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 13 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer13 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X143.466 Y126.619 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42161
G1 F9506.456
M204 S6000
G1 X144.062 Y127.215 E.02601
G1 X144.597 Y127.215 E.01653
G1 X143.635 Y126.253 E.04198
G1 X143.635 Y125.717 E.01653
G1 X145.133 Y127.215 E.06535
G1 X145.565 Y127.215 E.01333
G1 X145.565 Y127.111 E.00319
G1 X143.635 Y125.182 E.08421
G1 X143.635 Y124.646 E.01653
G1 X145.565 Y126.576 E.08421
G1 X145.565 Y126.115 E.01422
G1 X145.639 Y126.115 E.0023
M73 P40 R15
G1 X143.635 Y124.111 E.08746
G1 X143.635 Y123.575 E.01653
G1 X146.175 Y126.115 E.11084
G1 X146.711 Y126.115 E.01653
G1 X143.635 Y123.039 E.13421
G1 X143.635 Y122.504 E.01653
G1 X147.246 Y126.115 E.15758
G1 X147.782 Y126.115 E.01653
G1 X143.635 Y121.968 E.18095
G1 X143.635 Y121.433 E.01653
G1 X148.317 Y126.115 E.20432
G1 X148.853 Y126.115 E.01653
G1 X143.635 Y120.897 E.22769
G1 X143.635 Y120.362 E.01653
G1 X149.388 Y126.115 E.25106
G1 X149.924 Y126.115 E.01653
G1 X143.635 Y119.826 E.27444
G1 X143.635 Y119.291 E.01653
G1 X150.459 Y126.115 E.29781
G1 X150.995 Y126.115 E.01653
G1 X143.635 Y118.755 E.32118
G1 X143.635 Y118.22 E.01653
G1 X151.53 Y126.115 E.34455
G1 X151.565 Y126.115 E.00105
G1 X151.565 Y125.613 E.01547
G1 X143.635 Y117.684 E.34604
G1 X143.635 Y117.148 E.01653
G1 X151.565 Y125.078 E.34604
G1 X151.565 Y124.542 E.01653
G1 X143.635 Y116.613 E.34604
G1 X143.635 Y116.077 E.01653
G1 X151.564 Y124.007 E.34604
G1 X151.564 Y123.471 E.01653
G1 X143.879 Y115.785 E.33541
G1 X144.414 Y115.785 E.01653
G1 X151.564 Y122.935 E.31204
G1 X151.564 Y122.4 E.01653
G1 X144.95 Y115.785 E.28867
G1 X145.485 Y115.785 E.01653
G1 X151.564 Y121.864 E.26529
G1 X151.564 Y121.329 E.01653
G1 X146.021 Y115.785 E.24192
G1 X146.435 Y115.785 E.01279
G1 X146.435 Y115.664 E.00374
G1 X151.564 Y120.793 E.22383
G1 X151.564 Y120.258 E.01653
G1 X146.435 Y115.129 E.22383
G1 X146.435 Y114.593 E.01653
G1 X151.564 Y119.722 E.22383
G1 X151.564 Y119.186 E.01653
G1 X146.435 Y114.057 E.22383
G1 X146.435 Y113.936 E.00374
G1 X146.85 Y113.937 E.0128
G1 X151.564 Y118.651 E.20573
G1 X151.564 Y118.115 E.01653
G1 X147.386 Y113.937 E.18234
G1 X147.922 Y113.937 E.01654
G1 X151.564 Y117.58 E.15896
G1 X151.564 Y117.044 E.01653
G1 X148.458 Y113.938 E.13557
G1 X148.993 Y113.938 E.01654
G1 X151.564 Y116.508 E.11218
G1 X151.564 Y115.973 E.01653
G1 X149.529 Y113.938 E.08879
G1 X150.065 Y113.939 E.01654
G1 X151.564 Y115.437 E.0654
G1 X151.564 Y114.902 E.01653
G1 X150.601 Y113.939 E.04201
G1 X151.137 Y113.939 E.01654
G1 X151.734 Y114.536 E.02603
; WIPE_START
G1 X151.137 Y113.939 E-.32054
G1 X150.601 Y113.939 E-.20364
G1 X151.04 Y114.378 E-.23582
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279634
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10827
G2 X140.159 Y113.544 I.022 J.665 E.00262
; LINE_WIDTH: 0.222089
G1 X140.089 Y113.566 E.00106
; LINE_WIDTH: 0.177882
G1 X139.949 Y113.626 E.00168
; WIPE_START
G1 X140.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.026 Y120.611 Z3 F42000
G1 X146 Y127.744 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
; WIPE_START
G1 X146 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.534 Y129.381 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42169
G1 F9504.448
M204 S6000
G1 X147.938 Y128.785 E.02602
G1 X147.403 Y128.785 E.01653
G1 X148.365 Y129.747 E.042
G1 X148.365 Y130.283 E.01653
G1 X146.867 Y128.785 E.06538
G1 X146.435 Y128.785 E.01333
G1 X146.435 Y128.889 E.00321
G1 X148.365 Y130.819 E.08422
G1 X148.365 Y131.354 E.01653
G1 X146.435 Y129.425 E.08422
M73 P40 R14
G1 X146.435 Y129.885 E.01421
G1 X146.36 Y129.885 E.00232
G1 X148.365 Y131.89 E.08751
G1 X148.365 Y132.426 E.01653
G1 X145.824 Y129.885 E.11089
G1 X145.289 Y129.885 E.01653
G1 X148.365 Y132.961 E.13427
G1 X148.365 Y133.497 E.01653
G1 X144.753 Y129.885 E.15765
G1 X144.217 Y129.885 E.01653
G1 X148.365 Y134.033 E.18104
G1 X148.365 Y134.568 E.01653
G1 X143.682 Y129.885 E.20442
G1 X143.146 Y129.885 E.01653
G1 X148.365 Y135.104 E.2278
G1 X148.365 Y135.64 E.01653
G1 X142.61 Y129.885 E.25118
G1 X142.075 Y129.885 E.01653
G1 X148.365 Y136.175 E.27456
G1 X148.365 Y136.711 E.01653
G1 X141.539 Y129.885 E.29794
G1 X141.003 Y129.885 E.01653
G1 X148.365 Y137.247 E.32132
G1 X148.365 Y137.782 E.01653
G1 X140.468 Y129.885 E.3447
G1 X140.435 Y129.885 E.001
G1 X140.435 Y130.389 E.01554
G1 X148.365 Y138.318 E.34611
G1 X148.365 Y138.854 E.01653
G1 X140.435 Y130.924 E.34611
G1 X140.435 Y131.46 E.01653
G1 X148.365 Y139.389 E.34611
G1 X148.365 Y139.925 E.01653
G1 X140.436 Y131.996 E.34611
G1 X140.436 Y132.531 E.01653
G1 X148.119 Y140.215 E.33538
G1 X147.583 Y140.215 E.01653
G1 X140.436 Y133.067 E.31199
G1 X140.436 Y133.603 E.01653
G1 X147.048 Y140.215 E.28861
G1 X146.512 Y140.215 E.01653
G1 X140.436 Y134.138 E.26523
G1 X140.436 Y134.674 E.01653
G1 X145.976 Y140.215 E.24184
G1 X145.565 Y140.215 E.0127
G1 X145.565 Y140.339 E.00383
G1 X140.436 Y135.21 E.22388
G1 X140.436 Y135.746 E.01653
G1 X145.565 Y140.875 E.22388
G1 X145.565 Y141.41 E.01653
G1 X140.436 Y136.281 E.22388
G1 X140.436 Y136.817 E.01653
G1 X145.565 Y141.946 E.22388
G1 X145.565 Y142.064 E.00365
G1 X145.148 Y142.064 E.01288
G1 X140.436 Y137.353 E.20566
G1 X140.436 Y137.888 E.01653
G1 X144.612 Y142.064 E.18228
G1 X144.076 Y142.064 E.01653
G1 X140.436 Y138.424 E.1589
G1 X140.436 Y138.96 E.01653
G1 X143.541 Y142.065 E.13552
G1 X143.005 Y142.065 E.01653
G1 X140.436 Y139.495 E.11214
G1 X140.436 Y140.031 E.01653
G1 X142.469 Y142.065 E.08876
G1 X141.934 Y142.065 E.01653
G1 X140.436 Y140.567 E.06538
G1 X140.436 Y141.103 E.01653
G1 X141.398 Y142.065 E.042
G1 X140.863 Y142.065 E.01653
G1 X140.266 Y141.469 E.02602
; WIPE_START
G1 X140.863 Y142.065 E-.32039
G1 X141.398 Y142.065 E-.20353
G1 X140.959 Y141.625 E-.23608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F15000
M204 S6000
G1 X151.707 Y142.475 E.10844
G2 X151.795 Y142.466 I-.014 J-.605 E.00171
; LINE_WIDTH: 0.242882
G2 X151.881 Y142.444 I-.104 J-.596 E.00145
; LINE_WIDTH: 0.20252
G1 X151.927 Y142.427 E.00064
; LINE_WIDTH: 0.163001
G1 X152.058 Y142.368 E.0014
; OBJECT_ID: 394
; WIPE_START
G1 X151.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X144.753 Y139.824 Z3 F42000
G1 X122.761 Y131.844 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.81 Y130.929 E.23258
G2 X115.183 Y130.93 I-.309 J3.313 E.02082
G1 X108.239 Y131.844 E.23236
G1 X107.299 Y124.71 E.2387
G1 X114.231 Y123.797 E.23192
G3 X115.922 Y123.723 I1.45 J13.72 E.05618
G3 X116.769 Y123.797 I-.426 J9.733 E.02823
G1 X123.701 Y124.71 E.23192
G1 X122.769 Y131.785 E.23671
; WIPE_START
G1 X120.784 Y131.541 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.037 Y125.158 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X124.078 Y124.848 E.00961
G1 X127.022 Y125.236 E.09126
G1 X126.106 Y132.196 E.2157
G1 X123.162 Y131.808 E.09126
G1 X124.029 Y125.218 E.20425
; WIPE_START
M204 S6000
G1 X124.078 Y124.848 E-.14167
G1 X125.691 Y125.061 E-.61833
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.059 Y124.974 Z3 F42000
G1 X106.922 Y124.848 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X107.838 Y131.808 E.2157
G1 X104.894 Y132.196 E.09126
G1 X103.978 Y125.236 E.2157
G1 X106.863 Y124.856 E.08942
; WIPE_START
M204 S6000
G1 X107.141 Y126.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.434 Y129.086 Z3 F42000
G1 X126.078 Y132.676 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X115.768 Y131.319 E.31953
G2 X115.23 Y131.319 I-.267 J2.786 E.01654
G1 X104.853 Y132.674 E.32157
G3 X104.703 Y132.506 I.04 J-.187 E.00742
G1 X103.714 Y124.915 E.23522
G3 X103.883 Y124.764 I.187 J.04 E.00742
G1 X114.184 Y123.408 E.31926
G3 X115.939 Y123.331 I1.503 J14.254 E.05401
G3 X116.816 Y123.408 I-.44 J10.076 E.02707
G1 X127.117 Y124.764 E.31926
G3 X127.288 Y124.984 I-.022 J.193 E.00951
G1 X126.297 Y132.506 E.23313
G3 X126.138 Y132.675 I-.192 J-.02 E.00769
M204 S10000
G1 X126.109 Y132.438 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F15000
M204 S6000
G1 X122.936 Y132.02 E.02293
M204 S10000
G1 X123.915 Y124.585 F42000
; LINE_WIDTH: 0.130854
G1 F15000
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.408 Y128.404 Z3 F42000
G1 X114.193 Y130.709 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X112.579 Y130.921 E.05401
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X122.946 Y127.77 E.15174
G1 X122.877 Y128.299 E.01768
G1 X120.041 Y131.135 E.13303
G1 X118.421 Y130.921 E.05419
G1 X111.949 Y124.449 E.30364
G1 X111.288 Y124.536 E.02211
G1 X108.054 Y127.77 E.15174
G1 X108.123 Y128.299 E.01769
G1 X110.959 Y131.135 E.13302
G1 X109.344 Y131.347 E.05401
; WIPE_START
G1 X110.959 Y131.135 E-.61876
G1 X110.696 Y130.872 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F15000
M204 S6000
G1 X104.891 Y132.438 E.02293
M204 S10000
G1 X103.913 Y125.002 F42000
; LINE_WIDTH: 0.130851
G1 F15000
M204 S6000
G1 X107.085 Y124.585 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 14/85
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3 I-.061 J1.215 P1  F42000
G1 X145.898 Y126.903 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.898 Y127.548 E.0214
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.903 E.0214
G1 X145.838 Y126.903 E.08412
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.166 Y129.097 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.102 Y129.097 E.00212
G1 X146.102 Y128.452 E.0214
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.097 E.0214
G1 X146.226 Y129.097 E.082
; WIPE_START
G1 X146.102 Y129.097 E-.04708
G1 X146.102 Y128.452 E-.24516
G1 X147.333 Y128.452 E-.46776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.622 Y130.685 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X140.622 Y139.903 E.30575
G1 X148.698 Y139.903 E.26789
G1 X148.698 Y140.548 E.0214
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.05 J-.203 E.00882
G1 X140.102 Y129.552 E.41963
G1 X140.622 Y129.552 E.01725
G1 X140.622 Y130.625 E.03561
; WIPE_START
G1 X140.622 Y132.625 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.921 Y138.932 Z3.2 F42000
G1 X146.29 Y140.94 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z3.2 F42000
G1 X145.71 Y115.06 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.004 Y121.331 Z3.2 F42000
G1 X151.487 Y126.448 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X151.378 Y126.448 E.00361
G1 X151.378 Y116.097 E.34335
G1 X143.302 Y116.097 E.26789
G1 X143.302 Y115.452 E.0214
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.738 Y113.607 E.18697
G1 X151.853 Y113.675 E.00441
G1 X151.897 Y113.79 E.0041
G1 X151.898 Y126.448 E.41987
G1 X151.547 Y126.448 E.01165
; WIPE_START
G1 X151.378 Y126.448 E-.06413
G1 X151.378 Y124.617 E-.69588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.236 Y127.31 Z3.2 F42000
M73 P41 R14
G1 X142.91 Y127.81 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.594 J.034 E.02671
G1 X151.757 Y113.213 E.35284
G3 X152.289 Y113.771 I-.059 J.589 E.02582
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.81 E.38778
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.85 Y127.81 E.08942
; WIPE_START
M204 S6000
G1 X142.859 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 14 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer14 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X143.506 Y127.225 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28101
G1 F15000
M204 S6000
G1 X145.694 Y127.225 E.04247
M204 S10000
G1 X146 Y127.744 F42000
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.306 Y128.775 F42000
; LINE_WIDTH: 0.28101
G1 F15000
M204 S6000
G1 X148.494 Y128.775 E.04247
; WIPE_START
G1 X146.494 Y128.775 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.155 Y125.778 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X150.3 Y126.633 E.03716
G1 X149.767 Y126.633
G1 X151.155 Y125.244 E.06033
G1 X151.155 Y124.711
G1 X149.234 Y126.633 E.0835
G1 X148.7 Y126.633
G1 X151.155 Y124.178 E.10667
G1 X151.155 Y123.645
G1 X148.167 Y126.633 E.12985
G1 X147.634 Y126.633
G1 X151.155 Y123.111 E.15302
G1 X151.155 Y122.578
G1 X147.101 Y126.633 E.17619
G1 X146.567 Y126.633
G1 X151.155 Y122.045 E.19936
G1 X151.155 Y121.512
G1 X145.987 Y126.68 E.22461
G1 X145.501 Y126.632
G1 X151.155 Y120.978 E.24569
G1 X151.155 Y120.445
G1 X144.968 Y126.632 E.26886
G1 X144.435 Y126.632
G1 X151.155 Y119.912 E.29203
G1 X151.155 Y119.378
G1 X143.902 Y126.632 E.31521
G1 X143.32 Y126.68
G1 X151.155 Y118.845 E.34047
G1 X151.155 Y118.312
G1 X143.117 Y126.35 E.34929
G1 X143.117 Y125.817
G1 X151.155 Y117.779 E.34929
G1 X151.155 Y117.245
G1 X143.117 Y125.283 E.34929
G1 X143.117 Y124.75
G1 X151.155 Y116.712 E.34929
G1 X151.014 Y116.32
G1 X143.117 Y124.217 E.34317
G1 X143.117 Y123.684
G1 X150.433 Y116.368 E.3179
G1 X149.9 Y116.368
G1 X143.117 Y123.15 E.29473
G1 X143.117 Y122.617
G1 X149.367 Y116.368 E.27156
G1 X148.833 Y116.368
G1 X143.117 Y122.084 E.24839
G1 X143.117 Y121.551
G1 X148.3 Y116.368 E.22521
G1 X147.767 Y116.368
G1 X143.117 Y121.017 E.20204
G1 X143.117 Y120.484
G1 X147.234 Y116.368 E.17887
G1 X146.7 Y116.368
G1 X143.117 Y119.951 E.15569
G1 X143.117 Y119.418
G1 X146.167 Y116.368 E.13252
G1 X145.634 Y116.368
G1 X143.117 Y118.884 E.10935
G1 X143.117 Y118.351
G1 X145.101 Y116.368 E.08618
G1 X144.567 Y116.368
G1 X143.117 Y117.818 E.063
G1 X143.117 Y117.284
G1 X144.034 Y116.368 E.03983
G1 X143.542 Y116.327
G1 X143.117 Y116.751 E.01844
; WIPE_START
M204 S6000
G1 X143.542 Y116.327 E-.228
G1 X144.034 Y116.368 E-.18774
G1 X143.393 Y117.008 E-.34426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.227 Y124.639 Z3.2 F42000
G1 X143.188 Y126.42 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.150217
G1 F15000
M204 S6000
G1 X143.15 Y126.51 E.00085
G1 X143.15 Y126.699 E.00165
; WIPE_START
G1 X143.15 Y126.51 E-.50094
G1 X143.188 Y126.42 E-.25906
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.362 Y129.756 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.155524
G1 F15000
M204 S6000
G1 X140.363 Y140.106 E.09497
M204 S10000
G1 X141.35 Y141.15 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62251
G1 F6211.288
M204 S6000
G1 X144.564 Y141.15 E.15175
M204 S10000
G1 X144.956 Y140.672 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X141.037 Y140.672 E.12043
G1 X141 Y140.749 E.00263
G1 X140.872 Y140.794 E.00418
G1 X140.872 Y141.629 E.02563
G1 X145.129 Y141.628 E.13079
G1 X145.129 Y140.954 E.02072
G1 X145.021 Y140.884 E.00395
G1 X144.974 Y140.729 E.00497
M204 S10000
G1 X145.302 Y140.295 F42000
G1 F9547.299
M204 S6000
G1 X140.832 Y140.295 E.13735
G1 X140.763 Y140.456 E.0054
G1 X140.495 Y140.498 E.00833
G1 X140.495 Y142.006 E.04632
G1 X145.506 Y142.005 E.15396
G1 X145.506 Y140.773 E.03787
G1 X145.334 Y140.674 E.00608
G1 X145.307 Y140.355 E.00986
M204 S10000
G1 X145.694 Y140.225 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28102
G1 F15000
M204 S6000
G1 X148.494 Y140.225 E.05432
; WIPE_START
G1 X146.494 Y140.225 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.883 Y139.249 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X148.458 Y139.673 E.01844
G1 X147.966 Y139.632
G1 X148.883 Y138.715 E.03984
G1 X148.883 Y138.182
G1 X147.433 Y139.632 E.06301
G1 X146.899 Y139.632
G1 X148.883 Y137.649 E.08618
G1 X148.883 Y137.116
G1 X146.366 Y139.632 E.10935
G1 X145.833 Y139.632
G1 X148.883 Y136.582 E.13253
G1 X148.883 Y136.049
G1 X145.3 Y139.632 E.1557
G1 X144.766 Y139.632
G1 X148.883 Y135.516 E.17887
G1 X148.883 Y134.983
G1 X144.233 Y139.632 E.20205
G1 X143.7 Y139.632
G1 X148.883 Y134.449 E.22522
G1 X148.883 Y133.916
G1 X143.167 Y139.632 E.24839
G1 X142.633 Y139.632
G1 X148.883 Y133.383 E.27156
G1 X148.883 Y132.85
G1 X142.1 Y139.632 E.29474
G1 X141.567 Y139.632
G1 X148.883 Y132.316 E.31791
G1 X148.883 Y131.783
G1 X140.985 Y139.68 E.34317
G1 X140.845 Y139.288
G1 X148.883 Y131.25 E.34929
G1 X148.883 Y130.717
G1 X140.845 Y138.754 E.34929
G1 X140.845 Y138.221
G1 X148.883 Y130.183 E.34929
G1 X148.883 Y129.65
G1 X140.845 Y137.688 E.34929
G1 X140.845 Y137.155
G1 X148.68 Y129.32 E.34047
G1 X148.098 Y129.368
G1 X140.845 Y136.621 E.3152
G1 X140.845 Y136.088
G1 X147.565 Y129.368 E.29203
G1 X147.032 Y129.368
G1 X140.845 Y135.555 E.26885
G1 X140.845 Y135.022
G1 X146.498 Y129.368 E.24568
G1 X146.013 Y129.32
G1 X140.845 Y134.488 E.2246
G1 X140.845 Y133.955
G1 X145.432 Y129.367 E.19936
G1 X144.899 Y129.367
G1 X140.845 Y133.422 E.17619
G1 X140.845 Y132.889
G1 X144.366 Y129.367 E.15301
G1 X143.833 Y129.367
G1 X140.845 Y132.355 E.12984
G1 X140.845 Y131.822
G1 X143.299 Y129.367 E.10667
G1 X142.766 Y129.367
G1 X140.845 Y131.289 E.0835
G1 X140.845 Y130.756
G1 X142.233 Y129.367 E.06032
G1 X141.7 Y129.367
G1 X140.845 Y130.222 E.03715
M204 S10000
G1 X148.812 Y129.58 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.150332
G1 F15000
M204 S6000
G1 X148.85 Y129.49 E.00085
G1 X148.85 Y129.301 E.00165
; WIPE_START
G1 X148.85 Y129.49 E-.50136
G1 X148.812 Y129.58 E-.25864
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.638 Y126.244 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.155524
G1 F15000
M204 S6000
G1 X151.637 Y115.894 E.09497
M204 S10000
G1 X147.376 Y114.85 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62003
G1 F6237.979
M204 S6000
G1 X150.591 Y114.852 E.1512
M204 S10000
G1 X147.044 Y115.328 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X150.963 Y115.328 E.12043
G1 X151 Y115.251 E.00263
G1 X151.128 Y115.205 E.00417
G1 X151.128 Y114.375 E.02551
G1 X146.871 Y114.372 E.13079
G1 X146.871 Y115.046 E.02069
G1 X146.979 Y115.116 E.00396
G1 X147.026 Y115.271 E.00497
M204 S10000
G1 X146.698 Y115.705 F42000
G1 F9547.299
M204 S6000
G1 X151.168 Y115.705 E.13735
G1 X151.237 Y115.544 E.0054
G1 X151.505 Y115.502 E.00833
G1 X151.505 Y113.998 E.04619
G1 X146.494 Y113.995 E.15396
G1 X146.494 Y115.242 E.03831
G1 X146.666 Y115.326 E.00587
G1 X146.693 Y115.645 E.00986
M204 S10000
G1 X146.305 Y115.775 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28102
G1 F15000
M204 S6000
G1 X143.506 Y115.775 E.05432
; WIPE_START
G1 X145.506 Y115.775 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.279644
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10827
G2 X140.159 Y113.544 I.022 J.665 E.00262
; LINE_WIDTH: 0.222205
G1 X140.09 Y113.566 E.00106
; LINE_WIDTH: 0.17791
G1 X139.949 Y113.626 E.00169
; WIPE_START
G1 X140.09 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.642 Y121.039 Z3.2 F42000
G1 X146.094 Y142.475 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.279838
G1 F15000
M204 S6000
G1 X151.707 Y142.475 E.10836
G2 X151.836 Y142.458 I-.023 J-.673 E.00251
; LINE_WIDTH: 0.223239
G1 X151.912 Y142.434 E.00117
; LINE_WIDTH: 0.177417
G1 X152.051 Y142.374 E.00166
; OBJECT_ID: 394
; WIPE_START
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X144.738 Y139.828 Z3.2 F42000
G1 X122.761 Y131.844 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.817 Y130.93 E.23236
G2 X115.183 Y130.93 I-.317 J4.258 E.02102
G1 X108.239 Y131.844 E.23236
G1 X107.299 Y124.71 E.2387
G1 X114.231 Y123.797 E.23192
G3 X115.922 Y123.723 I1.453 J13.806 E.05618
G3 X116.769 Y123.797 I-.426 J9.734 E.02823
G1 X123.701 Y124.71 E.23192
G1 X122.769 Y131.785 E.23671
; WIPE_START
G1 X120.784 Y131.541 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.044 Y125.108 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P42 R14
G1 F9547.055
M204 S5000
G1 X124.078 Y124.848 E.00806
G1 X127.022 Y125.236 E.09126
G1 X126.106 Y132.196 E.2157
G1 X123.162 Y131.808 E.09126
G1 X124.036 Y125.168 E.2058
; WIPE_START
M204 S6000
G1 X124.078 Y124.848 E-.12253
G1 X125.741 Y125.067 E-.63747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.598 Y127.757 Z3.2 F42000
G1 X107.838 Y131.808 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X104.894 Y132.196 E.09126
G1 X103.978 Y125.236 E.2157
G1 X104.248 Y125.2 E.00838
G1 X106.922 Y124.848 E.08288
G1 X107.831 Y131.749 E.21386
; WIPE_START
M204 S6000
G1 X105.853 Y132.05 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.482 Y132.286 Z3.2 F42000
G1 X126.078 Y132.676 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X115.77 Y131.319 E.31947
G2 X115.23 Y131.319 I-.27 J3.67 E.0166
G1 X104.853 Y132.674 E.32157
G3 X104.703 Y132.505 I.043 J-.189 E.0074
G1 X103.714 Y124.914 E.23522
G3 X103.883 Y124.764 I.187 J.04 E.00742
G1 X114.184 Y123.408 E.31925
G3 X115.939 Y123.331 I1.507 J14.347 E.05401
G3 X116.816 Y123.408 I-.44 J10.076 E.02707
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.022 J.193 E.00958
G1 X126.297 Y132.506 E.23306
G3 X126.138 Y132.674 I-.195 J-.024 E.00764
M204 S10000
G1 X126.109 Y132.438 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130743
G1 F15000
M204 S6000
G1 X122.936 Y132.02 E.0229
; WIPE_START
G1 X124.919 Y132.282 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.426 Y130.829 Z3.2 F42000
G1 X116.807 Y130.709 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X118.421 Y130.921 E.05401
G1 X111.949 Y124.449 E.30364
G1 X111.288 Y124.536 E.02211
G1 X108.054 Y127.77 E.15174
G1 X108.123 Y128.299 E.01768
G1 X110.959 Y131.135 E.13303
G1 X112.579 Y130.921 E.05419
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X122.947 Y127.771 E.15174
G1 X122.877 Y128.299 E.01768
G1 X120.041 Y131.135 E.13303
G1 X121.656 Y131.347 E.05401
; WIPE_START
G1 X120.041 Y131.135 E-.61876
G1 X120.304 Y130.872 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130528
G1 F15000
M204 S6000
G1 X127.088 Y125.002 E.02284
; WIPE_START
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.472 Y124.675 Z3.2 F42000
G1 X107.085 Y124.585 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.130542
G1 F15000
M204 S6000
G1 X103.912 Y125.002 E.02285
; WIPE_START
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.908 Y132.309 Z3.2 F42000
G1 X104.891 Y132.438 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.130527
G1 F15000
M204 S6000
G1 X108.064 Y132.02 E.02284
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.081 Y132.282 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 15/85
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I.165 J1.206 P1  F42000
G1 X145.898 Y126.84 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7041
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7041
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7041
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7041
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7041
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.049 J-.202 E.00883
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z3.4 F42000
G1 X146.29 Y140.94 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7041
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z3.4 F42000
G1 X145.71 Y115.06 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7041
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7041
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.738 Y113.607 E.18697
G1 X151.852 Y113.675 E.00441
G1 X151.897 Y113.79 E.00411
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z3.4 F42000
G1 X141.49 Y129.965 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7041
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.012 J-.608 E.02762
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.608 J.048 E.02657
G1 X151.757 Y113.213 E.35284
G3 X152.289 Y113.771 I-.059 J.589 E.02582
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 15 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer15 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X144.676 Y140.649 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570567
G1 F6822.745
M204 S6000
G1 X141.693 Y140.649 E.12829
G1 X141.456 Y140.795 E.01197
G1 X141.324 Y140.817 E.00573
G1 X141.324 Y141.176 E.01544
G1 X144.676 Y141.176 E.14412
G1 X144.676 Y140.709 E.0201
M204 S10000
G1 X145.253 Y140.196 F42000
; LINE_WIDTH: 0.41999
G1 F7041
M204 S6000
G1 X141.487 Y140.196 E.11571
G1 X141.425 Y140.31 E.00398
G1 X141.12 Y140.4 E.00979
G1 X140.872 Y140.4 E.00761
G1 X140.872 Y141.629 E.03777
G1 X145.129 Y141.628 E.13079
G1 X145.129 Y140.344 E.03945
G1 X145.215 Y140.242 E.0041
M204 S10000
G1 X145.694 Y139.809 F42000
; LINE_WIDTH: 0.41384
G1 F7041
M204 S6000
G3 X141.308 Y139.819 I-2.55 J-155.453 E.13258
G1 X141.222 Y139.993 E.00586
G1 X141.12 Y140.023 E.00321
G1 X140.495 Y140.023 E.01888
G1 X140.495 Y142.006 E.05995
G1 X145.506 Y142.005 E.15145
G1 X145.506 Y140.344 E.05021
G1 X145.694 Y140.166 E.00785
G1 X148.316 Y140.166 E.07924
G1 X148.316 Y139.809 E.01079
G1 X145.754 Y139.809 E.07742
; WIPE_START
G1 F9705.596
G1 X147.754 Y139.809 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280103
G1 F7041
M204 S6000
G1 X151.756 Y142.472 E.10942
; LINE_WIDTH: 0.254699
G1 X151.867 Y142.449 E.00195
; LINE_WIDTH: 0.213451
G1 X151.912 Y142.434 E.00066
; LINE_WIDTH: 0.177387
G1 X152.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.684 Y135.517 Z3.4 F42000
G1 X145.906 Y129.563 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F7041
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F7041
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7041
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F7041
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F7041
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X147.323 Y115.352 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.569344
G1 F6838.601
M204 S6000
G1 X150.307 Y115.352 E.12801
G1 X150.546 Y115.205 E.012
G1 X150.676 Y115.183 E.00569
G1 X150.676 Y114.827 E.01531
G1 X147.323 Y114.825 E.14384
G1 X147.323 Y115.292 E.02003
M204 S10000
G1 X146.747 Y115.804 F42000
; LINE_WIDTH: 0.41999
G1 F7041
M204 S6000
G1 X150.512 Y115.804 E.11571
G1 X150.574 Y115.69 E.00397
G1 X150.88 Y115.6 E.0098
G1 X151.128 Y115.6 E.00761
G1 X151.128 Y114.375 E.03764
G1 X146.871 Y114.372 E.13079
G1 X146.871 Y115.656 E.03942
G1 X146.785 Y115.758 E.0041
M204 S10000
G1 X146.306 Y116.191 F42000
; LINE_WIDTH: 0.41384
G1 F7041
M204 S6000
G3 X150.692 Y116.181 I2.55 J155.453 E.13258
G1 X150.778 Y116.007 E.00586
G1 X150.88 Y115.977 E.00321
G1 X151.505 Y115.977 E.01888
G1 X151.505 Y113.998 E.05981
G1 X146.494 Y113.995 E.15145
G1 X146.494 Y115.656 E.05019
G1 X146.306 Y115.834 E.00785
G1 X143.684 Y115.834 E.07924
G1 X143.684 Y116.191 E.01079
G1 X146.246 Y116.191 E.07742
; WIPE_START
G1 F9705.598
G1 X144.246 Y116.191 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279645
G1 F7041
M204 S6000
G1 X140.293 Y113.525 E.10827
G2 X140.159 Y113.544 I.022 J.663 E.00262
; LINE_WIDTH: 0.222335
G1 X140.09 Y113.566 E.00106
; LINE_WIDTH: 0.178069
G1 X139.949 Y113.626 E.00169
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.09 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.778 Y117.857 Z3.4 F42000
G1 X123.701 Y124.71 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7041
M204 S6000
G1 X122.761 Y131.844 E.2387
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.313 E.02082
G1 X108.239 Y131.844 E.23258
G1 X107.299 Y124.71 E.2387
G1 X114.231 Y123.797 E.23192
G3 X115.556 Y123.715 I1.675 J16.266 E.04406
G3 X116.769 Y123.797 I-.116 J10.697 E.04036
G1 X123.641 Y124.702 E.22992
M204 S250
G1 X124.078 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7041
M204 S5000
G1 X123.162 Y131.808 E.2157
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.281 Y132.565 E.02514
G3 X126.076 Y132.676 I-.178 J-.084 E.00769
G1 X115.77 Y131.319 E.3194
G2 X115.232 Y131.319 I-.27 J2.787 E.01654
G1 X104.855 Y132.674 E.32159
G3 X104.705 Y132.52 I.038 J-.186 E.00703
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.01459
G1 X107.838 Y131.808 E.09126
G1 X106.922 Y124.848 E.21571
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.2 J-.022 E.00948
G1 X114.184 Y123.408 E.31926
G3 X115.565 Y123.323 I1.721 J16.704 E.04252
G3 X116.816 Y123.408 I-.124 J11.084 E.03857
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.028 J.197 E.00951
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.137 Y124.856 E.08942
M204 S10000
G1 X123.915 Y124.585 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F7041
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z3.4 F42000
G1 X126.108 Y132.438 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F7041
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.656 Y131.347 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7041
M204 S6000
G1 X120.041 Y131.135 E.05401
G1 X122.877 Y128.299 E.13302
G1 X122.946 Y127.77 E.01769
G1 X119.712 Y124.536 E.15174
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
M73 P43 R14
G1 X110.959 Y131.135 E.05419
G1 X108.123 Y128.299 E.13303
G1 X108.054 Y127.77 E.01769
G1 X111.288 Y124.536 E.15174
G1 X111.949 Y124.449 E.02211
G1 X118.421 Y130.921 E.30364
G1 X116.807 Y130.709 E.05401
; WIPE_START
G1 F8843.478
G1 X118.421 Y130.921 E-.61876
G1 X118.159 Y130.659 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.595 Y131.679 Z3.4 F42000
G1 X108.064 Y132.02 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130864
G1 F7041
M204 S6000
G1 X104.892 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z3.4 F42000
G1 X103.913 Y125.002 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F7041
M204 S6000
G1 X107.085 Y124.585 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 16/85
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I-.059 J1.216 P1  F42000
G1 X145.898 Y126.84 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8333
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8333
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8333
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8333
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8333
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.043 J-.197 E.00888
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z3.6 F42000
G1 X146.29 Y140.94 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8333
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z3.6 F42000
G1 X145.71 Y115.06 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8333
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8333
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.739 Y113.607 E.18697
G1 X151.852 Y113.675 E.00441
G1 X151.897 Y113.79 E.00411
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z3.6 F42000
G1 X141.49 Y129.965 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8333
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.591 J-.031 E.02675
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.608 J.048 E.02657
G1 X151.757 Y113.213 E.35284
G3 X152.289 Y113.771 I-.059 J.589 E.02581
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 16 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer16 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X144.676 Y140.649 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570567
G1 F6822.745
M204 S6000
G1 X141.693 Y140.649 E.12829
G1 X141.456 Y140.795 E.01197
G1 X141.324 Y140.817 E.00573
G1 X141.324 Y141.176 E.01544
G1 X144.676 Y141.176 E.14412
G1 X144.676 Y140.709 E.0201
M204 S10000
G1 X145.253 Y140.196 F42000
; LINE_WIDTH: 0.41999
G1 F8333
M204 S6000
G1 X141.487 Y140.196 E.11571
G1 X141.425 Y140.31 E.00398
G1 X141.12 Y140.4 E.00979
G1 X140.872 Y140.4 E.00761
G1 X140.872 Y141.629 E.03777
G1 X145.129 Y141.628 E.13079
G1 X145.129 Y140.344 E.03945
G1 X145.215 Y140.242 E.0041
M204 S10000
G1 X145.694 Y139.809 F42000
; LINE_WIDTH: 0.41384
G1 F8333
M204 S6000
G3 X141.308 Y139.819 I-2.55 J-155.453 E.13258
G1 X141.222 Y139.993 E.00586
G1 X141.12 Y140.023 E.00321
G1 X140.495 Y140.023 E.01888
G1 X140.495 Y142.006 E.05995
G1 X145.506 Y142.005 E.15145
G1 X145.506 Y140.344 E.05021
G1 X145.694 Y140.166 E.00785
G1 X148.316 Y140.166 E.07924
G1 X148.316 Y139.809 E.01079
G1 X145.754 Y139.809 E.07742
; WIPE_START
G1 F9705.596
G1 X147.754 Y139.809 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
G1 F8333
M204 S6000
G1 X151.707 Y142.475 E.10844
G2 X151.795 Y142.466 I-.013 J-.604 E.00172
; LINE_WIDTH: 0.236034
G2 X152.039 Y142.399 I-.334 J-1.68 E.00398
M204 S10000
G1 X152.052 Y142.372 F42000
; LINE_WIDTH: 0.171752
G1 F8333
M204 S6000
G1 X151.555 Y142.593 E.00571
; WIPE_START
G1 F15000
G1 X152.052 Y142.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.75 Y135.491 Z3.6 F42000
G1 X145.906 Y129.563 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F8333
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F8333
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F8333
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F8333
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F8333
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X147.323 Y115.352 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.569349
G1 F6838.539
M204 S6000
G1 X150.307 Y115.352 E.12801
G1 X150.546 Y115.205 E.012
G1 X150.676 Y115.183 E.00569
G1 X150.676 Y114.827 E.01531
G1 X147.323 Y114.825 E.14384
G1 X147.323 Y115.292 E.02004
M204 S10000
G1 X146.747 Y115.804 F42000
; LINE_WIDTH: 0.41999
G1 F8333
M204 S6000
G1 X150.512 Y115.804 E.11571
G1 X150.574 Y115.69 E.00397
G1 X150.88 Y115.6 E.0098
G1 X151.128 Y115.6 E.00761
G1 X151.128 Y114.375 E.03764
G1 X146.871 Y114.372 E.13079
G1 X146.871 Y115.656 E.03943
G1 X146.785 Y115.758 E.0041
M204 S10000
G1 X146.306 Y116.191 F42000
; LINE_WIDTH: 0.41384
G1 F8333
M204 S6000
G3 X150.692 Y116.181 I2.55 J155.453 E.13258
G1 X150.778 Y116.007 E.00586
G1 X150.88 Y115.977 E.00321
G1 X151.505 Y115.977 E.01888
G1 X151.505 Y113.998 E.05981
G1 X146.494 Y113.995 E.15145
G1 X146.494 Y115.656 E.05019
G1 X146.306 Y115.834 E.00785
G1 X143.684 Y115.834 E.07924
G1 X143.684 Y116.191 E.01079
G1 X146.246 Y116.191 E.07742
; WIPE_START
G1 F9705.598
G1 X144.246 Y116.191 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279655
G1 F8333
M204 S6000
G1 X140.293 Y113.525 E.10828
G2 X140.159 Y113.544 I.022 J.664 E.00262
; LINE_WIDTH: 0.216334
G2 X139.956 Y113.612 I.479 J1.749 E.00303
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.159 Y113.544 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.843 Y117.829 Z3.6 F42000
G1 X123.701 Y124.71 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8333
M204 S6000
G1 X122.761 Y131.844 E.2387
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.31 E.02082
G1 X108.239 Y131.844 E.23258
G1 X107.299 Y124.71 E.2387
G1 X114.231 Y123.797 E.23192
G3 X115.922 Y123.723 I1.41 J12.814 E.05619
G3 X116.769 Y123.797 I-.426 J9.737 E.02822
G1 X123.641 Y124.702 E.22992
M204 S250
G1 X124.078 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8333
M204 S5000
G1 X123.162 Y131.808 E.21571
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.078 Y132.676 I-.189 J-.034 E.0091
G1 X115.77 Y131.319 E.31946
G2 X115.232 Y131.319 I-.27 J2.787 E.01654
G1 X104.854 Y132.674 E.32159
G3 X104.705 Y132.52 I.038 J-.186 E.00702
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.922 Y124.848 E.21571
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.201 J-.022 E.00949
G1 X114.184 Y123.408 E.31925
G3 X115.939 Y123.331 I1.463 J13.334 E.05402
G3 X116.816 Y123.408 I-.441 J10.082 E.02706
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.022 J.193 E.00958
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.137 Y124.856 E.08942
M204 S10000
G1 X123.915 Y124.585 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130844
G1 F8333
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.459 Y124.912 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X123.263 Y125.046 E.0226
G1 X123.273 Y125.18 E.00374
G1 X122.613 Y130.196 E.14031
; Slow Down End
; WIPE_START
G1 X122.874 Y128.213 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130838
G1 F8333
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.944 Y130.844 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X121.485 Y131.31 E.09894
; Slow Down End
M204 S10000
G1 X116.811 Y130.709 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8333
M204 S6000
G1 X117.438 Y130.792 E.021
G1 X117.321 Y130.675 E.0055
G1 X117.45 Y130.413 E.00967
G1 X117.983 Y130.483 E.01783
G1 X112.285 Y124.785 E.26732
G1 X110.85 Y124.974 E.04801
G1 X108.39 Y127.434 E.11543
G1 X108.561 Y128.737 E.04359
G1 X110.623 Y130.799 E.0967
G1 X113.016 Y130.484 E.08009
G1 X118.715 Y124.785 E.26733
G1 X120.15 Y124.974 E.04801
G1 X122.61 Y127.434 E.11542
G1 X122.439 Y128.737 E.04359
G1 X120.377 Y130.799 E.0967
G1 X121.992 Y131.011 E.05401
M204 S10000
G1 X113.93 Y130.729 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F8333
M204 S6000
G1 X115.155 Y130.568 E.03421
G1 X115.458 Y130.552 E.00842
M204 S10000
G1 X110.505 Y131.18 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X112.803 Y130.877 E.06422
; Slow Down End
; WIPE_START
G1 X110.82 Y131.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F8333
M204 S6000
G1 X104.892 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.891 Y126.428 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X108.486 Y130.944 E.1262
; Slow Down End
M204 S10000
G1 X109.542 Y124.78 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X112.205 Y124.43 E.07441
; Slow Down End
M204 S10000
G1 X114.811 Y124.119 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G3 X116.73 Y124.158 I.772 J9.198 E.05327
G1 X120.4 Y124.641 E.10255
; Slow Down End
; WIPE_START
G1 X118.417 Y124.38 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.786 Y124.518 Z3.6 F42000
G1 X107.085 Y124.585 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130861
G1 F8333
M204 S6000
G1 X103.913 Y125.002 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 17/85
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I-.064 J1.215 P1  F42000
G1 X145.898 Y126.84 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
M73 P44 R14
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.243 Y142.389 E.1876
G3 X140.103 Y142.202 I.071 J-.198 E.00819
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z3.8 F42000
G1 X146.29 Y140.94 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z3.8 F42000
G1 X145.71 Y115.06 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.716 Y113.603 E.18623
G1 X151.839 Y113.661 E.00451
G1 X151.884 Y113.727 E.00265
G1 X151.897 Y113.79 E.00215
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z3.8 F42000
G1 X141.49 Y129.965 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.013 J-.609 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.608 J.048 E.02657
G1 X151.757 Y113.213 E.35284
G3 X152.289 Y113.771 I-.059 J.589 E.02581
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 17 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer17 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X141.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X140.451 Y142.05 E.02665
G1 X140.451 Y141.225 E.02736
G1 X141.901 Y139.775 E.06799
G1 X142.423 Y139.775 E.01734
G1 X144.697 Y142.049 E.10668
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; WIPE_START
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280103
G1 F15000
M204 S6000
G1 X151.756 Y142.472 E.10943
; LINE_WIDTH: 0.254645
G1 X151.867 Y142.449 E.00195
; LINE_WIDTH: 0.213427
G1 X151.912 Y142.434 E.00066
; LINE_WIDTH: 0.17738
G1 X152.051 Y142.374 E.00166
; WIPE_START
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.684 Y135.517 Z3.8 F42000
G1 X145.906 Y129.563 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F8717.973
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
M73 P44 R13
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F10086.86
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F10086.717
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F8717.973
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X150.744 Y113.951 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X151.549 Y113.952 E.02669
G1 X151.549 Y114.775 E.02733
G1 X150.099 Y116.225 E.06799
G1 X149.577 Y116.225 E.01734
G1 X147.303 Y113.951 E.10665
G1 X146.45 Y113.951 E.02829
G1 X146.45 Y114.727 E.02573
; WIPE_START
G1 X146.45 Y113.951 E-.29471
G1 X147.303 Y113.951 E-.32406
G1 X147.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279667
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10828
G2 X140.159 Y113.544 I.021 J.662 E.00261
; LINE_WIDTH: 0.22247
G1 X140.09 Y113.566 E.00107
; LINE_WIDTH: 0.178098
G1 X139.949 Y113.626 E.00169
; OBJECT_ID: 394
; WIPE_START
G1 X140.09 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.778 Y117.857 Z3.8 F42000
G1 X123.701 Y124.71 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X122.761 Y131.844 E.2387
G1 X115.81 Y130.929 E.23258
G2 X115.19 Y130.929 I-.31 J2.802 E.02062
G1 X108.239 Y131.844 E.23258
G1 X107.299 Y124.71 E.2387
G1 X114.231 Y123.797 E.23191
G3 X115.567 Y123.715 I1.645 J15.881 E.04442
G3 X116.769 Y123.797 I-.123 J10.652 E.03999
G1 X123.641 Y124.702 E.22992
M204 S250
G1 X124.078 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X123.162 Y131.808 E.21571
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.077 Y132.676 I-.191 J-.036 E.00908
G1 X115.768 Y131.319 E.31952
G2 X115.232 Y131.319 I-.268 J2.339 E.01648
G1 X104.852 Y132.674 E.32166
G3 X104.705 Y132.52 I.04 J-.186 E.00695
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.922 Y124.848 E.2157
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.202 J-.021 E.00948
G1 X114.184 Y123.408 E.31925
G3 X115.576 Y123.323 I1.694 J16.356 E.04286
G3 X116.816 Y123.408 I-.131 J11.04 E.03823
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.137 Y124.856 E.08942
M204 S10000
G1 X123.915 Y124.585 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130843
G1 F15000
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.856 Y124.87 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43496
G1 F9182.736
M204 S6000
G1 X120.807 Y124.732 E.03381
G1 X120.813 Y124.794 E.00199
G1 X121.261 Y125.242 E.02023
G1 X121.806 Y124.902 E.02052
M204 S10000
G1 X122.445 Y131.432 F42000
; LINE_WIDTH: 0.37107
G1 F10970.592
M204 S6000
G1 X121.952 Y131.367 E.01328
G1 X122.529 Y130.79 E.02182
G1 X122.453 Y131.372 E.01571
M204 S10000
G1 X122.936 Y132.02 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F15000
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.279 Y131.48 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41309
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X122.612 Y130.148 E.1029
G1 X122.711 Y129.394 E.04154
G1 X120.881 Y131.224 E.14132
G1 X120.302 Y131.148 E.03187
G1 X122.81 Y128.64 E.19368
G1 X122.91 Y127.885 E.04154
G1 X119.724 Y131.071 E.24604
G1 X119.145 Y130.995 E.03187
G1 X123.009 Y127.131 E.2984
G1 X123.108 Y126.377 E.04154
G1 X118.566 Y130.919 E.35076
G1 X118.012 Y130.846 E.03052
G1 X118.007 Y130.823 E.00129
G1 X123.208 Y125.623 E.40158
G1 X123.286 Y125.028 E.03276
G1 X123.164 Y125.012 E.00674
G1 X117.714 Y130.462 E.42085
G1 X117.386 Y130.134 E.02529
G1 X122.585 Y124.936 E.40145
G1 X122.553 Y124.931 E.00176
G1 X121.2 Y125.776 E.0871
G1 X121.145 Y125.721 E.00425
G1 X117.059 Y129.807 E.31552
G1 X116.859 Y129.607 E.01543
G1 X116.136 Y130.074 E.04701
G1 X120.817 Y125.393 E.36148
G1 X120.49 Y125.066 E.02529
G1 X114.971 Y130.585 E.42619
G1 X114.217 Y130.684 E.04154
G1 X120.27 Y124.631 E.46746
G1 X119.691 Y124.555 E.03187
G1 X113.843 Y130.403 E.45161
G1 X113.644 Y129.998 E.02465
G1 X112.766 Y130.875 E.06775
G1 X112.708 Y130.883 E.00319
G1 X119.113 Y124.479 E.49457
G1 X118.534 Y124.402 E.03187
G1 X111.954 Y130.982 E.50812
G1 X111.2 Y131.081 E.04154
G1 X117.955 Y124.326 E.52167
G1 X117.376 Y124.25 E.03187
G1 X110.561 Y131.066 E.52634
G1 X110.552 Y130.976 E.0049
G1 X110.274 Y130.698 E.02152
G1 X116.798 Y124.174 E.5038
G2 X116.202 Y124.114 I-1.359 J10.571 E.03267
G1 X109.946 Y130.37 E.48311
G1 X109.732 Y130.156 E.01652
G1 X109.132 Y130.529 E.03858
G1 X115.576 Y124.086 E.4976
G2 X114.934 Y124.107 I.897 J37.214 E.03508
G1 X114.821 Y124.186 E.00753
G1 X108.443 Y130.564 E.49254
G1 X108.367 Y129.985 E.03187
G1 X113.05 Y125.302 E.36166
G1 X112.723 Y124.974 E.02529
G1 X108.29 Y129.406 E.34227
G1 X108.214 Y128.828 E.03187
G1 X112.395 Y124.647 E.32288
G1 X112.188 Y124.439 E.01603
G1 X111.912 Y124.475 E.01521
G1 X108.138 Y128.249 E.29142
G1 X108.062 Y127.67 E.03187
G1 X111.158 Y124.575 E.23906
G1 X110.403 Y124.674 E.04154
G1 X107.986 Y127.092 E.1867
G1 X107.91 Y126.513 E.03187
G1 X109.884 Y124.538 E.1525
M106 S201.45
M204 S10000
G1 X107.806 Y125.098 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53818
; LAYER_HEIGHT: 0.2
G1 F7268.909
M204 S6000
G1 X107.88 Y125.664 E.02303
G1 X108.111 Y125.633 E.00942
G1 X108.774 Y124.971 E.03783
G1 X107.865 Y125.09 E.03701
M204 S10000
G1 X113.172 Y124.817 F42000
; Slow Down Start
; LINE_WIDTH: 0.45166
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X112.758 Y124.403 E.01951
G1 X113.996 Y124.24 E.04159
G1 X113.221 Y124.782 E.03151
; Slow Down End
M204 S10000
G1 X113.551 Y130.69 F42000
; LINE_WIDTH: 0.45634
G1 F8707.851
M204 S6000
G2 X113.543 Y130.779 I-.026 J.043 E.0068
M204 S10000
G1 X117.355 Y130.716 F42000
; Slow Down Start
; LINE_WIDTH: 0.4606
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X116.8 Y130.162 E.0267
G1 X116.182 Y130.561 E.02506
G1 X117.296 Y130.708 E.03822
; Slow Down End
M204 S10000
G1 X108.642 Y131.361 F42000
; Slow Down Start
; LINE_WIDTH: 0.48809
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X109.667 Y130.724 E.0438
G1 X110.111 Y131.168 E.02278
G1 X108.701 Y131.353 E.05159
; Slow Down End
M204 S10000
G1 X108.064 Y132.02 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130844
G1 F15000
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z3.8 F42000
G1 X103.913 Y125.002 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.130861
G1 F15000
M204 S6000
G1 X107.085 Y124.585 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P45 R13
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 18/85
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I-.059 J1.216 P1  F42000
G1 X145.898 Y126.84 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9233
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9233
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.043 J-.197 E.00887
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z4 F42000
G1 X146.29 Y140.94 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9233
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z4 F42000
G1 X145.71 Y115.06 Z4
G1 Z3.6
G1 E.8 F1800
G1 F9233
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.716 Y113.603 E.18624
G1 X151.839 Y113.66 E.0045
G1 X151.884 Y113.727 E.00265
G1 X151.897 Y113.79 E.00215
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z4 F42000
G1 X141.49 Y129.965 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9233
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.591 J-.031 E.02675
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.608 J.048 E.02657
G1 X151.757 Y113.213 E.35284
G3 X152.289 Y113.771 I-.059 J.589 E.02581
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 18 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer18 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X145.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X142.423 Y139.775 E.10668
G1 X141.901 Y139.775 E.01734
G1 X140.451 Y141.225 E.06799
G1 X140.451 Y142.05 E.02736
G1 X141.255 Y142.05 E.02665
; WIPE_START
G1 X140.451 Y142.05 E-.30528
G1 X140.451 Y141.225 E-.31348
G1 X140.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
G1 F9233
M204 S6000
G1 X151.707 Y142.475 E.10844
G2 X151.795 Y142.466 I-.013 J-.603 E.00172
; LINE_WIDTH: 0.236007
G2 X152.039 Y142.399 I-.335 J-1.684 E.00398
M204 S10000
G1 X152.052 Y142.373 F42000
; LINE_WIDTH: 0.171773
G1 F9233
M204 S6000
G1 X151.554 Y142.593 E.00571
; WIPE_START
G1 F15000
G1 X152.052 Y142.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.75 Y135.491 Z4 F42000
G1 X145.906 Y129.563 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F8717.973
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F9233
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F9233
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F9233
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F8717.973
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X146.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.45 Y113.951 E.02573
G1 X147.303 Y113.951 E.02829
G1 X149.577 Y116.225 E.10665
G1 X150.099 Y116.225 E.01734
G1 X151.549 Y114.775 E.06799
G1 X151.549 Y113.952 E.02732
G1 X150.744 Y113.951 E.02669
; WIPE_START
G1 X151.549 Y113.952 E-.30575
G1 X151.549 Y114.775 E-.31301
G1 X151.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279496
G1 F9233
M204 S6000
G1 X140.293 Y113.525 E.1082
G2 X140.137 Y113.55 I.044 J.794 E.00306
; LINE_WIDTH: 0.214465
G1 X140.088 Y113.566 E.00071
; LINE_WIDTH: 0.177385
G1 X139.949 Y113.626 E.00166
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.777 Y117.858 Z4 F42000
G1 X123.701 Y124.71 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X122.761 Y131.844 E.2387
G1 X115.817 Y130.93 E.23236
G2 X115.183 Y130.93 I-.317 J4.258 E.02102
G1 X108.239 Y131.844 E.23236
G1 X107.299 Y124.71 E.2387
G1 X114.231 Y123.797 E.23191
G3 X115.573 Y123.715 I1.632 J15.711 E.04461
G3 X116.769 Y123.797 I-.127 J10.638 E.0398
G1 X123.641 Y124.702 E.22992
M204 S250
G1 X124.078 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9233
M204 S5000
G1 X123.162 Y131.808 E.2157
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.281 Y132.567 E.0252
G3 X126.077 Y132.676 I-.177 J-.085 E.00758
G1 X115.77 Y131.319 E.31945
G2 X115.23 Y131.319 I-.27 J3.671 E.0166
G1 X104.855 Y132.674 E.32152
G3 X104.705 Y132.522 I.038 J-.187 E.00696
G1 X104.604 Y131.755 E.02377
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.922 Y124.848 E.2157
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.202 J-.021 E.00947
G1 X114.184 Y123.408 E.31925
G3 X115.581 Y123.323 I1.682 J16.194 E.04303
G3 X116.816 Y123.408 I-.135 J11.026 E.03806
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00948
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.137 Y124.856 E.08942
M204 S10000
G1 X123.915 Y124.585 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F9233
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z4 F42000
G1 X126.108 Y132.438 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F9233
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.942 Y131.571 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42272
G1 F9233
M204 S6000
G1 X122.54 Y130.973 E.02619
G1 X122.621 Y130.354 E.01931
G1 X121.618 Y131.357 E.04391
G1 X121.144 Y131.295 E.01482
G1 X122.703 Y129.736 E.06825
G1 X122.784 Y129.117 E.01931
G1 X120.669 Y131.232 E.09258
G1 X120.194 Y131.17 E.01482
G1 X122.866 Y128.499 E.11692
G1 X122.947 Y127.88 E.01931
G1 X119.72 Y131.107 E.14126
G1 X119.245 Y131.045 E.01482
G1 X123.029 Y127.261 E.1656
G1 X123.11 Y126.643 E.01931
G1 X118.77 Y130.983 E.18994
G1 X118.296 Y130.92 E.01482
G1 X123.191 Y126.024 E.21427
G1 X123.273 Y125.406 E.01931
G1 X117.821 Y130.858 E.23861
G1 X117.347 Y130.795 E.01482
G1 X123.166 Y124.976 E.25471
G1 X122.691 Y124.913 E.01482
G1 X116.872 Y130.733 E.25471
G1 X116.397 Y130.67 E.01482
G1 X122.217 Y124.851 E.25471
G1 X121.742 Y124.788 E.01482
G1 X115.923 Y130.608 E.25471
G2 X115.412 Y130.581 I-.467 J4.011 E.01582
G1 X121.268 Y124.726 E.25627
G1 X120.793 Y124.663 E.01482
G1 X114.814 Y130.642 E.2617
G1 X114.195 Y130.724 E.01931
G1 X120.318 Y124.601 E.268
G1 X119.844 Y124.538 E.01482
G1 X113.577 Y130.805 E.2743
G1 X112.958 Y130.887 E.01931
G1 X119.369 Y124.476 E.2806
G1 X118.894 Y124.413 E.01482
G1 X112.339 Y130.968 E.2869
G1 X111.721 Y131.049 E.01931
G1 X118.42 Y124.351 E.2932
G1 X117.945 Y124.288 E.01482
G1 X111.102 Y131.131 E.2995
G1 X110.484 Y131.212 E.01931
G1 X117.47 Y124.226 E.3058
G1 X116.996 Y124.163 E.01482
G1 X109.865 Y131.294 E.31209
G1 X109.247 Y131.375 E.01931
G1 X116.517 Y124.105 E.31821
G2 X116.016 Y124.069 I-.532 J3.932 E.01557
G1 X108.628 Y131.457 E.32334
G1 X108.525 Y131.47 E.0032
G1 X108.473 Y131.074 E.01236
G1 X115.498 Y124.05 E.30745
G2 X114.941 Y124.07 I-.141 J3.874 E.01726
G1 X108.411 Y130.6 E.28581
G1 X108.348 Y130.125 E.01482
G1 X114.352 Y124.121 E.26278
G2 X113.738 Y124.198 I.58 J7.107 E.01916
G1 X108.286 Y129.65 E.23863
G1 X108.223 Y129.176 E.01482
G1 X113.12 Y124.28 E.21429
G1 X112.501 Y124.361 E.01931
G1 X108.161 Y128.701 E.18996
G1 X108.098 Y128.227 E.01482
G1 X111.882 Y124.443 E.16562
G1 X111.264 Y124.524 E.01931
G1 X108.036 Y127.752 E.14128
G1 X107.973 Y127.277 E.01482
G1 X110.645 Y124.605 E.11694
G1 X110.027 Y124.687 E.01931
G1 X107.911 Y126.803 E.09261
G1 X107.849 Y126.328 E.01482
G1 X109.408 Y124.768 E.06827
G1 X108.79 Y124.85 E.01931
G1 X107.786 Y125.853 E.04393
G1 X107.724 Y125.379 E.01482
G1 X108.368 Y124.734 E.02822
; WIPE_START
G1 F9478.673
G1 X107.724 Y125.379 E-.34646
G1 X107.786 Y125.853 E-.18192
G1 X108.217 Y125.422 E-.23162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F9233
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z4 F42000
G1 X104.892 Y132.438 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F9233
M204 S6000
G1 X108.064 Y132.02 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 19/85
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4 I.165 J1.206 P1  F42000
G1 X145.898 Y126.84 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
M73 P46 R13
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9235
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9235
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.043 J-.197 E.00888
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z4.2 F42000
G1 X146.29 Y140.94 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9235
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z4.2 F42000
G1 X145.71 Y115.06 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9235
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.716 Y113.603 E.18624
G1 X151.839 Y113.66 E.0045
G1 X151.883 Y113.726 E.00262
G1 X151.897 Y113.79 E.00218
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z4.2 F42000
G1 X141.49 Y129.965 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9235
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.591 J-.031 E.02675
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.013 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.774 E.05811
G3 X140.274 Y113.211 I.594 J.031 E.02679
G1 X151.757 Y113.213 E.35285
G3 X152.289 Y113.771 I-.059 J.589 E.02581
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 19 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer19 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X141.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X140.451 Y142.05 E.02665
G1 X140.451 Y141.225 E.02736
G1 X141.901 Y139.775 E.06799
G1 X142.423 Y139.775 E.01734
G1 X144.697 Y142.049 E.10668
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; WIPE_START
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F9235
M204 S6000
G1 X151.707 Y142.475 E.10844
G2 X151.795 Y142.466 I-.013 J-.601 E.00171
; LINE_WIDTH: 0.236026
G2 X152.039 Y142.399 I-.336 J-1.691 E.00398
M204 S10000
G1 X152.052 Y142.373 F42000
; LINE_WIDTH: 0.171767
G1 F9235
M204 S6000
G1 X151.554 Y142.593 E.00571
; WIPE_START
G1 F15000
G1 X152.052 Y142.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.75 Y135.491 Z4.2 F42000
G1 X145.906 Y129.563 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F8717.973
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F9235
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F9235
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F9235
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F8717.973
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X150.744 Y113.951 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X151.549 Y113.952 E.02669
G1 X151.549 Y114.775 E.02732
G1 X150.099 Y116.225 E.06799
G1 X149.577 Y116.225 E.01734
G1 X147.303 Y113.951 E.10665
G1 X146.45 Y113.951 E.02829
G1 X146.45 Y114.727 E.02573
; WIPE_START
G1 X146.45 Y113.951 E-.29471
G1 X147.303 Y113.951 E-.32405
G1 X147.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278249
G1 F9235
M204 S6000
G1 X140.293 Y113.525 E.10763
G2 X139.963 Y113.598 I.1 J1.247 E.00649
M204 S10000
G1 X139.949 Y113.626 F42000
; LINE_WIDTH: 0.17737
G1 F9235
M204 S6000
G1 X140.46 Y113.407 E.0061
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X139.949 Y113.626 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.644 Y117.927 Z4.2 F42000
G1 X123.701 Y124.71 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X122.761 Y131.844 E.2387
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.31 E.02082
G1 X108.239 Y131.844 E.23258
G1 X107.299 Y124.71 E.2387
G1 X114.231 Y123.797 E.23191
G3 X115.578 Y123.715 I1.62 J15.55 E.04479
G3 X116.769 Y123.797 I-.131 J10.62 E.03962
G1 X123.641 Y124.702 E.22992
M204 S250
G1 X124.078 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9235
M204 S5000
G1 X123.162 Y131.808 E.21571
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.078 Y132.676 I-.19 J-.035 E.00907
G1 X115.77 Y131.319 E.31947
G2 X115.232 Y131.319 I-.27 J2.787 E.01654
G1 X104.922 Y132.676 E.31955
G1 X104.852 Y132.674 E.00215
G1 X104.771 Y132.635 E.00275
G3 X104.705 Y132.52 I.124 J-.148 E.00416
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.922 Y124.848 E.2157
G1 X103.977 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.202 J-.021 E.00948
G1 X114.184 Y123.408 E.31925
G3 X115.587 Y123.323 I1.67 J16.041 E.0432
G3 X116.816 Y123.408 I-.139 J11.009 E.03789
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00948
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.137 Y124.856 E.08942
M204 S10000
G1 X123.915 Y124.585 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F9235
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.428 Y125.53 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42272
G1 F9235
M204 S6000
G1 X122.829 Y124.931 E.02619
G1 X122.211 Y124.85 E.01931
G1 X123.214 Y125.853 E.04391
G1 X123.152 Y126.328 E.01482
G1 X121.592 Y124.768 E.06825
G1 X120.974 Y124.687 E.01931
G1 X123.089 Y126.802 E.09259
G1 X123.027 Y127.277 E.01482
G1 X120.355 Y124.605 E.11692
G1 X119.737 Y124.524 E.01931
G1 X122.964 Y127.751 E.14126
G1 X122.902 Y128.226 E.01482
G1 X119.118 Y124.443 E.1656
G1 X118.499 Y124.361 E.01931
G1 X122.839 Y128.701 E.18994
G1 X122.777 Y129.175 E.01482
G1 X117.881 Y124.28 E.21428
G1 X117.262 Y124.198 E.01931
G1 X122.714 Y129.65 E.23861
G1 X122.652 Y130.125 E.01482
G1 X116.646 Y124.119 E.26286
G2 X116.061 Y124.071 I-.67 J4.596 E.01817
G1 X122.589 Y130.599 E.28572
G1 X122.527 Y131.074 E.01482
G1 X115.503 Y124.05 E.30743
G2 X114.982 Y124.066 I-.15 J3.598 E.01615
G1 X122.372 Y131.457 E.32348
G1 X121.754 Y131.375 E.01931
G1 X114.488 Y124.109 E.31802
G2 X114.005 Y124.163 I.377 J5.576 E.01505
G1 X121.135 Y131.294 E.3121
G1 X120.517 Y131.212 E.01931
G1 X113.53 Y124.226 E.3058
G1 X113.055 Y124.288 E.01482
G1 X119.898 Y131.131 E.2995
G1 X119.28 Y131.05 E.01931
G1 X112.581 Y124.351 E.2932
G1 X112.106 Y124.413 E.01482
G1 X118.661 Y130.968 E.2869
G1 X118.042 Y130.887 E.01931
G1 X111.631 Y124.476 E.2806
G1 X111.157 Y124.538 E.01482
G1 X117.424 Y130.805 E.2743
G1 X116.805 Y130.724 E.01931
G1 X110.682 Y124.601 E.268
G1 X110.207 Y124.663 E.01482
G1 X116.187 Y130.642 E.26171
G2 X115.588 Y130.581 I-.852 J5.321 E.01864
G1 X109.733 Y124.726 E.25627
G1 X109.258 Y124.788 E.01482
G1 X115.078 Y130.608 E.25471
G1 X114.603 Y130.67 E.01482
G1 X108.784 Y124.85 E.25471
G1 X108.309 Y124.913 E.01482
G1 X114.128 Y130.733 E.25471
G1 X113.654 Y130.795 E.01482
G1 X107.834 Y124.975 E.25471
G1 X107.673 Y124.997 E.00503
G1 X107.727 Y125.405 E.01276
G1 X113.179 Y130.857 E.23863
G1 X112.705 Y130.92 E.01482
G1 X107.808 Y126.024 E.21429
G1 X107.89 Y126.642 E.01931
G1 X112.23 Y130.982 E.18996
G1 X111.755 Y131.045 E.01482
G1 X107.971 Y127.261 E.16562
G1 X108.053 Y127.88 E.01931
G1 X111.281 Y131.107 E.14128
G1 X110.806 Y131.17 E.01482
G1 X108.134 Y128.498 E.11694
G1 X108.216 Y129.117 E.01931
G1 X110.331 Y131.232 E.0926
G1 X109.857 Y131.295 E.01482
G1 X108.297 Y129.735 E.06827
G1 X108.379 Y130.354 E.01931
G1 X109.382 Y131.357 E.04393
G1 X108.908 Y131.42 E.01482
G1 X108.263 Y130.775 E.02822
; WIPE_START
G1 F9478.673
G1 X108.908 Y131.42 E-.34645
G1 X109.382 Y131.357 E-.18192
G1 X108.951 Y130.926 E-.23163
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F9235
M204 S6000
G1 X104.892 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z4.2 F42000
G1 X103.913 Y125.002 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F9235
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.183 Y127.694 Z4.2 F42000
G1 X122.936 Y132.02 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.13084
G1 F9235
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 20/85
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I.29 J1.182 P1  F42000
G1 X145.898 Y126.84 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9157
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
M73 P47 R13
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9157
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.315 Y142.398 E.1852
G1 X140.186 Y142.36 E.00447
G3 X140.103 Y142.202 I.138 J-.173 E.00608
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z4.4 F42000
G1 X146.29 Y140.94 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9157
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z4.4 F42000
G1 X145.71 Y115.06 Z4.4
G1 Z4
G1 E.8 F1800
G1 F9157
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.717 Y113.603 E.18624
G1 X151.839 Y113.661 E.00449
G1 X151.881 Y113.721 E.00243
G1 X151.897 Y113.79 E.00237
G1 X151.898 Y126.448 E.41988
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z4.4 F42000
G1 X141.49 Y129.965 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9157
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.593 J-.033 E.02673
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.01 J-.605 E.02764
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.605 J.045 E.02659
G1 X151.757 Y113.213 E.35285
G3 X152.289 Y113.771 I-.059 J.589 E.02581
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 20 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer20 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X145.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X142.423 Y139.775 E.10668
G1 X141.901 Y139.775 E.01734
G1 X140.451 Y141.225 E.06799
G1 X140.451 Y142.05 E.02736
G1 X141.255 Y142.05 E.02665
; WIPE_START
G1 X140.451 Y142.05 E-.30528
G1 X140.451 Y141.225 E-.31348
G1 X140.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F9157
M204 S6000
G1 X151.707 Y142.475 E.10844
G2 X151.795 Y142.466 I-.013 J-.602 E.00171
; LINE_WIDTH: 0.242861
G2 X151.881 Y142.444 I-.104 J-.594 E.00145
; LINE_WIDTH: 0.201724
G1 X151.929 Y142.426 E.00067
; LINE_WIDTH: 0.165869
G1 X151.969 Y142.409 E.00044
; LINE_WIDTH: 0.127153
G1 X152.057 Y142.362 E.00068
; WIPE_START
G1 F15000
G1 X151.969 Y142.409 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.711 Y135.506 Z4.4 F42000
G1 X145.906 Y129.563 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F8717.973
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F9157
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F9157
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F9157
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F8717.973
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X146.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.45 Y113.951 E.02573
G1 X147.303 Y113.951 E.02829
G1 X149.577 Y116.225 E.10665
G1 X150.099 Y116.225 E.01734
G1 X151.549 Y114.775 E.06799
G1 X151.549 Y113.952 E.02732
G1 X150.744 Y113.952 E.02669
; WIPE_START
G1 X151.549 Y113.952 E-.30576
G1 X151.549 Y114.775 E-.313
G1 X151.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279708
G1 F9157
M204 S6000
G1 X140.293 Y113.525 E.1083
G2 X140.163 Y113.543 I.021 J.654 E.00254
; LINE_WIDTH: 0.232357
G1 X140.119 Y113.556 E.0007
; LINE_WIDTH: 0.202519
G1 X139.95 Y113.618 E.00234
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.119 Y113.556 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.805 Y117.845 Z4.4 F42000
G1 X123.701 Y124.71 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X122.761 Y131.844 E.2387
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.313 E.02082
G1 X108.239 Y131.844 E.23258
G1 X107.299 Y124.71 E.2387
G1 X114.231 Y123.797 E.23191
G3 X115.584 Y123.716 I1.608 J15.393 E.04497
G3 X116.769 Y123.797 I-.135 J10.602 E.03944
G1 X123.641 Y124.702 E.22992
M204 S250
G1 X124.078 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9157
M204 S5000
G1 X123.162 Y131.808 E.2157
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.281 Y132.567 E.02521
G3 X126.076 Y132.676 I-.177 J-.085 E.00762
G1 X115.77 Y131.319 E.3194
G2 X115.232 Y131.319 I-.27 J2.788 E.01654
G1 X104.855 Y132.674 E.32159
G3 X104.705 Y132.52 I.041 J-.189 E.00701
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.922 Y124.848 E.2157
G1 X103.977 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.192 J-.029 E.0096
G1 X114.184 Y123.408 E.31925
G3 X115.592 Y123.324 I1.659 J15.89 E.04337
G3 X116.816 Y123.408 I-.143 J10.992 E.03772
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.137 Y124.856 E.08942
M204 S10000
G1 X123.915 Y124.585 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F9157
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z4.4 F42000
G1 X126.108 Y132.438 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F9157
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.942 Y131.571 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42272
G1 F9157
M204 S6000
G1 X122.54 Y130.973 E.02619
G1 X122.621 Y130.354 E.01931
G1 X121.618 Y131.357 E.04391
G1 X121.144 Y131.295 E.01482
G1 X122.703 Y129.736 E.06825
G1 X122.784 Y129.117 E.01931
G1 X120.669 Y131.232 E.09258
G1 X120.194 Y131.17 E.01482
G1 X122.866 Y128.499 E.11692
G1 X122.947 Y127.88 E.01931
G1 X119.72 Y131.107 E.14126
G1 X119.245 Y131.045 E.01482
G1 X123.029 Y127.261 E.1656
G1 X123.11 Y126.643 E.01931
G1 X118.77 Y130.983 E.18994
G1 X118.296 Y130.92 E.01482
G1 X123.191 Y126.024 E.21427
G1 X123.273 Y125.406 E.01931
G1 X117.821 Y130.858 E.23861
G1 X117.347 Y130.795 E.01482
G1 X123.166 Y124.976 E.25471
G1 X122.691 Y124.913 E.01482
G1 X116.872 Y130.733 E.25471
G1 X116.397 Y130.67 E.01482
G1 X122.217 Y124.851 E.25471
G1 X121.742 Y124.788 E.01482
G1 X115.923 Y130.608 E.25471
G2 X115.412 Y130.581 I-.457 J3.883 E.01584
G1 X121.268 Y124.726 E.25629
G1 X120.793 Y124.663 E.01482
G1 X114.814 Y130.642 E.2617
G1 X114.195 Y130.724 E.01931
G1 X120.318 Y124.601 E.268
G1 X119.844 Y124.538 E.01482
G1 X113.577 Y130.805 E.2743
G1 X112.958 Y130.887 E.01931
G1 X119.369 Y124.476 E.2806
G1 X118.894 Y124.413 E.01482
G1 X112.339 Y130.968 E.2869
G1 X111.721 Y131.049 E.01931
G1 X118.42 Y124.351 E.2932
G1 X117.945 Y124.288 E.01482
G1 X111.102 Y131.131 E.2995
G1 X110.484 Y131.212 E.01931
G1 X117.47 Y124.226 E.3058
G1 X116.996 Y124.163 E.01482
G1 X109.865 Y131.294 E.31209
G1 X109.247 Y131.375 E.01931
G1 X116.517 Y124.105 E.31821
G2 X116.016 Y124.069 I-.534 J3.951 E.01557
G1 X108.628 Y131.457 E.32334
G1 X108.525 Y131.47 E.0032
G1 X108.473 Y131.074 E.01236
G1 X115.498 Y124.05 E.30744
G2 X114.941 Y124.07 I-.145 J3.826 E.01725
G1 X108.411 Y130.6 E.28581
G1 X108.348 Y130.125 E.01482
G1 X114.352 Y124.121 E.26278
G2 X113.738 Y124.198 I.58 J7.104 E.01916
G1 X108.286 Y129.65 E.23863
G1 X108.223 Y129.176 E.01482
G1 X113.12 Y124.28 E.21429
G1 X112.501 Y124.361 E.01931
G1 X108.161 Y128.701 E.18996
G1 X108.098 Y128.227 E.01482
G1 X111.882 Y124.443 E.16562
G1 X111.264 Y124.524 E.01931
G1 X108.036 Y127.752 E.14128
G1 X107.973 Y127.277 E.01482
G1 X110.645 Y124.605 E.11694
G1 X110.027 Y124.687 E.01931
G1 X107.911 Y126.803 E.09261
G1 X107.849 Y126.328 E.01482
G1 X109.408 Y124.768 E.06827
G1 X108.79 Y124.85 E.01931
G1 X107.786 Y125.853 E.04393
G1 X107.724 Y125.379 E.01482
G1 X108.368 Y124.734 E.02822
; WIPE_START
G1 F9478.673
G1 X107.724 Y125.379 E-.34646
G1 X107.786 Y125.853 E-.18192
G1 X108.217 Y125.422 E-.23162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F9157
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z4.4 F42000
G1 X104.892 Y132.438 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F9157
M204 S6000
G1 X108.064 Y132.02 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 21/85
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.4 I.165 J1.206 P1  F42000
G1 X145.898 Y126.84 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.261 Y142.393 E.18697
G3 X140.103 Y142.202 I.043 J-.197 E.00887
M73 P48 R13
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z4.6 F42000
G1 X146.29 Y140.94 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z4.6 F42000
G1 X145.71 Y115.06 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.717 Y113.603 E.18625
G1 X151.839 Y113.661 E.00449
G1 X151.881 Y113.72 E.00241
G1 X151.897 Y113.79 E.00238
G1 X151.898 Y126.448 E.41988
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z4.6 F42000
G1 X141.49 Y129.965 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.594 J.034 E.02671
G1 X151.757 Y113.213 E.35285
G3 X152.289 Y113.771 I-.059 J.589 E.0258
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 21 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer21 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X141.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X140.451 Y142.05 E.02665
G1 X140.451 Y141.225 E.02736
G1 X141.901 Y139.775 E.06799
G1 X142.423 Y139.775 E.01734
G1 X144.697 Y142.049 E.10668
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; WIPE_START
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280097
G1 F15000
M204 S6000
G1 X151.761 Y142.471 E.10952
; LINE_WIDTH: 0.253836
G2 X151.866 Y142.449 I-.104 J-.762 E.00186
; LINE_WIDTH: 0.213502
G1 X151.912 Y142.434 E.00067
; LINE_WIDTH: 0.177372
G1 X152.051 Y142.374 E.00166
; WIPE_START
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.684 Y135.517 Z4.6 F42000
G1 X145.906 Y129.563 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F8717.973
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F10086.86
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F10086.717
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F8717.973
M204 S6000
M73 P48 R12
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X150.744 Y113.952 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X151.549 Y113.952 E.02669
G1 X151.549 Y114.775 E.02732
G1 X150.099 Y116.225 E.06799
G1 X149.577 Y116.225 E.01734
G1 X147.303 Y113.951 E.10665
G1 X146.45 Y113.951 E.02829
G1 X146.45 Y114.727 E.02573
; WIPE_START
G1 X146.45 Y113.951 E-.29471
G1 X147.303 Y113.951 E-.32405
G1 X147.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279806
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10835
G2 X140.179 Y113.539 I.016 J.623 E.00222
; LINE_WIDTH: 0.241001
G1 X140.133 Y113.551 E.00076
; LINE_WIDTH: 0.21344
G1 X140.088 Y113.566 E.00066
; LINE_WIDTH: 0.177378
G1 X139.949 Y113.626 E.00166
; OBJECT_ID: 394
; WIPE_START
G1 X140.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.777 Y117.858 Z4.6 F42000
G1 X123.701 Y124.71 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X123.564 Y125.746 E.03467
G1 X115.5 Y124.684 E.26981
G1 X107.436 Y125.746 E.26981
G1 X107.299 Y124.71 E.03467
G1 X114.231 Y123.797 E.23192
G3 X115.589 Y123.716 I1.597 J15.249 E.04516
G3 X116.769 Y123.797 I-.139 J10.586 E.03926
G1 X123.641 Y124.702 E.22992
; WIPE_START
G1 X123.564 Y125.746 E-.39781
G1 X122.619 Y125.622 E-.36219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.263 Y130.066 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X122.898 Y130.808 E.18853
G1 X122.761 Y131.844 E.03467
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.31 E.02082
G1 X108.239 Y131.844 E.23258
G1 X108.102 Y130.808 E.03467
G1 X115.5 Y129.834 E.24752
G1 X117.204 Y130.058 E.057
; WIPE_START
G1 X119.187 Y130.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.078 Y124.848 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X123.162 Y131.808 E.2157
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.28 Y132.567 E.02521
G3 X126.077 Y132.676 I-.177 J-.086 E.00756
G1 X115.77 Y131.319 E.31946
G2 X115.232 Y131.319 I-.27 J2.787 E.01654
G1 X104.924 Y132.676 E.31948
G1 X104.81 Y132.66 E.00353
G3 X104.705 Y132.52 I.087 J-.175 E.00558
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.922 Y124.848 E.2157
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.201 J-.022 E.00948
G1 X114.184 Y123.408 E.31925
G3 X115.598 Y123.324 I1.647 J15.744 E.04354
G3 X116.816 Y123.408 I-.147 J10.979 E.03755
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.03 J.2 E.00949
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.137 Y124.856 E.08942
M204 S10000
G1 X123.915 Y124.585 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F15000
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.676 Y126.311 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X123.303 Y125.938 E.01622
G1 X122.743 Y125.911
G1 X123.614 Y126.782 E.03786
G1 X123.552 Y127.253
G1 X122.129 Y125.83 E.06185
G1 X121.515 Y125.749
G1 X123.49 Y127.725 E.08584
G1 X123.428 Y128.196
G1 X120.9 Y125.668 E.10983
G1 X120.286 Y125.587
G1 X123.366 Y128.667 E.13382
G1 X123.304 Y129.138
G1 X119.672 Y125.507 E.15781
G1 X119.058 Y125.426
G1 X123.242 Y129.609 E.1818
G1 X123.18 Y130.081
G1 X118.444 Y125.345 E.20579
G1 X117.83 Y125.264
G1 X123.118 Y130.552 E.22978
G1 X122.517 Y130.485
G1 X117.216 Y125.183 E.23038
G1 X116.602 Y125.102
G1 X121.903 Y130.404 E.23038
G1 X121.289 Y130.323
G1 X115.988 Y125.021 E.23038
G1 X115.706 Y125.273
G1 X120.675 Y130.242 E.21595
G1 X120.061 Y130.161
G1 X115.644 Y125.744 E.19196
G1 X115.581 Y126.215
G1 X119.447 Y130.081 E.16797
G1 X118.833 Y130
G1 X115.519 Y126.686 E.14399
M204 S10000
G1 X115.313 Y125.413 F42000
G1 F9547.055
M204 S2000
G1 X114.932 Y125.032 E.01657
G1 X114.46 Y125.094
G1 X115.394 Y126.027 E.04056
G1 X115.475 Y126.642
G1 X113.989 Y125.156 E.06455
G1 X113.518 Y125.218
G1 X118.219 Y129.919 E.20427
G1 X117.605 Y129.838
G1 X113.047 Y125.28 E.19806
G1 X112.576 Y125.342
G1 X116.99 Y129.757 E.19185
G1 X116.376 Y129.676
G1 X112.104 Y125.404 E.18564
G1 X111.633 Y125.466
G1 X115.762 Y129.595 E.17943
G1 X115.23 Y129.596
G1 X111.162 Y125.528 E.17678
G1 X110.691 Y125.59
G1 X114.759 Y129.659 E.17678
G1 X114.288 Y129.721
G1 X110.22 Y125.652 E.17678
G1 X109.748 Y125.715
G1 X113.816 Y129.783 E.17678
G1 X113.345 Y129.845
G1 X109.277 Y125.777 E.17678
G1 X108.806 Y125.839
G1 X112.874 Y129.907 E.17678
G1 X112.403 Y129.969
G1 X108.335 Y125.901 E.17678
G1 X107.863 Y125.963
G1 X111.931 Y130.031 E.17678
G1 X111.46 Y130.093
G1 X107.349 Y125.982 E.17864
G1 X107.351 Y126.517
G1 X110.989 Y130.155 E.15809
G1 X110.518 Y130.217
G1 X107.432 Y127.131 E.1341
G1 X107.513 Y127.745
G1 X110.047 Y130.279 E.11011
G1 X109.575 Y130.341
G1 X107.594 Y128.359 E.08612
G1 X107.674 Y128.973
G1 X109.104 Y130.403 E.06213
G1 X108.633 Y130.465
G1 X107.755 Y129.587 E.03814
G1 X107.836 Y130.201
G1 X108.205 Y130.57 E.01602
; WIPE_START
M204 S6000
G1 X107.836 Y130.201 E-.19806
G1 X107.755 Y129.587 E-.23538
G1 X108.363 Y130.195 E-.32656
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.203 Y126.809 Z4.6 F42000
G1 X115.497 Y126.664 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106205
G1 F15000
M204 S6000
G1 X115.364 Y126.797 E.00097
M204 S10000
G1 X115.5 Y126.452 F42000
; LINE_WIDTH: 0.121892
G1 F15000
M204 S6000
G1 X115.5 Y126.227 E.00144
; LINE_WIDTH: 0.171828
G1 X115.5 Y126.003 E.00236
; LINE_WIDTH: 0.221765
G1 X115.5 Y125.779 E.00327
; LINE_WIDTH: 0.271701
G1 X115.5 Y125.555 E.00418
; LINE_WIDTH: 0.321637
G1 F12916.339
G1 X115.5 Y125.331 E.00509
; LINE_WIDTH: 0.371573
G1 F10953.802
G1 X115.5 Y125.106 E.006
; LINE_WIDTH: 0.42151
G1 F9508.985
G1 X115.5 Y124.882 E.00692
M204 S10000
G1 X115.1 Y124.228 F42000
; LINE_WIDTH: 0.624116
G1 F6194.132
M204 S6000
G3 X115.537 Y124.2 I.373 J2.418 E.02074
G1 X115.9 Y124.228 E.01724
; LINE_WIDTH: 0.679615
G1 F5654.197
G3 X116.707 Y124.316 I-1.626 J18.551 E.04214
G1 X123.431 Y125.201 E.35185
; WIPE_START
G1 X121.448 Y124.94 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.628 Y131.299 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.681
G1 F5641.928
M204 S6000
G1 X115.955 Y130.421 E.34996
M204 S10000
G1 X115.541 Y130.242 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55136
G1 F7080.482
M204 S6000
G2 X115.543 Y130.349 I-.027 J.054 E.01019
M204 S10000
G1 X115.064 Y130.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.68101
G1 F5641.843
M204 S6000
G1 X108.372 Y131.299 E.35094
M204 S10000
G1 X108.064 Y132.02 F42000
; LINE_WIDTH: 0.130853
G1 F15000
M204 S6000
G1 X104.892 Y132.438 E.02293
; WIPE_START
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z4.6 F42000
G1 X103.913 Y125.002 Z4.6
M73 P49 R12
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F15000
M204 S6000
G1 X107.085 Y124.585 E.02293
M204 S10000
G1 X107.569 Y125.201 F42000
; LINE_WIDTH: 0.679611
G1 F5654.241
M204 S6000
G1 X114.293 Y124.316 E.35185
G3 X115.1 Y124.228 I2.432 J18.452 E.04213
; WIPE_START
G1 X114.293 Y124.316 E-.30858
G1 X113.115 Y124.471 E-.45142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.166 Y129.123 Z4.6 F42000
G1 X122.936 Y132.02 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.130858
G1 F15000
M204 S6000
G1 X126.108 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 22/85
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I.29 J1.182 P1  F42000
G1 X145.898 Y126.84 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8036
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8036
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8036
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8036
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8036
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.043 J-.197 E.00887
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z4.8 F42000
G1 X146.29 Y140.94 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8036
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z4.8 F42000
G1 X145.71 Y115.06 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8036
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8036
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.717 Y113.603 E.18625
G1 X151.839 Y113.661 E.00448
G1 X151.88 Y113.72 E.00239
G1 X151.897 Y113.79 E.00241
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z4.8 F42000
G1 X141.49 Y129.965 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8036
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.012 J-.608 E.02762
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.774 E.05811
G3 X140.274 Y113.211 I.594 J.031 E.02679
G1 X151.757 Y113.213 E.35285
G3 X152.289 Y113.771 I-.059 J.589 E.0258
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 22 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer22 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X145.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8036
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X142.423 Y139.775 E.10668
G1 X141.901 Y139.775 E.01734
G1 X140.451 Y141.225 E.06799
G1 X140.451 Y142.05 E.02736
G1 X141.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X140.451 Y142.05 E-.30528
G1 X140.451 Y141.225 E-.31348
G1 X140.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279626
G1 F8036
M204 S6000
G1 X151.707 Y142.475 E.10826
G2 X151.798 Y142.466 I-.015 J-.622 E.00176
G1 X151.864 Y142.45 E.00132
; LINE_WIDTH: 0.214248
G1 X151.912 Y142.434 E.0007
; LINE_WIDTH: 0.177362
G1 X152.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.684 Y135.517 Z4.8 F42000
G1 X145.906 Y129.563 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F8036
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F8036
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F8036
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F8036
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F8036
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X146.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8036
M204 S6000
G1 X146.45 Y113.951 E.02573
G1 X147.303 Y113.951 E.02829
G1 X149.577 Y116.225 E.10665
G1 X150.099 Y116.225 E.01734
G1 X151.549 Y114.775 E.06799
G1 X151.549 Y113.952 E.02732
G1 X150.744 Y113.952 E.02669
; WIPE_START
G1 F8843.478
G1 X151.549 Y113.952 E-.30577
G1 X151.549 Y114.775 E-.31299
G1 X151.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279702
G1 F8036
M204 S6000
G1 X140.293 Y113.525 E.1083
G2 X140.16 Y113.543 I.021 J.66 E.00259
; LINE_WIDTH: 0.215849
G2 X139.956 Y113.613 I.486 J1.77 E.00304
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.16 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.287 Y116.862 Z4.8 F42000
G1 X115.967 Y125.226 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8036
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.595 Y123.716 I1.586 J15.114 E.04534
G3 X116.769 Y123.797 I-.142 J10.567 E.03907
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F8036
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.313 E.02082
G1 X108.239 Y131.844 E.23258
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54754
G1 X116.054 Y129.427 E-.21246
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8036
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.28 Y132.567 E.02522
G3 X126.077 Y132.676 I-.177 J-.086 E.00757
G1 X115.77 Y131.319 E.31945
G2 X115.232 Y131.319 I-.27 J2.788 E.01654
G1 X104.854 Y132.674 E.32159
G3 X104.705 Y132.52 I.04 J-.188 E.00701
G1 X104.604 Y131.755 E.02372
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.202 J-.021 E.00947
G1 X114.184 Y123.408 E.31926
G3 X115.603 Y123.324 I1.638 J15.615 E.04371
G3 X116.816 Y123.408 I-.151 J10.961 E.03738
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.031 J.2 E.00948
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370013
G1 F8036
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221055
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.513104
G1 F7656.59
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474813
G1 F8036
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436522
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39823
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357144
G1 X115.646 Y129.166 E.00589
M204 S10000
G1 X115.5 Y129.75 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8036
M204 S6000
G1 X108.48 Y130.674 E.21756
G1 X108.576 Y131.404 E.02264
G1 X115.146 Y130.539 E.20361
G3 X115.861 Y130.54 I.351 J5.36 E.02199
G1 X122.424 Y131.404 E.20339
G1 X122.52 Y130.674 E.02264
G1 X115.559 Y129.757 E.21572
M204 S10000
G1 X108.893 Y130.991 F42000
; LINE_WIDTH: 0.404077
G1 F8036
M204 S6000
G1 X115.098 Y130.174 E.18417
G3 X115.909 Y130.175 I.403 J2.825 E.02396
G1 X122.047 Y130.983 E.1822
; WIPE_START
G1 F9967.979
G1 X120.064 Y130.722 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F8036
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z4.8 F42000
G1 X127.087 Y125.002 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F8036
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.267 Y124.992 Z4.8 F42000
G1 X115.5 Y125.046 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.518972
G1 F7562.211
M204 S6000
G1 X115.5 Y125.267 E.00857
; LINE_WIDTH: 0.469319
G1 F8036
G1 X115.5 Y125.488 E.00768
; LINE_WIDTH: 0.419666
G1 X115.5 Y125.709 E.00679
; WIPE_START
G1 F9555.514
G1 X115.5 Y125.488 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.153 Y125.364 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4026
G1 F8036
M204 S6000
G1 X114.286 Y124.557 E.18131
M204 S10000
G1 X116.164 Y124.856 F42000
; LINE_WIDTH: 0.420226
G1 F8036
M204 S6000
G1 X123.165 Y125.778 E.2171
G1 X123.261 Y125.047 E.02265
G1 X116.719 Y124.186 E.20287
G1 X116.302 Y124.15 E.01285
; LINE_WIDTH: 0.453553
G1 X115.949 Y124.15 E.01184
; LINE_WIDTH: 0.496272
G1 F7940.863
G2 X115.092 Y124.156 I-.118 J44.42 E.03166
; LINE_WIDTH: 0.513415
G1 F7651.517
G1 X114.561 Y124.215 E.02049
; LINE_WIDTH: 0.50824
G1 F7736.612
G1 X114.462 Y124.206 E.00375
; LINE_WIDTH: 0.47294
G1 F8036
G1 X114.364 Y124.197 E.00346
; LINE_WIDTH: 0.420115
G1 X114.265 Y124.188 E.00304
G1 X107.739 Y125.047 E.20232
G1 X107.835 Y125.778 E.02265
G1 X114.393 Y124.914 E.20331
; LINE_WIDTH: 0.43764
G1 X114.531 Y124.878 E.00458
; LINE_WIDTH: 0.47294
G1 X114.669 Y124.842 E.00499
; LINE_WIDTH: 0.504767
G1 F7794.798
G1 X114.807 Y124.807 E.00536
G1 X114.886 Y124.656 E.00641
G1 X115.112 Y124.613 E.00866
G1 X115.963 Y124.616 E.03204
; LINE_WIDTH: 0.476563
G1 F8036
G1 X116.04 Y124.674 E.00341
; LINE_WIDTH: 0.430776
G3 X116.142 Y124.8 I-.05 J.146 E.0054
M204 S10000
G1 X116.414 Y124.52 F42000
; LINE_WIDTH: 0.402469
G1 F8036
M204 S6000
G1 X122.788 Y125.357 E.18835
; WIPE_START
G1 F10012.543
G1 X120.805 Y125.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.178 Y124.812 Z4.8 F42000
G1 X107.085 Y124.585 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130839
G1 F8036
M204 S6000
G1 X103.913 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z4.8 F42000
G1 X104.892 Y132.438 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F8036
M204 S6000
G1 X108.064 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 23/85
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z4.8 I.165 J1.206 P1  F42000
G1 X145.898 Y126.84 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7988
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7988
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M73 P50 R12
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7988
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7988
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7988
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.05 J-.203 E.00882
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z5 F42000
G1 X146.29 Y140.94 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7988
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z5 F42000
G1 X145.71 Y115.06 Z5
G1 Z4.6
G1 E.8 F1800
G1 F7988
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7988
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06134
G1 X151.717 Y113.603 E.18626
G1 X151.839 Y113.661 E.00448
G1 X151.88 Y113.719 E.00237
G1 X151.897 Y113.79 E.00242
G1 X151.898 Y126.448 E.41988
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z5 F42000
G1 X141.49 Y129.965 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7988
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.609 J.049 E.02656
G1 X151.757 Y113.213 E.35285
G3 X152.289 Y113.771 I-.059 J.589 E.0258
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 23 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer23 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X141.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7988
M204 S6000
G1 X140.451 Y142.05 E.02665
G1 X140.451 Y141.225 E.02736
G1 X141.901 Y139.775 E.06799
G1 X142.423 Y139.775 E.01734
G1 X144.697 Y142.049 E.10668
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279625
G1 F7988
M204 S6000
G1 X151.707 Y142.475 E.10826
G2 X151.798 Y142.466 I-.014 J-.621 E.00177
G1 X151.864 Y142.45 E.00132
; LINE_WIDTH: 0.214196
G1 X151.912 Y142.434 E.0007
; LINE_WIDTH: 0.17734
G1 X152.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.684 Y135.517 Z5 F42000
G1 X145.906 Y129.563 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F7988
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F7988
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7988
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F7988
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F7988
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X150.744 Y113.952 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7988
M204 S6000
G1 X151.549 Y113.952 E.02669
G1 X151.549 Y114.775 E.02732
G1 X150.099 Y116.225 E.06799
G1 X149.577 Y116.225 E.01734
G1 X147.303 Y113.951 E.10666
G1 X146.45 Y113.951 E.02829
G1 X146.45 Y114.727 E.02573
; WIPE_START
G1 F8843.478
G1 X146.45 Y113.951 E-.29472
G1 X147.303 Y113.951 E-.32404
G1 X147.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279727
G1 F7988
M204 S6000
G1 X140.293 Y113.525 E.10831
G2 X140.163 Y113.543 I.021 J.653 E.00254
; LINE_WIDTH: 0.232331
G1 X140.119 Y113.556 E.0007
; LINE_WIDTH: 0.202497
G1 X140.073 Y113.573 E.00064
; LINE_WIDTH: 0.162932
G1 X139.942 Y113.632 E.0014
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.073 Y113.573 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.201 Y116.895 Z5 F42000
G1 X115.967 Y125.226 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7988
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.6 Y123.716 I1.577 J14.987 E.04552
G3 X116.769 Y123.797 I-.147 J10.552 E.03889
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F7988
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.183 Y130.93 I-.317 J4.256 E.02102
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7988
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02429
G3 X126.078 Y132.676 I-.184 J-.051 E.00853
G1 X115.77 Y131.319 E.31947
G2 X115.23 Y131.319 I-.27 J3.668 E.01661
G1 X104.854 Y132.674 E.32152
G3 X104.705 Y132.522 I.041 J-.189 E.00695
G1 X104.604 Y131.755 E.02377
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.201 J-.022 E.00949
G1 X114.184 Y123.408 E.31925
G3 X115.609 Y123.324 I1.628 J15.493 E.04388
G3 X116.816 Y123.408 I-.155 J10.945 E.03721
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.032 J.2 E.00948
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419667
G1 F7988
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 F7562.194
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.370014
G1 F7988
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7656.483
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 F7988
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
M204 S10000
G1 X115.5 Y129.75 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7988
M204 S6000
G1 X108.48 Y130.674 E.21756
G1 X108.576 Y131.404 E.02264
G1 X115.139 Y130.54 E.20339
G3 X115.861 Y130.54 I.361 J5.363 E.02221
G1 X122.424 Y131.404 E.20339
G1 X122.52 Y130.674 E.02264
G1 X115.559 Y129.757 E.21572
M204 S10000
G1 X108.893 Y130.991 F42000
; LINE_WIDTH: 0.404108
G1 F7988
M204 S6000
G1 X115.091 Y130.175 E.18398
G3 X115.909 Y130.175 I.409 J2.852 E.02417
G1 X122.047 Y130.983 E.18222
; WIPE_START
G1 F9967.119
G1 X120.064 Y130.722 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130858
G1 F7988
M204 S6000
G1 X126.108 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z5 F42000
G1 X127.087 Y125.002 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.130828
G1 F7988
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.269 Y125.069 Z5 F42000
G1 X108.153 Y125.364 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4026
G1 F7988
M204 S6000
G1 X114.286 Y124.557 E.18131
M204 S10000
G1 X116.164 Y124.856 F42000
; LINE_WIDTH: 0.420226
G1 F7988
M204 S6000
G1 X123.165 Y125.778 E.2171
G1 X123.261 Y125.047 E.02265
G1 X116.719 Y124.186 E.20287
G1 X116.302 Y124.15 E.01285
; LINE_WIDTH: 0.453545
G1 X115.951 Y124.15 E.01175
; LINE_WIDTH: 0.496213
G1 F7941.889
G2 X115.1 Y124.155 I-.099 J53.493 E.03144
; LINE_WIDTH: 0.5134
G1 F7651.76
G1 X114.561 Y124.215 E.02081
; LINE_WIDTH: 0.508249
G1 F7736.473
G1 X114.462 Y124.206 E.00375
; LINE_WIDTH: 0.472945
G1 F7988
G1 X114.364 Y124.197 E.00346
; LINE_WIDTH: 0.420115
G1 X114.265 Y124.188 E.00304
G1 X107.739 Y125.047 E.20232
G1 X107.835 Y125.778 E.02265
G1 X114.393 Y124.914 E.20331
; LINE_WIDTH: 0.437642
G1 X114.531 Y124.878 E.00458
; LINE_WIDTH: 0.472945
G1 X114.669 Y124.842 E.00499
; LINE_WIDTH: 0.504746
G1 F7795.143
G1 X114.807 Y124.807 E.00536
G1 X114.885 Y124.655 E.00641
G1 X115.112 Y124.613 E.00866
G1 X115.963 Y124.616 E.03205
; LINE_WIDTH: 0.476555
G1 F7988
G1 X116.04 Y124.674 E.00341
; LINE_WIDTH: 0.43077
G3 X116.142 Y124.8 I-.05 J.146 E.0054
M204 S10000
G1 X116.414 Y124.52 F42000
; LINE_WIDTH: 0.40247
G1 F7988
M204 S6000
G1 X122.788 Y125.357 E.18834
; WIPE_START
G1 F10012.532
G1 X120.805 Y125.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.178 Y124.812 Z5 F42000
G1 X107.085 Y124.585 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130827
G1 F7988
M204 S6000
G1 X103.913 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z5 F42000
G1 X104.892 Y132.438 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.130842
G1 F7988
M204 S6000
G1 X108.064 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 24/85
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5 I.165 J1.206 P1  F42000
G1 X145.898 Y126.84 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7322
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7322
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7322
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7322
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7322
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.043 J-.197 E.00888
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z5.2 F42000
G1 X146.29 Y140.94 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7322
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z5.2 F42000
G1 X145.71 Y115.06 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F7322
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z5.2 F42000
M73 P51 R12
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7322
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.717 Y113.603 E.18627
G1 X151.839 Y113.661 E.00447
G1 X151.88 Y113.718 E.00233
G1 X151.897 Y113.79 E.00246
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z5.2 F42000
G1 X141.49 Y129.965 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7322
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.007 J-.602 E.02768
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.774 E.05811
G3 X140.274 Y113.211 I.594 J.031 E.02679
G1 X151.757 Y113.213 E.35286
G3 X152.289 Y113.771 I-.059 J.589 E.0258
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 24 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer24 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X145.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7322
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X142.423 Y139.775 E.10668
G1 X141.901 Y139.775 E.01734
G1 X140.451 Y141.225 E.06799
G1 X140.451 Y142.05 E.02736
G1 X141.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X140.451 Y142.05 E-.30528
G1 X140.451 Y141.225 E-.31348
G1 X140.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280105
G1 F7322
M204 S6000
G1 X151.754 Y142.472 E.10939
; LINE_WIDTH: 0.25495
G1 X151.866 Y142.449 E.00198
; LINE_WIDTH: 0.213497
G1 X151.912 Y142.434 E.00066
; LINE_WIDTH: 0.177397
G1 X152.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.684 Y135.517 Z5.2 F42000
G1 X145.906 Y129.563 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F7322
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F7322
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7322
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F7322
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F7322
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X146.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7322
M204 S6000
G1 X146.45 Y113.951 E.02573
G1 X147.303 Y113.951 E.02829
G1 X149.577 Y116.225 E.10666
G1 X150.099 Y116.225 E.01734
G1 X151.549 Y114.775 E.06799
G1 X151.549 Y113.952 E.02732
G1 X150.744 Y113.952 E.02669
; WIPE_START
G1 F8843.478
G1 X151.549 Y113.952 E-.30579
G1 X151.549 Y114.775 E-.31297
G1 X151.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279812
G1 F7322
M204 S6000
G1 X140.293 Y113.525 E.10835
G1 X140.177 Y113.54 E.00226
; LINE_WIDTH: 0.240349
G1 X140.133 Y113.551 E.00072
; LINE_WIDTH: 0.213439
G1 X140.088 Y113.566 E.00066
; LINE_WIDTH: 0.177382
G1 X139.949 Y113.626 E.00166
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.217 Y116.888 Z5.2 F42000
G1 X115.967 Y125.226 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7322
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.606 Y123.716 I1.568 J14.872 E.04571
G3 X116.769 Y123.797 I-.15 J10.532 E.0387
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F7322
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54754
G1 X116.054 Y129.427 E-.21246
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7322
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.192 J-.038 E.00911
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.854 Y132.674 E.32152
G3 X104.705 Y132.52 I.04 J-.188 E.00701
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.201 J-.022 E.00948
G1 X114.184 Y123.408 E.31925
G3 X115.614 Y123.324 I1.62 J15.392 E.04405
G3 X116.816 Y123.408 I-.159 J10.923 E.03704
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.37001
G1 F7322
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320358
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270706
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221054
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171402
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.121749
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.513103
G1 F7322
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474812
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436521
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39823
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357111
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11458.005
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y125.709 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.419662
G1 F7322
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.469314
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518966
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X108.716 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7322
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.698 E.00648
G1 X116.108 Y124.698 E.04032
G1 X116.108 Y124.893 E.00648
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F7322
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7322
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.0657
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130854
G1 F7322
M204 S6000
G1 X104.892 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z5.2 F42000
G1 X103.913 Y125.002 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.130861
G1 F7322
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.183 Y127.694 Z5.2 F42000
G1 X122.936 Y132.02 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F7322
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 25/85
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.2 I.29 J1.182 P1  F42000
G1 X145.898 Y126.84 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7229
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7229
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7229
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7229
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7229
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.261 Y142.393 E.18697
G3 X140.103 Y142.205 I.043 J-.197 E.0088
G1 X140.102 Y129.552 E.41971
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z5.4 F42000
G1 X146.29 Y140.94 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7229
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z5.4 F42000
G1 X145.71 Y115.06 Z5.4
G1 Z5
G1 E.8 F1800
G1 F7229
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7229
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.717 Y113.603 E.18627
G1 X151.839 Y113.661 E.00447
G1 X151.878 Y113.713 E.00215
G1 X151.897 Y113.79 E.00265
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z5.4 F42000
G1 X141.49 Y129.965 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7229
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.227 I.012 J-.608 E.02759
G1 X139.71 Y127.335 E.45759
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
M73 P52 R12
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.594 J.034 E.02671
G1 X151.757 Y113.213 E.35286
G3 X152.289 Y113.771 I-.059 J.589 E.0258
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 25 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer25 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X141.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7229
M204 S6000
G1 X140.451 Y142.05 E.02665
G1 X140.451 Y141.225 E.02736
G1 X141.901 Y139.775 E.06799
G1 X142.423 Y139.775 E.01734
G1 X144.697 Y142.049 E.10668
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280105
G1 F7229
M204 S6000
G1 X151.754 Y142.472 E.10939
; LINE_WIDTH: 0.254968
G1 X151.866 Y142.449 E.00198
; LINE_WIDTH: 0.213486
G1 X151.912 Y142.434 E.00067
; LINE_WIDTH: 0.177378
G1 X152.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.684 Y135.517 Z5.4 F42000
G1 X145.906 Y129.563 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F7229
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F7229
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7229
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F7229
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F7229
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X150.744 Y113.952 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7229
M204 S6000
M73 P52 R11
G1 X151.549 Y113.952 E.02669
G1 X151.549 Y114.775 E.02732
G1 X150.099 Y116.225 E.06799
G1 X149.577 Y116.225 E.01734
G1 X147.303 Y113.951 E.10666
G1 X146.45 Y113.951 E.02829
G1 X146.45 Y114.727 E.02573
; WIPE_START
G1 F8843.478
G1 X146.45 Y113.951 E-.29472
G1 X147.303 Y113.951 E-.32404
G1 X147.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279522
G1 F7229
M204 S6000
G1 X140.293 Y113.525 E.10822
G2 X139.987 Y113.563 I.105 J2.094 E.00595
M204 S10000
G1 X139.949 Y113.626 F42000
; LINE_WIDTH: 0.177347
G1 F7229
M204 S6000
G1 X140.088 Y113.566 E.00166
; LINE_WIDTH: 0.214237
G1 X140.552 Y113.407 E.00684
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.217 Y116.888 Z5.4 F42000
G1 X115.967 Y125.226 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7229
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.611 Y123.716 I1.559 J14.758 E.04589
G3 X116.769 Y123.797 I-.155 J10.524 E.03852
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F7229
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.312 E.02082
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54753
G1 X116.054 Y129.427 E-.21247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7229
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.076 Y132.676 I-.185 J-.053 E.00859
G1 X115.77 Y131.319 E.3194
G2 X115.232 Y131.319 I-.27 J2.786 E.01655
G1 X104.854 Y132.674 E.32159
G3 X104.705 Y132.522 I.041 J-.189 E.00695
G1 X104.604 Y131.755 E.02377
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.201 J-.022 E.00948
G1 X114.184 Y123.408 E.31925
G3 X115.62 Y123.324 I1.612 J15.281 E.04422
G3 X116.816 Y123.408 I-.164 J10.919 E.03687
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.031 J.2 E.00948
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419662
G1 F7229
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.469314
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518966
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.37001
G1 F7229
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320358
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270706
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221054
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171402
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.121749
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.513103
G1 F7229
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474812
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436521
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39823
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357111
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11458.005
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7229
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.0657
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130858
G1 F7229
M204 S6000
G1 X126.108 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z5.4 F42000
G1 X127.087 Y125.002 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F7229
M204 S6000
G1 X123.915 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.284 Y125.706 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7229
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.698 E.00648
G1 X114.892 Y124.698 E.04032
G1 X114.892 Y124.893 E.00648
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130849
G1 F7229
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z5.4 F42000
G1 X104.892 Y132.438 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.130842
G1 F7229
M204 S6000
G1 X108.064 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 26/85
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I.165 J1.206 P1  F42000
G1 X145.898 Y126.84 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7286
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7286
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7286
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7286
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7286
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.261 Y142.393 E.18698
G3 X140.103 Y142.216 I.051 J-.205 E.00837
G1 X140.102 Y129.552 E.4201
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z5.6 F42000
G1 X146.29 Y140.94 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7286
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z5.6 F42000
G1 X145.71 Y115.06 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F7286
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7286
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.718 Y113.603 E.18628
G1 X151.839 Y113.661 E.00446
G1 X151.877 Y113.713 E.00214
G1 X151.897 Y113.79 E.00265
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z5.6 F42000
G1 X141.49 Y129.965 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7286
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.727 Y142.789 I-.594 J-.034 E.02669
G1 X140.305 Y142.79 E.35096
G3 X139.711 Y142.229 I.012 J-.609 E.02754
G1 X139.71 Y127.335 E.45765
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.608 J.048 E.02657
G1 X151.757 Y113.213 E.35286
G3 X152.289 Y113.771 I-.059 J.589 E.0258
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 26 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer26 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X145.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7286
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X142.423 Y139.775 E.10668
G1 X141.901 Y139.775 E.01734
G1 X140.451 Y141.225 E.06799
G1 X140.451 Y142.05 E.02736
G1 X141.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X140.451 Y142.05 E-.30528
G1 X140.451 Y141.225 E-.31348
G1 X140.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280112
G1 F7286
M204 S6000
G1 X151.75 Y142.472 E.10932
; LINE_WIDTH: 0.255467
G2 X151.866 Y142.449 I-.076 J-.685 E.00205
; LINE_WIDTH: 0.213421
G1 X151.912 Y142.434 E.00066
; LINE_WIDTH: 0.17733
M73 P53 R11
G1 X152.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.684 Y135.517 Z5.6 F42000
G1 X145.906 Y129.563 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F7286
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F7286
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7286
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F7286
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F7286
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X146.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7286
M204 S6000
G1 X146.45 Y113.951 E.02573
G1 X147.303 Y113.951 E.02829
G1 X149.577 Y116.225 E.10666
G1 X150.099 Y116.225 E.01734
G1 X151.549 Y114.775 E.06799
G1 X151.549 Y113.952 E.02732
G1 X150.744 Y113.952 E.0267
; WIPE_START
G1 F8843.478
G1 X151.549 Y113.952 E-.30582
G1 X151.549 Y114.775 E-.31295
G1 X151.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.27984
G1 F7286
M204 S6000
G1 X140.293 Y113.525 E.10836
G2 X140.18 Y113.539 I.018 J.649 E.0022
; LINE_WIDTH: 0.241258
G1 X140.133 Y113.551 E.00078
; LINE_WIDTH: 0.213398
G1 X140.088 Y113.566 E.00066
; LINE_WIDTH: 0.177376
G1 X139.949 Y113.626 E.00166
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.216 Y116.888 Z5.6 F42000
G1 X115.967 Y125.226 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7286
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.617 Y123.716 I1.551 J14.654 E.04607
G3 X116.769 Y123.797 I-.159 J10.514 E.03834
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F7286
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.31 E.02082
G1 X108.239 Y131.844 E.23258
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7286
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.077 Y132.676 I-.191 J-.036 E.00909
G1 X115.77 Y131.319 E.31945
G2 X115.232 Y131.319 I-.27 J2.786 E.01655
G1 X104.924 Y132.676 E.31948
G1 X104.801 Y132.655 E.00382
G1 X104.725 Y132.577 E.00335
G3 X104.705 Y132.52 I.184 J-.095 E.00188
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.201 J-.022 E.0095
G1 X114.184 Y123.408 E.31925
G3 X115.625 Y123.324 I1.604 J15.182 E.04439
G3 X116.816 Y123.408 I-.168 J10.906 E.0367
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.032 J.201 E.00949
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419667
G1 F7286
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.370014
G1 F7286
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7286
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7286
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F7286
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z5.6 F42000
G1 X103.913 Y125.002 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F7286
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7286
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F7286
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z5.6 F42000
G1 X126.108 Y132.438 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F7286
M204 S6000
G1 X122.936 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 27/85
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.6 I.306 J1.178 P1  F42000
G1 X145.898 Y126.84 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7218
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7218
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7218
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7218
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7218
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.049 J-.202 E.00883
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z5.8 F42000
G1 X146.29 Y140.94 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7218
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z5.8 F42000
G1 X145.71 Y115.06 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F7218
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7218
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.718 Y113.603 E.18628
G1 X151.839 Y113.661 E.00446
G3 X151.897 Y113.79 I-.143 J.141 E.00481
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z5.8 F42000
G1 X141.49 Y129.965 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7218
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.594 J.034 E.02671
G1 X151.757 Y113.213 E.35286
G3 X152.289 Y113.771 I-.066 J.595 E.02573
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 27 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer27 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X141.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7218
M204 S6000
G1 X140.451 Y142.05 E.02665
G1 X140.451 Y141.225 E.02736
G1 X141.901 Y139.775 E.06799
G1 X142.423 Y139.775 E.01734
G1 X144.697 Y142.049 E.10668
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280097
G1 F7218
M204 S6000
G1 X151.761 Y142.471 E.10952
; LINE_WIDTH: 0.253808
G2 X151.866 Y142.449 I-.105 J-.765 E.00186
; LINE_WIDTH: 0.213455
G1 X151.912 Y142.434 E.00067
; LINE_WIDTH: 0.177413
G1 X152.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X151.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.684 Y135.517 Z5.8 F42000
G1 X145.906 Y129.563 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F7218
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F7218
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7218
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F7218
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z5.8 F42000
M73 P54 R11
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F7218
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X150.744 Y113.952 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7218
M204 S6000
G1 X151.549 Y113.952 E.0267
G1 X151.549 Y114.775 E.02732
G1 X150.099 Y116.225 E.06799
G1 X149.577 Y116.225 E.01734
G1 X147.303 Y113.951 E.10666
G1 X146.45 Y113.951 E.02829
G1 X146.45 Y114.727 E.02573
; WIPE_START
G1 F8843.478
G1 X146.45 Y113.951 E-.29472
G1 X147.303 Y113.951 E-.32404
G1 X147.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279736
G1 F7218
M204 S6000
G1 X140.293 Y113.525 E.10831
G2 X140.161 Y113.543 I.021 J.659 E.00258
; LINE_WIDTH: 0.215407
G2 X139.956 Y113.613 I.484 J1.763 E.00305
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.161 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.288 Y116.862 Z5.8 F42000
G1 X115.967 Y125.226 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7218
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.622 Y123.716 I1.543 J14.548 E.04626
G3 X116.769 Y123.797 I-.164 J10.501 E.03815
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F7218
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.183 Y130.93 I-.317 J4.256 E.02102
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7218
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.28 Y132.568 E.02525
G3 X126.077 Y132.676 I-.176 J-.087 E.00754
G1 X115.77 Y131.319 E.31945
G2 X115.23 Y131.319 I-.27 J3.668 E.01661
G1 X104.924 Y132.676 E.31942
G1 X104.84 Y132.671 E.00256
G1 X104.771 Y132.635 E.0024
G3 X104.705 Y132.52 I.123 J-.147 E.00416
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.201 J-.022 E.00948
G1 X114.184 Y123.408 E.31925
G3 X115.631 Y123.324 I1.596 J15.069 E.04456
G3 X116.816 Y123.408 I-.172 J10.893 E.03653
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419667
G1 F7218
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.370014
G1 F7218
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7218
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7218
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F7218
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z5.8 F42000
G1 X127.087 Y125.002 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F7218
M204 S6000
G1 X123.915 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.284 Y125.706 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7218
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130861
G1 F7218
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z5.8 F42000
G1 X104.892 Y132.438 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.13084
G1 F7218
M204 S6000
G1 X108.064 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 28/85
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z5.8 I.165 J1.206 P1  F42000
G1 X145.898 Y126.84 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7330
M204 S6000
G1 X145.898 Y127.548 E.02348
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y126.427 E.03718
G1 X145.898 Y126.427 E.08611
G1 X145.898 Y126.78 E.01171
M204 S250
G1 X146.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7330
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.102 Y128.452 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7330
M204 S6000
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.573 E.03718
G1 X146.102 Y129.573 E.08611
G1 X146.102 Y128.512 E.03519
M204 S250
G1 X145.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7330
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.098 Y129.573 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7330
M204 S6000
G1 X141.098 Y139.427 E.32688
G1 X148.698 Y139.427 E.25211
G1 X148.698 Y140.548 E.03718
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.049 J-.202 E.00883
G1 X140.102 Y129.552 E.41963
G1 X141.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X141.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.778 Y138.222 Z6 F42000
G1 X146.29 Y140.94 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7330
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.534 Y133.384 Z6 F42000
G1 X145.71 Y115.06 Z6
G1 Z5.6
G1 E.8 F1800
G1 F7330
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.302 Y116.573 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7330
M204 S6000
G1 X143.302 Y115.452 E.03718
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.718 Y113.604 E.18629
G1 X151.839 Y113.66 E.00445
G1 X151.877 Y113.713 E.00214
G1 X151.897 Y113.79 E.00266
G1 X151.898 Y126.448 E.41987
G1 X150.902 Y126.448 E.03303
G1 X150.902 Y116.573 E.32757
G1 X143.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X143.302 Y115.452 E-.42654
G1 X144.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.789 Y122.957 Z6 F42000
G1 X141.49 Y129.965 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7330
M204 S5000
G1 X141.49 Y139.035 E.2787
G1 X149.09 Y139.035 E.23353
G1 X149.09 Y140.81 E.05454
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.013 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.035 E.05454
G1 X150.51 Y126.035 E.23353
G1 X150.51 Y116.965 E.2787
G1 X142.91 Y116.965 E.23353
G1 X142.91 Y115.19 E.05454
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.774 E.05811
G3 X140.274 Y113.211 I.594 J.031 E.02679
G1 X151.757 Y113.213 E.35286
G3 X152.289 Y113.771 I-.06 J.589 E.02579
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.965 E.05454
G1 X141.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X141.537 Y131.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 28 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer28 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.6 Y129.756 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X140.6 Y139.631 E.47341
M204 S10000
G1 X145.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7330
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X142.423 Y139.775 E.10668
G1 X141.901 Y139.775 E.01734
G1 X140.451 Y141.225 E.06799
G1 X140.451 Y142.05 E.02736
G1 X141.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X140.451 Y142.05 E-.30528
G1 X140.451 Y141.225 E-.31348
G1 X140.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278371
G1 F7330
M204 S6000
G1 X151.707 Y142.475 E.10769
G2 X152.037 Y142.402 I-.1 J-1.245 E.0065
M204 S10000
G1 X152.051 Y142.374 F42000
; LINE_WIDTH: 0.177379
G1 F7330
M204 S6000
G1 X151.54 Y142.593 E.0061
; WIPE_START
G1 F15000
G1 X152.051 Y142.374 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.75 Y135.492 Z6 F42000
G1 X145.906 Y129.563 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F7330
M204 S6000
G1 X141.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X143.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.516 Y127.166 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F7330
M204 S6000
G1 X145.516 Y126.809 E.01038
G1 X143.684 Y126.809 E.05328
G1 X143.684 Y127.166 E.01038
G1 X145.456 Y127.166 E.05153
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7330
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F7330
M204 S6000
G1 X146.484 Y129.191 E.01038
G1 X148.316 Y129.191 E.05328
G1 X148.316 Y128.834 E.01038
G1 X146.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X148.316 Y128.834 E-.67333
G1 X148.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y126.437 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F7330
M204 S6000
G1 X150.706 Y126.437 E.15519
M204 S10000
G1 X151.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F6119.129
M204 S6000
G1 X151.4 Y116.369 E.47341
M204 S10000
G1 X146.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7330
M204 S6000
G1 X146.45 Y113.951 E.02573
G1 X147.303 Y113.951 E.02829
G1 X149.577 Y116.225 E.10666
G1 X150.099 Y116.225 E.01734
M73 P55 R11
G1 X151.549 Y114.775 E.06799
G1 X151.549 Y113.952 E.02732
G1 X150.744 Y113.952 E.0267
; WIPE_START
G1 F8843.478
G1 X151.549 Y113.952 E-.30584
G1 X151.549 Y114.775 E-.31293
G1 X151.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279738
G1 F7330
M204 S6000
G1 X140.293 Y113.525 E.10831
G2 X140.161 Y113.543 I.021 J.659 E.00257
; LINE_WIDTH: 0.215338
G2 X139.956 Y113.613 I.489 J1.779 E.00305
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.161 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.288 Y116.862 Z6 F42000
G1 X115.967 Y125.226 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7330
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.628 Y123.717 I1.536 J14.454 E.04644
G3 X116.769 Y123.797 I-.168 J10.482 E.03797
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F7330
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.183 Y130.93 I-.317 J4.256 E.02102
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7330
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.281 Y132.565 E.02515
G3 X126.076 Y132.676 I-.177 J-.083 E.00769
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.669 E.01661
G1 X104.924 Y132.676 E.3194
G1 X104.854 Y132.674 E.00215
G1 X104.768 Y132.632 E.00296
G3 X104.705 Y132.52 I.134 J-.149 E.00402
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.201 J-.022 E.00948
G1 X114.184 Y123.408 E.31926
G3 X115.637 Y123.325 I1.589 J14.979 E.04473
G3 X116.816 Y123.408 I-.176 J10.875 E.03636
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.031 J.2 E.00948
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370014
G1 F7330
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7330
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y125.709 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.419667
G1 F7330
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X108.716 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7330
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130855
G1 F7330
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7330
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130849
G1 F7330
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z6 F42000
G1 X103.913 Y125.002 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F7330
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.183 Y127.694 Z6 F42000
G1 X122.936 Y132.02 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F7330
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 29/85
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
M106 S196.35
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6 I.285 J1.183 P1  F42000
G1 X146.29 Y126.84 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I-1.158 J.375 P1  F42000
G1 X148.618 Y140.548 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.898 Y140.548 E.09024
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.049 J-.202 E.00883
G1 X140.102 Y129.552 E.41963
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y129.192 E.02456
G1 X148.698 Y129.592 E.01327
G1 F4919.51
G1 X148.698 Y129.992 E.01327
M106 S255
G1 F1800
G1 X148.698 Y130.375 E.01269
M106 S196.35
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X148.698 Y138.625 E.27367
M106 S196.35
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X148.698 Y139.007 E.01269
M106 S196.35
G1 F4919.51
G1 X148.698 Y139.407 E.01327
G1 F8843.478
G1 X148.698 Y139.807 E.01327
G1 X148.698 Y140.548 E.02456
G1 X148.678 Y140.548 E.00065
; WIPE_START
G1 X146.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.211 J-.121 P1  F42000
G1 X145.71 Y115.06 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I-1.216 J-.04 P1  F42000
G1 X143.302 Y127.548 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y126.807 E.02456
G1 X143.302 Y126.407 E.01327
G1 F4919.51
G1 X143.302 Y126.007 E.01327
M106 S255
G1 F1800
G1 X143.302 Y125.625 E.01269
M106 S196.35
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X143.302 Y117.375 E.27367
M106 S196.35
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X143.302 Y116.992 E.01269
M106 S196.35
G1 F4919.51
G1 X143.302 Y116.592 E.01327
G1 F8843.478
G1 X143.302 Y116.192 E.01327
G1 X143.302 Y115.452 E.02456
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.718 Y113.604 E.18629
G1 X151.839 Y113.66 E.00445
G1 X151.877 Y113.712 E.00213
G1 X151.897 Y113.79 E.00267
G1 X151.898 Y126.448 E.41987
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.362 Y127.548 E.08412
; WIPE_START
G1 X143.302 Y126.807 E-.28229
G1 X143.302 Y126.407 E-.152
G1 X143.302 Y126.007 E-.152
G1 X143.302 Y125.625 E-.14535
G1 X143.302 Y125.55 E-.02836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I-1.138 J.432 P1  F42000
G1 X149.09 Y140.81 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y126.794 E.03122
G1 X142.91 Y126.394 E.01229
G1 F4919.51
G1 X142.91 Y125.994 E.01229
M106 S255
G1 F1800
G1 X142.91 Y125.625 E.01134
M106 S196.35
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.91 Y117.375 E.27367
M106 S196.35
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X142.91 Y117.006 E.01134
M106 S196.35
G1 F4919.51
G1 X142.91 Y116.606 E.01229
G1 F9547.055
G1 X142.91 Y116.206 E.01229
G1 X142.91 Y115.19 E.03122
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.608 J.048 E.02657
G1 X151.757 Y113.213 E.35286
G3 X152.289 Y113.771 I-.06 J.589 E.02579
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y129.206 E.03122
G1 X149.09 Y129.606 E.01229
G1 F4919.51
G1 X149.09 Y130.006 E.01229
M106 S255
G1 F1800
G1 X149.09 Y130.375 E.01134
M106 S196.35
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X149.09 Y138.625 E.27367
M106 S196.35
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X149.09 Y138.994 E.01134
M106 S196.35
G1 F4919.51
G1 X149.09 Y139.394 E.01229
G1 F9547.055
G1 X149.09 Y139.794 E.01229
G1 X149.09 Y140.75 E.02938
; WIPE_START
M204 S6000
G1 X151.09 Y140.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 29 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer29 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X152.051 Y142.374 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17679
G1 F15000
M204 S6000
G1 X151.54 Y142.593 E.00607
M204 S10000
G1 X152.026 Y142.417 F42000
; LINE_WIDTH: 0.278967
G1 F15000
M204 S6000
G3 X151.707 Y142.475 I-.4 J-1.31 E.00626
G1 X146.094 Y142.475 E.10796
; WIPE_START
G1 X148.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.357 Y139.632 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4362
M106 S255
G1 F3000
M204 S6000
G1 X148.357 Y129.538 E.3235
G1 X147.963 Y129.538 E.0126
G1 X147.963 Y139.462 E.31807
G1 X147.57 Y139.462 E.0126
G1 X147.57 Y129.538 E.31807
G1 X147.177 Y129.538 E.0126
G1 X147.177 Y139.462 E.31807
G1 X146.783 Y139.462 E.0126
G1 X146.783 Y129.538 E.31807
G1 X146.435 Y129.538 E.01116
G1 X146.435 Y129.885 E.01115
G1 X146.39 Y129.885 E.00145
G1 X146.39 Y139.462 E.30692
G1 X145.997 Y139.462 E.0126
G1 X145.997 Y129.885 E.30692
G1 X145.604 Y129.885 E.0126
G1 X145.604 Y139.462 E.30692
G1 X145.21 Y139.462 E.0126
G1 X145.21 Y129.885 E.30692
G1 X144.817 Y129.885 E.0126
G1 X144.817 Y139.462 E.30692
G1 X144.424 Y139.462 E.0126
G1 X144.424 Y129.885 E.30692
G1 X144.03 Y129.885 E.0126
G1 X144.03 Y139.462 E.30692
G1 X143.637 Y139.462 E.0126
G1 X143.637 Y129.885 E.30692
G1 X143.244 Y129.885 E.0126
G1 X143.244 Y139.462 E.30692
G1 X142.851 Y139.462 E.0126
G1 X142.851 Y129.885 E.30692
G1 X142.457 Y129.885 E.0126
G1 X142.457 Y139.462 E.30692
G1 X142.064 Y139.462 E.0126
G1 X142.064 Y129.885 E.30692
G1 X141.671 Y129.885 E.0126
G1 X141.671 Y139.462 E.30692
G1 X141.277 Y139.462 E.0126
G1 X141.277 Y129.885 E.30692
G1 X140.884 Y129.885 E.0126
G1 X140.884 Y139.666 E.31344
G1 X140.82 Y139.666 E.00207
G1 X140.669 Y139.457 E.00827
G1 X140.541 Y139.162 E.0103
G1 X140.491 Y138.943 E.00721
G1 X140.491 Y129.716 E.2957
M106 S196.35
; WIPE_START
G1 X140.491 Y131.716 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.521 Y127.171 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38964
G1 F10383.018
M204 S6000
G1 X145.521 Y126.824 E.0098
G1 X143.679 Y126.824 E.05205
G1 X143.679 Y127.171 E.0098
G1 X145.461 Y127.171 E.05035
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.479 Y128.829 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.389635
G1 F10383.168
M204 S6000
G1 X146.479 Y129.176 E.0098
G1 X148.321 Y129.176 E.05204
G1 X148.321 Y128.829 E.0098
G1 X146.539 Y128.829 E.05035
; WIPE_START
G1 X148.321 Y128.829 E-.6772
G1 X148.321 Y129.047 E-.0828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.509 Y126.284 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4362
M106 S255
G1 F3000
M204 S6000
G1 X151.509 Y117.057 E.2957
G1 X151.459 Y116.838 E.00721
G1 X151.331 Y116.543 E.0103
G1 X151.18 Y116.334 E.00827
G1 X151.116 Y116.334 E.00207
G1 X151.116 Y126.115 E.31344
G1 X150.723 Y126.115 E.0126
G1 X150.723 Y116.538 E.30692
G1 X150.329 Y116.538 E.0126
G1 X150.329 Y126.115 E.30692
G1 X149.936 Y126.115 E.0126
M73 P56 R11
G1 X149.936 Y116.538 E.30692
G1 X149.543 Y116.538 E.0126
G1 X149.543 Y126.115 E.30692
G1 X149.149 Y126.115 E.0126
G1 X149.149 Y116.538 E.30692
G1 X148.756 Y116.538 E.0126
G1 X148.756 Y126.115 E.30692
G1 X148.363 Y126.115 E.0126
G1 X148.363 Y116.538 E.30692
G1 X147.97 Y116.538 E.0126
G1 X147.97 Y126.115 E.30692
G1 X147.576 Y126.115 E.0126
G1 X147.576 Y116.538 E.30692
G1 X147.183 Y116.538 E.0126
G1 X147.183 Y126.115 E.30692
G1 X146.79 Y126.115 E.0126
G1 X146.79 Y116.538 E.30692
G1 X146.396 Y116.538 E.0126
G1 X146.396 Y126.115 E.30692
G1 X146.003 Y126.115 E.0126
G1 X146.003 Y116.538 E.30692
G1 X145.61 Y116.538 E.0126
G1 X145.61 Y126.115 E.30692
G1 X145.565 Y126.115 E.00145
G1 X145.565 Y126.462 E.01115
G1 X145.217 Y126.462 E.01116
G1 X145.217 Y116.538 E.31807
G1 X144.823 Y116.538 E.0126
G1 X144.823 Y126.462 E.31807
G1 X144.43 Y126.462 E.0126
G1 X144.43 Y116.538 E.31807
G1 X144.037 Y116.538 E.0126
G1 X144.037 Y126.462 E.31807
G1 X143.643 Y126.462 E.0126
G1 X143.643 Y116.368 E.3235
M106 S196.35
; WIPE_START
G1 X143.643 Y118.368 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279747
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10832
G2 X140.161 Y113.543 I.021 J.657 E.00258
; LINE_WIDTH: 0.215294
G2 X139.955 Y113.613 I.484 J1.762 E.00305
; WIPE_START
G1 X140.161 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.788 Y113.838 Z6.2 F42000
G1 X150.744 Y113.952 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
M73 P56 R10
G1 X151.549 Y113.952 E.0267
G1 X151.549 Y114.775 E.02732
G1 X150.179 Y116.145 E.06428
G1 X149.497 Y116.145 E.0226
G1 X147.303 Y113.951 E.10294
G1 X146.45 Y113.951 E.02829
G1 X146.45 Y114.727 E.02573
M204 S10000
G1 X151.574 Y116.25 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X151.51 Y116.286 E.00204
G1 X151.559 Y116.314 E.00155
; WIPE_START
G1 X151.51 Y116.286 E-.32874
G1 X151.574 Y116.25 E-.43126
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I-1.1 J-.521 P1  F42000
G1 X140.469 Y139.676 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F10588.235
M204 S6000
G1 X140.405 Y139.713 E.00204
G1 X140.454 Y139.741 E.00155
M204 S10000
G1 X141.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X140.451 Y142.05 E.02665
G1 X140.451 Y141.225 E.02737
G1 X141.821 Y139.855 E.06427
G1 X142.503 Y139.855 E.0226
G1 X144.697 Y142.049 E.10296
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; OBJECT_ID: 394
; WIPE_START
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.837 Y137.949 Z6.2 F42000
G1 X115.967 Y125.226 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.634 Y123.717 I1.528 J14.351 E.04662
G3 X116.769 Y123.797 I-.172 J10.472 E.03778
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 X115.5 Y129.354 E-.54753
G1 X116.054 Y129.427 E-.21247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.19 J-.035 E.00915
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.854 Y132.674 E.32152
G3 X104.705 Y132.52 I.041 J-.189 E.007
G1 X104.604 Y131.755 E.02372
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.192 J-.029 E.0096
G1 X114.184 Y123.408 E.31925
G3 X115.642 Y123.325 I1.582 J14.888 E.0449
G3 X116.816 Y123.408 I-.18 J10.857 E.03619
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419656
G1 F9555.775
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.469307
G1 F8443.041
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518958
G1 F7562.425
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.370005
G1 F11006.336
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320354
G1 F12976.099
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270702
G1 F15000
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221051
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.1714
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.121749
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.513104
G1 F7656.582
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474813
G1 F8335.411
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436521
G1 F9146.32
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39823
G1 F10132.012
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357143
G1 F11456.834
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.242 Y131.349 Z6.2 F42000
G1 X104.892 Y132.438 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.13085
G1 F15000
M204 S6000
G1 X108.064 Y132.02 E.02292
; WIPE_START
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130858
G1 F15000
M204 S6000
G1 X126.108 Y132.438 E.02293
; WIPE_START
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z6.2 F42000
G1 X127.087 Y125.002 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F15000
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.284 Y125.706 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.698 E.00648
G1 X114.892 Y124.698 E.04032
G1 X114.892 Y124.893 E.00648
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F15000
M204 S6000
G1 X103.913 Y125.002 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 30/85
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
M106 S201.45
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.2 I-.063 J1.215 P1  F42000
G1 X146.29 Y126.84 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.215 J.067 P1  F42000
G1 X145.71 Y115.06 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-1.216 J-.04 P1  F42000
G1 X143.302 Y127.548 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.718 Y113.604 E.1863
G1 X151.809 Y113.636 E.00321
G3 X151.897 Y113.79 I-.111 J.165 E.0061
G1 X151.898 Y126.448 E.41987
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.362 Y127.548 E.08412
; WIPE_START
G1 X143.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-1.148 J.403 P1  F42000
G1 X148.618 Y140.548 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X145.898 Y140.548 E.09024
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.05 J-.202 E.00883
G1 X140.102 Y129.552 E.41963
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X148.678 Y140.548 E.00065
; WIPE_START
G1 X146.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.09 Y140.81 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
M73 P57 R10
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.592 J-.032 E.02674
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.013 J-.608 E.0276
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.774 E.05811
G3 X140.274 Y113.211 I.594 J.031 E.02679
G1 X151.757 Y113.213 E.35287
G3 X152.289 Y113.771 I-.072 J.601 E.02567
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.75 E.38593
; WIPE_START
M204 S6000
G1 X151.09 Y140.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 30 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer30 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X151.795 Y142.466 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
G1 F15000
M204 S6000
G3 X151.707 Y142.475 I-.102 J-.594 E.00172
G1 X146.094 Y142.475 E.10844
; WIPE_START
G1 X148.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.55 Y141.273 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X142.503 Y139.855 E.10296
G1 X141.821 Y139.855 E.0226
G1 X140.451 Y141.225 E.06427
G1 X140.451 Y142.05 E.02737
G1 X141.255 Y142.05 E.02665
; WIPE_START
G1 X140.451 Y142.05 E-.30528
G1 X140.451 Y141.225 E-.31348
G1 X140.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.288 Y141.905 Z6.4 F42000
G1 X152.052 Y142.373 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.173774
G1 F15000
M204 S6000
G1 X151.926 Y142.428 E.00146
; LINE_WIDTH: 0.202984
G1 X151.882 Y142.444 E.0006
; LINE_WIDTH: 0.242533
G3 X151.795 Y142.466 I-.193 J-.582 E.00146
; WIPE_START
G1 X151.882 Y142.444 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.726 Y139.632 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4218
G1 F9501.689
M204 S6000
G1 X148.365 Y138.993 E.0279
G1 X148.365 Y138.457 E.01654
G1 X147.36 Y139.463 E.04389
G1 X146.824 Y139.463 E.01654
G1 X148.365 Y137.922 E.06728
G1 X148.365 Y137.386 E.01654
G1 X146.288 Y139.463 E.09068
G1 X145.752 Y139.463 E.01654
G1 X148.365 Y136.85 E.11407
G1 X148.365 Y136.314 E.01654
G1 X145.216 Y139.463 E.13747
G1 X144.681 Y139.463 E.01654
G1 X148.365 Y135.778 E.16086
G1 X148.365 Y135.242 E.01654
G1 X144.145 Y139.463 E.18426
G1 X143.609 Y139.463 E.01654
G1 X148.365 Y134.707 E.20765
G1 X148.365 Y134.171 E.01654
G1 X143.073 Y139.463 E.23105
G1 X142.537 Y139.463 E.01654
G1 X148.365 Y133.635 E.25444
G1 X148.365 Y133.099 E.01654
G1 X142.001 Y139.463 E.27784
G1 X141.466 Y139.463 E.01654
G1 X148.365 Y132.563 E.30123
G1 X148.365 Y132.028 E.01654
G1 X140.726 Y139.666 E.33351
G1 X140.436 Y139.666 E.00896
G1 X140.436 Y139.421 E.00758
G1 X148.365 Y131.492 E.34619
G1 X148.365 Y130.956 E.01654
G1 X140.436 Y138.885 E.34619
G1 X140.436 Y138.349 E.01654
G1 X148.365 Y130.42 E.34619
G1 X148.365 Y129.884 E.01654
G1 X140.436 Y137.813 E.34619
G1 X140.436 Y137.277 E.01654
G1 X148.365 Y129.348 E.34619
G1 X148.365 Y128.813 E.01654
G1 X140.436 Y136.742 E.3462
G1 X140.436 Y136.206 E.01654
G1 X147.856 Y128.785 E.324
G1 X147.321 Y128.785 E.01654
G1 X140.436 Y135.67 E.30061
G1 X140.436 Y135.134 E.01654
G1 X145.685 Y129.885 E.22919
G1 X145.149 Y129.885 E.01654
G1 X140.436 Y134.598 E.20579
G1 X140.436 Y134.063 E.01654
G1 X144.613 Y129.885 E.1824
G1 X144.077 Y129.885 E.01654
G1 X140.436 Y133.527 E.159
G1 X140.436 Y132.991 E.01654
G1 X143.541 Y129.885 E.13561
G1 X143.006 Y129.885 E.01654
G1 X140.436 Y132.455 E.11222
G1 X140.436 Y131.92 E.01654
G1 X142.47 Y129.885 E.08882
G1 X141.934 Y129.885 E.01654
G1 X140.435 Y131.384 E.06543
G1 X140.435 Y130.848 E.01654
G1 X141.398 Y129.885 E.04204
G1 X140.862 Y129.885 E.01654
G1 X140.266 Y130.482 E.02605
; WIPE_START
G1 X140.862 Y129.885 E-.32064
G1 X141.398 Y129.885 E-.20361
G1 X140.96 Y130.324 E-.23575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.266 Y129.304 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F9501.689
M204 S6000
G1 X146.954 Y128.616 E.03008
; WIPE_START
G1 X146.266 Y129.304 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y128.256 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y127.744 E.00784
; WIPE_START
G1 X146 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.968 Y126.284 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4218
G1 F9501.689
M204 S6000
G1 X151.565 Y125.688 E.02604
G1 X151.565 Y125.152 E.01654
G1 X150.602 Y126.115 E.04202
G1 X150.066 Y126.115 E.01654
G1 X151.565 Y124.616 E.06542
G1 X151.564 Y124.081 E.01654
G1 X149.53 Y126.115 E.08881
G1 X148.995 Y126.115 E.01654
G1 X151.564 Y123.545 E.1122
G1 X151.564 Y123.009 E.01654
G1 X148.459 Y126.115 E.1356
G1 X147.923 Y126.115 E.01654
G1 X151.564 Y122.473 E.15899
G1 X151.564 Y121.938 E.01654
G1 X147.387 Y126.115 E.18239
G1 X146.851 Y126.115 E.01654
G1 X151.564 Y121.402 E.20578
G1 X151.564 Y120.866 E.01654
G1 X146.146 Y126.284 E.23658
M204 S10000
G1 X145.734 Y126.696 F42000
G1 F9501.689
M204 S6000
G1 X145.046 Y127.384 E.03007
M204 S10000
G1 X144.51 Y127.384 F42000
G1 F9501.689
M204 S6000
G1 X151.564 Y120.33 E.308
G1 X151.564 Y119.794 E.01654
G1 X144.144 Y127.215 E.32399
G1 X143.635 Y127.215 E.0157
G1 X143.635 Y127.188 E.00084
G1 X151.564 Y119.259 E.3462
G1 X151.564 Y118.723 E.01654
G1 X143.635 Y126.652 E.34619
G1 X143.635 Y126.116 E.01654
G1 X151.564 Y118.187 E.34619
G1 X151.564 Y117.651 E.01654
G1 X143.635 Y125.58 E.34619
G1 X143.635 Y125.044 E.01654
G1 X151.564 Y117.116 E.34619
G1 X151.564 Y116.58 E.01654
G1 X143.635 Y124.509 E.34619
G1 X143.635 Y123.973 E.01654
G1 X151.274 Y116.334 E.33352
G1 X151.06 Y116.334 E.00661
G1 X150.909 Y116.485 E.00658
G1 X150.782 Y116.537 E.00426
G1 X150.535 Y116.537 E.00763
G1 X143.635 Y123.437 E.30125
G1 X143.635 Y122.901 E.01654
G1 X149.999 Y116.537 E.27785
G1 X149.463 Y116.537 E.01654
G1 X143.635 Y122.365 E.25446
G1 X143.635 Y121.829 E.01654
G1 X148.927 Y116.537 E.23106
G1 X148.391 Y116.537 E.01654
G1 X143.635 Y121.294 E.20767
G1 X143.635 Y120.758 E.01654
G1 X147.856 Y116.537 E.18427
G1 X147.32 Y116.537 E.01654
G1 X143.635 Y120.222 E.16088
G1 X143.635 Y119.686 E.01654
G1 X146.784 Y116.537 E.13748
G1 X146.248 Y116.537 E.01654
G1 X143.635 Y119.15 E.11409
G1 X143.635 Y118.615 E.01654
G1 X145.712 Y116.537 E.09069
G1 X145.176 Y116.537 E.01654
G1 X143.635 Y118.079 E.0673
G1 X143.635 Y117.543 E.01654
G1 X144.641 Y116.537 E.0439
G1 X144.105 Y116.537 E.01654
G1 X143.466 Y117.177 E.02791
; WIPE_START
G1 X144.105 Y116.537 E-.34357
G1 X144.641 Y116.537 E-.20361
G1 X144.245 Y116.933 E-.21281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.955 Y113.613 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.215211
G1 F15000
M204 S6000
G3 X140.161 Y113.543 I.691 J1.698 E.00305
; LINE_WIDTH: 0.279749
G3 X140.293 Y113.525 I.153 J.64 E.00257
G1 X145.906 Y113.525 E.10832
; WIPE_START
G1 X143.906 Y113.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.45 Y114.727 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.45 Y113.951 E.02573
G1 X147.303 Y113.951 E.02829
G1 X149.497 Y116.145 E.10294
G1 X150.179 Y116.145 E.0226
G1 X151.549 Y114.775 E.06428
G1 X151.549 Y113.952 E.02732
G1 X150.744 Y113.952 E.0267
; OBJECT_ID: 394
; WIPE_START
G1 X151.549 Y113.952 E-.30585
G1 X151.549 Y114.775 E-.31291
G1 X151.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X143.952 Y117.153 Z6.4 F42000
G1 X115.967 Y125.226 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.639 Y123.717 I1.521 J14.264 E.04681
G3 X116.769 Y123.797 I-.176 J10.458 E.0376
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.312 E.02082
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.28 Y132.569 E.02526
G3 X126.076 Y132.676 I-.176 J-.088 E.00756
G1 X115.77 Y131.319 E.3194
G2 X115.232 Y131.319 I-.27 J2.785 E.01655
G1 X104.854 Y132.674 E.32159
G3 X104.705 Y132.52 I.041 J-.189 E.007
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.201 J-.022 E.00949
G1 X114.184 Y123.408 E.31925
G3 X115.648 Y123.325 I1.575 J14.803 E.04507
G3 X116.816 Y123.408 I-.185 J10.851 E.03602
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419667
G1 F9555.494
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 F8442.788
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 F7562.194
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.370014
G1 F11006.019
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 F12975.736
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 F15000
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7656.483
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 F8335.224
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 F9146.011
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 F10131.53
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 F11456.137
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F15000
M204 S6000
G1 X104.892 Y132.438 E.02293
; WIPE_START
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z6.4 F42000
G1 X103.913 Y125.002 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F15000
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
M73 P58 R10
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130855
G1 F15000
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z6.4 F42000
G1 X126.108 Y132.438 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F15000
M204 S6000
G1 X122.936 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 31/85
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.4 I.3 J1.179 P1  F42000
G1 X146.29 Y126.84 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.215 J.067 P1  F42000
G1 X145.71 Y115.06 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-1.216 J-.04 P1  F42000
G1 X143.302 Y127.548 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.718 Y113.604 E.1863
G1 X151.839 Y113.66 E.00444
G1 X151.882 Y113.724 E.00255
G1 X151.897 Y113.79 E.00224
G1 X151.898 Y126.448 E.41987
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.362 Y127.548 E.08412
; WIPE_START
G1 X143.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-1.148 J.403 P1  F42000
G1 X148.618 Y140.548 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X145.898 Y140.548 E.09024
G1 X145.898 Y142.397 E.06135
G1 X140.261 Y142.393 E.18697
G3 X140.103 Y142.202 I.05 J-.203 E.00882
G1 X140.102 Y129.552 E.41963
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X148.678 Y140.548 E.00065
; WIPE_START
G1 X146.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.09 Y140.81 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.774 E.05812
G3 X140.274 Y113.211 I.594 J.031 E.02679
G1 X151.757 Y113.213 E.35287
G3 X152.289 Y113.771 I-.06 J.589 E.02579
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.75 E.38593
; WIPE_START
M204 S6000
G1 X151.09 Y140.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 31 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer31 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X152.051 Y142.374 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17738
G1 F15000
M204 S6000
G1 X151.539 Y142.593 E.0061
M204 S10000
G1 X152.037 Y142.402 F42000
; LINE_WIDTH: 0.27837
G1 F15000
M204 S6000
G3 X151.707 Y142.475 I-.43 J-1.174 E.0065
G1 X146.094 Y142.475 E.10769
; WIPE_START
G1 X148.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.178 Y139.127 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X142.549 Y139.127 E.05401
G1 X140.451 Y141.225 E.09843
G1 X140.451 Y137.803 E.11351
G1 X141.398 Y138.75 E.04445
G1 X141.398 Y138.886 E.00448
G1 X141.639 Y139.127 E.01131
G1 X141.775 Y139.127 E.00448
G1 X144.697 Y142.049 E.13711
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
M204 S10000
G1 X141.974 Y138.904 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4241
G1 F9444.357
M204 S6000
G1 X141.79 Y138.72 E.00808
G1 X141.79 Y138.181 E.01674
G1 X142.344 Y138.734 E.02431
G1 X142.883 Y138.734 E.01674
G1 X141.79 Y137.642 E.04799
G1 X141.79 Y137.103 E.01674
G1 X143.422 Y138.734 E.07167
G1 X143.961 Y138.734 E.01674
G1 X141.79 Y136.564 E.09535
G1 X141.79 Y136.025 E.01674
G1 X144.5 Y138.734 E.11903
G1 X145.039 Y138.734 E.01674
G1 X141.79 Y135.486 E.14271
G1 X141.79 Y134.947 E.01674
G1 X145.578 Y138.734 E.16639
G1 X146.117 Y138.734 E.01674
G1 X141.79 Y134.408 E.19006
G1 X141.79 Y133.869 E.01674
G1 X146.656 Y138.734 E.21374
G1 X147.195 Y138.734 E.01674
G1 X141.79 Y133.33 E.23742
G1 X141.79 Y132.79 E.01674
G1 X147.735 Y138.734 E.2611
G1 X148.274 Y138.734 E.01674
G1 X141.79 Y132.251 E.28478
G1 X141.79 Y131.712 E.01674
G1 X148.365 Y138.287 E.28879
G1 X148.365 Y137.748 E.01674
G1 X141.79 Y131.173 E.28879
G1 X141.79 Y130.634 E.01674
G1 X148.365 Y137.208 E.28879
G1 X148.365 Y136.669 E.01674
G1 X141.961 Y130.265 E.28131
G1 X142.5 Y130.265 E.01674
G1 X148.365 Y136.13 E.25763
G1 X148.365 Y135.591 E.01674
G1 X143.039 Y130.265 E.23395
G1 X143.578 Y130.265 E.01674
G1 X148.365 Y135.052 E.21027
G1 X148.365 Y134.513 E.01674
G1 X144.117 Y130.265 E.18659
G1 X144.656 Y130.265 E.01674
G1 X148.365 Y133.974 E.16291
G1 X148.365 Y133.435 E.01674
G1 X145.195 Y130.265 E.13923
G1 X145.734 Y130.265 E.01674
G1 X148.365 Y132.896 E.11555
G1 X148.365 Y132.357 E.01674
G1 X146.273 Y130.265 E.09187
G1 X146.812 Y130.265 E.01674
G1 X148.365 Y131.818 E.06819
G1 X148.365 Y131.279 E.01674
G1 X147.352 Y130.265 E.04451
G1 X147.891 Y130.265 E.01674
G1 X148.534 Y130.909 E.02828
M204 S10000
G1 X148.271 Y128.8 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X148.35 Y128.8 E.00262
G1 X148.35 Y129.873 E.0356
G1 X147.873 Y129.873 E.0158
G1 X146.8 Y128.8 E.05034
G1 X146.45 Y128.8 E.01161
G1 X146.45 Y129.873 E.0356
G1 X146.656 Y129.873 E.00681
; WIPE_START
G1 X146.45 Y129.873 E-.07798
G1 X146.45 Y128.8 E-.40778
G1 X146.8 Y128.8 E-.133
G1 X147.063 Y129.063 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y128.256 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y127.744 E.00784
; WIPE_START
G1 X146 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.65 Y127.121 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X143.65 Y127.2 E.00262
G1 X145.2 Y127.2 E.0514
G1 X144.127 Y126.127 E.05034
G1 X145.55 Y126.127 E.04721
G1 X145.55 Y126.332 E.00681
M204 S10000
G1 X144.279 Y125.904 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4241
G1 F9444.357
M204 S6000
G1 X143.635 Y125.26 E.02828
G1 X143.635 Y124.721 E.01674
G1 X144.648 Y125.734 E.0445
G1 X145.187 Y125.734 E.01674
G1 X143.635 Y124.182 E.06818
G1 X143.635 Y123.643 E.01674
G1 X145.726 Y125.734 E.09186
G1 X146.266 Y125.734 E.01674
G1 X143.635 Y123.104 E.11554
G1 X143.635 Y122.565 E.01674
G1 X146.805 Y125.734 E.13922
G1 X147.344 Y125.734 E.01674
G1 X143.635 Y122.026 E.1629
G1 X143.635 Y121.487 E.01674
G1 X147.883 Y125.734 E.18658
G1 X148.422 Y125.734 E.01674
G1 X143.635 Y120.948 E.21026
G1 X143.635 Y120.409 E.01674
G1 X148.961 Y125.734 E.23394
G1 X149.5 Y125.734 E.01674
G1 X143.635 Y119.87 E.25762
G1 X143.635 Y119.331 E.01674
G1 X150.039 Y125.734 E.2813
G1 X150.209 Y125.723 E.00531
G1 X150.209 Y125.366 E.0111
G1 X143.635 Y118.792 E.28879
G1 X143.635 Y118.253 E.01674
G1 X150.209 Y124.827 E.28879
G1 X150.209 Y124.288 E.01674
G1 X143.635 Y117.713 E.28879
G1 X143.635 Y117.265 E.01391
G1 X143.726 Y117.265 E.00283
G1 X150.209 Y123.749 E.28479
G1 X150.209 Y123.21 E.01674
G1 X144.265 Y117.265 E.26111
G1 X144.804 Y117.265 E.01674
G1 X150.209 Y122.671 E.23743
G1 X150.209 Y122.131 E.01674
G1 X145.344 Y117.265 E.21375
G1 X145.883 Y117.265 E.01674
G1 X150.209 Y121.592 E.19007
G1 X150.209 Y121.053 E.01674
G1 X146.422 Y117.265 E.16639
G1 X146.961 Y117.265 E.01674
G1 X150.209 Y120.514 E.14271
G1 X150.209 Y119.975 E.01674
G1 X147.5 Y117.265 E.11903
G1 X148.039 Y117.265 E.01674
G1 X150.209 Y119.436 E.09535
G1 X150.209 Y118.897 E.01674
G1 X148.578 Y117.265 E.07167
G1 X149.117 Y117.265 E.01674
G1 X150.209 Y118.358 E.04799
G1 X150.209 Y117.819 E.01674
G1 X149.656 Y117.265 E.02431
G1 X150.195 Y117.265 E.01674
G1 X150.379 Y117.45 E.00808
M204 S10000
G1 X147.822 Y116.873 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X149.451 Y116.873 E.05401
G1 X151.549 Y114.775 E.09843
G1 X151.549 Y118.197 E.11351
G1 X150.602 Y117.25 E.04445
G1 X150.602 Y117.114 E.00448
G1 X150.361 Y116.873 E.01131
G1 X150.225 Y116.873 E.00448
G1 X147.303 Y113.951 E.13709
G1 X146.45 Y113.951 E.02829
G1 X146.45 Y114.727 E.02573
; WIPE_START
G1 X146.45 Y113.951 E-.29474
G1 X147.303 Y113.951 E-.32403
G1 X147.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279759
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10832
G2 X140.161 Y113.543 I.021 J.657 E.00257
; LINE_WIDTH: 0.215132
G2 X139.955 Y113.613 I.484 J1.763 E.00305
; WIPE_START
G1 X140.161 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-.833 J.887 P1  F42000
G1 X151.549 Y124.245 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X151.549 Y125.874 E.05401
G1 X150.602 Y124.926 E.04447
G1 X150.602 Y123.398 E.05066
G1 X151.549 Y122.451 E.04446
G1 X151.549 Y120.822 E.05401
; WIPE_START
G1 X151.549 Y122.451 E-.61876
G1 X151.286 Y122.714 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-.78 J-.934 P1  F42000
G1 X140.451 Y131.755 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X140.451 Y130.126 E.05401
G1 X141.398 Y131.074 E.04447
G1 X141.398 Y132.602 E.05066
G1 X140.451 Y133.549 E.04446
G1 X140.451 Y135.178 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X140.451 Y133.549 E-.61876
G1 X140.714 Y133.286 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.456 Y130.923 Z6.6 F42000
G1 X115.967 Y125.226 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.645 Y123.717 I1.515 J14.182 E.04699
G3 X116.769 Y123.797 I-.181 J10.448 E.03742
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.187 Y130.929 I-.318 J3.903 E.02093
G1 X108.239 Y131.844 E.23246
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.077 Y132.676 I-.185 J-.052 E.00855
G1 X115.77 Y131.319 E.31944
G2 X115.231 Y131.319 I-.27 J3.33 E.01657
G1 X104.924 Y132.676 E.31946
G1 X104.85 Y132.673 E.00227
G3 X104.705 Y132.521 I.044 J-.187 E.00681
G1 X104.604 Y131.755 E.02376
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.201 J-.022 E.00949
G1 X114.184 Y123.408 E.31925
G3 X115.653 Y123.325 I1.569 J14.722 E.04524
G3 X116.816 Y123.408 I-.189 J10.841 E.03585
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.027 J.197 E.00952
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370014
G1 F11006.019
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 F12975.736
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 F15000
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7656.483
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 F8335.224
M73 P59 R10
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 F9146.011
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 F10131.53
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 F11456.137
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y125.709 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.419667
G1 F9555.494
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 F8442.788
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 F7562.194
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.13 Y125.093 Z6.6 F42000
G1 X127.087 Y125.002 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F15000
M204 S6000
G1 X123.915 Y124.585 E.02293
; WIPE_START
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.284 Y125.706 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130863
G1 F15000
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z6.6 F42000
G1 X104.892 Y132.438 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.130853
G1 F15000
M204 S6000
G1 X108.064 Y132.02 E.02293
; WIPE_START
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F15000
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 32/85
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I.285 J1.183 P1  F42000
G1 X146.29 Y126.84 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7239
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F7239
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y121.539 Z6.8 F42000
G1 X145.71 Y115.06 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F7239
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.462 Y122.65 Z6.8 F42000
G1 X143.302 Y127.548 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7239
M204 S6000
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.718 Y113.604 E.1863
G1 X151.793 Y113.626 E.00259
G1 X151.864 Y113.69 E.00317
G3 X151.897 Y113.79 I-.212 J.125 E.00352
G1 X151.898 Y126.448 E.41988
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.362 Y127.548 E.08412
; WIPE_START
G1 F8843.478
G1 X143.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.88 Y132.749 Z6.8 F42000
G1 X148.618 Y140.548 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F7239
M204 S6000
G1 X145.898 Y140.548 E.09024
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.05 J-.203 E.00882
G1 X140.102 Y129.552 E.41963
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X148.678 Y140.548 E.00065
; WIPE_START
G1 F8843.478
G1 X146.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7239
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.09 Y140.81 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F7239
M204 S5000
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.591 J-.031 E.02675
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.013 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.594 J.034 E.02671
G1 X151.757 Y113.213 E.35287
G3 X152.289 Y113.771 I-.066 J.595 E.02572
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.09 Y140.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 32 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer32 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X151.795 Y142.466 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.236048
G1 F7239
M204 S6000
G2 X152.039 Y142.399 I-.333 J-1.677 E.00398
M204 S10000
G1 X152.052 Y142.373 F42000
; LINE_WIDTH: 0.171794
G1 F7239
M204 S6000
G1 X151.554 Y142.593 E.00572
M204 S10000
G1 X151.795 Y142.466 F42000
; LINE_WIDTH: 0.280021
G1 F7239
M204 S6000
G3 X151.707 Y142.475 I-.101 J-.592 E.00171
G1 X146.094 Y142.475 E.10844
; WIPE_START
G1 F15000
G1 X148.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.55 Y141.273 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7239
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X140.451 Y137.803 E.19922
G1 X140.451 Y141.225 E.11351
G1 X148.35 Y133.326 E.37054
G1 X148.35 Y130.35 E.09873
G1 X146.8 Y128.8 E.07269
G1 X146.45 Y128.8 E.01161
G1 X146.45 Y129.9 E.03649
G1 X144.1 Y129.9 E.07797
G1 X140.451 Y133.549 E.17119
G1 X140.45 Y130.126 E.11355
G1 X148.35 Y138.026 E.37058
G1 X148.35 Y139.654 E.05401
; WIPE_START
G1 F8843.478
G1 X148.35 Y138.026 E-.61876
G1 X148.087 Y137.763 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.45 Y130.308 Z6.8 F42000
G1 X146 Y128.256 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7239
M204 S6000
G1 X146 Y127.744 E.00784
; WIPE_START
G1 F15000
G1 X146 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.254 Y120.628 Z6.8 F42000
G1 X146.45 Y114.726 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7239
M204 S6000
G1 X146.45 Y113.951 E.02573
G1 X147.303 Y113.951 E.02829
G1 X151.549 Y118.197 E.1992
G1 X151.549 Y114.775 E.11351
G1 X143.65 Y122.674 E.37054
G1 X143.65 Y125.65 E.09873
G1 X145.2 Y127.2 E.07269
G1 X145.55 Y127.2 E.01161
G1 X145.55 Y126.1 E.03649
G1 X147.9 Y126.1 E.07797
G1 X151.549 Y122.451 E.17119
G1 X151.55 Y125.874 E.11355
G1 X143.65 Y117.974 E.37058
G1 X143.65 Y116.346 E.05401
; WIPE_START
G1 F8843.478
G1 X143.65 Y117.974 E-.61876
G1 X143.913 Y118.237 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279776
G1 F7239
M204 S6000
G1 X140.293 Y113.525 E.10833
G2 X140.163 Y113.543 I.021 J.655 E.00254
; LINE_WIDTH: 0.214464
G2 X139.955 Y113.614 I.469 J1.711 E.00307
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.163 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.289 Y116.862 Z6.8 F42000
G1 X115.967 Y125.226 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7239
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.65 Y123.717 I1.509 J14.104 E.04717
G3 X116.769 Y123.797 I-.185 J10.434 E.03724
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F7239
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.2496
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.183 Y130.93 I-.317 J4.256 E.02102
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54753
G1 X116.054 Y129.427 E-.21247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7239
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G1 X126.268 Y132.591 E.00233
G3 X126.077 Y132.676 I-.162 J-.107 E.00678
G1 X115.77 Y131.319 E.31944
G2 X115.23 Y131.319 I-.27 J3.668 E.01661
G1 X104.924 Y132.676 E.3194
G1 X104.85 Y132.673 E.0023
G1 X104.771 Y132.635 E.00268
G3 X104.705 Y132.521 I.132 J-.153 E.00411
G1 X104.604 Y131.755 E.02375
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.201 J-.022 E.00949
G1 X114.184 Y123.408 E.31925
G3 X115.659 Y123.325 I1.563 J14.645 E.04541
G3 X116.816 Y123.408 I-.194 J10.827 E.03568
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419656
G1 F7239
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.469307
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518958
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.370005
G1 F7239
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320354
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270702
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221051
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.1714
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.121749
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.513104
G1 F7239
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474812
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.43652
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398228
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357153
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.472
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7239
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F7239
M204 S6000
G1 X104.892 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z6.8 F42000
G1 X103.913 Y125.002 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.130827
G1 F7239
M204 S6000
G1 X107.085 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7239
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.698 E.00648
G1 X116.108 Y124.698 E.04032
G1 X116.108 Y124.893 E.00648
G1 X118.316 Y125.184 E.07389
M73 P60 R10
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F7239
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z6.8 F42000
G1 X126.108 Y132.438 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.13084
G1 F7239
M204 S6000
G1 X122.936 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 33/85
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I.3 J1.179 P1  F42000
G1 X146.29 Y126.84 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7263
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F7263
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y121.539 Z7 F42000
G1 X145.71 Y115.06 Z7
G1 Z6.6
G1 E.8 F1800
G1 F7263
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.462 Y122.65 Z7 F42000
G1 X143.302 Y127.548 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7263
M204 S6000
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.719 Y113.604 E.18631
G1 X151.809 Y113.636 E.0032
G3 X151.897 Y113.79 I-.112 J.165 E.0061
G1 X151.898 Y126.448 E.41988
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.362 Y127.548 E.08412
; WIPE_START
G1 F8843.478
G1 X143.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.88 Y132.749 Z7 F42000
G1 X148.618 Y140.548 Z7
G1 Z6.6
G1 E.8 F1800
G1 F7263
M204 S6000
G1 X145.898 Y140.548 E.09024
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18696
G3 X140.103 Y142.202 I.049 J-.202 E.00883
G1 X140.102 Y129.552 E.41963
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X148.678 Y140.548 E.00065
; WIPE_START
G1 F8843.478
G1 X146.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7263
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.09 Y140.81 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F7263
M204 S5000
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35093
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.594 J.034 E.02671
G1 X151.758 Y113.213 E.35287
G3 X152.289 Y113.771 I-.072 J.601 E.02567
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.09 Y140.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 33 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer33 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X151.754 Y142.472 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255184
G1 F7263
M204 S6000
G1 X151.866 Y142.449 E.00197
; LINE_WIDTH: 0.213728
G1 X151.912 Y142.434 E.00068
; LINE_WIDTH: 0.177302
G1 X152.051 Y142.374 E.00166
M204 S10000
G1 X151.754 Y142.472 F42000
; LINE_WIDTH: 0.280105
G1 F7263
M204 S6000
G1 X146.094 Y142.475 E.10939
; WIPE_START
G1 F15000
M73 P60 R9
G1 X148.094 Y142.474 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.35 Y139.654 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7263
M204 S6000
G1 X148.35 Y138.026 E.05401
G1 X140.45 Y130.126 E.37058
G1 X140.451 Y133.549 E.11355
G1 X144.1 Y129.9 E.17119
G1 X146.45 Y129.9 E.07797
G1 X146.45 Y128.8 E.03649
G1 X146.8 Y128.8 E.01161
G1 X148.35 Y130.35 E.07269
G1 X148.35 Y133.326 E.09873
G1 X140.451 Y141.225 E.37054
G1 X140.451 Y137.803 E.11351
G1 X144.697 Y142.049 E.19922
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.787 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.312 Y134.205 Z7 F42000
G1 X146 Y128.256 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7263
M204 S6000
G1 X146 Y127.744 E.00784
; WIPE_START
G1 F15000
G1 X146 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.523 Y120.768 Z7 F42000
G1 X143.65 Y116.346 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7263
M204 S6000
G1 X143.65 Y117.974 E.05401
G1 X151.55 Y125.874 E.37058
G1 X151.549 Y122.451 E.11355
G1 X147.9 Y126.1 E.17119
G1 X145.55 Y126.1 E.07797
G1 X145.55 Y127.2 E.03649
G1 X145.2 Y127.2 E.01161
G1 X143.65 Y125.65 E.07269
G1 X143.65 Y122.674 E.09873
G1 X151.549 Y114.775 E.37054
G1 X151.549 Y118.197 E.11351
G1 X147.303 Y113.951 E.1992
G1 X146.45 Y113.951 E.02829
G1 X146.45 Y114.726 E.02573
; WIPE_START
G1 F8843.478
G1 X146.45 Y113.951 E-.29474
G1 X147.303 Y113.951 E-.32403
G1 X147.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279781
G1 F7263
M204 S6000
G1 X140.293 Y113.525 E.10833
G2 X140.162 Y113.543 I.021 J.656 E.00256
; LINE_WIDTH: 0.214982
G2 X139.955 Y113.613 I.484 J1.763 E.00306
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X140.162 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.289 Y116.862 Z7 F42000
G1 X115.967 Y125.226 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7263
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.656 Y123.717 I1.503 J14.029 E.04736
G3 X116.769 Y123.797 I-.19 J10.425 E.03705
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F7263
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7263
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.281 Y132.565 E.02516
G3 X126.076 Y132.676 I-.178 J-.084 E.00767
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.854 Y132.674 E.32152
G3 X104.705 Y132.521 I.041 J-.189 E.00696
G1 X104.604 Y131.755 E.02376
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.192 J-.029 E.0096
G1 X114.184 Y123.408 E.31925
G3 X115.664 Y123.325 I1.557 J14.572 E.04558
G3 X116.816 Y123.408 I-.199 J10.819 E.03551
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370014
G1 F7263
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7263
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y125.709 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.419667
G1 F7263
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7263
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130838
G1 F7263
M204 S6000
G1 X103.913 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7263
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F7263
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z7 F42000
G1 X127.087 Y125.002 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F7263
M204 S6000
G1 X123.915 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.817 Y127.694 Z7 F42000
G1 X108.064 Y132.02 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.130853
G1 F7263
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 34/85
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7 I.163 J1.206 P1  F42000
G1 X146.29 Y126.84 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7411
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F7411
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y121.539 Z7.2 F42000
G1 X145.71 Y115.06 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F7411
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.462 Y122.65 Z7.2 F42000
G1 X143.302 Y127.548 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7411
M204 S6000
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.719 Y113.604 E.18632
G1 X151.793 Y113.626 E.00257
G1 X151.864 Y113.69 E.00317
G3 X151.897 Y113.79 I-.211 J.125 E.00352
G1 X151.898 Y126.448 E.41987
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.362 Y127.548 E.08412
; WIPE_START
G1 F8843.478
G1 X143.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P61 R9
G1 X145.88 Y132.749 Z7.2 F42000
G1 X148.618 Y140.548 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F7411
M204 S6000
G1 X145.898 Y140.548 E.09024
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.203 I.049 J-.202 E.0088
G1 X140.102 Y129.552 E.41966
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X148.678 Y140.548 E.00065
; WIPE_START
G1 F8843.478
G1 X146.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7411
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.09 Y140.81 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F7411
M204 S5000
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.594 J-.034 E.02671
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.227 I.012 J-.608 E.0276
G1 X139.71 Y127.335 E.45758
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.774 E.05811
G3 X140.274 Y113.211 I.591 J.029 E.02682
G1 X151.758 Y113.213 E.35287
G3 X152.289 Y113.771 I-.066 J.595 E.02572
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.09 Y140.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 34 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer34 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X151.795 Y142.466 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F7411
M204 S6000
G3 X151.707 Y142.475 I-.102 J-.594 E.00172
G1 X146.094 Y142.475 E.10844
; WIPE_START
G1 F15000
G1 X148.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.55 Y141.273 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7411
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X140.451 Y137.803 E.19922
G1 X140.451 Y141.225 E.11351
G1 X148.35 Y133.326 E.37054
G1 X148.35 Y130.35 E.09873
G1 X146.8 Y128.8 E.07269
G1 X146.45 Y128.8 E.01161
G1 X146.45 Y129.9 E.03649
G1 X144.1 Y129.9 E.07797
G1 X140.451 Y133.549 E.17119
G1 X140.45 Y130.126 E.11355
G1 X148.35 Y138.026 E.37058
G1 X148.35 Y139.654 E.05401
; WIPE_START
G1 F8843.478
G1 X148.35 Y138.026 E-.61876
G1 X148.087 Y137.763 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.795 Y142.466 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.242889
G1 F7411
M204 S6000
G2 X151.881 Y142.444 I-.104 J-.594 E.00145
; LINE_WIDTH: 0.202588
G1 X151.927 Y142.427 E.00064
; LINE_WIDTH: 0.162999
G1 X152.058 Y142.368 E.0014
; WIPE_START
G1 F15000
G1 X151.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.982 Y135.386 Z7.2 F42000
G1 X146 Y128.256 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.23088
G1 F7411
M204 S6000
G1 X146 Y127.744 E.00784
; WIPE_START
G1 F15000
G1 X146 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.254 Y120.628 Z7.2 F42000
G1 X146.45 Y114.726 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7411
M204 S6000
G1 X146.45 Y113.951 E.02573
G1 X147.303 Y113.951 E.02829
G1 X151.549 Y118.197 E.1992
G1 X151.549 Y114.775 E.11351
G1 X143.65 Y122.674 E.37054
G1 X143.65 Y125.65 E.09873
G1 X145.2 Y127.2 E.07269
G1 X145.55 Y127.2 E.01161
G1 X145.55 Y126.1 E.03649
G1 X147.9 Y126.1 E.07797
G1 X151.549 Y122.451 E.17119
G1 X151.55 Y125.874 E.11355
G1 X143.65 Y117.974 E.37058
G1 X143.65 Y116.346 E.05401
; WIPE_START
G1 F8843.478
G1 X143.65 Y117.974 E-.61876
G1 X143.913 Y118.237 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279786
G1 F7411
M204 S6000
G1 X140.293 Y113.525 E.10834
G2 X140.163 Y113.543 I.021 J.655 E.00255
; LINE_WIDTH: 0.232394
G1 X139.961 Y113.601 E.00323
M204 S10000
G1 X139.948 Y113.628 F42000
; LINE_WIDTH: 0.170048
G1 F7411
M204 S6000
G1 X140.443 Y113.407 E.00562
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X139.948 Y113.628 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.077 Y116.951 Z7.2 F42000
G1 X115.967 Y125.226 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7411
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.661 Y123.717 I1.498 J13.959 E.04754
G3 X116.769 Y123.797 I-.195 J10.416 E.03687
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F7411
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.2496
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7411
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02429
G3 X126.076 Y132.676 I-.184 J-.051 E.0086
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.855 Y132.674 E.32152
G3 X104.705 Y132.52 I.038 J-.186 E.00702
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.201 J-.022 E.00949
G1 X114.184 Y123.408 E.31925
G3 X115.67 Y123.325 I1.552 J14.502 E.04575
G3 X116.816 Y123.408 I-.203 J10.809 E.03534
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.032 J.201 E.00948
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370014
G1 F7411
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7411
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y125.709 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.419667
G1 F7411
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.87 Y125.093 Z7.2 F42000
G1 X103.913 Y125.002 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F7411
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7411
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F7411
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z7.2 F42000
G1 X126.108 Y132.438 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F7411
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7411
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F7411
M204 S6000
G1 X104.892 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 35/85
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.2 I.163 J1.206 P1  F42000
G1 X146.29 Y126.84 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7278
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y127.94 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F7278
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y121.539 Z7.4 F42000
G1 X145.71 Y115.06 Z7.4
G1 Z7
G1 E.8 F1800
G1 F7278
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.462 Y122.65 Z7.4 F42000
G1 X143.302 Y127.548 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7278
M204 S6000
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.719 Y113.604 E.18631
G1 X151.839 Y113.661 E.00443
G3 X151.897 Y113.79 I-.143 J.141 E.00481
G1 X151.898 Y126.448 E.41987
G1 X145.898 Y126.448 E.19903
G1 X145.898 Y127.548 E.03649
G1 X143.362 Y127.548 E.08412
; WIPE_START
G1 F8843.478
G1 X143.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.88 Y132.749 Z7.4 F42000
G1 X148.618 Y140.548 Z7.4
G1 Z7
G1 E.8 F1800
G1 F7278
M204 S6000
G1 X145.898 Y140.548 E.09024
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.103 Y142.202 I.049 J-.202 E.00883
G1 X140.102 Y129.552 E.41963
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.548 E.40124
G1 X148.678 Y140.548 E.00065
; WIPE_START
G1 F8843.478
G1 X146.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7278
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.09 Y140.81 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F7278
M204 S5000
G1 X152.06 Y140.81 E.09126
G1 X152.06 Y140.335 E.0146
G1 X152.29 Y140.335 E.00706
G1 X152.289 Y142.229 E.05819
G3 X151.726 Y142.789 I-.591 J-.031 E.02675
G1 X140.305 Y142.79 E.35094
G3 X139.711 Y142.226 I.012 J-.608 E.02761
G1 X139.71 Y127.335 E.45757
G1 X139.94 Y127.335 E.00707
G1 X139.94 Y127.81 E.0146
G1 X142.91 Y127.81 E.09126
G1 X142.91 Y115.19 E.38778
G1 X139.94 Y115.19 E.09126
G1 X139.94 Y115.665 E.0146
G1 X139.71 Y115.665 E.00706
G1 X139.711 Y113.771 E.05819
G3 X140.274 Y113.211 I.594 J.034 E.02671
G1 X151.758 Y113.213 E.35287
G3 X152.289 Y113.771 I-.066 J.595 E.02572
G1 X152.29 Y128.665 E.45765
G1 X152.06 Y128.665 E.00707
G1 X152.06 Y128.19 E.0146
G1 X149.09 Y128.19 E.09126
G1 X149.09 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.09 Y140.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 35 start: 394,405
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P62 R9
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


; object ids of this layer35 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X151.795 Y142.466 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23605
G1 F7278
M204 S6000
G2 X152.039 Y142.399 I-.334 J-1.679 E.00398
M204 S10000
G1 X152.052 Y142.373 F42000
; LINE_WIDTH: 0.17177
G1 F7278
M204 S6000
G1 X151.554 Y142.593 E.00572
M204 S10000
G1 X151.795 Y142.466 F42000
; LINE_WIDTH: 0.280021
G1 F7278
M204 S6000
G3 X151.707 Y142.475 I-.102 J-.594 E.00171
G1 X146.094 Y142.475 E.10844
; WIPE_START
G1 F15000
G1 X148.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.35 Y139.654 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7278
M204 S6000
G1 X148.35 Y138.026 E.05401
G1 X140.45 Y130.126 E.37058
G1 X140.451 Y133.549 E.11355
G1 X144.1 Y129.9 E.17119
G1 X146.45 Y129.9 E.07797
G1 X146.45 Y128.8 E.03649
G1 X146.8 Y128.8 E.01161
G1 X148.35 Y130.35 E.07269
G1 X148.35 Y133.326 E.09873
G1 X140.451 Y141.225 E.37054
G1 X140.451 Y137.803 E.11351
G1 X144.697 Y142.049 E.19922
G1 X145.55 Y142.049 E.02827
G1 X145.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X145.55 Y142.049 E-.2949
G1 X144.697 Y142.049 E-.32387
G1 X144.435 Y141.787 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.312 Y134.205 Z7.4 F42000
G1 X146 Y128.256 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7278
M204 S6000
G1 X146 Y127.744 E.00784
; WIPE_START
G1 F15000
G1 X146 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.523 Y120.768 Z7.4 F42000
G1 X143.65 Y116.346 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7278
M204 S6000
G1 X143.65 Y117.974 E.05401
G1 X151.55 Y125.874 E.37058
G1 X151.549 Y122.451 E.11355
G1 X147.9 Y126.1 E.17119
G1 X145.55 Y126.1 E.07797
G1 X145.55 Y127.2 E.03649
G1 X145.2 Y127.2 E.01161
G1 X143.65 Y125.65 E.07269
G1 X143.65 Y122.674 E.09873
G1 X151.549 Y114.775 E.37054
G1 X151.549 Y118.197 E.11351
G1 X147.303 Y113.951 E.1992
G1 X146.45 Y113.951 E.02828
G1 X146.45 Y114.726 E.02573
; WIPE_START
G1 F8843.478
G1 X146.45 Y113.951 E-.29475
G1 X147.303 Y113.951 E-.32402
G1 X147.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278343
G1 F7278
M204 S6000
G1 X140.293 Y113.525 E.10768
G2 X139.963 Y113.598 I.1 J1.246 E.0065
M204 S10000
G1 X139.949 Y113.626 F42000
; LINE_WIDTH: 0.17738
G1 F7278
M204 S6000
G1 X140.461 Y113.407 E.0061
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X139.949 Y113.626 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.078 Y116.95 Z7.4 F42000
G1 X115.967 Y125.226 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7278
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.667 Y123.717 I1.493 J13.892 E.04772
G3 X116.769 Y123.797 I-.2 J10.417 E.03668
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F7278
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.183 Y130.93 I-.317 J4.256 E.02102
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7278
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.191 J-.036 E.00914
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.669 E.01661
G1 X104.854 Y132.674 E.32152
G3 X104.705 Y132.521 I.041 J-.189 E.00696
G1 X104.604 Y131.755 E.02376
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.203 J-.021 E.00948
G1 X114.184 Y123.408 E.31925
G3 X115.675 Y123.325 I1.547 J14.436 E.04592
G3 X116.816 Y123.408 I-.209 J10.81 E.03517
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.032 J.201 E.00948
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419667
G1 F7278
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.370014
G1 F7278
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7278
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.242 Y131.349 Z7.4 F42000
G1 X104.892 Y132.438 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F7278
M204 S6000
G1 X108.064 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7278
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F7278
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z7.4 F42000
G1 X127.087 Y125.002 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F7278
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.284 Y125.706 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7278
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F7278
M204 S6000
G1 X103.913 Y125.002 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 36/85
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.4 I-.063 J1.215 P1  F42000
G1 X146.29 Y126.84 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.728 Y134.499 Z7.6 F42000
G1 X149.09 Y140.81 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X149.09 Y128.19 E.38778
G1 X151.66 Y128.19 E.07897
G1 X152.06 Y128.19 E.01229
G1 F6111.369
G1 X152.06 Y128.706 E.01585
M106 S255
G1 F1800
G1 X152.06 Y129.075 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X152.06 Y139.925 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X152.06 Y140.294 E.01134
M106 S201.45
G1 F6111.477
G1 X152.06 Y140.81 E.01586
G1 F9547.055
G1 X151.66 Y140.81 E.01229
G1 X149.15 Y140.81 E.07712
; WIPE_START
M204 S6000
G1 X149.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.843 Y131.531 Z7.6 F42000
G1 X145.71 Y127.94 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.838 Y121.606 Z7.6 F42000
G1 X142.91 Y115.19 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X142.91 Y127.81 E.38778
G1 X140.34 Y127.81 E.07897
G1 X139.94 Y127.81 E.01229
G1 F6111.369
G1 X139.94 Y127.294 E.01585
M106 S255
G1 F1800
G1 X139.94 Y126.925 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X139.94 Y116.075 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X139.94 Y115.706 E.01134
M106 S201.45
G1 F6111.477
G1 X139.94 Y115.19 E.01586
G1 F9547.055
G1 X140.34 Y115.19 E.01229
G1 X142.85 Y115.19 E.07712
; WIPE_START
M204 S6000
G1 X142.859 Y117.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y115.06 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.249 Y113.829 Z7.6 F42000
G1 X151.884 Y113.729 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X151.897 Y113.79 I-.187 J.073 E.0021
G1 X151.897 Y126.448 E.41988
G1 X145.898 Y126.448 E.19901
G1 X145.898 Y127.548 E.03649
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.719 Y113.604 E.18632
G1 X151.839 Y113.66 E.00442
G3 X151.853 Y113.676 I-.143 J.141 E.00071
; WIPE_START
G1 X151.897 Y113.79 E-.04634
G1 X151.897 Y115.668 E-.71366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.924 Y123.239 Z7.6 F42000
G1 X148.698 Y140.548 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.102 Y142.178 I.045 J-.2 E.0097
G1 X140.102 Y129.552 E.41881
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.488 E.39925
; WIPE_START
G1 X146.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.376 Y133.424 Z7.6 F42000
G1 X152.234 Y113.552 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X152.234 Y113.555 E.00009
G3 X152.289 Y113.771 I-.543 J.253 E.0069
G1 X152.29 Y127.906 E.43433
G1 X152.29 Y128.306 E.01229
G1 F4919.51
G1 X152.29 Y128.706 E.01229
M106 S255
G1 F1800
G1 X152.29 Y129.075 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X152.29 Y139.925 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X152.29 Y140.294 E.01134
M106 S201.45
G1 F4919.51
G1 X152.29 Y140.694 E.01229
G1 F9547.055
G1 X152.29 Y141.094 E.01229
G1 X152.29 Y142.195 E.03382
G3 X151.726 Y142.789 I-.608 J-.012 E.02761
G1 X140.305 Y142.79 E.35094
G3 X139.71 Y142.192 I.012 J-.607 E.02866
G1 X139.71 Y128.094 E.43319
G1 X139.71 Y127.694 E.01229
G1 F4919.51
G1 X139.71 Y127.294 E.01229
M106 S255
G1 F1800
G1 X139.71 Y126.925 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X139.71 Y116.075 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X139.71 Y115.706 E.01134
M106 S201.45
G1 F4919.51
G1 X139.71 Y115.306 E.01229
G1 F9547.055
G1 X139.71 Y114.906 E.01229
G1 X139.71 Y113.805 E.03382
G3 X140.274 Y113.211 I.608 J.012 E.02761
G1 X151.758 Y113.213 E.35287
G3 X152.115 Y113.385 I-.066 J.595 E.01241
G1 X152.199 Y113.503 E.00447
; WIPE_START
M204 S6000
G1 X152.234 Y113.555 E-.02361
G1 X152.289 Y113.771 E-.08479
G1 X152.289 Y115.486 E-.6516
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 36 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer36 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X146.45 Y114.726 F42000
M73 P63 R9
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.45 Y113.951 E.02573
G1 X147.303 Y113.951 E.02828
G1 X151.549 Y118.197 E.19919
G1 X151.549 Y114.775 E.11351
G1 X143.65 Y122.674 E.37054
G1 X143.65 Y125.65 E.09873
G1 X145.2 Y127.2 E.07269
G1 X145.55 Y127.2 E.01161
G1 X145.55 Y126.1 E.03649
G1 X147.9 Y126.1 E.07797
G1 X151.549 Y122.451 E.17118
G1 X151.549 Y125.873 E.11353
G1 X143.65 Y117.974 E.37056
G1 X143.65 Y116.346 E.05401
; WIPE_START
G1 X143.65 Y117.974 E-.61876
G1 X143.913 Y118.237 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y113.525 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279915
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.1084
G2 X140.182 Y113.538 I.026 J.717 E.00217
; LINE_WIDTH: 0.241737
G1 X140.134 Y113.551 E.00081
; LINE_WIDTH: 0.213455
G1 X140.088 Y113.566 E.00066
; LINE_WIDTH: 0.177406
G1 X139.949 Y113.626 E.00166
; WIPE_START
G1 X140.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.026 Y120.611 Z7.6 F42000
G1 X146 Y127.744 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
; WIPE_START
G1 X146 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.746 Y135.372 Z7.6 F42000
G1 X145.55 Y141.273 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.55 Y142.049 E.02574
G1 X144.697 Y142.049 E.02827
G1 X140.45 Y137.802 E.19925
G1 X140.45 Y141.226 E.11357
G1 X148.35 Y133.326 E.37058
G1 X148.35 Y130.35 E.09873
G1 X146.8 Y128.8 E.07269
G1 X146.45 Y128.8 E.01161
G1 X146.45 Y129.9 E.03649
G1 X144.1 Y129.9 E.07797
G1 X140.45 Y133.55 E.17121
G1 X140.45 Y130.126 E.11357
G1 X148.35 Y138.026 E.37058
G1 X148.35 Y139.654 E.05401
; WIPE_START
G1 X148.35 Y138.026 E-.61876
G1 X148.087 Y137.763 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280105
G1 F15000
M204 S6000
G1 X151.754 Y142.472 E.10939
; LINE_WIDTH: 0.255107
G1 X151.866 Y142.449 E.00197
; LINE_WIDTH: 0.213613
G1 X151.912 Y142.433 E.00068
; LINE_WIDTH: 0.17737
G1 X152.051 Y142.374 E.00166
; OBJECT_ID: 394
; WIPE_START
G1 X151.912 Y142.433 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X145.028 Y139.138 Z7.6 F42000
G1 X115.967 Y125.226 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.672 Y123.718 I1.488 J13.828 E.04791
G3 X116.769 Y123.797 I-.205 J10.409 E.0365
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.31 E.02083
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 X115.5 Y129.354 E-.54756
G1 X116.054 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.077 Y132.676 I-.191 J-.037 E.00909
G1 X115.77 Y131.319 E.31943
G2 X115.232 Y131.319 I-.27 J2.786 E.01655
G1 X104.924 Y132.676 E.31949
G1 X104.828 Y132.667 E.00297
G1 X104.751 Y132.616 E.00283
G3 X104.705 Y132.521 I.204 J-.158 E.00325
G1 X104.604 Y131.755 E.02375
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.191 J-.03 E.00961
G1 X114.184 Y123.408 E.31925
G3 X115.681 Y123.326 I1.542 J14.373 E.04609
G3 X116.816 Y123.408 I-.214 J10.807 E.03499
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.022 J.193 E.00959
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370014
G1 F11006.019
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 F12975.736
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 F15000
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7656.486
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 F8335.209
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 F9145.971
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 F10131.452
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 F11457.67
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y125.709 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.419667
G1 F9555.494
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 F8442.788
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 F7562.194
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X108.716 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F15000
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.0657
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F15000
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z7.6 F42000
G1 X103.913 Y125.002 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.13084
G1 F15000
M204 S6000
G1 X107.085 Y124.585 E.02292
; WIPE_START
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.183 Y127.694 Z7.6 F42000
G1 X122.936 Y132.02 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.130857
G1 F15000
M204 S6000
G1 X126.108 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 37/85
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.6 I.285 J1.183 P1  F42000
G1 X146.29 Y126.84 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8891
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.728 Y134.499 Z7.8 F42000
G1 X149.09 Y140.81 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F8891
M204 S5000
G1 X149.09 Y128.19 E.38778
G1 X152.06 Y128.19 E.09126
G1 X152.06 Y140.81 E.38778
G1 X149.15 Y140.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.843 Y131.531 Z7.8 F42000
G1 X145.71 Y127.94 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F8891
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.838 Y121.606 Z7.8 F42000
G1 X142.91 Y115.19 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F8891
M204 S5000
G1 X142.91 Y127.81 E.38778
G1 X139.94 Y127.81 E.09126
G1 X139.94 Y115.19 E.38778
G1 X142.85 Y115.19 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X142.859 Y117.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y115.06 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F8891
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.249 Y113.829 Z7.8 F42000
G1 X151.884 Y113.729 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X151.897 Y113.79 I-.187 J.073 E.0021
G1 X151.897 Y126.448 E.41988
G1 X145.898 Y126.448 E.19901
G1 X145.898 Y127.548 E.03649
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.719 Y113.604 E.18632
G1 X151.839 Y113.661 E.00442
G3 X151.853 Y113.676 I-.143 J.141 E.0007
; WIPE_START
G1 X151.897 Y113.79 E-.0464
G1 X151.897 Y115.668 E-.71361
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.924 Y123.238 Z7.8 F42000
G1 X148.698 Y140.548 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.262 Y142.393 E.18697
G3 X140.102 Y142.178 I.045 J-.2 E.00971
G1 X140.102 Y129.552 E.41881
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.488 E.39925
; WIPE_START
G1 X146.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8891
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.377 Y133.424 Z7.8 F42000
G1 X152.235 Y113.553 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F8891
M204 S5000
G1 X152.234 Y113.554 E.00006
G3 X152.289 Y113.771 I-.542 J.254 E.00693
G1 X152.29 Y142.195 E.87338
G3 X151.726 Y142.789 I-.608 J-.013 E.02761
G1 X140.305 Y142.79 E.35094
G3 X139.71 Y142.192 I.012 J-.607 E.02866
G1 X139.71 Y113.805 E.87225
G3 X140.274 Y113.211 I.608 J.013 E.02761
G1 X151.758 Y113.213 E.35287
G3 X152.115 Y113.385 I-.066 J.595 E.01242
G1 X152.2 Y113.504 E.0045
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.234 Y113.554 E-.02291
G1 X152.289 Y113.771 E-.08515
G1 X152.289 Y115.487 E-.65194
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 37 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer37 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X145.906 Y113.525 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279803
G1 F8891
M204 S6000
G1 X140.293 Y113.525 E.10834
G2 X140.162 Y113.543 I.02 J.652 E.00256
; LINE_WIDTH: 0.214707
G2 X139.955 Y113.614 I.477 J1.739 E.00306
; WIPE_START
G1 F15000
G1 X140.162 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.027 Y116.723 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X144.027 Y118.352 E.05401
G1 X151.172 Y125.496 E.33516
G1 X151.172 Y122.828 E.0885
G1 X148.277 Y125.722 E.13578
G1 X145.173 Y125.722 E.103
G1 X145.173 Y126.822 E.03649
G1 X144.822 Y126.822 E.01161
G1 X144.027 Y126.027 E.0373
G1 X144.027 Y122.297 E.12376
G1 X151.172 Y115.152 E.33514
G1 X151.172 Y117.82 E.08848
G1 X147.68 Y114.328 E.16379
G1 X146.827 Y114.328 E.02829
G1 X146.827 Y115.104 E.02573
M204 S10000
G1 X145.376 Y127.185 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.384085
G1 F8891
M204 S6000
G1 X145.508 Y127.158 E.00374
G1 X145.535 Y126.244 E.02541
G1 X145.562 Y126.112 E.00375
G1 X145.694 Y126.085 E.00375
G1 X151.375 Y126.085 E.15793
G1 X151.507 Y126.058 E.00375
G1 X151.535 Y125.926 E.00375
G1 X151.534 Y114.126 E.32806
G1 X151.507 Y113.994 E.00374
G1 X151.375 Y113.966 E.00374
G1 X146.624 Y113.965 E.13208
G1 X146.492 Y113.993 E.00375
G1 X146.465 Y114.125 E.00375
G1 X146.465 Y115.656 E.04256
G1 X146.437 Y115.787 E.00375
G1 X146.306 Y115.815 E.00374
G1 X143.824 Y115.815 E.06899
G1 X143.692 Y115.842 E.00375
G1 X143.665 Y115.974 E.00375
G1 X143.665 Y127.026 E.30725
G1 X143.692 Y127.158 E.00375
G1 X143.824 Y127.185 E.00374
G1 X145.316 Y127.185 E.04148
M204 S10000
G1 X146 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F8891
M204 S6000
G1 X146 Y128.256 E.00784
M204 S10000
G1 X146.624 Y128.815 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.384084
G1 F8891
M204 S6000
M73 P64 R9
G1 X146.492 Y128.842 E.00374
G1 X146.465 Y129.756 E.02541
G1 X146.437 Y129.888 E.00375
G1 X146.306 Y129.915 E.00375
G1 X140.624 Y129.915 E.15795
G1 X140.492 Y129.942 E.00374
G1 X140.465 Y130.074 E.00375
G1 X140.465 Y141.876 E.3281
G1 X140.492 Y142.008 E.00375
G1 X140.624 Y142.035 E.00375
G1 X145.376 Y142.035 E.1321
G1 X145.508 Y142.007 E.00375
G1 X145.535 Y141.876 E.00374
G1 X145.535 Y140.344 E.04257
G1 X145.562 Y140.212 E.00375
G1 X145.694 Y140.185 E.00374
G1 X148.176 Y140.185 E.06899
G1 X148.308 Y140.158 E.00375
G1 X148.335 Y140.026 E.00375
G1 X148.335 Y128.974 E.30725
G1 X148.308 Y128.842 E.00375
G1 X148.176 Y128.815 E.00374
G1 X146.684 Y128.815 E.04148
M204 S10000
G1 X147.973 Y139.277 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X147.973 Y137.648 E.05401
G1 X140.827 Y130.503 E.33519
G1 X140.827 Y133.173 E.08854
G1 X143.722 Y130.277 E.13581
G1 X146.827 Y130.277 E.103
G1 X146.827 Y129.177 E.03649
G1 X147.177 Y129.177 E.01161
G1 X147.973 Y129.973 E.0373
G1 X147.973 Y133.703 E.12376
G1 X140.827 Y140.848 E.33519
G1 X140.827 Y138.179 E.08854
G1 X144.32 Y141.672 E.16385
G1 X145.173 Y141.672 E.02827
G1 X145.173 Y140.896 E.02574
; WIPE_START
G1 X145.173 Y141.672 E-.29491
G1 X144.32 Y141.672 E-.32386
G1 X144.057 Y141.409 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278371
G1 F8891
M204 S6000
G1 X151.707 Y142.475 E.10769
G2 X152.037 Y142.402 I-.1 J-1.248 E.0065
M204 S10000
G1 X152.051 Y142.374 F42000
; LINE_WIDTH: 0.177443
G1 F8891
M204 S6000
G1 X151.54 Y142.593 E.0061
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X152.051 Y142.374 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
M73 P64 R8
G1 X145.158 Y139.098 Z7.8 F42000
G1 X115.967 Y125.226 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.678 Y123.718 I1.483 J13.764 E.04809
G3 X116.769 Y123.797 I-.21 J10.407 E.03632
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.81 Y130.929 E.23257
G2 X115.183 Y130.93 I-.309 J3.31 E.02082
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8891
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.281 Y132.566 E.02516
G3 X126.076 Y132.676 I-.177 J-.084 E.00767
G1 X115.768 Y131.319 E.31947
G2 X115.23 Y131.319 I-.267 J2.786 E.01655
G1 X104.855 Y132.674 E.32152
G3 X104.705 Y132.52 I.04 J-.188 E.00701
G1 X104.604 Y131.755 E.02372
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.201 J-.022 E.00949
G1 X114.184 Y123.408 E.31925
G3 X115.686 Y123.326 I1.537 J14.309 E.04626
G3 X116.816 Y123.408 I-.219 J10.806 E.03483
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.03 J.2 E.0095
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370014
G1 F8891
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7656.483
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 F8335.224
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 F8891
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y125.709 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.419667
G1 F8891
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 F8442.788
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 F7562.194
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130827
G1 F8891
M204 S6000
G1 X103.913 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F8891
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z7.8 F42000
G1 X127.087 Y125.002 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F8891
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.817 Y127.694 Z7.8 F42000
G1 X108.064 Y132.02 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.130854
G1 F8891
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 38/85
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
M106 S196.35
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7.8 I.163 J1.206 P1  F42000
G1 X146.29 Y126.84 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y126.84 E.17269
G1 X151.91 Y128.06 E.03749
G1 X146.29 Y128.06 E.17269
G1 X146.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.728 Y134.499 Z8 F42000
G1 X149.09 Y140.81 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X149.09 Y128.19 E.38778
G1 X152.06 Y128.19 E.09126
G1 X152.06 Y140.81 E.38778
G1 X149.15 Y140.81 E.08942
; WIPE_START
M204 S6000
G1 X149.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.843 Y131.531 Z8 F42000
G1 X145.71 Y127.94 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.71 Y129.16 E.03749
G1 X140.09 Y129.16 E.17269
G1 X140.09 Y127.94 E.03749
G1 X145.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X145.71 Y129.16 E-.46416
G1 X144.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.838 Y121.606 Z8 F42000
G1 X142.91 Y115.19 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X142.91 Y127.81 E.38778
G1 X139.94 Y127.81 E.09126
G1 X139.94 Y115.19 E.38778
G1 X142.85 Y115.19 E.08942
; WIPE_START
M204 S6000
G1 X142.859 Y117.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.71 Y115.06 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X140.09 Y115.06 E.17269
G1 X140.09 Y113.84 E.03749
G1 X145.71 Y113.84 E.17269
G1 X145.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X143.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.249 Y113.829 Z8 F42000
G1 X151.883 Y113.728 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X151.897 Y113.79 I-.187 J.073 E.00211
G1 X151.897 Y126.448 E.41988
G1 X145.898 Y126.448 E.19901
G1 X145.898 Y127.548 E.03649
G1 X143.302 Y127.548 E.08611
G1 X143.302 Y115.452 E.40124
G1 X146.102 Y115.452 E.09288
G1 X146.102 Y113.603 E.06135
G1 X151.719 Y113.604 E.18633
G1 X151.839 Y113.661 E.00442
G3 X151.853 Y113.676 I-.143 J.141 E.00069
; WIPE_START
G1 X151.897 Y113.79 E-.0465
G1 X151.897 Y115.668 E-.7135
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.924 Y123.238 Z8 F42000
G1 X148.698 Y140.548 Z8
G1 Z7.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X145.898 Y140.548 E.09288
G1 X145.898 Y142.397 E.06135
G1 X140.261 Y142.393 E.18697
G3 X140.102 Y142.178 I.045 J-.2 E.0097
G1 X140.102 Y129.552 E.41881
G1 X146.102 Y129.552 E.19903
G1 X146.102 Y128.452 E.03649
G1 X148.698 Y128.452 E.08611
G1 X148.698 Y140.488 E.39925
; WIPE_START
G1 X146.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.29 Y140.94 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.91 Y140.94 E.17269
G1 X151.91 Y142.16 E.03749
G1 X146.29 Y142.16 E.17269
G1 X146.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X148.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.376 Y133.424 Z8 F42000
G1 X152.233 Y113.553 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G3 X152.289 Y113.771 I-.542 J.255 E.00695
G1 X152.29 Y142.195 E.87338
G3 X151.726 Y142.789 I-.608 J-.013 E.02761
G1 X140.305 Y142.79 E.35094
G3 X139.71 Y142.192 I.012 J-.607 E.02866
G1 X139.71 Y113.805 E.87225
G3 X140.274 Y113.211 I.608 J.013 E.02761
G1 X151.758 Y113.213 E.35287
G3 X152.205 Y113.5 I-.066 J.595 E.01692
; WIPE_START
M204 S6000
G1 X152.289 Y113.771 E-.10777
G1 X152.289 Y115.487 E-.65224
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 38 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer38 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X146.269 Y115.069 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41358
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X147.366 Y113.972 E.08488
G1 X146.71 Y113.972 E.03588
G1 X146.269 Y114.413 E.03414
M106 S196.35
M204 S10000
G1 X145.906 Y113.525 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279813
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X140.293 Y113.525 E.10835
G2 X140.162 Y113.543 I.021 J.653 E.00255
; LINE_WIDTH: 0.214635
G2 X139.955 Y113.614 I.477 J1.74 E.00306
; WIPE_START
G1 X140.162 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.408 Y115.619 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41358
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X143.672 Y116.355 E.05698
G1 X143.672 Y117.011 E.03588
G1 X144.861 Y115.822 E.09205
G1 X145.516 Y115.822 E.03588
G1 X143.672 Y117.666 E.1428
G1 X143.672 Y118.322 E.03588
G1 X148.021 Y113.973 E.33668
G1 X148.677 Y113.973 E.03588
G1 X143.672 Y118.978 E.38742
G1 X143.672 Y119.633 E.03588
G1 X149.332 Y113.973 E.43816
G1 X149.988 Y113.973 E.03588
G1 X143.672 Y120.289 E.4889
G1 X143.672 Y120.944 E.03589
G1 X150.643 Y113.973 E.53964
G1 X151.299 Y113.973 E.03588
G1 X143.672 Y121.6 E.59038
G1 X143.672 Y122.256 E.03588
G1 X151.527 Y114.4 E.60809
G1 X151.527 Y115.056 E.03588
G1 X143.672 Y122.911 E.60809
G1 X143.672 Y123.567 E.03588
G1 X151.527 Y115.711 E.60809
G1 X151.527 Y116.367 E.03588
G1 X143.672 Y124.222 E.6081
G1 X143.672 Y124.878 E.03588
G1 X151.527 Y117.022 E.6081
G1 X151.527 Y117.678 E.03588
G1 X143.672 Y125.534 E.6081
G1 X143.672 Y126.189 E.03588
G1 X151.528 Y118.333 E.6081
G1 X151.528 Y118.989 E.03588
G1 X143.672 Y126.845 E.6081
G1 X143.672 Y127.178 E.01825
G1 X143.994 Y127.178 E.01763
G1 X151.528 Y119.645 E.58316
G1 X151.528 Y120.3 E.03588
G1 X144.447 Y127.381 E.54809
M106 S196.35
M204 S10000
G1 X145.103 Y127.381 F42000
M106 S255
G1 F3000
M204 S6000
G1 X145.731 Y126.753 E.04863
M106 S196.35
M204 S10000
G1 X146.203 Y126.281 F42000
M106 S255
G1 F3000
M204 S6000
G1 X151.528 Y120.956 E.4122
G1 X151.528 Y121.611 E.03588
G1 X147.061 Y126.078 E.34577
G1 X147.716 Y126.078 E.03588
G1 X151.528 Y122.267 E.29503
G1 X151.528 Y122.923 E.03588
G1 X148.372 Y126.078 E.24428
G1 X149.027 Y126.078 E.03588
G1 X151.528 Y123.578 E.19353
G1 X151.528 Y124.234 E.03588
G1 X149.683 Y126.078 E.14279
G1 X150.339 Y126.078 E.03588
G1 X151.528 Y124.889 E.09204
G1 X151.528 Y125.545 E.03588
G1 X150.792 Y126.281 E.05697
M106 S196.35
; WIPE_START
G1 X151.528 Y125.545 E-.3955
G1 X151.528 Y124.889 E-.24912
G1 X151.313 Y125.104 E-.11538
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146 Y127.744 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X146 Y128.256 E.00784
; WIPE_START
M73 P65 R8
G1 X146 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.269 Y129.247 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41359
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X146.695 Y128.822 E.03294
G1 X147.35 Y128.822 E.03589
G1 X140.472 Y135.7 E.53249
G1 X140.472 Y136.356 E.03589
G1 X148.006 Y128.822 E.58324
G1 X148.328 Y128.822 E.01764
G1 X148.328 Y129.155 E.01824
G1 X140.472 Y137.012 E.60819
G1 X140.472 Y137.667 E.03589
G1 X148.328 Y129.811 E.60819
G1 X148.328 Y130.466 E.03589
G1 X140.472 Y138.323 E.60819
G1 X140.472 Y138.978 E.03589
G1 X148.328 Y131.122 E.60819
G1 X148.328 Y131.777 E.03589
G1 X140.472 Y139.634 E.60819
G1 X140.472 Y140.29 E.03589
G1 X148.328 Y132.433 E.60819
G1 X148.328 Y133.089 E.03589
G1 X140.472 Y140.945 E.60819
G1 X140.472 Y141.601 E.03589
G1 X148.328 Y133.744 E.60819
G1 X148.328 Y134.4 E.03589
G1 X140.7 Y142.028 E.59052
G1 X141.356 Y142.028 E.03589
G1 X148.328 Y135.056 E.53977
G1 X148.328 Y135.711 E.03589
G1 X142.011 Y142.028 E.48901
G1 X142.667 Y142.028 E.03589
G1 X148.328 Y136.367 E.43825
G1 X148.328 Y137.022 E.03589
G1 X143.12 Y142.231 E.40317
M106 S196.35
; WIPE_START
G1 X144.534 Y140.816 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.592 Y140.381 Z8 F42000
G1 Z7.6
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X148.328 Y139.645 E.05697
G1 X148.328 Y138.989 E.03589
G1 X147.139 Y140.178 E.09205
G1 X146.484 Y140.178 E.03589
G1 X148.328 Y138.334 E.1428
G1 X148.328 Y137.678 E.03589
G1 X143.978 Y142.028 E.33674
G1 X144.634 Y142.028 E.03589
G1 X145.528 Y141.134 E.06923
G1 X145.528 Y141.789 E.03589
G1 X145.087 Y142.23 E.03415
M106 S196.35
; WIPE_START
G1 X145.528 Y141.789 E-.2371
G1 X145.528 Y141.134 E-.24914
G1 X145.019 Y141.643 E-.27377
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.094 Y142.475 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X151.707 Y142.475 E.10844
G2 X151.795 Y142.466 I-.013 J-.6 E.00172
; LINE_WIDTH: 0.24287
G2 X151.881 Y142.444 I-.104 J-.594 E.00145
; LINE_WIDTH: 0.20247
G1 X151.927 Y142.427 E.00064
; LINE_WIDTH: 0.162821
G1 X152.058 Y142.367 E.0014
; WIPE_START
G1 X151.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.429 Y138.425 Z8 F42000
G1 X140.269 Y135.247 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41359
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X145.595 Y129.922 E.41226
G1 X144.939 Y129.922 E.03589
G1 X140.472 Y134.389 E.34583
G1 X140.472 Y133.734 E.03589
G1 X144.284 Y129.922 E.29508
G1 X143.628 Y129.922 E.03589
G1 X140.472 Y133.078 E.24433
G1 X140.472 Y132.422 E.03589
G1 X142.972 Y129.922 E.19357
G1 X142.317 Y129.922 E.03589
G1 X140.472 Y131.767 E.14282
G1 X140.472 Y131.111 E.03589
G1 X141.661 Y129.922 E.09207
G1 X141.005 Y129.922 E.03589
G1 X140.269 Y130.658 E.05699
M106 S196.35
; OBJECT_ID: 394
; WIPE_START
G1 X141.005 Y129.922 E-.39566
G1 X141.661 Y129.922 E-.24914
G1 X141.447 Y130.136 E-.11521
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X133.952 Y128.692 Z8 F42000
G1 X115.967 Y125.226 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.683 Y123.718 I1.478 J13.706 E.04827
G3 X116.769 Y123.797 I-.215 J10.402 E.03613
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 X115.5 Y129.354 E-.54756
G1 X116.054 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.281 Y132.566 E.02517
G3 X126.076 Y132.676 I-.177 J-.084 E.00767
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.855 Y132.674 E.32152
G3 X104.705 Y132.521 I.041 J-.189 E.00697
G1 X104.604 Y131.755 E.02375
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.203 J-.02 E.00946
G1 X114.184 Y123.408 E.31926
G3 X115.692 Y123.326 I1.533 J14.245 E.04643
G3 X116.816 Y123.408 I-.225 J10.801 E.03465
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.033 J.201 E.00946
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370014
G1 F11006.019
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 F12975.736
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 F15000
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7656.486
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 F8335.209
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 F9145.971
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 F10131.452
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 F11457.67
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y125.709 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.419667
G1 F9555.494
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 F8442.788
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 F7562.194
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.87 Y125.093 Z8 F42000
G1 X103.913 Y125.002 Z8
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F15000
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F15000
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z8 F42000
G1 X126.108 Y132.438 Z8
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F15000
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P66 R8
G1 X122.39 Y130.612 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.0657
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F15000
M204 S6000
G1 X104.892 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 39/85
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8 I.462 J1.126 P1  F42000
G1 X151.883 Y113.728 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X151.897 Y113.79 I-.187 J.074 E.00213
G1 X151.897 Y127.418 E.45203
G1 X151.897 Y127.818 E.01327
G1 F6070.344
G1 X151.897 Y128.217 E.01327
G1 F2520
G1 X151.898 Y140.782 E.4168
G1 F6070.344
G1 X151.897 Y141.182 E.01327
G1 F8843.478
G1 X151.895 Y141.582 E.01327
G1 X151.893 Y142.238 E.02176
G3 X151.702 Y142.397 I-.203 J-.05 E.00882
G1 X140.261 Y142.393 E.37951
G3 X140.102 Y142.178 I.045 J-.2 E.0097
G1 X140.102 Y128.582 E.45097
G1 X140.102 Y128.182 E.01327
G1 F6070.344
G1 X140.102 Y127.782 E.01327
G1 F2520
G1 X140.102 Y115.217 E.4168
G1 F6070.344
G1 X140.103 Y114.818 E.01327
G1 F8843.478
G1 X140.105 Y114.418 E.01327
G1 X140.107 Y113.761 E.02176
G3 X140.298 Y113.603 I.202 J.049 E.00883
G1 X151.719 Y113.604 E.37887
G1 X151.84 Y113.661 E.00441
G3 X151.853 Y113.676 I-.143 J.141 E.00067
M204 S250
G1 X152.236 Y113.558 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X152.289 Y113.771 E.00674
G1 X152.29 Y142.195 E.87338
G3 X151.726 Y142.789 I-.608 J-.012 E.02761
G1 X140.305 Y142.79 E.35094
G3 X139.71 Y142.192 I.012 J-.607 E.02866
G1 X139.71 Y113.805 E.87225
G3 X140.274 Y113.211 I.608 J.012 E.02761
G1 X151.758 Y113.213 E.35287
G3 X152.208 Y113.505 I-.066 J.595 E.01711
; WIPE_START
M204 S6000
G1 X152.289 Y113.771 E-.10557
G1 X152.289 Y115.493 E-.65444
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 39 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer39 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X151.733 Y114.544 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42702
G1 F9372.559
M204 S6000
G1 X151.126 Y113.937 E.02688
G1 X150.583 Y113.937 E.017
G1 X151.563 Y114.918 E.04341
G1 X151.563 Y115.461 E.017
G1 X150.039 Y113.937 E.06745
G1 X149.496 Y113.937 E.017
G1 X151.563 Y116.004 E.09148
G1 X151.563 Y116.547 E.017
G1 X148.953 Y113.937 E.11552
G1 X148.41 Y113.937 E.017
G1 X151.563 Y117.09 E.13956
G1 X151.562 Y117.633 E.017
G1 X147.867 Y113.937 E.16359
G1 X147.323 Y113.937 E.017
G1 X151.562 Y118.176 E.18763
G1 X151.562 Y118.719 E.017
G1 X147.094 Y114.251 E.19775
G1 X147.094 Y114.794 E.017
G1 X151.562 Y119.262 E.19774
G1 X151.562 Y119.805 E.017
G1 X147.028 Y115.271 E.20069
G1 X146.867 Y115.653 E.01298
G1 X151.561 Y120.348 E.2078
G1 X151.561 Y120.891 E.017
G1 X146.638 Y115.967 E.21794
G1 X146.502 Y116.087 E.00565
G1 X146.33 Y116.202 E.00651
G1 X151.561 Y121.434 E.23157
G1 X151.561 Y121.977 E.017
G1 X145.952 Y116.368 E.24827
G1 X145.696 Y116.429 E.00823
G1 X145.485 Y116.444 E.00662
G1 X151.561 Y122.52 E.26892
G1 X151.561 Y123.063 E.017
G1 X144.942 Y116.444 E.29295
G1 X144.399 Y116.444 E.017
G1 X151.56 Y123.606 E.31699
G1 X151.56 Y124.149 E.017
G1 X144.294 Y116.883 E.32161
G1 X144.294 Y117.426 E.017
G1 X151.56 Y124.692 E.3216
G1 X151.56 Y125.235 E.017
G1 X144.294 Y117.969 E.32159
G1 X144.294 Y118.513 E.017
G1 X151.237 Y125.456 E.30732
G1 X150.694 Y125.456 E.017
G1 X144.294 Y119.056 E.28328
G1 X144.294 Y119.599 E.017
G1 X150.151 Y125.456 E.25923
G1 X149.608 Y125.456 E.017
G1 X144.294 Y120.142 E.23519
G1 X144.294 Y120.685 E.017
G1 X149.065 Y125.456 E.21114
G1 X148.521 Y125.456 E.017
G1 X144.294 Y121.229 E.1871
G1 X144.294 Y121.772 E.017
G1 X147.978 Y125.456 E.16306
G1 X147.435 Y125.456 E.017
G1 X144.294 Y122.315 E.13901
G1 X144.294 Y122.858 E.017
G1 X146.892 Y125.456 E.11497
G2 X146.357 Y125.464 I-.215 J3.28 E.01676
G1 X144.294 Y123.401 E.0913
G1 X144.294 Y123.945 E.017
G1 X145.929 Y125.579 E.07233
G1 X145.737 Y125.662 E.00652
G1 X145.57 Y125.763 E.00614
G1 X144.294 Y124.488 E.05644
G1 X144.294 Y125.031 E.017
G1 X145.285 Y126.021 E.04383
G1 X145.164 Y126.194 E.00661
G1 X145.079 Y126.358 E.00579
G1 X144.294 Y125.574 E.03471
G1 X144.294 Y126.117 E.017
G1 X144.902 Y126.725 E.0269
; WIPE_START
G1 X144.294 Y126.117 E-.32663
G1 X144.294 Y125.574 E-.20642
G1 X144.717 Y125.997 E-.22696
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I-.867 J-.854 P1  F42000
G1 X140.443 Y130.337 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42614
M106 S255
G1 F3000
M204 S6000
G1 X140.446 Y114.891 E.48233
G1 X140.489 Y114.848 E.00189
G1 X140.489 Y114.051 E.02489
G3 X140.446 Y113.936 I.036 J-.079 E.00425
G1 X140.826 Y113.936 E.01187
G1 X140.826 Y130.167 E.50685
G1 X141.21 Y130.167 E.01197
G1 X141.21 Y113.936 E.50685
G1 X141.593 Y113.936 E.01197
G1 X141.593 Y130.167 E.50685
G1 X141.976 Y130.167 E.01197
G1 X141.976 Y113.936 E.50685
G1 X142.359 Y113.936 E.01197
G1 X142.359 Y130.167 E.50685
G1 X142.742 Y130.167 E.01197
G1 X142.742 Y113.936 E.50685
G1 X143.126 Y113.936 E.01197
G1 X143.126 Y130.167 E.50685
G1 X143.509 Y130.167 E.01197
G1 X143.509 Y113.936 E.50685
G1 X143.892 Y113.936 E.01197
G1 X143.892 Y130.167 E.50685
G1 X144.275 Y130.167 E.01197
G1 X144.275 Y126.933 E.10101
G1 X144.659 Y126.933 E.01197
G1 X144.659 Y130.167 E.10101
G1 X145.042 Y130.167 E.01197
G1 X145.042 Y126.933 E.10101
G1 X145.263 Y126.933 E.0069
G1 X145.425 Y126.508 E.01421
G1 X145.425 Y130.167 E.11428
G1 X145.614 Y130.16 E.00592
G1 X145.808 Y130.118 E.0062
G1 X145.808 Y126.057 E.1268
G1 X145.939 Y125.983 E.0047
G1 X146.191 Y125.882 E.00848
G1 X146.191 Y129.943 E.12681
G1 X146.401 Y129.768 E.00852
G1 X146.575 Y129.493 E.01016
G1 X146.575 Y125.833 E.11431
G1 X146.958 Y125.833 E.01197
G1 X146.958 Y129.067 E.10101
G1 X147.341 Y129.067 E.01197
G1 X147.341 Y125.833 E.10101
G1 X147.724 Y125.833 E.01197
G1 X147.724 Y129.237 E.10631
M106 S196.35
M204 S10000
G1 X147.875 Y130.052 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42687
G1 F9376.22
M204 S6000
G1 X147.268 Y129.444 E.02686
G1 X147.003 Y129.444 E.0083
G1 X146.922 Y129.641 E.00665
G1 X147.706 Y130.425 E.03468
G1 X147.706 Y130.968 E.01699
G1 X146.716 Y129.978 E.04379
G1 X146.598 Y130.106 E.00544
G1 X146.431 Y130.237 E.00663
G1 X147.706 Y131.511 E.05639
G1 X147.706 Y132.054 E.01699
G1 X146.072 Y130.421 E.07226
G1 X145.87 Y130.493 E.00673
G1 X145.644 Y130.536 E.00717
G1 X147.706 Y132.597 E.0912
G1 X147.706 Y133.14 E.01699
G1 X145.11 Y130.544 E.11484
G1 X144.567 Y130.544 E.01699
G1 X147.706 Y133.683 E.13886
G1 X147.706 Y134.226 E.01699
G1 X144.024 Y130.544 E.16289
G1 X143.481 Y130.544 E.01699
G1 X147.706 Y134.769 E.18691
G1 X147.706 Y135.312 E.01699
G1 X142.938 Y130.544 E.21094
G1 X142.395 Y130.544 E.01699
G1 X147.706 Y135.855 E.23496
G1 X147.706 Y136.398 E.01699
G1 X141.852 Y130.544 E.25899
G1 X141.309 Y130.544 E.01699
G1 X147.706 Y136.941 E.28301
G1 X147.706 Y137.484 E.01699
G1 X140.766 Y130.544 E.30704
G1 X140.44 Y130.544 E.01022
G1 X140.44 Y130.761 E.00677
G1 X147.706 Y138.027 E.32149
G1 X147.706 Y138.57 E.01699
G1 X140.439 Y131.304 E.3215
G1 X140.439 Y131.846 E.01698
G1 X147.706 Y139.113 E.32151
G1 X147.706 Y139.556 E.01386
G1 X147.605 Y139.556 E.00313
G1 X140.439 Y132.389 E.31709
G1 X140.439 Y132.932 E.01698
G1 X147.062 Y139.556 E.29307
G1 X146.519 Y139.556 E.01699
G1 X140.439 Y133.475 E.26906
G1 X140.438 Y134.018 E.01698
G1 X146.052 Y139.631 E.24837
G1 X145.674 Y139.796 E.0129
G1 X140.438 Y134.56 E.23166
G1 X140.438 Y135.103 E.01698
G1 X145.365 Y140.03 E.218
G1 X145.245 Y140.172 E.00582
G1 X145.135 Y140.343 E.00636
G1 X140.438 Y135.646 E.20784
G1 X140.438 Y136.189 E.01698
G1 X144.974 Y140.725 E.20071
G1 X144.917 Y140.985 E.00834
G1 X144.906 Y141.2 E.00672
G1 X140.437 Y136.731 E.1977
G1 X140.437 Y137.274 E.01698
G1 X144.906 Y141.743 E.19771
G2 X144.911 Y142.058 I2.249 J.122 E.00988
G1 X144.678 Y142.058 E.00729
G1 X140.437 Y137.817 E.18764
G1 X140.437 Y138.36 E.01698
G1 X144.134 Y142.057 E.1636
G1 X143.591 Y142.057 E.017
G1 X140.437 Y138.903 E.13956
G1 X140.436 Y139.445 E.01698
G1 X143.047 Y142.056 E.11553
G1 X142.504 Y142.056 E.017
G1 X140.436 Y139.988 E.09149
G1 X140.436 Y140.531 E.01698
G1 X141.96 Y142.055 E.06745
G1 X141.417 Y142.055 E.017
G1 X140.436 Y141.074 E.04342
G1 X140.436 Y141.616 E.01698
G1 X141.043 Y142.224 E.02689
M204 S10000
G1 X145.425 Y140.278 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42614
M106 S255
G1 F3000
M204 S6000
G1 X145.425 Y142.058 E.0556
G1 X145.808 Y142.059 E.01197
G1 X145.808 Y140.157 E.05938
G1 X145.939 Y140.083 E.0047
G1 X146.191 Y139.982 E.00848
G1 X146.191 Y142.059 E.06484
G1 X146.575 Y142.059 E.01197
G1 X146.575 Y139.933 E.06641
G1 X146.958 Y139.933 E.01197
G1 X146.958 Y142.06 E.06642
G1 X147.341 Y142.06 E.01197
G1 X147.341 Y139.933 E.06643
G1 X147.724 Y139.933 E.01197
G1 X147.724 Y142.06 E.06644
G1 X148.108 Y142.061 E.01197
G1 X148.108 Y125.833 E.50676
G1 X148.491 Y125.833 E.01197
G1 X148.491 Y142.061 E.50677
G1 X148.874 Y142.061 E.01197
G1 X148.874 Y125.833 E.50678
G1 X149.257 Y125.833 E.01197
G1 X149.257 Y142.062 E.50679
G1 X149.64 Y142.062 E.01197
G1 X149.64 Y125.833 E.5068
G1 X150.024 Y125.833 E.01197
G1 X150.024 Y142.062 E.50681
G1 X150.407 Y142.063 E.01197
G1 X150.407 Y125.833 E.50682
G1 X150.79 Y125.833 E.01197
G1 X150.79 Y142.063 E.50683
G1 X151.173 Y142.063 E.01197
G1 X151.173 Y125.833 E.50684
G1 X151.556 Y125.833 E.01197
G1 X151.556 Y142.233 E.51215
M106 S196.35
; WIPE_START
G1 X151.556 Y140.233 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.193 J-.242 P1  F42000
G1 X146.575 Y115.723 Z8.2
G1 Z7.8
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X146.575 Y113.937 E.05577
G1 X146.191 Y113.937 E.01197
G1 X146.191 Y115.843 E.05954
G1 X146.061 Y115.917 E.00468
G1 X145.808 Y116.018 E.00849
G1 X145.808 Y113.937 E.06499
G1 X145.425 Y113.937 E.01197
G1 X145.425 Y116.067 E.06654
G1 X145.042 Y116.067 E.01197
G1 X145.042 Y113.937 E.06654
G1 X144.659 Y113.937 E.01197
G1 X144.659 Y116.067 E.06654
G1 X144.275 Y116.067 E.01197
G1 X144.275 Y113.767 E.07184
M106 S196.35
; OBJECT_ID: 394
; WIPE_START
G1 X144.275 Y115.767 E-.76
; WIPE_END
M73 P67 R8
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z8.2 I-.386 J-1.154 P1  F42000
G1 X115.967 Y125.226 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.689 Y123.718 I1.474 J13.655 E.04846
G3 X116.769 Y123.797 I-.22 J10.395 E.03595
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02372
G3 X126.076 Y132.676 I-.189 J-.034 E.00916
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.854 Y132.674 E.32152
G3 X104.705 Y132.521 I.038 J-.186 E.00698
G1 X104.604 Y131.755 E.02375
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.201 J-.022 E.00949
G1 X114.184 Y123.408 E.31926
G3 X115.697 Y123.326 I1.529 J14.201 E.0466
G3 X116.816 Y123.408 I-.229 J10.79 E.03448
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.022 J.193 E.00959
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370014
G1 F11006.019
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 F12975.736
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 F15000
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7656.483
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 F8335.224
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 F9146.011
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 F10131.53
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 F11456.137
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y125.709 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.419667
G1 F9555.494
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 F8442.788
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 F7562.194
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.13 Y125.093 Z8.2 F42000
G1 X127.087 Y125.002 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F15000
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.284 Y125.706 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F15000
M204 S6000
G1 X103.913 Y125.002 E.02292
; WIPE_START
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z8.2 F42000
G1 X104.892 Y132.438 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F15000
M204 S6000
G1 X108.064 Y132.02 E.02292
; WIPE_START
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F15000
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 40/85
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
M106 S201.45
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.2 I.674 J1.013 P1  F42000
G1 X151.882 Y113.724 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X151.897 Y113.798 I-.156 J.07 E.00251
G1 X151.893 Y142.238 E.94342
G3 X151.702 Y142.397 I-.202 J-.049 E.00883
G1 X140.261 Y142.393 E.37952
G3 X140.102 Y142.177 I.045 J-.2 E.0097
G1 X140.107 Y113.762 E.9426
G3 X140.298 Y113.603 I.203 J.05 E.00882
G1 X151.719 Y113.604 E.37887
G1 X151.81 Y113.636 E.00318
G1 X151.844 Y113.678 E.0018
M204 S250
G1 X152.242 Y113.569 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X152.243 Y113.575 E.00017
G3 X152.289 Y113.774 I-.551 J.233 E.00631
G1 X152.29 Y142.195 E.8733
G3 X151.726 Y142.789 I-.608 J-.013 E.0276
G1 X140.305 Y142.79 E.35095
G3 X139.71 Y142.192 I.012 J-.607 E.02866
G1 X139.71 Y113.805 E.87225
G3 X140.274 Y113.211 I.602 J.007 E.02767
G1 X151.758 Y113.213 E.35288
G3 X152.115 Y113.385 I-.066 J.595 E.01241
G1 X152.208 Y113.52 E.00503
; WIPE_START
M204 S6000
G1 X152.243 Y113.575 E-.02481
G1 X152.289 Y113.774 E-.07764
G1 X152.289 Y115.504 E-.65755
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 40 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer40 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X140.276 Y114.54 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42503
G1 F9421.37
M204 S6000
G1 X140.88 Y113.936 E.0266
G1 X141.421 Y113.936 E.01682
G1 X140.446 Y114.911 E.04293
G1 X140.445 Y115.452 E.01683
G1 X141.961 Y113.936 E.06674
G1 X142.501 Y113.936 E.01682
G1 X140.445 Y115.993 E.09054
G1 X140.445 Y116.533 E.01683
G1 X143.042 Y113.936 E.11434
G1 X143.582 Y113.936 E.01682
G1 X140.445 Y117.074 E.13815
G1 X140.445 Y117.614 E.01683
G1 X144.122 Y113.937 E.16195
G1 X144.663 Y113.937 E.01682
G1 X140.444 Y118.155 E.18575
G1 X140.444 Y118.695 E.01683
G1 X145.203 Y113.937 E.20956
G1 X145.743 Y113.937 E.01682
G1 X140.444 Y119.236 E.23336
G1 X140.444 Y119.777 E.01683
G1 X146.284 Y113.937 E.25716
G1 X146.824 Y113.937 E.01682
G1 X140.444 Y120.317 E.28096
G1 X140.443 Y120.858 E.01683
G1 X147.365 Y113.937 E.30477
G1 X147.905 Y113.937 E.01683
G1 X140.443 Y121.398 E.32857
G1 X140.443 Y121.939 E.01683
G1 X148.445 Y113.937 E.35237
G1 X148.986 Y113.937 E.01682
G1 X140.443 Y122.48 E.37618
G1 X140.443 Y123.02 E.01683
G1 X149.526 Y113.937 E.39998
G1 X150.066 Y113.937 E.01682
G1 X140.442 Y123.561 E.42378
G1 X140.442 Y124.101 E.01683
G1 X150.607 Y113.937 E.44759
G1 X151.147 Y113.937 E.01682
G1 X140.442 Y124.642 E.47139
G1 X140.442 Y125.183 E.01683
G1 X151.564 Y114.061 E.48975
G1 X151.563 Y114.601 E.01683
G1 X140.442 Y125.723 E.48975
G1 X140.441 Y126.264 E.01683
G1 X151.563 Y115.142 E.48975
G1 X151.563 Y115.682 E.01683
G1 X140.441 Y126.804 E.48975
G1 X140.441 Y127.345 E.01683
G1 X151.563 Y116.223 E.48975
G1 X151.563 Y116.764 E.01683
G1 X140.441 Y127.886 E.48975
G1 X140.441 Y128.426 E.01683
G1 X151.563 Y117.304 E.48975
G1 X151.562 Y117.845 E.01683
G1 X140.44 Y128.967 E.48975
G1 X140.44 Y129.507 E.01683
G1 X151.562 Y118.385 E.48975
G1 X151.562 Y118.926 E.01683
G1 X140.44 Y130.048 E.48975
G1 X140.44 Y130.588 E.01683
G1 X151.562 Y119.466 E.48975
G1 X151.562 Y120.007 E.01683
G1 X140.44 Y131.129 E.48975
G1 X140.439 Y131.67 E.01683
G1 X151.561 Y120.548 E.48975
G1 X151.561 Y121.088 E.01683
G1 X140.439 Y132.21 E.48976
G1 X140.439 Y132.751 E.01683
G1 X151.561 Y121.629 E.48976
G1 X151.561 Y122.169 E.01683
G1 X140.439 Y133.291 E.48976
G1 X140.438 Y133.832 E.01683
G1 X151.561 Y122.71 E.48976
G1 X151.56 Y123.25 E.01683
G1 X140.438 Y134.373 E.48976
G1 X140.438 Y134.913 E.01683
G1 X151.56 Y123.791 E.48976
G1 X151.56 Y124.332 E.01683
G1 X140.438 Y135.454 E.48976
G1 X140.438 Y135.994 E.01683
G1 X151.56 Y124.872 E.48976
G1 X151.56 Y125.413 E.01683
G1 X140.437 Y136.535 E.48976
G1 X140.437 Y137.076 E.01683
G1 X151.559 Y125.953 E.48976
G1 X151.559 Y126.494 E.01683
G1 X140.437 Y137.616 E.48976
G1 X140.437 Y138.157 E.01683
G1 X151.559 Y127.034 E.48976
G1 X151.559 Y127.575 E.01683
G1 X140.437 Y138.697 E.48976
G1 X140.436 Y139.238 E.01683
G1 X151.559 Y128.116 E.48977
G1 X151.559 Y128.656 E.01683
G1 X140.436 Y139.779 E.48977
G1 X140.436 Y140.319 E.01683
G1 X151.558 Y129.197 E.48977
G1 X151.558 Y129.737 E.01683
G1 X140.436 Y140.86 E.48977
G1 X140.436 Y141.4 E.01683
G1 X151.558 Y130.278 E.48977
G1 X151.558 Y130.818 E.01683
G1 X140.435 Y141.941 E.48977
G1 X140.435 Y142.054 E.00352
G1 X140.862 Y142.054 E.01329
G1 X151.558 Y131.359 E.47096
G1 X151.557 Y131.9 E.01683
G1 X141.402 Y142.055 E.44718
G1 X141.942 Y142.055 E.01681
G1 X151.557 Y132.44 E.4234
G1 X151.557 Y132.981 E.01683
G1 X142.482 Y142.056 E.39961
G1 X143.022 Y142.056 E.01681
G1 X151.557 Y133.521 E.37583
G1 X151.557 Y134.062 E.01683
G1 X143.562 Y142.057 E.35205
G1 X144.102 Y142.057 E.01681
G1 X151.556 Y134.602 E.32826
G1 X151.556 Y135.143 E.01683
G1 X144.642 Y142.058 E.30448
G1 X145.182 Y142.058 E.01681
M73 P68 R8
G1 X151.556 Y135.684 E.2807
G1 X151.556 Y136.224 E.01683
G1 X145.722 Y142.059 E.25691
G1 X146.261 Y142.059 E.01681
G1 X151.556 Y136.765 E.23313
G1 X151.556 Y137.305 E.01683
G1 X146.801 Y142.059 E.20935
G1 X147.341 Y142.06 E.01681
G1 X151.555 Y137.846 E.18556
G1 X151.555 Y138.387 E.01683
G1 X147.881 Y142.06 E.16178
G1 X148.421 Y142.061 E.01681
G1 X151.555 Y138.927 E.138
G1 X151.555 Y139.468 E.01683
G1 X148.961 Y142.061 E.11421
G1 X149.501 Y142.062 E.01681
G1 X151.555 Y140.008 E.09043
G1 X151.554 Y140.549 E.01683
G1 X150.041 Y142.062 E.06665
G1 X150.581 Y142.063 E.01681
G1 X151.554 Y141.089 E.04286
G1 X151.554 Y141.63 E.01683
G1 X150.951 Y142.233 E.02654
; OBJECT_ID: 394
; WIPE_START
G1 X151.554 Y141.63 E-.32395
G1 X151.554 Y141.089 E-.20542
G1 X151.125 Y141.519 E-.23063
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z8.4 I.512 J-1.104 P1  F42000
G1 X115.967 Y125.226 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.694 Y123.718 I1.47 J13.606 E.04864
G3 X116.769 Y123.797 I-.226 J10.402 E.03577
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
M73 P68 R7
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.077 Y132.676 I-.191 J-.036 E.0091
G1 X115.77 Y131.319 E.31943
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.924 Y132.676 E.31942
G1 X104.823 Y132.665 E.00311
G1 X104.75 Y132.614 E.00273
G3 X104.705 Y132.52 I.179 J-.144 E.00324
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.194 J-.027 E.00956
G1 X114.184 Y123.408 E.31925
G3 X115.703 Y123.326 I1.525 J14.146 E.04677
G3 X116.816 Y123.408 I-.235 J10.796 E.03432
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419667
G1 F9555.494
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 F8442.788
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 F7562.194
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.370014
G1 F11006.019
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 F12975.736
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 F15000
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7656.483
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 F8335.224
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 F9146.011
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 F10131.53
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 F11456.137
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.758 Y131.349 Z8.4 F42000
G1 X126.108 Y132.438 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F15000
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F15000
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z8.4 F42000
G1 X103.913 Y125.002 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F15000
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F15000
M204 S6000
G1 X127.087 Y125.002 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 41/85
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.4 I.464 J1.125 P1  F42000
G1 X151.855 Y113.7 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X151.884 Y113.791 I-.157 J.101 E.0032
G1 X151.881 Y142.236 E.94357
G3 X151.702 Y142.384 I-.19 J-.048 E.00826
G1 X140.264 Y142.381 E.3794
G3 X140.115 Y142.178 I.043 J-.188 E.00912
G1 X140.119 Y113.764 E.94253
G3 X140.298 Y113.616 I.19 J.048 E.00826
G1 X151.718 Y113.616 E.37879
G1 X151.802 Y113.647 E.00298
G3 X151.814 Y113.655 I-.104 J.155 E.0005
M204 S250
G1 X152.225 Y113.569 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X152.276 Y113.772 E.00644
G1 X152.277 Y142.195 E.87336
G3 X151.726 Y142.776 I-.589 J-.007 E.02708
G1 X140.305 Y142.777 E.35091
G3 X139.723 Y142.192 I.012 J-.594 E.02805
G1 X139.723 Y113.805 E.87224
G3 X140.274 Y113.224 I.589 J.006 E.02708
G1 X151.756 Y113.226 E.35281
G3 X152.197 Y113.516 I-.07 J.588 E.01681
; WIPE_START
M204 S6000
G1 X152.276 Y113.772 E-.10184
G1 X152.276 Y115.504 E-.65816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 41 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer41 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X151.72 Y114.552 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42465
G1 F9430.749
M204 S6000
G1 X151.118 Y113.95 E.02649
G1 X150.578 Y113.95 E.01679
G1 X151.551 Y114.922 E.04277
G1 X151.55 Y115.462 E.01679
G1 X150.038 Y113.95 E.06651
G1 X149.499 Y113.95 E.01679
G1 X151.55 Y116.001 E.09026
G1 X151.55 Y116.541 E.01679
G1 X148.959 Y113.949 E.114
G1 X148.419 Y113.949 E.01679
G1 X151.55 Y117.081 E.13774
G1 X151.55 Y117.62 E.01679
G1 X147.879 Y113.949 E.16148
G1 X147.339 Y113.949 E.01679
G1 X151.55 Y118.16 E.18522
G1 X151.549 Y118.7 E.01679
G1 X146.799 Y113.949 E.20897
G1 X146.259 Y113.949 E.01679
G1 X151.549 Y119.239 E.23271
G1 X151.549 Y119.779 E.01679
G1 X145.719 Y113.949 E.25645
G1 X145.18 Y113.949 E.01679
G1 X151.549 Y120.319 E.28019
G1 X151.549 Y120.858 E.01679
G1 X144.64 Y113.949 E.30393
G1 X144.1 Y113.949 E.01679
G1 X151.549 Y121.398 E.32768
G1 X151.548 Y121.938 E.01679
G1 X143.56 Y113.949 E.35142
G1 X143.02 Y113.949 E.01679
G1 X151.548 Y122.477 E.37516
G1 X151.548 Y123.017 E.01679
G1 X142.48 Y113.949 E.3989
G1 X141.94 Y113.949 E.01679
G1 X151.548 Y123.557 E.42264
G1 X151.548 Y124.096 E.01679
G1 X141.4 Y113.949 E.44639
G1 X140.861 Y113.949 E.01679
G1 X151.547 Y124.636 E.47013
G1 X151.547 Y125.176 E.01679
G1 X140.458 Y114.086 E.48782
G1 X140.458 Y114.626 E.01679
G1 X151.547 Y125.715 E.48782
G1 X151.547 Y126.255 E.01679
G1 X140.458 Y115.166 E.48782
G1 X140.458 Y115.705 E.01679
G1 X151.547 Y126.795 E.48782
G1 X151.547 Y127.334 E.01679
G1 X140.457 Y116.245 E.48782
G1 X140.457 Y116.785 E.01679
G1 X151.546 Y127.874 E.48783
G1 X151.546 Y128.414 E.01679
G1 X140.457 Y117.324 E.48783
G1 X140.457 Y117.864 E.01679
G1 X151.546 Y128.953 E.48783
G1 X151.546 Y129.493 E.01679
G1 X140.457 Y118.404 E.48783
G1 X140.456 Y118.943 E.01679
G1 X151.546 Y130.033 E.48783
G1 X151.546 Y130.572 E.01679
G1 X140.456 Y119.483 E.48783
G1 X140.456 Y120.023 E.01679
G1 X151.545 Y131.112 E.48783
G1 X151.545 Y131.652 E.01679
G1 X140.456 Y120.562 E.48783
G1 X140.456 Y121.102 E.01679
G1 X151.545 Y132.191 E.48783
G1 X151.545 Y132.731 E.01679
G1 X140.455 Y121.642 E.48783
G1 X140.455 Y122.181 E.01679
G1 X151.545 Y133.271 E.48783
G1 X151.544 Y133.81 E.01679
G1 X140.455 Y122.721 E.48783
G1 X140.455 Y123.261 E.01679
G1 X151.544 Y134.35 E.48784
G1 X151.544 Y134.89 E.01679
G1 X140.455 Y123.8 E.48784
G1 X140.454 Y124.34 E.01679
G1 X151.544 Y135.429 E.48784
G1 X151.544 Y135.969 E.01679
G1 X140.454 Y124.88 E.48784
G1 X140.454 Y125.419 E.01679
G1 X151.544 Y136.509 E.48784
G1 X151.543 Y137.048 E.01679
G1 X140.454 Y125.959 E.48784
G1 X140.454 Y126.499 E.01679
G1 X151.543 Y137.588 E.48784
G1 X151.543 Y138.128 E.01679
G1 X140.453 Y127.038 E.48784
G1 X140.453 Y127.578 E.01679
G1 X151.543 Y138.668 E.48784
G1 X151.543 Y139.207 E.01679
G1 X140.453 Y128.118 E.48784
G1 X140.453 Y128.657 E.01679
G1 X151.543 Y139.747 E.48784
G1 X151.542 Y140.287 E.01679
G1 X140.453 Y129.197 E.48784
M73 P69 R7
G1 X140.453 Y129.736 E.01679
G1 X151.542 Y140.826 E.48784
G1 X151.542 Y141.366 E.01679
G1 X140.452 Y130.276 E.48785
G1 X140.452 Y130.816 E.01679
G1 X151.542 Y141.906 E.48785
G1 X151.542 Y142.051 E.00452
G1 X151.147 Y142.051 E.01228
G1 X140.452 Y131.355 E.47048
G1 X140.452 Y131.895 E.01679
G1 X150.607 Y142.05 E.44672
G1 X150.066 Y142.05 E.01681
G1 X140.452 Y132.435 E.42297
G1 X140.451 Y132.974 E.01679
G1 X149.526 Y142.049 E.39921
G1 X148.986 Y142.049 E.01681
G1 X140.451 Y133.514 E.37545
G1 X140.451 Y134.054 E.01679
G1 X148.446 Y142.048 E.35169
G1 X147.905 Y142.048 E.01681
G1 X140.451 Y134.593 E.32793
G1 X140.451 Y135.133 E.01679
G1 X147.365 Y142.047 E.30417
G1 X146.825 Y142.047 E.01681
G1 X140.45 Y135.673 E.28041
G1 X140.45 Y136.212 E.01679
G1 X146.284 Y142.047 E.25665
G1 X145.744 Y142.046 E.01681
G1 X140.45 Y136.752 E.23289
G1 X140.45 Y137.292 E.01679
G1 X145.204 Y142.046 E.20914
G1 X144.664 Y142.045 E.01681
G1 X140.45 Y137.831 E.18538
G1 X140.449 Y138.371 E.01679
G1 X144.123 Y142.045 E.16162
G1 X143.583 Y142.044 E.01681
G1 X140.449 Y138.911 E.13786
G1 X140.449 Y139.45 E.01679
G1 X143.043 Y142.044 E.1141
G1 X142.502 Y142.044 E.01681
G1 X140.449 Y139.99 E.09034
G1 X140.449 Y140.53 E.01679
G1 X141.962 Y142.043 E.06658
G1 X141.422 Y142.043 E.01681
G1 X140.448 Y141.069 E.04282
G1 X140.448 Y141.609 E.01679
G1 X141.051 Y142.212 E.02654
; OBJECT_ID: 394
; WIPE_START
G1 X140.448 Y141.609 E-.32416
G1 X140.448 Y141.069 E-.20507
G1 X140.878 Y141.499 E-.23077
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.488 Y137.324 Z8.6 F42000
G1 X115.967 Y125.226 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.7 Y123.718 I1.467 J13.556 E.04882
G3 X116.769 Y123.797 I-.232 J10.402 E.03558
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.31 E.02083
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 X115.5 Y129.354 E-.54756
G1 X116.054 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G1 X126.268 Y132.59 E.00232
G3 X126.077 Y132.676 I-.161 J-.103 E.00681
G1 X115.77 Y131.319 E.31943
G2 X115.232 Y131.319 I-.27 J2.786 E.01655
G1 X104.923 Y132.676 E.3195
G1 X104.825 Y132.666 E.00303
G1 X104.751 Y132.615 E.00276
G3 X104.705 Y132.521 I.201 J-.156 E.00325
G1 X104.604 Y131.755 E.02375
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02328
G3 X103.883 Y124.764 I.193 J-.028 E.00958
G1 X114.184 Y123.408 E.31925
G3 X115.708 Y123.326 I1.521 J14.096 E.04694
G3 X116.816 Y123.408 I-.241 J10.797 E.03415
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.023 J.193 E.00958
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419667
G1 F9555.494
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 F8442.788
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 F7562.194
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.370014
G1 F11006.019
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 F12975.736
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 F15000
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7656.486
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 F8335.209
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 F9145.971
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 F10131.452
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 F11457.67
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.0657
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F15000
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z8.6 F42000
G1 X127.087 Y125.002 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.130856
G1 F15000
M204 S6000
G1 X123.915 Y124.585 E.02293
; WIPE_START
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.284 Y125.706 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F15000
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z8.6 F42000
G1 X104.892 Y132.438 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.130854
G1 F15000
M204 S6000
G1 X108.064 Y132.02 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 42/85
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 405
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z8.6 I.456 J1.128 P1  F42000
G1 X152.132 Y113.663 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X152.134 Y113.668 E.00018
G3 X152.154 Y113.805 I-.436 J.134 E.00427
G1 X152.154 Y142.195 E.87232
G3 X151.72 Y142.654 I-.469 J-.009 E.02132
G1 X140.305 Y142.654 E.35074
G3 X139.846 Y142.192 I.009 J-.468 E.02216
G1 X139.846 Y113.805 E.87224
G3 X140.28 Y113.346 I.469 J.009 E.02132
G1 X151.744 Y113.348 E.35225
G3 X152.051 Y113.512 I-.046 J.454 E.01097
G1 X152.103 Y113.61 E.00342
; WIPE_START
M204 S6000
G1 X152.134 Y113.668 E-.025
G1 X152.154 Y113.805 E-.05265
G1 X152.154 Y115.601 E-.68235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 42 start: 394,405
M624 AwAAAAAAAAA=
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


; object ids of this layer42 end: 394,405
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X151.551 Y142.446 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X151.947 Y142.05 E.01722
G1 X151.947 Y141.517
G1 X151.018 Y142.446 E.04039
G1 X150.484 Y142.446
G1 X151.947 Y140.984 E.06357
G1 X151.947 Y140.45
G1 X149.951 Y142.446 E.08674
G1 X149.418 Y142.446
G1 X151.947 Y139.917 E.10992
G1 X151.947 Y139.384
G1 X148.884 Y142.446 E.13309
G1 X148.351 Y142.446
G1 X151.947 Y138.85 E.15626
G1 X151.947 Y138.317
G1 X147.818 Y142.447 E.17944
G1 X147.284 Y142.447
G1 X151.947 Y137.784 E.20261
G1 X151.947 Y137.251
G1 X146.751 Y142.447 E.22579
G1 X146.218 Y142.447
G1 X151.947 Y136.717 E.24896
G1 X151.947 Y136.184
G1 X145.685 Y142.447 E.27214
G1 X145.151 Y142.447
G1 X151.947 Y135.651 E.29531
G1 X151.947 Y135.118
G1 X144.618 Y142.447 E.31848
G1 X144.085 Y142.447
G1 X151.947 Y134.584 E.34166
G1 X151.947 Y134.051
G1 X143.551 Y142.447 E.36483
G1 X143.018 Y142.447
G1 X151.947 Y133.518 E.38801
G1 X151.947 Y132.985
G1 X142.485 Y142.447 E.41118
G1 X141.952 Y142.447
G1 X151.947 Y132.451 E.43436
G1 X151.947 Y131.918
G1 X141.418 Y142.447 E.45753
G1 X140.885 Y142.447
G1 X151.947 Y131.385 E.4807
G1 X151.947 Y130.852
G1 X140.352 Y142.447 E.50388
G1 X140.057 Y142.208
G1 X151.947 Y130.318 E.51666
G1 X151.947 Y129.785
G1 X140.053 Y141.679 E.51686
G1 X140.053 Y141.146
G1 X151.947 Y129.252 E.51686
G1 X151.947 Y128.719
G1 X140.053 Y140.613 E.51686
G1 X140.053 Y140.079
G1 X151.947 Y128.185 E.51686
G1 X151.947 Y127.652
G1 X140.053 Y139.546 E.51686
G1 X140.053 Y139.013
G1 X151.947 Y127.119 E.51686
G1 X151.947 Y126.586
G1 X140.053 Y138.48 E.51686
G1 X140.053 Y137.946
G1 X151.947 Y126.052 E.51686
G1 X151.947 Y125.519
G1 X140.053 Y137.413 E.51686
G1 X140.053 Y136.88
G1 X151.947 Y124.986 E.51686
G1 X151.947 Y124.453
G1 X140.053 Y136.347 E.51686
G1 X140.053 Y135.813
G1 X151.947 Y123.919 E.51686
G1 X151.947 Y123.386
G1 X140.053 Y135.28 E.51686
G1 X140.053 Y134.747
G1 X151.947 Y122.853 E.51686
G1 X151.947 Y122.32
G1 X140.053 Y134.214 E.51686
G1 X140.053 Y133.68
G1 X151.947 Y121.786 E.51686
G1 X151.947 Y121.253
G1 X140.053 Y133.147 E.51686
G1 X140.053 Y132.614
G1 X151.947 Y120.72 E.51686
G1 X151.947 Y120.186
G1 X140.053 Y132.081 E.51686
G1 X140.053 Y131.547
G1 X151.947 Y119.653 E.51686
G1 X151.947 Y119.12
G1 X140.053 Y131.014 E.51686
G1 X140.053 Y130.481
G1 X151.947 Y118.587 E.51686
G1 X151.947 Y118.053
G1 X140.053 Y129.948 E.51686
G1 X140.053 Y129.414
G1 X151.947 Y117.52 E.51686
G1 X151.947 Y116.987
G1 X140.053 Y128.881 E.51686
G1 X140.053 Y128.348
G1 X151.947 Y116.454 E.51686
G1 X151.947 Y115.92
G1 X140.053 Y127.815 E.51686
M73 P70 R7
G1 X140.053 Y127.281
G1 X151.947 Y115.387 E.51686
G1 X151.947 Y114.854
G1 X140.053 Y126.748 E.51686
G1 X140.053 Y126.215
G1 X151.947 Y114.321 E.51686
G1 X151.943 Y113.792
G1 X140.053 Y125.682 E.51668
G1 X140.053 Y125.148
G1 X151.646 Y113.555 E.50377
G1 X151.113 Y113.555
G1 X140.053 Y124.615 E.4806
G1 X140.053 Y124.082
G1 X150.58 Y113.555 E.45743
G1 X150.046 Y113.555
G1 X140.053 Y123.548 E.43426
G1 X140.053 Y123.015
G1 X149.513 Y113.555 E.41109
G1 X148.98 Y113.555
G1 X140.053 Y122.482 E.38792
G1 X140.053 Y121.949
G1 X148.447 Y113.555 E.36475
G1 X147.914 Y113.555
G1 X140.053 Y121.415 E.34158
G1 X140.053 Y120.882
G1 X147.38 Y113.555 E.31841
G1 X146.847 Y113.555
G1 X140.053 Y120.349 E.29524
G1 X140.053 Y119.816
G1 X146.314 Y113.555 E.27208
G1 X145.781 Y113.554
G1 X140.053 Y119.282 E.24891
G1 X140.053 Y118.749
G1 X145.248 Y113.554 E.22574
G1 X144.714 Y113.554
G1 X140.053 Y118.216 E.20257
G1 X140.053 Y117.683
G1 X144.181 Y113.554 E.1794
G1 X143.648 Y113.554
G1 X140.053 Y117.149 E.15623
G1 X140.053 Y116.616
G1 X143.115 Y113.554 E.13306
G1 X142.582 Y113.554
G1 X140.053 Y116.083 E.10989
G1 X140.053 Y115.55
G1 X142.049 Y113.554 E.08672
G1 X141.515 Y113.554
G1 X140.053 Y115.016 E.06355
G1 X140.053 Y114.483
G1 X140.982 Y113.554 E.04038
G1 X140.449 Y113.554
G1 X140.053 Y113.95 E.01721
; WIPE_START
M204 S6000
G1 X140.449 Y113.554 E-.21285
G1 X140.982 Y113.554 E-.20261
G1 X140.341 Y114.195 E-.34454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.953 Y113.632 Z8.8 F42000
G1 X148.69 Y113.578 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126795
G1 F15000
M204 S6000
G1 X148.47 Y113.578 E.00151
; WIPE_START
G1 X148.69 Y113.578 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.943 Y113.77 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.113968
G1 F15000
M204 S6000
G2 X151.801 Y113.612 I-.415 J.23 E.00124
; LINE_WIDTH: 0.1412
G1 X151.78 Y113.613 E.00017
G1 X151.776 Y113.685 E.00058
; OBJECT_ID: 394
; WIPE_START
G1 X151.78 Y113.613 E-.59143
G1 X151.801 Y113.612 E-.16857
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X144.54 Y115.965 Z8.8 F42000
G1 X115.967 Y125.226 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.705 Y123.718 I1.463 J13.502 E.04901
G3 X116.769 Y123.797 I-.237 J10.4 E.0354
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.812 Y130.929 E.2325
G2 X115.183 Y130.93 I-.311 J3.781 E.02089
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.19 J-.035 E.00915
G1 X115.768 Y131.319 E.31945
G2 X115.23 Y131.319 I-.268 J3.211 E.01656
G1 X104.855 Y132.674 E.32152
G3 X104.705 Y132.52 I.04 J-.189 E.00701
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.193 J-.029 E.00959
G1 X114.184 Y123.408 E.31925
G3 X115.714 Y123.326 I1.517 J14.049 E.04711
G3 X116.816 Y123.408 I-.246 J10.794 E.03397
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.023 J.193 E.00959
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
M204 S10000
G1 X115.5 Y125.709 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.419667
G1 F9555.494
M204 S6000
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 F8442.788
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 F7562.194
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X115.5 Y125.709 F42000
; LINE_WIDTH: 0.370014
G1 F11006.019
M204 S6000
G1 X115.5 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 F12975.736
G1 X115.5 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 F15000
G1 X115.5 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X115.5 Y127.035 E.00142
; WIPE_START
G1 X115.5 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y128.157 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.51311
G1 F7656.483
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 F8335.224
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 F9146.011
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 F10131.53
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 F11456.137
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z8.8 F42000
M73 P71 R7
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F15000
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z8.8 F42000
G1 X103.913 Y125.002 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.130827
G1 F15000
M204 S6000
G1 X107.085 Y124.585 E.02292
; WIPE_START
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F15000
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z8.8 F42000
G1 X126.108 Y132.438 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F15000
M204 S6000
G1 X122.936 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 43/85
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z8.8 I.753 J-.956 P1  F42000
G1 X115.967 Y125.226 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.922 Y123.723 I1.41 J12.814 E.05619
G3 X116.769 Y123.797 I-.426 J9.736 E.02822
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.189 J-.034 E.00916
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.854 Y132.674 E.32152
G3 X104.705 Y132.52 I.041 J-.189 E.00701
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.198 J-.025 E.00953
G1 X114.184 Y123.408 E.31925
G3 X115.939 Y123.331 I1.463 J13.335 E.05402
G3 X116.816 Y123.408 I-.441 J10.082 E.02706
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.022 J.193 E.00959
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 43 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer43 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2430
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z9 F42000
G1 X127.087 Y125.002 Z9
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2430
M204 S6000
G1 X123.915 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.817 Y127.694 Z9 F42000
G1 X108.064 Y132.02 Z9
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.130853
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 44/85
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z9 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.717 Y123.718 I1.456 J13.414 E.04938
G3 X116.769 Y123.797 I-.25 J10.412 E.03503
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F2443
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54756
G1 X116.054 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2443
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.076 Y132.676 I-.184 J-.051 E.00861
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.924 Y132.676 E.3194
G1 X104.824 Y132.665 E.00309
G1 X104.751 Y132.615 E.00272
G3 X104.705 Y132.52 I.178 J-.145 E.00329
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.192 J-.029 E.00959
G1 X114.184 Y123.408 E.31925
G3 X115.725 Y123.326 I1.511 J13.961 E.04745
G3 X116.816 Y123.408 I-.257 J10.797 E.03364
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.023 J.193 E.00958
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 44 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer44 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2443
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2443
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.87 Y125.093 Z9.2 F42000
G1 X103.913 Y125.002 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2443
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
M73 P72 R7
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130828
G1 F2443
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z9.2 F42000
G1 X126.108 Y132.438 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2443
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.0657
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P72 R6
G1 X108.064 Y132.02 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F2443
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 45/85
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z9.2 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.722 Y123.719 I1.453 J13.374 E.04956
G3 X116.769 Y123.797 I-.255 J10.41 E.03485
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.077 Y132.676 I-.185 J-.051 E.00857
G1 X115.77 Y131.319 E.31943
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.923 Y132.676 E.31943
G1 X104.826 Y132.666 E.003
G1 X104.751 Y132.615 E.00278
G3 X104.705 Y132.521 I.199 J-.155 E.00326
G1 X104.604 Y131.755 E.02375
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.193 J-.029 E.00959
G1 X114.184 Y123.408 E.31925
G3 X115.731 Y123.327 I1.508 J13.921 E.04762
G3 X116.816 Y123.408 I-.264 J10.804 E.03347
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.023 J.194 E.00959
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 45 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer45 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2430
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z9.4 F42000
G1 X127.087 Y125.002 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2430
M204 S6000
G1 X123.915 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.817 Y127.694 Z9.4 F42000
G1 X108.064 Y132.02 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.130854
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 46/85
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z9.4 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.728 Y123.719 I1.45 J13.337 E.04974
G3 X116.769 Y123.797 I-.262 J10.424 E.03466
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
M73 P73 R6
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F2443
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.19 Y130.929 I-.318 J3.309 E.02083
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2443
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.281 Y132.566 E.02517
G3 X126.076 Y132.676 I-.177 J-.084 E.00764
G1 X115.77 Y131.319 E.31942
G2 X115.232 Y131.319 I-.27 J2.784 E.01655
G1 X104.855 Y132.674 E.32159
G3 X104.705 Y132.52 I.04 J-.189 E.00701
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.196 J-.026 E.00954
G1 X114.184 Y123.408 E.31925
G3 X115.736 Y123.327 I1.505 J13.883 E.04779
G3 X116.816 Y123.408 I-.27 J10.818 E.03329
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.03 J.2 E.0095
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 46 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer46 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2443
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2443
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.87 Y125.093 Z9.6 F42000
G1 X103.913 Y125.002 Z9.6
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.130839
G1 F2443
M204 S6000
G1 X107.085 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2443
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z9.6 F42000
G1 X126.108 Y132.438 Z9.6
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F2443
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2443
M204 S6000
G1 X104.892 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 47/85
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z9.6 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.733 Y123.719 I1.447 J13.298 E.04993
G3 X116.769 Y123.797 I-.268 J10.435 E.03448
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F2443
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.812 Y130.929 E.23251
G2 X115.183 Y130.93 I-.311 J3.725 E.02088
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54756
G1 X116.054 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2443
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.076 Y132.676 I-.184 J-.051 E.0086
G1 X115.768 Y131.319 E.31945
G2 X115.23 Y131.319 I-.268 J3.156 E.01656
G1 X104.855 Y132.674 E.32152
G3 X104.705 Y132.52 I.04 J-.189 E.00701
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.192 J-.029 E.00959
G1 X114.184 Y123.408 E.31925
G3 X115.742 Y123.327 I1.502 J13.843 E.04796
G3 X116.816 Y123.408 I-.277 J10.828 E.03312
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.024 J.195 E.00956
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 47 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer47 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2443
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2443
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.13 Y125.093 Z9.8 F42000
G1 X127.087 Y125.002 Z9.8
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2443
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.284 Y125.706 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2443
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z9.8 F42000
G1 X104.892 Y132.438 Z9.8
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.130842
G1 F2443
M204 S6000
G1 X108.064 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P74 R6
G1 F2443
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.0657
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F2443
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 48/85
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z9.8 I.789 J-.926 P1  F42000
G1 X115.967 Y125.226 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2442
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.739 Y123.719 I1.444 J13.264 E.05011
G3 X116.769 Y123.797 I-.275 J10.441 E.0343
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F2442
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2442
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02429
G3 X126.076 Y132.676 I-.184 J-.051 E.0086
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.854 Y132.674 E.32152
G3 X104.705 Y132.522 I.039 J-.188 E.00693
G1 X104.604 Y131.755 E.02379
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.195 J-.027 E.00957
G1 X114.184 Y123.408 E.31925
G3 X115.747 Y123.327 I1.499 J13.808 E.04813
G3 X116.816 Y123.408 I-.283 J10.834 E.03296
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.024 J.195 E.00957
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 48 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer48 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2442
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2442
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.87 Y125.093 Z10 F42000
G1 X103.913 Y125.002 Z10
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.130839
G1 F2442
M204 S6000
G1 X107.085 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2442
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F2442
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z10 F42000
G1 X126.108 Y132.438 Z10
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F2442
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2442
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2442
M204 S6000
G1 X104.892 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 49/85
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z10 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.744 Y123.719 I1.442 J13.234 E.05029
G3 X116.769 Y123.797 I-.282 J10.466 E.03411
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.31 E.02083
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.076 Y132.676 I-.185 J-.052 E.0086
G1 X115.77 Y131.319 E.3194
G2 X115.232 Y131.319 I-.27 J2.787 E.01655
G1 X104.924 Y132.676 E.31947
G1 X104.811 Y132.66 E.00353
G3 X104.705 Y132.521 I.087 J-.175 E.00556
G1 X104.604 Y131.755 E.02374
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.195 J-.027 E.00957
G1 X114.184 Y123.408 E.31925
G3 X115.753 Y123.327 I1.497 J13.778 E.0483
G3 X116.816 Y123.408 I-.29 J10.848 E.03279
G1 X127.117 Y124.764 E.31925
M73 P75 R6
G3 X127.287 Y124.986 I-.024 J.195 E.00957
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 49 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer49 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2430
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z10.2 F42000
G1 X127.087 Y125.002 Z10.2
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2430
M204 S6000
G1 X123.915 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.817 Y127.694 Z10.2 F42000
G1 X108.064 Y132.02 Z10.2
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.130854
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 50/85
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z10.2 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.75 Y123.719 I1.44 J13.203 E.05048
G3 X116.769 Y123.797 I-.289 J10.477 E.03393
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F2443
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54756
G1 X116.054 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2443
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.077 Y132.676 I-.185 J-.053 E.00857
G1 X115.77 Y131.319 E.31942
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.895 Y132.678 E.3203
G3 X104.705 Y132.522 I-.001 J-.192 E.00817
G1 X104.604 Y131.755 E.02379
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.198 J-.024 E.00952
G1 X114.184 Y123.408 E.31925
G3 X115.758 Y123.327 I1.494 J13.747 E.04847
G3 X116.816 Y123.408 I-.298 J10.874 E.03261
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.021 J.192 E.00961
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 50 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer50 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2443
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2443
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.87 Y125.093 Z10.4 F42000
G1 X103.913 Y125.002 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F2443
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130836
G1 F2443
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z10.4 F42000
G1 X126.108 Y132.438 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2443
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.0657
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130855
G1 F2443
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 51/85
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z10.4 I.739 J.967 P1  F42000
M73 P76 R6
G1 X115.967 Y125.226 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.755 Y123.719 I1.437 J13.171 E.05066
G3 X116.769 Y123.797 I-.296 J10.496 E.03375
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P76 R5
G1 X114.131 Y129.534 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23236
G2 X115.19 Y130.929 I-.318 J3.31 E.02083
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.192 J-.037 E.0091
G1 X115.77 Y131.319 E.31942
G2 X115.232 Y131.319 I-.27 J2.786 E.01655
G1 X104.855 Y132.674 E.32159
G3 X104.705 Y132.522 I.041 J-.189 E.00693
G1 X104.604 Y131.755 E.02379
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02328
G3 X103.883 Y124.764 I.192 J-.029 E.00959
G1 X114.184 Y123.408 E.31925
G3 X115.764 Y123.327 I1.492 J13.714 E.04864
G3 X116.816 Y123.408 I-.305 J10.892 E.03244
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.024 J.195 E.00957
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 51 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer51 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130828
G1 F2430
M204 S6000
G1 X103.913 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z10.6 F42000
G1 X127.087 Y125.002 Z10.6
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2430
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.817 Y127.694 Z10.6 F42000
G1 X108.064 Y132.02 Z10.6
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.130853
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 52/85
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z10.6 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.761 Y123.719 I1.435 J13.147 E.05084
G3 X116.769 Y123.797 I-.304 J10.521 E.03356
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.812 Y130.929 E.23252
G2 X115.183 Y130.93 I-.311 J3.662 E.02088
G1 X108.239 Y131.844 E.23235
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54756
G1 X116.054 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.282 Y132.564 E.02513
G3 X126.076 Y132.676 I-.178 J-.083 E.00769
G1 X115.768 Y131.319 E.31947
G2 X115.23 Y131.319 I-.268 J3.102 E.01656
G1 X104.924 Y132.676 E.3194
G1 X104.823 Y132.665 E.00314
G1 X104.739 Y132.601 E.00323
G3 X104.705 Y132.52 I.181 J-.125 E.00273
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.195 J-.027 E.00957
G1 X114.184 Y123.408 E.31925
G3 X115.769 Y123.327 I1.49 J13.689 E.04881
G3 X116.816 Y123.408 I-.313 J10.915 E.03228
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.024 J.195 E.00956
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 52 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer52 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X108.716 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
M73 P77 R5
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F2430
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.0657
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z10.8 F42000
G1 X103.913 Y125.002 Z10.8
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2430
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.183 Y127.694 Z10.8 F42000
G1 X122.936 Y132.02 Z10.8
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 53/85
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z10.8 I.789 J-.926 P1  F42000
G1 X115.967 Y125.226 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.766 Y123.72 I1.433 J13.12 E.05103
G3 X116.769 Y123.797 I-.312 J10.544 E.03338
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.817 Y130.93 E.23235
G2 X115.183 Y130.93 I-.317 J4.251 E.02103
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54754
G1 X116.054 Y129.427 E-.21246
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.189 J-.034 E.00917
G1 X115.77 Y131.319 E.3194
G2 X115.23 Y131.319 I-.27 J3.667 E.01661
G1 X104.924 Y132.676 E.3194
G1 X104.81 Y132.66 E.00353
G3 X104.705 Y132.52 I.082 J-.172 E.00559
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.192 J-.029 E.0096
G1 X114.184 Y123.408 E.31925
G3 X115.775 Y123.328 I1.487 J13.656 E.04898
G3 X116.816 Y123.408 I-.32 J10.934 E.03211
G1 X127.117 Y124.764 E.31924
G3 X127.287 Y124.986 I-.03 J.2 E.0095
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 53 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer53 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513105
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474819
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436533
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398246
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357154
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.44
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.121749
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.1714
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221051
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270703
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320354
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370005
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419657
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.469308
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518959
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00648
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00648
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130827
G1 F2430
M204 S6000
G1 X103.913 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z11 F42000
G1 X127.087 Y125.002 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2430
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.817 Y127.694 Z11 F42000
G1 X108.064 Y132.02 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 54/85
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z11 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.772 Y123.72 I1.432 J13.098 E.05121
G3 X116.769 Y123.797 I-.321 J10.579 E.0332
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.812 Y130.929 E.23253
G2 X115.19 Y130.929 I-.312 J2.99 E.02067
M73 P78 R5
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.076 Y132.676 I-.185 J-.051 E.0086
G1 X115.768 Y131.319 E.31945
G2 X115.232 Y131.319 I-.268 J2.5 E.0165
G1 X104.896 Y132.678 E.32035
G3 X104.705 Y132.52 I-.002 J-.192 E.00828
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.192 J-.029 E.00958
G1 X114.184 Y123.408 E.31926
G3 X115.78 Y123.328 I1.486 J13.634 E.04915
G3 X116.816 Y123.408 I-.329 J10.966 E.03193
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.025 J.195 E.00956
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 54 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer54 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X108.716 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130844
G1 F2430
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z11.2 F42000
G1 X103.913 Y125.002 Z11.2
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2430
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.183 Y127.694 Z11.2 F42000
G1 X122.936 Y132.02 Z11.2
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 55/85
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z11.2 I.789 J-.926 P1  F42000
G1 X115.967 Y125.226 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.777 Y123.72 I1.429 J13.069 E.05139
G3 X116.769 Y123.797 I-.328 J10.598 E.03301
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.812 Y130.929 E.23253
G2 X115.19 Y130.929 I-.312 J2.984 E.02066
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54756
G1 X116.054 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.076 Y132.676 I-.184 J-.051 E.00859
G1 X115.768 Y131.319 E.31947
G2 X115.232 Y131.319 I-.268 J2.493 E.0165
G1 X104.923 Y132.676 E.31951
G1 X104.855 Y132.674 E.0021
G1 X104.771 Y132.635 E.00284
G3 X104.705 Y132.52 I.132 J-.153 E.00414
G1 X104.604 Y131.755 E.02373
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.711 Y124.934 E.02486
G3 X103.883 Y124.764 I.201 J.031 E.00793
G1 X114.184 Y123.408 E.31925
G3 X115.786 Y123.328 I1.484 J13.61 E.04932
G3 X116.816 Y123.408 I-.336 J10.982 E.03176
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.025 J.195 E.00956
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 55 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer55 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130863
G1 F2430
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
M73 P79 R5
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.0657
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130849
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z11.4 F42000
G1 X127.087 Y125.002 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2430
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.817 Y127.694 Z11.4 F42000
G1 X108.064 Y132.02 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.130864
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 56/85
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z11.4 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23191
G3 X115.783 Y123.72 I1.427 J13.041 E.05158
G3 X116.769 Y123.797 I-.336 J10.625 E.03283
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F2443
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.81 Y130.929 E.23257
G2 X115.183 Y130.93 I-.309 J3.31 E.02082
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2443
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.29 Y132.543 E.02443
G3 X126.076 Y132.676 I-.183 J-.055 E.00844
G1 X115.768 Y131.319 E.31949
G2 X115.23 Y131.319 I-.267 J2.784 E.01655
G1 X104.924 Y132.676 E.3194
G1 X104.826 Y132.666 E.00303
G1 X104.75 Y132.614 E.00282
G3 X104.705 Y132.52 I.181 J-.145 E.00326
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.195 J-.027 E.00956
G1 X114.184 Y123.408 E.31925
G3 X115.791 Y123.328 I1.482 J13.581 E.04949
G3 X116.816 Y123.408 I-.344 J11.007 E.0316
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.025 J.195 E.00956
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 56 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer56 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2443
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2443
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.87 Y125.093 Z11.6 F42000
G1 X103.913 Y125.002 Z11.6
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.130839
G1 F2443
M204 S6000
G1 X107.085 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2443
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z11.6 F42000
G1 X126.108 Y132.438 Z11.6
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.13084
G1 F2443
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2443
M204 S6000
G1 X104.892 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 57/85
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z11.6 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.788 Y123.72 I1.426 J13.026 E.05176
G3 X116.769 Y123.797 I-.346 J10.669 E.03264
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.812 Y130.929 E.23253
G2 X115.183 Y130.93 I-.31 J3.606 E.02087
G1 X108.239 Y131.844 E.23235
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
M73 P80 R5
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.189 J-.034 E.00916
G1 X115.768 Y131.319 E.31945
G2 X115.23 Y131.319 I-.268 J3.052 E.01656
G1 X104.854 Y132.674 E.32152
G3 X104.705 Y132.52 I.039 J-.187 E.00702
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.192 J-.029 E.00958
G1 X114.184 Y123.408 E.31926
G3 X115.797 Y123.328 I1.48 J13.566 E.04966
G3 X116.816 Y123.408 I-.353 J11.05 E.03142
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.022 J.193 E.00959
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 57 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer57 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
M73 P80 R4
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130849
G1 F2430
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130839
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z11.8 F42000
G1 X127.087 Y125.002 Z11.8
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.130844
G1 F2430
M204 S6000
G1 X123.915 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.817 Y127.694 Z11.8 F42000
G1 X108.064 Y132.02 Z11.8
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.130864
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 58/85
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z11.8 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.794 Y123.72 I1.425 J13.007 E.05194
G3 X116.769 Y123.797 I-.356 J10.711 E.03246
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F2443
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.81 Y130.929 E.23257
G2 X115.19 Y130.929 I-.31 J2.803 E.02063
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54756
G1 X116.054 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2443
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.193 J-.039 E.00911
G1 X115.768 Y131.319 E.31947
G2 X115.232 Y131.319 I-.268 J2.339 E.01649
G1 X104.923 Y132.676 E.31952
G1 X104.81 Y132.66 E.00349
G3 X104.705 Y132.52 I.086 J-.174 E.00558
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.711 Y124.934 E.02486
G3 X103.883 Y124.764 I.201 J.031 E.00793
G1 X114.184 Y123.408 E.31925
G3 X115.803 Y123.328 I1.479 J13.546 E.04983
G3 X116.816 Y123.408 I-.363 J11.089 E.03125
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 58 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer58 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2443
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2443
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.87 Y125.093 Z12 F42000
G1 X103.913 Y125.002 Z12
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2443
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2443
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z12 F42000
G1 X126.108 Y132.438 Z12
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F2443
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2443
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.0657
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
M73 P81 R4
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2443
M204 S6000
G1 X104.892 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 59/85
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z12 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.8 Y123.72 I1.423 J12.989 E.05213
G3 X116.769 Y123.797 I-.365 J10.747 E.03228
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.811 Y130.929 E.23254
G2 X115.189 Y130.929 I-.311 J3.151 E.02069
G1 X108.239 Y131.844 E.23253
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.191 J-.037 E.00911
G1 X115.768 Y131.319 E.31947
G2 X115.232 Y131.319 I-.268 J2.634 E.0165
G1 X104.923 Y132.676 E.3195
G1 X104.854 Y132.674 E.0021
G1 X104.771 Y132.635 E.00283
G3 X104.705 Y132.52 I.131 J-.152 E.00416
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.195 J-.027 E.00956
G1 X114.184 Y123.408 E.31925
G3 X115.808 Y123.328 I1.477 J13.527 E.05
G3 X116.816 Y123.408 I-.372 J11.122 E.03108
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.027 J.197 E.00953
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 59 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer59 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2430
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130846
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z12.2 F42000
G1 X127.087 Y125.002 Z12.2
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2430
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.817 Y127.694 Z12.2 F42000
G1 X108.064 Y132.02 Z12.2
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 60/85
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z12.2 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.805 Y123.72 I1.422 J12.972 E.05231
G3 X116.769 Y123.797 I-.375 J10.799 E.0321
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z12.4 F42000
G1 Z12
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.2496
G1 X122.761 Y131.844 E.05045
G1 X115.81 Y130.929 E.23257
G2 X115.19 Y130.929 I-.31 J2.801 E.02062
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54753
G1 X116.054 Y129.427 E-.21247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.193 J-.039 E.0091
G1 X115.768 Y131.319 E.31948
G2 X115.232 Y131.319 I-.268 J2.338 E.01649
G1 X104.855 Y132.674 E.32159
G3 X104.705 Y132.52 I.038 J-.186 E.00703
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.201 J-.022 E.00948
G1 X114.184 Y123.408 E.31925
G3 X115.814 Y123.328 I1.476 J13.51 E.05017
G3 X116.816 Y123.408 I-.382 J11.172 E.03091
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.021 J.193 E.0096
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P82 R4
G3 Z12.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 60 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer60 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513104
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474812
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436519
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398227
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357182
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11455.418
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221055
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419666
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.469319
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518972
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X108.716 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2430
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.0657
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z12.4 F42000
G1 X103.913 Y125.002 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2430
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.183 Y127.694 Z12.4 F42000
G1 X122.936 Y132.02 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 61/85
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z12.4 I.789 J-.926 P1  F42000
G1 X115.967 Y125.226 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2442
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.811 Y123.721 I1.421 J12.954 E.05249
G3 X116.769 Y123.797 I-.387 J10.862 E.03191
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
G1 F2442
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.81 Y130.929 E.23257
G2 X115.19 Y130.929 I-.31 J2.801 E.02062
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54756
G1 X116.054 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2442
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02372
G3 X126.076 Y132.676 I-.19 J-.035 E.00913
G1 X115.768 Y131.319 E.31948
G2 X115.232 Y131.319 I-.268 J2.337 E.01649
G1 X104.924 Y132.676 E.31947
G1 X104.854 Y132.674 E.00215
G1 X104.771 Y132.635 E.00283
G3 X104.705 Y132.52 I.132 J-.152 E.00413
G1 X104.604 Y131.755 E.02373
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.192 J-.029 E.0096
G1 X114.184 Y123.408 E.31925
G3 X115.819 Y123.329 I1.475 J13.49 E.05034
G3 X116.816 Y123.408 I-.393 J11.231 E.03074
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.021 J.193 E.0096
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 61 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer61 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513125
G1 F2442
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474834
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436543
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398252
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357142
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.876
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2442
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270709
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320362
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370015
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 F7562.183
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.13 Y125.093 Z12.6 F42000
G1 X127.087 Y125.002 Z12.6
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2442
M204 S6000
G1 X123.915 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.284 Y125.706 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2442
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2442
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.909 Y132.31 Z12.6 F42000
G1 X104.892 Y132.438 Z12.6
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.130864
G1 F2442
M204 S6000
G1 X108.064 Y132.02 E.02293
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2442
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.0657
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F2442
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 62/85
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z12.6 I.789 J-.926 P1  F42000
G1 X115.967 Y125.226 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2442
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.816 Y123.721 I1.419 J12.939 E.05268
G3 X116.769 Y123.797 I-.398 J10.921 E.03173
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
M73 P83 R4
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
G1 F2442
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.811 Y130.929 E.23254
G2 X115.183 Y130.93 I-.31 J3.553 E.02086
G1 X108.239 Y131.844 E.23236
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2442
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.076 Y132.676 I-.184 J-.051 E.00861
G1 X115.768 Y131.319 E.31946
G2 X115.23 Y131.319 I-.268 J3 E.01655
G1 X104.924 Y132.676 E.3194
G1 X104.807 Y132.658 E.00364
G3 X104.705 Y132.52 I.085 J-.17 E.00548
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.198 J-.025 E.00953
G1 X114.184 Y123.408 E.31925
G3 X115.825 Y123.329 I1.473 J13.474 E.05051
G3 X116.816 Y123.408 I-.404 J11.293 E.03057
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 62 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer62 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2442
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2442
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X115.5 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.87 Y125.093 Z12.8 F42000
G1 X103.912 Y125.002 Z12.8
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.130827
G1 F2442
M204 S6000
G1 X107.085 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.716 Y125.706 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2442
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00649
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00649
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130843
G1 F2442
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z12.8 F42000
G1 X126.108 Y132.438 Z12.8
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2442
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2442
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130855
G1 F2442
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 63/85
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z12.8 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.822 Y123.721 I1.418 J12.926 E.05286
G3 X116.769 Y123.797 I-.41 J10.991 E.03154
G1 X123.701 Y124.71 E.23191
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.24959
G1 X122.761 Y131.844 E.05045
G1 X115.81 Y130.929 E.23257
G2 X115.19 Y130.929 I-.31 J2.803 E.02063
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54755
G1 X116.054 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02429
G3 X126.076 Y132.676 I-.184 J-.051 E.0086
G1 X115.768 Y131.319 E.31947
G2 X115.232 Y131.319 I-.268 J2.339 E.01649
G1 X104.901 Y132.678 E.3202
G3 X104.705 Y132.52 I-.007 J-.191 E.00844
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.712 Y124.931 E.02495
G3 X103.883 Y124.764 I.2 J.034 E.00785
G1 X114.184 Y123.408 E.31925
G3 X115.83 Y123.329 I1.472 J13.46 E.05068
G3 X116.816 Y123.408 I-.416 J11.36 E.0304
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.024 J.195 E.00956
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 63 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer63 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X115.5 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X122.284 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.67 Y125.494 E.05401
G1 X119.712 Y124.536 E.04493
G1 X119.051 Y124.449 E.0221
G1 X118.316 Y125.184 E.03448
G1 X116.108 Y124.893 E.07389
G1 X116.108 Y124.697 E.00649
G1 X114.892 Y124.697 E.04032
G1 X114.892 Y124.893 E.00649
G1 X112.684 Y125.184 E.07389
G1 X111.949 Y124.449 E.03448
G1 X111.288 Y124.536 E.0221
G1 X110.33 Y125.494 E.04493
G1 X108.716 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X110.33 Y125.494 E-.61876
G1 X110.593 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P84 R4
G1 X107.085 Y124.585 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2430
M204 S6000
G1 X103.913 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.61 Y130.612 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.224 Y130.4 E.05401
G1 X110.959 Y131.135 E.03448
G1 X112.578 Y130.922 E.05419
G1 X113.536 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X117.464 Y129.964 E.06571
G1 X118.422 Y130.922 E.04493
G1 X120.041 Y131.135 E.05419
G1 X120.776 Y130.4 E.03448
G1 X122.39 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X120.776 Y130.4 E-.61876
G1 X120.513 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z13 F42000
G1 X127.087 Y125.002 Z13
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2430
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P84 R3
G1 X118.817 Y127.694 Z13 F42000
G1 X108.064 Y132.02 Z13
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.130853
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 64/85
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z13 I.739 J.967 P1  F42000
G1 X115.967 Y125.226 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X115.607 Y127.961 E.09151
G1 X115.393 Y127.961 E.0071
G1 X115.033 Y125.226 E.09151
G1 X107.498 Y126.218 E.25211
G1 X107.299 Y124.71 E.05045
G1 X114.231 Y123.797 E.23192
G3 X115.827 Y123.721 I1.418 J12.917 E.05305
G3 X116.769 Y123.797 I-.423 J11.069 E.03136
G1 X123.701 Y124.71 E.23192
G1 X123.502 Y126.218 E.05045
G1 X116.027 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X115.723 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.131 Y129.534 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
G1 F2430
M204 S6000
G1 X115.5 Y129.354 E.04581
G1 X122.96 Y130.336 E.2496
G1 X122.761 Y131.844 E.05045
G1 X115.811 Y130.929 E.23254
G2 X115.19 Y130.929 I-.311 J2.927 E.02065
G1 X108.239 Y131.844 E.23257
G1 X108.04 Y130.336 E.05045
G1 X114.071 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X115.5 Y129.354 E-.54753
G1 X116.054 Y129.427 E-.21247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.305 Y125.666 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
M204 S5000
G1 X115.865 Y129.007 E.10355
G1 X123.4 Y129.999 E.23353
G1 X123.162 Y131.808 E.05608
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.19 J-.034 E.00914
G1 X115.768 Y131.319 E.31947
G2 X115.232 Y131.319 I-.268 J2.445 E.01649
G1 X104.897 Y132.678 E.32029
G3 X104.705 Y132.52 I-.004 J-.192 E.00833
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.6 Y129.999 E.05608
G1 X115.135 Y129.007 E.23353
G1 X114.695 Y125.666 E.10355
G1 X107.16 Y126.658 E.23353
G1 X106.922 Y124.848 E.05608
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.192 J-.029 E.00959
G1 X114.184 Y123.408 E.31925
G3 X115.836 Y123.329 I1.471 J13.45 E.05085
G3 X116.816 Y123.408 I-.426 J11.41 E.03023
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.84 Y126.658 E.05608
G1 X116.364 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.068 Y127.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 64 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer64 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.5 Y128.157 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.5131
G1 F2430
M204 S6000
G1 X115.5 Y128.365 E.00796
; LINE_WIDTH: 0.474803
G1 X115.5 Y128.572 E.00732
; LINE_WIDTH: 0.436505
G1 X115.5 Y128.78 E.00667
; LINE_WIDTH: 0.398208
G1 X115.5 Y128.988 E.00602
; LINE_WIDTH: 0.357142
G1 X115.646 Y129.166 E.00589
; WIPE_START
G1 F11456.891
G1 X115.5 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.5 Y127.035 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.121749
G1 F2430
M204 S6000
G1 X115.5 Y126.814 E.00142
; LINE_WIDTH: 0.1714
G1 X115.5 Y126.593 E.00231
; LINE_WIDTH: 0.221051
G1 X115.5 Y126.372 E.00321
; LINE_WIDTH: 0.270702
G1 X115.5 Y126.151 E.0041
; LINE_WIDTH: 0.320353
G1 X115.5 Y125.93 E.005
; LINE_WIDTH: 0.370004
G1 X115.5 Y125.709 E.00589
; LINE_WIDTH: 0.419656
G1 X115.5 Y125.488 E.00679
; LINE_WIDTH: 0.469307
G1 X115.5 Y125.267 E.00768
; LINE_WIDTH: 0.518958
G1 X115.5 Y125.046 E.00857
M204 S10000
G1 X108.716 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X110.33 Y125.494 E.05401
G1 X111.288 Y124.536 E.04493
G1 X111.949 Y124.449 E.0221
G1 X112.684 Y125.184 E.03448
G1 X114.892 Y124.893 E.07389
G1 X114.892 Y124.697 E.00648
G1 X116.108 Y124.697 E.04032
G1 X116.108 Y124.893 E.00648
G1 X118.316 Y125.184 E.07389
G1 X119.051 Y124.449 E.03448
G1 X119.712 Y124.536 E.0221
G1 X120.67 Y125.494 E.04493
G1 X122.284 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X120.67 Y125.494 E-.61876
G1 X120.407 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2430
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.39 Y130.612 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
M204 S6000
G1 X120.776 Y130.4 E.05401
G1 X120.041 Y131.135 E.03448
G1 X118.422 Y130.922 E.05419
G1 X117.464 Y129.964 E.04493
G1 X115.5 Y129.705 E.06571
G1 X113.536 Y129.964 E.06571
G1 X112.578 Y130.922 E.04493
G1 X110.959 Y131.135 E.05419
G1 X110.224 Y130.4 E.03448
G1 X108.61 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X110.224 Y130.4 E-.61876
G1 X110.487 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2430
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.962 Y125.122 Z13.2 F42000
G1 X103.913 Y125.002 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.130861
G1 F2430
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.183 Y127.694 Z13.2 F42000
G1 X122.936 Y132.02 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2430
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 65/85
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z13.2 I.494 J-1.112 P1  F42000
G1 X107.299 Y124.71 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5059
M204 S6000
G1 X114.231 Y123.797 E.23192
G3 X115.833 Y123.721 I1.416 J12.901 E.05323
G3 X116.769 Y123.797 I-.435 J11.14 E.03118
G1 X123.701 Y124.71 E.23192
G1 X123.552 Y125.84 E.03783
G1 X123.5 Y126.237 E.01327
G1 F4919.51
G1 X123.447 Y126.634 E.01327
M106 S255
G1 F1800
G1 X123.397 Y127.013 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X123.065 Y129.541 E.08459
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X123.015 Y129.92 E.01269
M106 S201.45
G1 F4919.51
G1 X122.962 Y130.317 E.01327
G1 F5059
G1 X122.91 Y130.713 E.01327
G1 X122.761 Y131.844 E.03783
G1 X115.81 Y130.929 E.23257
G2 X115.19 Y130.929 I-.31 J2.802 E.02062
G1 X108.239 Y131.844 E.23257
G1 X108.09 Y130.713 E.03783
G1 X108.038 Y130.317 E.01327
G1 F4919.51
G1 X107.985 Y129.92 E.01327
M106 S255
G1 F1800
G1 X107.935 Y129.541 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X107.603 Y127.013 E.08459
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X107.553 Y126.634 E.01269
M106 S201.45
G1 F4919.51
G1 X107.5 Y126.237 E.01327
G1 F5059
G1 X107.448 Y125.84 E.01327
G1 X107.307 Y124.769 E.03584
M204 S250
G1 X106.922 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5059
M204 S5000
M73 P85 R3
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.195 J-.027 E.00956
G1 X114.184 Y123.408 E.31926
G3 X115.841 Y123.329 I1.47 J13.433 E.05102
G3 X116.816 Y123.408 I-.44 J11.498 E.03006
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.022 J.193 E.0096
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.939 Y125.905 E.03276
G1 X123.887 Y126.302 E.01229
G1 F4919.51
G1 X123.834 Y126.698 E.01229
M106 S255
G1 F1800
G1 X123.786 Y127.064 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X123.453 Y129.592 E.08459
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X123.405 Y129.958 E.01134
M106 S201.45
G1 F4919.51
G1 X123.353 Y130.355 E.01229
G1 F5059
G1 X123.301 Y130.751 E.01229
G1 X123.162 Y131.808 E.03276
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.191 J-.037 E.00912
G1 X115.768 Y131.319 E.31948
G2 X115.232 Y131.319 I-.268 J2.339 E.01649
G1 X104.854 Y132.674 E.32159
G3 X104.705 Y132.52 I.041 J-.189 E.00699
G1 X104.604 Y131.755 E.02372
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X107.699 Y130.751 E.03276
G1 X107.647 Y130.355 E.01229
G1 F4919.51
G1 X107.595 Y129.958 E.01229
M106 S255
G1 F1800
G1 X107.547 Y129.592 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X107.214 Y127.064 E.08459
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X107.166 Y126.698 E.01134
M106 S201.45
G1 F4919.51
G1 X107.113 Y126.302 E.01229
G1 F5059
G1 X107.061 Y125.905 E.01229
G1 X106.93 Y124.908 E.03091
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.942 Y125.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 65 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer65 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X103.913 Y125.002 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F5059
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I-.925 J.791 P1  F42000
G1 X107.916 Y128.138 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42413
M106 S255
G1 F3000
M204 S6000
G1 X108.185 Y126.091 E.06411
G1 X108.576 Y126.04 E.01226
G1 X108.193 Y128.948 E.09111
G1 X108.375 Y130.328 E.04323
G1 X108.397 Y130.325 E.00068
G1 X108.968 Y125.988 E.13587
G1 X109.359 Y125.937 E.01226
G1 X108.788 Y130.273 E.13587
G1 X109.179 Y130.222 E.01226
G1 X109.75 Y125.885 E.13587
G1 X110.141 Y125.834 E.01226
G1 X109.57 Y130.17 E.13587
G1 X109.962 Y130.119 E.01226
G1 X110.533 Y125.782 E.13587
G1 X110.924 Y125.731 E.01226
G1 X110.353 Y130.067 E.13587
G1 X110.744 Y130.016 E.01226
G1 X111.315 Y125.679 E.13587
G1 X111.707 Y125.628 E.01226
G1 X111.136 Y129.964 E.13587
G1 X111.527 Y129.913 E.01226
G1 X112.098 Y125.576 E.13587
G1 X112.489 Y125.525 E.01226
G1 X111.918 Y129.861 E.13587
G1 X112.309 Y129.81 E.01226
G1 X112.88 Y125.473 E.13587
G1 X113.272 Y125.422 E.01226
G1 X112.701 Y129.758 E.13587
G1 X113.092 Y129.707 E.01226
G1 X113.663 Y125.37 E.13587
G1 X114.054 Y125.319 E.01226
G1 X113.483 Y129.655 E.13587
G1 X113.875 Y129.604 E.01226
G1 X114.446 Y125.267 E.13587
G1 X114.837 Y125.216 E.01226
G1 X114.266 Y129.552 E.13587
G1 X114.657 Y129.501 E.01226
G1 X115.248 Y125.01 E.1407
G1 X115.345 Y125.01 E.00302
G1 X115.5 Y125.141 E.0063
G1 X115.63 Y125.031 E.0053
G1 X115.048 Y129.449 E.13843
G1 X115.44 Y129.398 E.01226
G1 X115.995 Y125.183 E.13204
G1 X116.371 Y125.243 E.01185
G1 X115.82 Y129.432 E.13124
G1 X116.198 Y129.482 E.01184
G1 X116.749 Y125.293 E.13124
G1 X117.127 Y125.343 E.01184
G1 X116.576 Y129.531 E.13124
G1 X116.954 Y129.581 E.01184
G1 X117.505 Y125.392 E.13124
G1 X117.883 Y125.442 E.01184
G1 X117.332 Y129.631 E.13124
G1 X117.709 Y129.681 E.01184
G1 X118.261 Y125.492 E.13124
G1 X118.639 Y125.542 E.01184
G1 X118.087 Y129.73 E.13124
G1 X118.465 Y129.78 E.01184
G1 X119.017 Y125.591 E.13124
G1 X119.395 Y125.641 E.01184
G1 X118.843 Y129.83 E.13124
G1 X119.221 Y129.88 E.01184
G1 X119.773 Y125.691 E.13124
G1 X120.151 Y125.741 E.01184
G1 X119.599 Y129.929 E.13124
G1 X119.977 Y129.979 E.01184
G1 X120.529 Y125.79 E.13124
G1 X120.907 Y125.84 E.01184
G1 X120.355 Y130.029 E.13124
G1 X120.733 Y130.079 E.01184
G1 X121.285 Y125.89 E.13124
G1 X121.662 Y125.94 E.01184
G1 X121.111 Y130.128 E.13124
G1 X121.489 Y130.178 E.01184
G1 X122.04 Y125.989 E.13124
G1 X122.418 Y126.039 E.01184
G1 X121.867 Y130.228 E.13124
G1 X122.245 Y130.278 E.01184
G1 X122.796 Y126.089 E.13124
G1 X123.174 Y126.139 E.01184
G1 X122.601 Y130.496 E.13651
M106 S201.45
; WIPE_START
G1 X122.862 Y128.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F5059
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z13.4 F42000
G1 X127.087 Y125.002 Z13.4
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F5059
M204 S6000
G1 X123.915 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.192 Y125.614 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5059
M204 S6000
G1 X120.577 Y125.401 E.05401
G1 X119.712 Y124.536 E.0406
G1 X119.051 Y124.449 E.02211
G1 X118.387 Y125.113 E.03115
G1 X116.146 Y124.818 E.07498
G1 X115.946 Y124.618 E.00937
G1 X115.054 Y124.618 E.0296
G1 X114.854 Y124.818 E.00937
G1 X112.613 Y125.113 E.07498
G1 X111.949 Y124.449 E.03115
G1 X111.288 Y124.536 E.02211
G1 X110.423 Y125.401 E.0406
G1 X108.808 Y125.614 E.05401
; WIPE_START
G1 F8843.478
G1 X110.423 Y125.401 E-.61876
G1 X110.686 Y125.139 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I-1.144 J-.414 P1  F42000
G1 X108.68 Y130.683 Z13.4
G1 Z13
G1 E.8 F1800
G1 F5059
M204 S6000
G1 X110.295 Y130.471 E.05401
G1 X110.959 Y131.135 E.03115
G1 X112.579 Y130.921 E.05419
G1 X113.444 Y130.056 E.0406
G1 X114.903 Y129.864 E.04882
G3 X116.097 Y129.864 I.597 J2.228 E.04006
G1 X117.556 Y130.056 E.04882
G1 X118.421 Y130.921 E.0406
G1 X120.041 Y131.135 E.05419
G1 X120.705 Y130.471 E.03115
G1 X122.32 Y130.683 E.05401
; WIPE_START
G1 F8843.478
G1 X120.705 Y130.471 E-.61876
G1 X120.442 Y130.733 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.851 Y131.523 Z13.4 F42000
G1 X108.064 Y132.02 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F5059
M204 S6000
G1 X104.892 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 66/85
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z13.4 I1.215 J.069 P1  F42000
G1 X107.299 Y124.71 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3540
M204 S6000
G1 X114.231 Y123.797 E.23192
G3 X115.838 Y123.721 I1.416 J12.89 E.05341
G3 X116.769 Y123.797 I-.449 J11.23 E.03099
G1 X123.701 Y124.71 E.23192
G1 X122.761 Y131.844 E.2387
G1 X115.81 Y130.929 E.23257
G2 X115.19 Y130.929 I-.31 J2.801 E.02062
G1 X108.239 Y131.844 E.23257
G1 X107.307 Y124.769 E.23671
M204 S250
G1 X106.922 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3540
M204 S5000
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.711 Y124.934 E.02484
G3 X103.883 Y124.764 I.201 J.031 E.00795
G1 X114.184 Y123.408 E.31926
G3 X115.847 Y123.329 I1.469 J13.422 E.05119
G3 X116.816 Y123.408 I-.454 J11.58 E.02989
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00949
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.162 Y131.808 E.21571
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.076 Y132.676 I-.184 J-.051 E.0086
G1 X115.768 Y131.319 E.31948
G2 X115.232 Y131.319 I-.268 J2.338 E.01649
G1 X104.924 Y132.676 E.31947
G1 X104.808 Y132.658 E.00361
G3 X104.705 Y132.52 I.089 J-.174 E.00549
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.93 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.942 Y125.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 66 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer66 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X103.913 Y125.002 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F3540
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.808 Y125.614 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3540
M204 S6000
G1 X110.423 Y125.401 E.05401
G1 X111.288 Y124.536 E.0406
G1 X111.949 Y124.449 E.02211
G1 X112.613 Y125.113 E.03115
G1 X114.854 Y124.818 E.07498
G1 X115.054 Y124.618 E.00937
G1 X115.946 Y124.618 E.0296
G1 X116.146 Y124.818 E.00937
G1 X118.387 Y125.113 E.07498
G1 X119.051 Y124.449 E.03115
G1 X119.712 Y124.536 E.02211
G1 X120.577 Y125.401 E.0406
G1 X122.192 Y125.614 E.05401
; WIPE_START
G1 F8843.478
G1 X120.577 Y125.401 E-.61876
G1 X120.314 Y125.138 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F3540
M204 S6000
G1 X127.087 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I-1.021 J-.663 P1  F42000
G1 X122.842 Y128.226 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3540
M204 S6000
G1 X123.118 Y126.131 E.06492
G1 X116.054 Y125.201 E.21894
G3 X115.79 Y125.01 I.179 J-.524 E.01015
G1 X115.21 Y125.01 E.01782
G1 X114.969 Y125.197 E.00937
G1 X114.914 Y125.206 E.00172
G1 X107.882 Y126.131 E.21792
G1 X108.433 Y130.32 E.12982
G1 X115.468 Y129.394 E.218
G1 X122.567 Y130.32 E.21997
G1 X122.834 Y128.286 E.06306
M204 S10000
G1 X122.468 Y128.177 F42000
G1 F3540
M204 S6000
G1 X122.695 Y126.456 E.05334
G1 X116.004 Y125.575 E.20735
G1 X115.739 Y125.467 E.00881
G1 X115.647 Y125.387 E.00375
G1 X115.353 Y125.387 E.009
G1 X115.124 Y125.542 E.00851
G1 X114.963 Y125.579 E.00509
G1 X108.305 Y126.456 E.20633
G1 X108.758 Y129.897 E.10665
G1 X115.424 Y129.02 E.20659
G1 X115.563 Y129.021 E.00428
G1 X122.242 Y129.897 E.20697
G1 X122.461 Y128.236 E.05148
M204 S10000
G1 X122.095 Y128.128 F42000
G1 F3540
M204 S6000
G1 X122.272 Y126.781 E.04175
G1 X115.955 Y125.949 E.19577
G3 X115.487 Y125.769 I.184 J-1.175 E.01553
G1 X115.157 Y125.927 E.01126
G1 X115.012 Y125.953 E.00452
G1 X108.728 Y126.781 E.19475
G1 X109.083 Y129.474 E.08348
G1 X115.38 Y128.645 E.19517
G1 X115.612 Y128.647 E.00714
G1 X121.917 Y129.474 E.19539
G1 X122.087 Y128.187 E.03989
M204 S10000
G1 X121.721 Y128.078 F42000
G1 F3540
M204 S6000
G1 X121.849 Y127.105 E.03017
G1 X115.906 Y126.323 E.18418
G1 X115.606 Y126.247 E.00951
G1 X115.5 Y126.188 E.00372
G3 X115.061 Y126.327 I-.537 J-.935 E.01425
G1 X109.151 Y127.105 E.18316
G1 X109.407 Y129.051 E.06031
G1 X115.317 Y128.273 E.18316
G1 X115.661 Y128.273 E.01057
G1 X121.593 Y129.052 E.18381
G1 X121.713 Y128.138 E.02831
M204 S10000
G1 X121.347 Y128.029 F42000
G1 F3540
M204 S6000
G1 X121.426 Y127.43 E.01858
G1 X115.857 Y126.697 E.1726
G1 X115.5 Y126.608 E.01129
M73 P86 R3
G1 X115.11 Y126.701 E.01231
G1 X109.574 Y127.43 E.17158
G1 X109.732 Y128.628 E.03713
G1 X115.268 Y127.899 E.17158
G1 X115.711 Y127.899 E.01359
G1 X121.268 Y128.629 E.17223
G1 X121.339 Y128.089 E.01673
M204 S10000
G1 X120.954 Y127.978 F42000
; LINE_WIDTH: 0.459584
G1 F3540
M204 S6000
G1 X120.981 Y127.771 E.00706
G1 X115.446 Y127.051 E.18951
G1 X110.019 Y127.771 E.18587
G1 X110.073 Y128.183 E.01412
G1 X115.216 Y127.506 E.17613
G3 X115.762 Y127.505 I.275 J1.361 E.01865
G1 X120.927 Y128.184 E.17685
G1 X120.946 Y128.037 E.00503
M204 S10000
G1 X122.32 Y130.683 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3540
M204 S6000
G1 X120.705 Y130.471 E.05401
G1 X120.041 Y131.135 E.03115
G1 X118.421 Y130.921 E.05419
G1 X117.556 Y130.056 E.0406
G1 X115.5 Y129.785 E.06879
G1 X113.444 Y130.056 E.06879
G1 X112.579 Y130.921 E.0406
G1 X110.959 Y131.135 E.05419
G1 X110.295 Y130.471 E.03115
G1 X108.68 Y130.683 E.05401
; WIPE_START
G1 F8843.478
G1 X110.295 Y130.471 E-.61876
G1 X110.558 Y130.733 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F3540
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.507 Y132.103 Z13.6 F42000
G1 X122.936 Y132.02 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F3540
M204 S6000
G1 X126.108 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 67/85
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z13.6 I.494 J-1.112 P1  F42000
G1 X107.299 Y124.71 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2936
M204 S6000
G1 X114.231 Y123.797 E.23191
G3 X115.844 Y123.721 I1.415 J12.879 E.0536
G3 X116.769 Y123.797 I-.464 J11.33 E.03081
G1 X123.701 Y124.71 E.23191
G1 X122.761 Y131.844 E.2387
G1 X115.811 Y130.929 E.23255
G2 X115.189 Y130.929 I-.311 J3.029 E.02067
G1 X108.239 Y131.844 E.23255
G1 X107.307 Y124.769 E.23671
M204 S250
G1 X106.922 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2936
M204 S5000
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.192 J-.029 E.00959
G1 X114.184 Y123.408 E.31925
G3 X115.852 Y123.329 I1.468 J13.406 E.05136
G3 X116.816 Y123.408 I-.467 J11.663 E.02972
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00948
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.023 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.162 Y131.808 E.21571
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.01459
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.191 J-.036 E.00914
G1 X115.768 Y131.319 E.31946
G2 X115.232 Y131.319 I-.268 J2.532 E.0165
G1 X104.854 Y132.674 E.32159
G3 X104.705 Y132.522 I.038 J-.187 E.00694
G1 X104.604 Y131.755 E.02379
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.93 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.942 Y125.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 67 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer67 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X103.913 Y125.002 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130826
G1 F2936
M204 S6000
G1 X107.085 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.963 Y126.46 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2936
M204 S6000
G1 X109.577 Y126.247 E.05401
G1 X111.288 Y124.536 E.08027
G1 X111.949 Y124.449 E.02211
G1 X113.262 Y125.762 E.06159
G1 X111.648 Y125.974 E.05401
M204 S10000
G1 X113.493 Y127.746 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.484845
G1 F2936
M204 S6000
G1 X113.435 Y127.308 E.01591
G1 X109.283 Y127.855 E.15082
G1 X109.34 Y128.293 E.01591
G1 X113.433 Y127.754 E.14866
M204 S10000
G1 X113.952 Y128.099 F42000
; LINE_WIDTH: 0.41999
G1 F2936
M204 S6000
G1 X113.787 Y126.849 E.03874
G1 X108.823 Y127.502 E.15385
G1 X108.988 Y128.752 E.03874
G1 X113.893 Y128.107 E.15201
M204 S10000
G1 X114.375 Y128.423 F42000
G1 F2936
M204 S6000
G1 X114.112 Y126.426 E.06192
G1 X108.4 Y127.178 E.17703
G1 X108.663 Y129.175 E.06192
G1 X114.316 Y128.431 E.17518
M204 S10000
G1 X114.796 Y128.729 F42000
G1 F2936
M204 S6000
G1 X114.438 Y126.014 E.08414
G1 X114.417 Y126.005 E.0007
G1 X107.977 Y126.853 E.1996
G1 X108.338 Y129.599 E.08509
G1 X114.75 Y128.754 E.19871
M204 S10000
G1 X112.675 Y129.423 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2936
M204 S6000
G1 X114.29 Y129.21 E.05401
G1 X112.579 Y130.921 E.08027
G1 X110.959 Y131.135 E.05419
G1 X109.646 Y129.822 E.06159
G1 X108.346 Y129.993 E.04348
G1 X108.388 Y130.308 E.01053
; WIPE_START
G1 F8843.478
G1 X108.346 Y129.993 E-.12062
G1 X109.646 Y129.822 E-.49814
G1 X109.909 Y130.085 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.064 Y132.02 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F2936
M204 S6000
G1 X104.892 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.92 Y129.241 Z13.8 F42000
G1 X117.507 Y127.746 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48485
G1 F2936
M204 S6000
G1 X121.66 Y128.293 E.15082
G1 X121.717 Y127.855 E.01591
G1 X117.565 Y127.308 E.15082
G1 X117.515 Y127.687 E.01375
M204 S10000
G1 X117.048 Y128.099 F42000
; LINE_WIDTH: 0.41999
G1 F2936
M204 S6000
G1 X122.012 Y128.752 E.15385
G1 X122.177 Y127.502 E.03874
G1 X117.213 Y126.849 E.15385
G1 X117.056 Y128.039 E.0369
M204 S10000
G1 X116.625 Y128.423 F42000
G1 F2936
M204 S6000
G1 X122.337 Y129.175 E.17703
G1 X122.6 Y127.178 E.06192
G1 X116.888 Y126.426 E.17702
G1 X116.633 Y128.364 E.06007
M204 S10000
G1 X116.203 Y128.737 F42000
G1 F2936
M204 S6000
G1 X122.662 Y129.599 E.2002
G1 X123.023 Y126.853 E.08509
G1 X116.575 Y126.004 E.19985
G1 X116.211 Y128.677 E.08289
M204 S10000
G1 X123.037 Y126.46 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2936
M204 S6000
G1 X121.423 Y126.247 E.05401
G1 X119.712 Y124.536 E.08027
G1 X119.051 Y124.449 E.02211
G1 X117.738 Y125.762 E.06159
G1 X116.465 Y125.594 E.0426
G1 X116.194 Y125.802 E.01131
G1 X115.966 Y127.534 E.05794
G1 X115.142 Y128.358 E.03867
G1 X115.034 Y127.534 E.02758
G1 X115.858 Y128.358 E.03867
G1 X115.794 Y128.847 E.01635
G1 X116.001 Y129.117 E.01131
G1 X116.71 Y129.21 E.02373
G1 X118.421 Y130.921 E.08027
G1 X120.041 Y131.135 E.05419
G1 X121.354 Y129.822 E.06159
G1 X122.654 Y129.993 E.04348
G1 X122.612 Y130.308 E.01053
; WIPE_START
G1 F8843.478
G1 X122.654 Y129.993 E-.12062
G1 X121.354 Y129.822 E-.49814
G1 X121.091 Y130.085 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.936 Y132.02 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F2936
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z13.8 F42000
G1 X127.087 Y125.002 Z13.8
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2936
M204 S6000
G1 X123.915 Y124.585 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 68/85
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z13.8 I.009 J-1.217 P1  F42000
G1 X107.299 Y124.71 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1819
M204 S6000
G1 X114.231 Y123.797 E.23191
G3 X115.849 Y123.721 I1.414 J12.867 E.05378
G3 X116.769 Y123.797 I-.478 J11.416 E.03063
G1 X123.701 Y124.71 E.23191
G1 X122.761 Y131.844 E.2387
G1 X115.811 Y130.929 E.23255
G2 X115.189 Y130.929 I-.311 J3.016 E.02067
G1 X108.239 Y131.844 E.23255
G1 X107.307 Y124.769 E.23671
M204 S250
G1 X106.922 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1819
M204 S5000
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.711 Y124.934 E.02486
G3 X103.883 Y124.764 I.201 J.031 E.00794
G1 X114.184 Y123.408 E.31925
G3 X115.858 Y123.329 I1.468 J13.397 E.05153
G3 X116.816 Y123.408 I-.48 J11.74 E.02955
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00948
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.162 Y131.808 E.21571
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
M73 P87 R3
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.189 J-.034 E.00916
G1 X115.768 Y131.319 E.31946
G2 X115.232 Y131.319 I-.268 J2.519 E.0165
G1 X104.923 Y132.676 E.31952
G1 X104.81 Y132.66 E.00349
G3 X104.705 Y132.52 I.087 J-.175 E.00558
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.93 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.942 Y125.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 68 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer68 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X103.913 Y125.002 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F1819
M204 S6000
G1 X107.085 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.892 Y132.438 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F1819
M204 S6000
G1 X108.064 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.344 Y131.347 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1819
M204 S6000
G1 X110.959 Y131.135 E.05401
G1 X108.123 Y128.299 E.13302
G1 X108.054 Y127.77 E.01769
G1 X111.288 Y124.536 E.15174
G1 X111.949 Y124.449 E.02211
G1 X118.421 Y130.921 E.30364
G1 X120.041 Y131.135 E.05419
G1 X122.877 Y128.299 E.13302
G1 X122.946 Y127.77 E.01769
G1 X119.712 Y124.536 E.15174
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
G1 X114.193 Y130.709 E.05401
; WIPE_START
G1 F8843.478
G1 X112.579 Y130.921 E-.61876
G1 X112.841 Y130.659 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.405 Y131.679 Z14 F42000
G1 X122.936 Y132.02 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F1819
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z14 F42000
G1 X127.087 Y125.002 Z14
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.130844
G1 F1819
M204 S6000
G1 X123.915 Y124.585 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 69/85
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z14 I.009 J-1.217 P1  F42000
G1 X107.299 Y124.71 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1803
M204 S6000
G1 X114.231 Y123.797 E.23191
G3 X115.855 Y123.721 I1.413 J12.86 E.05397
G3 X116.769 Y123.797 I-.495 J11.53 E.03044
G1 X123.701 Y124.71 E.23191
G1 X122.761 Y131.844 E.2387
G1 X115.81 Y130.929 E.23257
G2 X115.183 Y130.93 I-.309 J3.315 E.02082
G1 X108.239 Y131.844 E.23236
G1 X107.307 Y124.769 E.23671
M204 S250
G1 X106.922 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1803
M204 S5000
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02326
G3 X103.883 Y124.764 I.192 J-.029 E.00959
G1 X114.184 Y123.408 E.31926
G3 X115.863 Y123.33 I1.467 J13.391 E.0517
G3 X116.816 Y123.408 I-.495 J11.842 E.02938
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.022 J.193 E.0096
G1 X127.189 Y125.737 E.02326
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.162 Y131.808 E.21571
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.291 Y132.538 E.02428
G3 X126.076 Y132.676 I-.184 J-.051 E.0086
G1 X115.768 Y131.319 E.31948
G2 X115.23 Y131.319 I-.267 J2.789 E.01655
G1 X104.923 Y132.676 E.31945
G1 X104.81 Y132.66 E.00348
G3 X104.705 Y132.52 I.087 J-.175 E.00558
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.93 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.942 Y125.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 69 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer69 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X103.913 Y125.002 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F1803
M204 S6000
G1 X107.085 Y124.585 E.02293
M204 S10000
G1 X108.064 Y132.02 F42000
; LINE_WIDTH: 0.130855
G1 F1803
M204 S6000
G1 X104.892 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.193 Y130.709 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1803
M204 S6000
G1 X112.579 Y130.921 E.05401
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X122.946 Y127.77 E.15174
G1 X122.877 Y128.299 E.01769
G1 X120.041 Y131.135 E.13302
G1 X118.421 Y130.921 E.05419
G1 X111.949 Y124.449 E.30364
G1 X111.288 Y124.536 E.02211
G1 X108.054 Y127.77 E.15174
G1 X108.123 Y128.299 E.01769
G1 X110.959 Y131.135 E.13302
G1 X109.344 Y131.347 E.05401
; WIPE_START
G1 F8843.478
G1 X110.959 Y131.135 E-.61876
G1 X110.696 Y130.872 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.295 Y131.585 Z14.2 F42000
G1 X122.936 Y132.02 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F1803
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z14.2 F42000
G1 X127.087 Y125.002 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F1803
M204 S6000
G1 X123.915 Y124.585 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 70/85
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z14.2 I.009 J-1.217 P1  F42000
G1 X107.299 Y124.71 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1819
M204 S6000
G1 X114.231 Y123.797 E.23192
G3 X115.922 Y123.723 I1.41 J12.812 E.05619
G3 X116.769 Y123.797 I-.426 J9.735 E.02822
G1 X123.701 Y124.71 E.23192
G1 X122.761 Y131.844 E.2387
G1 X115.811 Y130.929 E.23256
G2 X115.189 Y130.929 I-.311 J2.988 E.02065
G1 X108.239 Y131.844 E.23256
G1 X107.307 Y124.769 E.23671
M204 S250
G1 X106.922 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1819
M204 S5000
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.713 Y124.986 E.02327
G3 X103.883 Y124.764 I.198 J-.025 E.00952
G1 X114.184 Y123.408 E.31925
G3 X115.939 Y123.331 I1.463 J13.332 E.05402
G3 X116.816 Y123.408 I-.441 J10.081 E.02706
G1 X127.117 Y124.764 E.31926
G3 X127.287 Y124.986 I-.023 J.193 E.00958
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.162 Y131.808 E.21571
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.295 Y132.52 E.02371
G3 X126.076 Y132.676 I-.188 J-.032 E.00918
G1 X115.768 Y131.319 E.31947
G2 X115.232 Y131.319 I-.268 J2.495 E.01649
G1 X104.854 Y132.674 E.32159
G3 X104.705 Y132.52 I.041 J-.189 E.00701
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.93 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.942 Y125.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 70 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer70 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X103.913 Y125.002 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13085
G1 F1819
M204 S6000
G1 X107.085 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X105.102 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.892 Y132.438 Z14.4 F42000
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F1819
M204 S6000
G1 X108.064 Y132.02 E.02292
; WIPE_START
G1 F15000
M73 P88 R3
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.344 Y131.347 Z14.4 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1819
M204 S6000
G1 X110.959 Y131.135 E.05401
G1 X108.123 Y128.299 E.13302
G1 X108.054 Y127.77 E.01769
G1 X111.288 Y124.536 E.15174
G1 X111.949 Y124.449 E.02211
G1 X118.421 Y130.921 E.30364
G1 X120.041 Y131.135 E.05419
G1 X122.877 Y128.299 E.13302
G1 X122.946 Y127.77 E.01769
G1 X119.712 Y124.536 E.15174
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
M73 P88 R2
G1 X114.193 Y130.709 E.05401
; WIPE_START
G1 F8843.478
G1 X112.579 Y130.921 E-.61876
G1 X112.841 Y130.659 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.405 Y131.679 Z14.4 F42000
G1 X122.936 Y132.02 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F1819
M204 S6000
G1 X126.108 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X124.125 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.038 Y125.122 Z14.4 F42000
G1 X127.087 Y125.002 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F1819
M204 S6000
G1 X123.915 Y124.585 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.898 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 71/85
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z14.4 I.009 J-1.217 P1  F42000
G1 X107.299 Y124.71 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2048
M204 S6000
G1 X114.231 Y123.797 E.23192
G3 X115.866 Y123.722 I1.412 J12.843 E.05433
G3 X116.769 Y123.797 I-.531 J11.802 E.03008
G1 X123.701 Y124.71 E.23191
G1 X122.761 Y131.844 E.2387
G1 X115.81 Y130.929 E.23257
G2 X115.19 Y130.929 I-.31 J2.801 E.02062
G1 X108.239 Y131.844 E.23257
G1 X107.307 Y124.769 E.23671
M204 S250
G1 X106.922 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2048
M204 S5000
G1 X103.978 Y125.236 E.09126
G1 X104.04 Y125.707 E.0146
G1 X103.811 Y125.737 E.00707
G1 X103.711 Y124.934 E.02485
G3 X103.883 Y124.764 I.201 J.031 E.00795
G1 X114.184 Y123.408 E.31925
G3 X115.874 Y123.33 I1.465 J13.365 E.05204
G3 X116.816 Y123.408 I-.53 J12.088 E.02904
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.031 J.2 E.00948
G1 X127.189 Y125.737 E.02327
G1 X126.96 Y125.707 E.00707
G1 X127.022 Y125.236 E.0146
G1 X124.078 Y124.848 E.09126
G1 X123.162 Y131.808 E.21571
G1 X126.106 Y132.196 E.09126
G1 X126.168 Y131.725 E.0146
G1 X126.396 Y131.755 E.00706
G1 X126.29 Y132.54 E.02434
G3 X126.076 Y132.676 I-.184 J-.052 E.00854
G1 X115.768 Y131.319 E.31948
G2 X115.232 Y131.319 I-.268 J2.338 E.01649
G1 X104.924 Y132.676 E.31947
G1 X104.854 Y132.674 E.00215
G1 X104.771 Y132.635 E.00283
G3 X104.705 Y132.52 I.122 J-.147 E.00416
G1 X104.604 Y131.755 E.02371
G1 X104.832 Y131.725 E.00706
G1 X104.894 Y132.196 E.0146
G1 X107.838 Y131.808 E.09126
G1 X106.93 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.942 Y125.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 71 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer71 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X103.913 Y125.002 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130849
G1 F2048
M204 S6000
G1 X107.085 Y124.585 E.02293
M204 S10000
G1 X108.064 Y132.02 F42000
; LINE_WIDTH: 0.130852
G1 F2048
M204 S6000
G1 X104.892 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X106.875 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.863 Y131.133 Z14.6 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383586
G1 F2048
M204 S6000
G1 X108.709 Y131.416 E.0603
G1 X108.574 Y131.406 E.00374
G1 X108.53 Y131.279 E.00374
G1 X107.727 Y125.18 E.17078
G1 X107.737 Y125.046 E.00374
G1 X107.864 Y125.001 E.00374
G1 X112.376 Y124.407 E.12633
M204 S10000
G1 X114.193 Y130.709 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2048
M204 S6000
G1 X112.579 Y130.921 E.05401
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X122.61 Y127.434 E.13597
G1 X122.439 Y128.737 E.04359
G1 X120.377 Y130.799 E.0967
G1 X117.983 Y130.483 E.0801
G1 X112.285 Y124.785 E.26732
G1 X110.85 Y124.974 E.04801
G1 X108.39 Y127.434 E.11542
G1 X108.561 Y128.737 E.04359
G1 X110.623 Y130.799 E.09671
G1 X109.008 Y131.011 E.05401
M204 S10000
G1 X117.903 Y130.839 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383604
G1 F2048
M204 S6000
G1 X122.291 Y131.416 E.12288
G1 X122.426 Y131.406 E.00374
G1 X122.47 Y131.279 E.00374
G1 X123.273 Y125.18 E.17078
G1 X123.263 Y125.046 E.00374
G1 X123.136 Y125.001 E.00374
G1 X121.221 Y124.749 E.05361
; WIPE_START
G1 F10566.98
G1 X123.136 Y125.001 E-.73388
G1 X123.201 Y125.024 E-.02612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z14.6 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F2048
M204 S6000
G1 X127.087 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.091 Y132.31 Z14.6 F42000
G1 X126.108 Y132.438 Z14.6
G1 Z14.2
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2048
M204 S6000
G1 X122.936 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 72/85
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z14.6 I.032 J-1.217 P1  F42000
G1 X108.239 Y131.844 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4375
M204 S6000
G1 X107.299 Y124.71 E.2387
G1 X114.231 Y123.797 E.23191
G3 X115.86 Y123.722 I1.413 J12.853 E.05414
G3 X116.769 Y123.797 I-.315 J9.292 E.03027
M73 P89 R2
G1 X123.701 Y124.71 E.23191
G1 X122.761 Y131.844 E.2387
G1 X115.811 Y130.929 E.23255
G2 X115.189 Y130.929 I-.311 J2.956 E.02066
G1 X108.298 Y131.836 E.23056
; WIPE_START
G1 F8843.478
G1 X108.02 Y129.856 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.307 Y127.583 Z14.8 F42000
G1 X124.078 Y124.848 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4375
M204 S5000
G1 X126.626 Y125.184 E.07897
G1 X127.022 Y125.236 E.01229
G1 X126.955 Y125.747 E.01586
M106 S255
G1 F1800
G1 X126.907 Y126.113 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X126.222 Y131.318 E.17415
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X126.174 Y131.684 E.01134
M106 S201.45
G1 F4375
G1 X126.106 Y132.196 E.01586
G1 X125.71 Y132.144 E.01229
G1 X123.162 Y131.808 E.07897
G1 X124.01 Y125.362 E.19977
G1 X124.07 Y124.908 E.01409
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.058 Y125.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.427 Y125.013 Z14.8 F42000
G1 X106.922 Y124.848 Z14.8
G1 Z14.4
G1 E.8 F1800
G1 F4375
M204 S5000
G1 X107.838 Y131.808 E.2157
G1 X105.29 Y132.144 E.07897
G1 X104.894 Y132.196 E.01229
G1 X104.826 Y131.684 E.01586
M106 S255
G1 F1800
G1 X104.778 Y131.318 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X104.093 Y126.113 E.17415
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X104.045 Y125.747 E.01134
M106 S201.45
G1 F4375
G1 X103.978 Y125.236 E.01586
G1 X104.374 Y125.184 E.01229
G1 X106.652 Y124.884 E.07059
G1 X106.863 Y124.856 E.00654
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.141 Y126.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.703 Y132.506 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
G1 F4375
M204 S5000
G1 X104.651 Y132.111 E.01225
G1 X104.598 Y131.714 E.01229
M106 S255
G1 F1800
G1 X104.55 Y131.348 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X103.865 Y126.143 E.17415
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X103.817 Y125.777 E.01134
M106 S201.45
G1 F4375
G1 X103.765 Y125.381 E.01229
G1 X103.713 Y124.986 E.01223
G1 X103.717 Y124.904 E.00254
G1 X103.754 Y124.833 E.00246
G3 X103.883 Y124.764 I.153 J.132 E.0046
G1 X114.184 Y123.408 E.31925
G3 X115.876 Y123.33 I1.465 J13.366 E.05209
G3 X116.816 Y123.408 I-.326 J9.612 E.029
G1 X127.117 Y124.764 E.31925
G3 X127.288 Y124.984 I-.025 J.195 E.00948
G1 X127.235 Y125.381 E.01231
G1 X127.183 Y125.777 E.01229
M106 S255
G1 F1800
G1 X127.135 Y126.143 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X126.45 Y131.348 E.17415
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1920
G1 X126.402 Y131.714 E.01134
G1 F4375
G1 X126.349 Y132.111 E.01229
G1 X126.297 Y132.506 E.01224
G3 X126.076 Y132.676 I-.193 J-.022 E.00959
G1 X115.768 Y131.319 E.31946
G2 X115.232 Y131.319 I-.268 J2.47 E.01649
G1 X104.854 Y132.674 E.32159
G3 X104.719 Y132.564 I.041 J-.19 E.00557
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.651 Y132.111 E-.17433
G1 X104.598 Y131.714 E-.152
G1 X104.55 Y131.348 E-.14022
G1 X104.449 Y130.583 E-.29346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 72 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer72 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X104.891 Y132.438 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130863
G1 F4375
M204 S6000
G1 X108.064 Y132.02 E.02293
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.516 Y131.376 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41795
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X114.82 Y127.072 E.34021
G1 X114.489 Y126.741 E.02616
G1 X109.989 Y131.241 E.35571
G1 X109.227 Y131.341 E.04297
G1 X114.158 Y126.41 E.38979
G1 X113.827 Y126.079 E.02616
G1 X108.548 Y131.359 E.41737
G1 X108.471 Y130.774 E.03297
G1 X113.496 Y125.748 E.39729
G1 X113.165 Y125.418 E.02616
G1 X108.394 Y130.189 E.37722
G1 X108.317 Y129.605 E.03297
G1 X112.834 Y125.087 E.35715
G1 X112.504 Y124.756 E.02616
G1 X108.24 Y129.02 E.33708
G1 X108.163 Y128.435 E.03297
G1 X112.154 Y124.443 E.31554
G1 X111.392 Y124.544 E.04297
G1 X108.086 Y127.85 E.26138
G1 X108.009 Y127.265 E.03297
G1 X110.63 Y124.644 E.20722
G1 X109.868 Y124.744 E.04297
G1 X107.932 Y126.681 E.15306
G1 X107.855 Y126.096 E.03297
G1 X109.106 Y124.845 E.0989
G1 X108.344 Y124.945 E.04297
G1 X107.597 Y125.692 E.05901
M106 S201.45
; WIPE_START
G1 X108.344 Y124.945 E-.40114
G1 X109.106 Y124.845 E-.2921
G1 X108.981 Y124.969 E-.06676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130836
; LAYER_HEIGHT: 0.2
G1 F4375
M204 S6000
G1 X103.913 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.403 Y126.115 Z14.8 F42000
G1 X114.708 Y126.354 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4375
M204 S6000
G1 X115.432 Y127.078 E.03399
G1 X115.005 Y127.505 E.02003
G1 X116.763 Y129.263 E.08247
G1 X120.174 Y125.852 E.16002
G1 X119.856 Y125.534 E.01493
G1 X120.283 Y125.107 E.02003
G1 X119.712 Y124.536 E.0268
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
G1 X114.193 Y130.709 E.05401
; WIPE_START
G1 F8843.478
G1 X112.579 Y130.921 E-.61876
G1 X112.841 Y130.659 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.406 Y131.673 Z14.8 F42000
G1 X126.109 Y132.438 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130836
G1 F4375
M204 S6000
G1 X122.936 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.776 Y131.546 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41999
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X122.527 Y130.795 E.05994
G1 X122.627 Y130.029 E.04358
G1 X121.369 Y131.288 E.10046
G1 X120.782 Y131.211 E.03344
G1 X122.728 Y129.264 E.15539
G1 X122.829 Y128.499 E.04358
G1 X120.194 Y131.133 E.21032
G1 X119.607 Y131.056 E.03344
G1 X122.93 Y127.733 E.26524
G1 X123.031 Y126.968 E.04358
G1 X119.02 Y130.979 E.32017
G1 X118.432 Y130.901 E.03344
G1 X123.131 Y126.202 E.3751
G1 X123.232 Y125.437 E.04358
G1 X117.953 Y130.716 E.42138
G1 X117.628 Y130.376 E.02654
G1 X123.012 Y124.992 E.42979
G1 X122.425 Y124.915 E.03344
G1 X117.296 Y130.044 E.40943
G1 X116.964 Y129.711 E.02653
G1 X121.838 Y124.837 E.38908
G1 X121.25 Y124.76 E.03344
G1 X120.326 Y125.684 E.07378
M106 S201.45
; WIPE_START
G1 X121.25 Y124.76 E-.49671
G1 X121.838 Y124.837 E-.22511
G1 X121.767 Y124.908 E-.03818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
; LAYER_HEIGHT: 0.2
G1 F4375
M204 S6000
G1 X127.087 Y125.002 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X125.105 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 73/85
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z14.8 I-.472 J-1.122 P1  F42000
G1 X108.239 Y131.844 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3169
M204 S6000
G1 X107.299 Y124.71 E.2387
G1 X114.231 Y123.797 E.23192
G3 X115.866 Y123.722 I1.413 J12.851 E.05432
G3 X116.769 Y123.797 I-.324 J9.326 E.03009
G1 X123.701 Y124.71 E.23192
G1 X122.761 Y131.844 E.2387
G1 X115.811 Y130.929 E.23255
G2 X115.19 Y130.929 I-.311 J2.871 E.02064
G1 X108.298 Y131.836 E.23058
; WIPE_START
G1 F8843.478
G1 X108.02 Y129.856 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.344 Y127.708 Z15 F42000
G1 X124.037 Y125.158 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3169
M204 S5000
G1 X124.078 Y124.848 E.00961
G1 X127.022 Y125.236 E.09126
G1 X126.106 Y132.196 E.2157
G1 X123.162 Y131.808 E.09126
G1 X124.029 Y125.218 E.20425
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.078 Y124.848 E-.14168
G1 X125.691 Y125.061 E-.61832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.059 Y124.974 Z15 F42000
G1 X106.922 Y124.848 Z15
G1 Z14.6
G1 E.8 F1800
G1 F3169
M204 S5000
G1 X107.838 Y131.808 E.21571
G1 X104.894 Y132.196 E.09126
G1 X103.978 Y125.236 E.2157
G1 X106.863 Y124.856 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.141 Y126.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.703 Y132.506 Z15 F42000
G1 Z14.6
M73 P90 R2
G1 E.8 F1800
G1 F3169
M204 S5000
G1 X103.713 Y124.986 E.23305
G1 X103.722 Y124.889 E.003
G1 X103.773 Y124.813 E.00282
G3 X103.883 Y124.764 I.154 J.2 E.00373
G1 X114.184 Y123.408 E.31925
G3 X115.882 Y123.33 I1.465 J13.368 E.05226
G3 X116.816 Y123.408 I-.335 J9.645 E.02883
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.022 J.193 E.00959
G1 X126.297 Y132.506 E.23305
G3 X126.078 Y132.676 I-.192 J-.02 E.00953
G1 X115.768 Y131.319 E.31954
G2 X115.232 Y131.319 I-.268 J2.397 E.01649
G1 X104.854 Y132.674 E.32159
G3 X104.718 Y132.564 I.041 J-.19 E.00558
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.455 Y130.582 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 73 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer73 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X104.891 Y132.438 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13085
G1 F3169
M204 S6000
G1 X108.064 Y132.02 E.02293
; WIPE_START
G1 F15000
G1 X106.081 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.12 Y126.549 Z15 F42000
G1 X111.256 Y126.395 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3169
M204 S6000
G1 X111.044 Y124.78 E.05401
G1 X111.288 Y124.536 E.01146
G1 X111.949 Y124.449 E.02211
G1 X118.421 Y130.921 E.30364
G2 X115.502 Y130.56 I-4.142 J21.506 E.09767
G2 X112.579 Y130.921 I1.193 J21.665 E.09777
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X119.956 Y124.78 E.01146
G1 X119.744 Y126.395 E.05401
; WIPE_START
G1 F8843.478
G1 X119.956 Y124.78 E-.61876
G1 X119.712 Y124.536 E-.1313
G1 X119.686 Y124.532 E-.00995
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.915 Y124.585 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F3169
M204 S6000
G1 X127.087 Y125.002 E.02293
M204 S10000
G1 X126.109 Y132.438 F42000
; LINE_WIDTH: 0.130846
G1 F3169
M204 S6000
G1 X122.936 Y132.02 E.02293
; WIPE_START
G1 F15000
G1 X124.919 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.53 Y131.023 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3169
M204 S6000
G1 X122.424 Y131.404 E.0897
G1 X123.261 Y125.047 E.19701
G1 X120.367 Y124.666 E.0897
G1 X119.537 Y130.964 E.19517
M204 S10000
G1 X122.696 Y126.445 F42000
G1 F3169
M204 S6000
G1 X122.838 Y125.372 E.03326
G1 X120.691 Y125.089 E.06653
G1 X119.953 Y130.699 E.17384
G1 X122.099 Y130.981 E.06653
G1 X122.689 Y126.505 E.13873
M204 S10000
G1 X122.323 Y126.396 F42000
G1 F3169
M204 S6000
G1 X122.415 Y125.697 E.02168
G1 X121.016 Y125.512 E.04335
G1 X120.376 Y130.374 E.15067
G1 X121.775 Y130.558 E.04335
G1 X122.315 Y126.455 E.12715
M204 S10000
G1 X121.879 Y126.338 F42000
; LINE_WIDTH: 0.55985
G1 F3169
M204 S6000
G1 X121.913 Y126.081 E.01089
G1 X121.401 Y126.014 E.02177
G1 X120.877 Y129.989 E.16889
G1 X121.39 Y130.057 E.02177
G1 X121.872 Y126.397 E.15548
M204 S10000
G1 X110.824 Y126.113 F42000
; LINE_WIDTH: 0.41999
G1 F3169
M204 S6000
G1 X110.633 Y124.666 E.04485
G1 X107.739 Y125.047 E.0897
G1 X108.576 Y131.404 E.19701
G1 X111.47 Y131.023 E.0897
G1 X110.832 Y126.173 E.15032
M204 S10000
G1 X110.45 Y126.163 F42000
G1 F3169
M204 S6000
G1 X110.309 Y125.089 E.03326
G1 X108.162 Y125.372 E.06653
G1 X108.901 Y130.981 E.17384
G1 X111.047 Y130.699 E.06653
G1 X110.458 Y126.222 E.13873
M204 S10000
G1 X110.076 Y126.212 F42000
G1 F3169
M204 S6000
G1 X109.984 Y125.512 E.02168
G1 X108.585 Y125.697 E.04335
G1 X109.225 Y130.558 E.15067
G1 X110.624 Y130.374 E.04335
G1 X110.084 Y126.271 E.12715
M204 S10000
G1 X109.633 Y126.27 F42000
; LINE_WIDTH: 0.55987
G1 F3169
M204 S6000
G1 X109.599 Y126.014 E.01089
G1 X109.087 Y126.081 E.02178
G1 X109.61 Y130.057 E.1689
G1 X110.123 Y129.989 E.02178
G1 X109.641 Y126.33 E.15548
; WIPE_START
G1 F6963.931
G1 X109.902 Y128.313 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.085 Y124.585 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130829
G1 F3169
M204 S6000
G1 X103.913 Y125.002 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X105.895 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 74/85
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z15 I-1.21 J-.133 P1  F42000
G1 X105.066 Y132.262 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3387.004
M204 S6000
G1 X105.051 Y132.147 E.00383
G1 F2520
G1 X104.142 Y125.242 E.23104
G1 F3386.934
G1 X104.127 Y125.127 E.00383
G1 F4510
G1 X104.523 Y125.075 E.01327
G1 X104.92 Y125.023 E.01327
G1 X114.231 Y123.797 E.31153
G3 X115.871 Y123.722 I1.412 J12.841 E.05449
G3 X116.769 Y123.797 I-.332 J9.349 E.02992
G1 X126.08 Y125.023 E.31153
G1 X126.477 Y125.075 E.01327
G1 X126.873 Y125.127 E.01327
G1 F3387.014
G1 X126.858 Y125.242 E.00383
G1 F2520
G1 X125.949 Y132.147 E.23104
G1 F3386.924
G1 X125.934 Y132.262 E.00383
G1 F4510
G1 X125.537 Y132.21 E.01327
G1 X125.141 Y132.157 E.01327
G1 X115.81 Y130.929 E.31218
G2 X115.19 Y130.929 I-.31 J2.803 E.02063
G1 X105.125 Y132.254 E.33673
M204 S250
G1 X104.703 Y132.506 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4510
M204 S5000
G1 X103.713 Y124.986 E.23305
G1 X103.717 Y124.902 E.00259
G1 X103.754 Y124.833 E.0024
G3 X103.883 Y124.764 I.153 J.132 E.00459
G1 X114.184 Y123.408 E.31926
G3 X115.887 Y123.33 I1.465 J13.359 E.05242
G3 X116.816 Y123.408 I-.343 J9.667 E.02866
G1 X127.117 Y124.764 E.31925
G3 X127.288 Y124.983 I-.022 J.193 E.00951
G1 X126.297 Y132.506 E.23313
G3 X126.076 Y132.676 I-.193 J-.022 E.00958
G1 X115.768 Y131.319 E.31948
G2 X115.232 Y131.319 I-.268 J2.339 E.01649
G1 X104.854 Y132.674 E.32159
G3 X104.719 Y132.564 I.041 J-.189 E.00557
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.455 Y130.582 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 74 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer74 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X104.483 Y125.246 F42000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42882
M106 S255
G1 F3000
M204 S6000
G1 X105.357 Y131.887 E.21066
G1 X105.74 Y131.837 E.01214
G1 X104.888 Y125.363 E.20532
G1 X105.27 Y125.313 E.01214
G1 X106.122 Y131.787 E.20532
G1 X106.505 Y131.736 E.01214
G1 X105.653 Y125.263 E.20532
G1 X106.035 Y125.212 E.01214
G1 X106.888 Y131.686 E.20532
G1 X107.27 Y131.635 E.01214
G1 X106.418 Y125.162 E.20532
G1 X106.801 Y125.112 E.01214
G1 X107.653 Y131.585 E.20532
G1 X108.035 Y131.535 E.01214
G1 X107.183 Y125.061 E.20532
G1 X107.566 Y125.011 E.01214
G1 X108.418 Y131.484 E.20532
G1 X108.801 Y131.434 E.01214
G1 X107.926 Y124.792 E.21066
M106 S201.45
M204 S10000
G1 X110.785 Y125.816 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4510
M204 S6000
G1 X110.633 Y124.666 E.03564
G1 X108.334 Y124.969 E.07126
G1 X109.167 Y131.326 E.19701
G1 X111.47 Y131.023 E.07139
G1 X110.793 Y125.876 E.15952
M204 S10000
G1 X110.411 Y125.866 F42000
G1 F4510
M204 S6000
G1 X110.309 Y125.089 E.02406
G1 X108.757 Y125.294 E.0481
G1 X109.492 Y130.903 E.17384
G1 X111.047 Y130.699 E.04821
G1 X110.419 Y125.925 E.14794
M204 S10000
G1 X110.037 Y125.915 F42000
G1 F4510
M204 S6000
G1 X109.984 Y125.512 E.01247
G1 X109.18 Y125.618 E.02493
G1 X109.816 Y130.48 E.15067
G1 X110.624 Y130.374 E.02503
G1 X110.045 Y125.974 E.13635
M204 S10000
G1 X110.167 Y130.023 F42000
; LINE_WIDTH: 0.47893
G1 F4510
M204 S6000
G1 X109.643 Y126.027 E.1432
M204 S10000
G1 X119.744 Y126.395 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4510
M204 S6000
G1 X119.956 Y124.78 E.05401
G1 X119.712 Y124.536 E.01146
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
G3 X115.5 Y130.56 I4.119 J21.329 E.09772
G3 X118.421 Y130.921 I-1.201 J21.713 E.09772
G1 X111.949 Y124.449 E.30364
G1 X111.288 Y124.536 E.02211
G1 X111.044 Y124.78 E.01146
G1 X111.256 Y126.395 E.05401
M204 S10000
G1 X122.518 Y126.122 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4510
M204 S6000
G1 X122.67 Y124.97 E.03571
G1 X120.367 Y124.666 E.07139
G1 X119.53 Y131.023 E.19701
G1 X121.829 Y131.326 E.07126
G1 X122.51 Y126.181 E.15946
M204 S10000
G1 X122.144 Y126.072 F42000
G1 F4510
M204 S6000
G1 X122.247 Y125.294 E.02411
G1 X120.691 Y125.089 E.04821
G1 X119.953 Y130.699 E.17384
G1 X121.505 Y130.903 E.0481
G1 X122.136 Y126.132 E.14788
M204 S10000
G1 X121.77 Y126.023 F42000
G1 F4510
M204 S6000
G1 X121.824 Y125.619 E.01252
G1 X121.016 Y125.512 E.02503
G1 X120.376 Y130.374 E.15067
G1 X121.18 Y130.48 E.02493
G1 X121.762 Y126.082 E.1363
M204 S10000
G1 X120.831 Y130.024 F42000
; LINE_WIDTH: 0.47891
G1 F4510
M204 S6000
G1 X121.359 Y126.029 E.14319
M204 S10000
G1 X122.177 Y131.602 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42882
M106 S255
G1 F3000
M204 S6000
G1 X123.052 Y124.96 E.21066
G1 X123.434 Y125.011 E.01214
G1 X122.582 Y131.484 E.20532
G1 X122.965 Y131.535 E.01213
G1 X123.817 Y125.061 E.20532
M73 P91 R2
G1 X124.199 Y125.112 E.01214
G1 X123.347 Y131.585 E.20532
G1 X123.73 Y131.635 E.01214
G1 X124.582 Y125.162 E.20532
G1 X124.965 Y125.212 E.01214
G1 X124.112 Y131.686 E.20532
G1 X124.495 Y131.736 E.01213
G1 X125.347 Y125.263 E.20532
G1 X125.73 Y125.313 E.01213
G1 X124.878 Y131.787 E.20532
G1 X125.26 Y131.837 E.01214
G1 X126.112 Y125.363 E.20532
G1 X126.495 Y125.414 E.01214
G1 X125.621 Y132.055 E.21066
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X125.882 Y130.073 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 75/85
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z15.2 I-.127 J-1.21 P1  F42000
G1 X105.066 Y132.262 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3724
M204 S6000
G1 X104.127 Y125.127 E.2387
G1 X114.231 Y123.797 E.33807
G3 X115.876 Y123.722 I1.412 J12.837 E.05468
G3 X116.769 Y123.797 I-.341 J9.38 E.02973
G1 X126.873 Y125.127 E.33806
G1 X125.934 Y132.262 E.2387
G1 X115.811 Y130.929 E.33871
G2 X115.189 Y130.929 I-.311 J2.917 E.02064
G1 X105.125 Y132.254 E.33672
M204 S250
G1 X104.703 Y132.506 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3724
M204 S5000
G1 X103.711 Y124.961 E.23382
G3 X103.883 Y124.764 I.191 J-.007 E.00886
G1 X114.184 Y123.408 E.31925
G3 X115.893 Y123.33 I1.464 J13.354 E.05259
G3 X116.816 Y123.408 I-.352 J9.698 E.02849
G1 X127.117 Y124.764 E.31925
G3 X127.288 Y124.984 I-.022 J.193 E.00951
G1 X126.297 Y132.505 E.23312
G3 X126.076 Y132.676 I-.195 J-.025 E.00955
G1 X115.768 Y131.319 E.31947
G2 X115.232 Y131.319 I-.268 J2.436 E.01649
G1 X104.854 Y132.674 E.32159
G3 X104.718 Y132.564 I.039 J-.187 E.00559
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.455 Y130.582 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 75 start: 394
M624 AQAAAAAAAAA=
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


; object ids of this layer75 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X105.906 Y131.986 F42000
G1 Z15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43371
G1 F3724
M204 S6000
G1 X105.284 Y131.364 E.02803
G1 X105.2 Y130.727 E.02044
G1 X106.243 Y131.771 E.04699
G1 X106.732 Y131.706 E.01569
G1 X105.116 Y130.091 E.07276
G1 X105.032 Y129.454 E.02044
G1 X107.22 Y131.642 E.09852
G1 X107.708 Y131.578 E.01569
G1 X104.949 Y128.818 E.12429
G1 X104.865 Y128.182 E.02044
G1 X108.197 Y131.514 E.15006
G1 X108.685 Y131.449 E.01569
G1 X104.781 Y127.545 E.17582
G1 X104.697 Y126.909 E.02044
G1 X109.174 Y131.385 E.20159
G1 X109.662 Y131.321 E.01569
G1 X104.613 Y126.272 E.22736
G1 X104.53 Y125.636 E.02044
G1 X110.15 Y131.256 E.25312
G1 X110.639 Y131.192 E.01569
G1 X104.819 Y125.372 E.26209
G1 X105.307 Y125.308 E.01569
G1 X111.127 Y131.128 E.26209
G1 X111.478 Y131.082 E.01127
G1 X111.454 Y130.902 E.00575
G1 X105.796 Y125.244 E.25484
G1 X106.284 Y125.179 E.01569
G1 X111.371 Y130.266 E.22907
G1 X111.287 Y129.63 E.02044
G1 X106.772 Y125.115 E.2033
G1 X107.261 Y125.051 E.01569
G1 X111.203 Y128.993 E.17754
G1 X111.119 Y128.357 E.02044
G1 X107.749 Y124.987 E.15177
G1 X108.238 Y124.922 E.01569
G1 X111.035 Y127.72 E.126
G1 X110.952 Y127.084 E.02044
G1 X108.726 Y124.858 E.10024
G1 X109.214 Y124.794 E.01569
G1 X110.868 Y126.447 E.07447
G1 X110.784 Y125.811 E.02044
G1 X109.703 Y124.729 E.0487
G1 X110.191 Y124.665 E.01569
G1 X110.897 Y125.371 E.03181
M204 S10000
G1 X111.256 Y126.395 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3724
M204 S6000
G1 X111.044 Y124.78 E.05401
G1 X111.288 Y124.536 E.01146
G1 X111.949 Y124.449 E.02211
G1 X118.421 Y130.921 E.30364
G2 X115.5 Y130.56 I-4.133 J21.432 E.09772
G2 X112.579 Y130.921 I1.211 J21.793 E.09772
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X119.956 Y124.78 E.01146
G1 X119.744 Y126.395 E.05401
M204 S10000
G1 X119.425 Y130.52 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42067
G1 F3724
M204 S6000
G1 X120.057 Y131.152 E.02751
G1 X120.672 Y131.233 E.0191
G1 X119.638 Y130.199 E.045
G1 X119.7 Y129.727 E.01466
G1 X121.287 Y131.314 E.06908
G1 X121.902 Y131.395 E.0191
G1 X119.763 Y129.255 E.09316
G1 X119.825 Y128.783 E.01466
G1 X122.518 Y131.476 E.11723
G1 X123.133 Y131.557 E.0191
G1 X119.887 Y128.311 E.14131
G1 X119.949 Y127.839 E.01466
G1 X123.748 Y131.638 E.16538
G1 X124.363 Y131.719 E.0191
G1 X120.011 Y127.367 E.18946
G1 X120.073 Y126.895 E.01466
G1 X124.979 Y131.8 E.21354
G1 X125.594 Y131.881 E.0191
G1 X120.135 Y126.423 E.23761
G1 X120.198 Y125.951 E.01466
G1 X125.704 Y131.457 E.23971
G1 X125.766 Y130.985 E.01466
G1 X120.26 Y125.478 E.23971
G1 X120.322 Y125.006 E.01466
G1 X125.828 Y130.513 E.23971
G1 X125.89 Y130.041 E.01466
G1 X120.47 Y124.62 E.23595
G1 X121.085 Y124.701 E.0191
G1 X125.953 Y129.569 E.21188
G1 X126.015 Y129.097 E.01466
G1 X121.701 Y124.782 E.1878
G1 X122.316 Y124.863 E.0191
G1 X126.077 Y128.624 E.16373
G1 X126.139 Y128.152 E.01466
G1 X122.931 Y124.944 E.13965
G1 X123.546 Y125.025 E.0191
G1 X126.201 Y127.68 E.11557
G1 X126.263 Y127.208 E.01466
G1 X124.161 Y125.106 E.0915
G1 X124.777 Y125.187 E.0191
G1 X126.325 Y126.736 E.06742
G1 X126.388 Y126.264 E.01466
G1 X125.392 Y125.268 E.04335
G1 X126.007 Y125.349 E.0191
G1 X126.601 Y125.943 E.02585
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9530.112
G1 X126.007 Y125.349 E-.31915
G1 X125.392 Y125.268 E-.2358
G1 X125.773 Y125.65 E-.20505
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 76/85
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z15.4 I-.455 J-1.129 P1  F42000
G1 X111.486 Y131.417 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4194
M204 S6000
G1 X110.547 Y124.282 E.2387
G1 X114.231 Y123.797 E.12325
G3 X115.882 Y123.722 I1.411 J12.831 E.05486
G3 X116.769 Y123.797 I-.349 J9.399 E.02955
G1 X120.453 Y124.282 E.12325
G1 X119.514 Y131.417 E.2387
G1 X115.81 Y130.929 E.12391
G2 X115.19 Y130.929 I-.31 J2.801 E.02062
G1 X111.546 Y131.409 E.12192
; WIPE_START
G1 F8843.478
G1 X111.268 Y129.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.703 Y132.506 Z15.6 F42000
G1 Z15.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4194
M204 S5000
G1 X103.713 Y124.986 E.23305
G1 X103.718 Y124.902 E.00259
G1 X103.754 Y124.833 E.00239
G3 X103.883 Y124.764 I.153 J.132 E.0046
G1 X114.184 Y123.408 E.31925
G3 X115.898 Y123.33 I1.464 J13.344 E.05277
G3 X116.816 Y123.408 I-.361 J9.728 E.02832
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.022 J.193 E.00958
G1 X126.297 Y132.505 E.23305
G3 X126.076 Y132.676 I-.193 J-.022 E.00959
G1 X115.768 Y131.319 E.31947
G2 X115.232 Y131.319 I-.268 J2.339 E.01649
G1 X104.854 Y132.674 E.32159
G3 X104.718 Y132.564 I.039 J-.187 E.00559
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.455 Y130.582 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 76 start: 394
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer76 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X110.424 Y131.743 F42000
G1 Z15.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F4194
M204 S2000
G1 X111.159 Y131.007 E.03195
G1 X111.097 Y130.536
G1 X109.81 Y131.823 E.05594
G1 X109.196 Y131.904
G1 X111.035 Y130.065 E.07993
G1 X110.973 Y129.594
G1 X108.582 Y131.985 E.10392
G1 X107.968 Y132.066
G1 X110.911 Y129.122 E.12791
G1 X110.849 Y128.651
G1 X107.354 Y132.147 E.1519
G1 X106.74 Y132.228
G1 X110.787 Y128.18 E.17589
G1 X110.725 Y127.709
G1 X106.125 Y132.309 E.19988
G1 X105.511 Y132.389
G1 X110.663 Y127.238 E.22387
G1 X110.601 Y126.766
G1 X104.906 Y132.461 E.24748
G1 X104.844 Y131.99
G1 X110.539 Y126.295 E.24748
G1 X110.477 Y125.824
G1 X104.782 Y131.519 E.24748
G1 X104.72 Y131.048
G1 X110.415 Y125.353 E.24748
G1 X110.353 Y124.881
M73 P92 R2
G1 X104.658 Y130.577 E.24748
G1 X104.596 Y130.105
G1 X110.334 Y124.367 E.24935
G1 X110 Y124.168
G1 X104.534 Y129.634 E.23753
G1 X104.472 Y129.163
G1 X109.386 Y124.249 E.21354
G1 X108.772 Y124.33
G1 X104.41 Y128.692 E.18955
G1 X104.348 Y128.22
G1 X108.158 Y124.41 E.16556
G1 X107.544 Y124.491
G1 X104.286 Y127.749 E.14157
G1 X104.224 Y127.278
G1 X106.929 Y124.572 E.11758
G1 X106.315 Y124.653
G1 X104.162 Y126.807 E.09359
G1 X104.099 Y126.336
M73 P92 R1
G1 X105.701 Y124.734 E.0696
G1 X105.087 Y124.815
G1 X104.037 Y125.864 E.04561
G1 X103.975 Y125.393
G1 X104.473 Y124.896 E.02162
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.975 Y125.393 E-.2674
G1 X104.037 Y125.864 E-.18061
G1 X104.618 Y125.284 E-.31199
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.227 Y125.875 Z15.6 F42000
G1 X119.814 Y126.465 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4194
M204 S6000
G1 X120.027 Y124.851 E.05401
G1 X119.712 Y124.536 E.01478
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
G3 X115.5 Y130.56 I4.118 J21.324 E.09772
G3 X118.421 Y130.921 I-1.198 J21.696 E.09772
G1 X111.952 Y124.452 E.30351
G1 X111.286 Y124.538 E.02226
G1 X110.973 Y124.851 E.01469
G1 X111.186 Y126.465 E.05401
; WIPE_START
G1 F8843.478
G1 X110.973 Y124.851 E-.61876
G1 X111.236 Y124.588 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.069 Y127.988 Z15.6 F42000
G1 X126.153 Y132.011 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4194
M204 S2000
G1 X125.742 Y132.423 E.01788
G1 X125.271 Y132.361
G1 X126.234 Y131.397 E.04187
G1 X126.315 Y130.783
G1 X124.799 Y132.299 E.06586
G1 X124.328 Y132.237
G1 X126.396 Y130.169 E.08985
G1 X126.477 Y129.555
G1 X123.857 Y132.175 E.11384
G1 X123.386 Y132.113
G1 X126.558 Y128.941 E.13783
G1 X126.638 Y128.327
G1 X122.914 Y132.05 E.16182
G1 X122.443 Y131.988
G1 X126.719 Y127.712 E.18581
G1 X126.8 Y127.098
G1 X121.972 Y131.926 E.2098
G1 X121.501 Y131.864
G1 X126.881 Y126.484 E.23379
G1 X126.962 Y125.87
G1 X121.03 Y131.802 E.25778
G1 X120.558 Y131.74
G1 X127.043 Y125.256 E.28177
G1 X126.83 Y124.935
G1 X120.087 Y131.678 E.29301
G1 X119.726 Y131.506
G1 X126.359 Y124.873 E.28821
G1 X125.887 Y124.811
G1 X119.863 Y130.836 E.26179
G1 X119.944 Y130.222
G1 X125.416 Y124.749 E.2378
G1 X124.945 Y124.687
G1 X120.025 Y129.607 E.21381
G1 X120.106 Y128.993
G1 X124.474 Y124.625 E.18982
G1 X124.003 Y124.563
G1 X120.187 Y128.379 E.16583
G1 X120.267 Y127.765
G1 X123.531 Y124.501 E.14184
G1 X123.06 Y124.439
G1 X120.348 Y127.151 E.11785
G1 X120.429 Y126.537
G1 X122.589 Y124.377 E.09386
G1 X122.118 Y124.315
G1 X120.51 Y125.923 E.06987
G1 X120.591 Y125.309
G1 X121.647 Y124.253 E.04588
G1 X121.175 Y124.191
G1 X120.672 Y124.695 E.02189
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X121.175 Y124.191 E-.27066
G1 X121.647 Y124.253 E-.18061
G1 X121.072 Y124.828 E-.30873
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 77/85
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z15.6 I-.671 J-1.015 P1  F42000
G1 X111.015 Y131.479 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1791
M204 S6000
G1 X110.075 Y124.344 E.2387
G1 X114.231 Y123.797 E.13903
G3 X115.887 Y123.722 I1.411 J12.826 E.05504
G3 X116.769 Y123.797 I-.359 J9.437 E.02937
G1 X120.925 Y124.344 E.13903
G1 X119.985 Y131.479 E.2387
G1 X115.81 Y130.929 E.13969
G2 X115.189 Y130.929 I-.31 J2.889 E.02064
G1 X111.074 Y131.471 E.13769
; WIPE_START
G1 F8843.478
G1 X110.797 Y129.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.663 Y126.157 Z15.8 F42000
G1 X121.315 Y124.384 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1791
M204 S5000
G1 X126.887 Y125.117 E.17269
G1 X125.944 Y132.275 E.22185
G1 X120.373 Y131.542 E.17269
G1 X121.121 Y125.856 E.17622
G1 X121.307 Y124.443 E.04379
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.293 Y124.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.662 Y124.515 Z15.8 F42000
G1 X109.685 Y124.384 Z15.8
G1 Z15.4
G1 E.8 F1800
G1 F1791
M204 S5000
G1 X110.627 Y131.542 E.22185
G1 X105.056 Y132.275 E.17269
G1 X104.113 Y125.117 E.22185
G1 X105.288 Y124.962 E.03641
G1 X109.626 Y124.391 E.13443
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.903 Y126.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.967 Y132.194 Z15.8 F42000
G1 X104.703 Y132.506 Z15.8
G1 Z15.4
G1 E.8 F1800
G1 F1791
M204 S5000
G1 X103.713 Y124.986 E.23305
G1 X103.729 Y124.871 E.00356
G3 X103.883 Y124.764 I.176 J.088 E.006
G1 X114.184 Y123.408 E.31925
G3 X115.903 Y123.33 I1.464 J13.344 E.05293
G3 X116.816 Y123.408 I-.371 J9.768 E.02815
G1 X127.117 Y124.764 E.31926
G3 X127.288 Y124.984 I-.025 J.195 E.00948
G1 X126.297 Y132.506 E.23313
G3 X126.076 Y132.676 I-.193 J-.022 E.00959
G1 X115.768 Y131.319 E.31946
G2 X115.232 Y131.319 I-.268 J2.412 E.01649
G1 X104.922 Y132.676 E.31953
G1 X104.81 Y132.659 E.00349
G3 X104.719 Y132.564 I.088 J-.176 E.00413
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.455 Y130.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 77 start: 394
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer77 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X110.762 Y126.889 F42000
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1791
M204 S6000
G1 X110.549 Y125.275 E.05401
G1 X111.285 Y124.539 E.03454
G1 X111.952 Y124.452 E.02231
G1 X118.421 Y130.921 E.30348
G2 X115.5 Y130.56 I-4.13 J21.416 E.09772
G2 X112.579 Y130.921 I1.211 J21.792 E.09772
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X120.451 Y125.275 E.03467
G1 X120.238 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X120.451 Y125.275 E-.61876
G1 X120.188 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 78/85
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z15.8 I-.701 J-.995 P1  F42000
G1 X111.015 Y131.479 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1795
M204 S6000
G1 X110.075 Y124.344 E.2387
G1 X114.231 Y123.797 E.13903
G3 X115.893 Y123.722 I1.411 J12.827 E.05521
G3 X116.769 Y123.797 I-.369 J9.487 E.02919
G1 X120.925 Y124.344 E.13903
G1 X119.985 Y131.479 E.2387
G1 X115.816 Y130.93 E.13948
G2 X115.189 Y130.929 I-.318 J3.377 E.02083
G1 X111.074 Y131.471 E.13769
; WIPE_START
G1 F8843.478
G1 X110.797 Y129.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.663 Y126.157 Z16 F42000
G1 X121.315 Y124.384 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1795
M204 S5000
G1 X126.887 Y125.117 E.17269
G1 X125.944 Y132.275 E.22185
G1 X120.373 Y131.542 E.17269
G1 X120.899 Y127.541 E.12398
G1 X121.307 Y124.443 E.09602
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.293 Y124.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.662 Y124.515 Z16 F42000
G1 X109.685 Y124.384 Z16
G1 Z15.6
G1 E.8 F1800
G1 F1795
M204 S5000
G1 X110.627 Y131.542 E.22185
G1 X105.056 Y132.275 E.17269
G1 X104.113 Y125.117 E.22185
G1 X109.626 Y124.391 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.903 Y126.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.967 Y132.194 Z16 F42000
G1 X104.703 Y132.506 Z16
G1 Z15.6
G1 E.8 F1800
G1 F1795
M204 S5000
G1 X103.711 Y124.962 E.2338
G3 X103.883 Y124.764 I.192 J-.006 E.00886
G1 X114.184 Y123.408 E.31926
G3 X115.909 Y123.331 I1.463 J13.344 E.0531
G3 X116.816 Y123.408 I-.381 J9.81 E.02798
G1 X127.117 Y124.764 E.31925
G3 X127.288 Y124.983 I-.02 J.192 E.00954
G1 X126.297 Y132.505 E.23313
G3 X126.076 Y132.676 I-.192 J-.02 E.00961
G1 X115.77 Y131.319 E.3194
G2 X115.232 Y131.319 I-.27 J2.843 E.01655
G1 X104.854 Y132.674 E.32159
G3 X104.718 Y132.564 I.039 J-.188 E.00559
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.455 Y130.582 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 78 start: 394
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer78 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M73 P93 R1
G1 X120.238 Y126.889 F42000
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1795
M204 S6000
G1 X120.451 Y125.275 E.05401
G1 X119.712 Y124.536 E.03467
G1 X119.051 Y124.449 E.02211
G1 X112.579 Y130.921 E.30364
G3 X115.506 Y130.56 I4.106 J21.233 E.09794
G3 X118.421 Y130.921 I-1.335 J22.709 E.0975
G1 X111.952 Y124.452 E.30348
G1 X111.285 Y124.539 E.02231
G1 X110.549 Y125.275 E.03454
G1 X110.762 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X110.549 Y125.275 E-.61876
G1 X110.812 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 79/85
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z16 I-1.216 J.038 P1  F42000
G1 X111.015 Y131.479 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1788
M204 S6000
G1 X110.075 Y124.344 E.2387
G1 X114.231 Y123.797 E.13903
G3 X115.898 Y123.722 I1.41 J12.817 E.05539
G3 X116.769 Y123.797 I-.378 J9.522 E.02902
G1 X120.925 Y124.344 E.13903
G1 X119.985 Y131.479 E.2387
G1 X115.81 Y130.929 E.13968
G2 X115.19 Y130.929 I-.311 J2.831 E.02064
G1 X111.074 Y131.471 E.1377
; WIPE_START
G1 F8843.478
G1 X110.797 Y129.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.26 Y131.089 Z16.2 F42000
G1 X120.373 Y131.542 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1788
M204 S5000
G1 X120.677 Y129.227 E.07175
G1 X121.315 Y124.384 E.1501
G1 X126.887 Y125.117 E.17269
G1 X125.944 Y132.275 E.22185
G1 X120.432 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X120.642 Y129.561 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.741 Y126.3 Z16.2 F42000
G1 X109.685 Y124.384 Z16.2
G1 Z15.8
G1 E.8 F1800
G1 F1788
M204 S5000
G1 X110.627 Y131.542 E.22185
G1 X105.056 Y132.275 E.17269
G1 X104.113 Y125.117 E.22185
G1 X107.866 Y124.623 E.1163
G1 X109.626 Y124.391 E.05454
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.903 Y126.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.967 Y132.194 Z16.2 F42000
G1 X104.703 Y132.506 Z16.2
G1 Z15.8
G1 E.8 F1800
G1 F1788
M204 S5000
G1 X103.713 Y124.986 E.23305
G1 X103.717 Y124.902 E.00257
G1 X103.754 Y124.833 E.00241
G3 X103.883 Y124.764 I.153 J.132 E.0046
G1 X114.184 Y123.408 E.31925
G3 X115.914 Y123.331 I1.463 J13.335 E.05327
G3 X116.816 Y123.408 I-.39 J9.849 E.02782
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.985 I-.02 J.192 E.00959
G1 X126.297 Y132.506 E.23308
G3 X126.076 Y132.676 I-.192 J-.02 E.00961
G1 X115.768 Y131.319 E.31947
G2 X115.232 Y131.319 I-.268 J2.365 E.01649
G1 X104.924 Y132.676 E.31949
G1 X104.854 Y132.674 E.00213
G1 X104.771 Y132.635 E.00283
G3 X104.718 Y132.563 I.132 J-.153 E.00275
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.455 Y130.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 79 start: 394
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer79 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X110.762 Y126.889 F42000
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1788
M204 S6000
G1 X110.549 Y125.275 E.05401
G1 X111.285 Y124.539 E.03454
G1 X111.952 Y124.452 E.02231
G1 X118.421 Y130.921 E.30348
G2 X115.501 Y130.56 I-4.132 J21.426 E.09769
G2 X112.579 Y130.921 I1.198 J21.699 E.09775
G1 X119.051 Y124.449 E.30364
G1 X119.712 Y124.536 E.02211
G1 X120.451 Y125.275 E.03467
G1 X120.238 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X120.451 Y125.275 E-.61876
G1 X120.188 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 80/85
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z16.2 I-.701 J-.995 P1  F42000
G1 X111.015 Y131.479 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2038
M204 S6000
G1 X110.075 Y124.344 E.2387
G1 X114.231 Y123.797 E.13903
G3 X115.903 Y123.723 I1.41 J12.815 E.05557
G3 X116.769 Y123.797 I-.387 J9.553 E.02884
G1 X120.925 Y124.344 E.13903
G1 X119.985 Y131.479 E.2387
G1 X115.81 Y130.929 E.13969
G2 X115.19 Y130.929 I-.31 J2.849 E.02063
G1 X111.074 Y131.471 E.1377
; WIPE_START
G1 F8843.478
G1 X110.797 Y129.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.685 Y124.384 Z16.4 F42000
G1 Z16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2038
M204 S5000
G1 X110.627 Y131.542 E.22185
G1 X105.056 Y132.275 E.17269
G1 X104.113 Y125.117 E.22185
G1 X109.155 Y124.453 E.15625
G1 X109.626 Y124.391 E.0146
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.903 Y126.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.747 Y129.751 Z16.4 F42000
G1 X120.373 Y131.542 Z16.4
G1 Z16
G1 E.8 F1800
G1 F2038
M204 S5000
G1 X120.455 Y130.912 E.01951
G1 X121.315 Y124.384 E.20234
G1 X126.887 Y125.117 E.17269
G1 X125.944 Y132.275 E.22185
G1 X120.432 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X120.455 Y130.912 E-.24237
G1 X120.633 Y129.562 E-.51763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.128 Y130.949 Z16.4 F42000
G1 X104.703 Y132.506 Z16.4
G1 Z16
G1 E.8 F1800
G1 F2038
M204 S5000
G1 X103.713 Y124.986 E.23305
G1 X103.714 Y124.916 E.00215
G1 X103.754 Y124.833 E.00283
G3 X103.883 Y124.764 I.153 J.132 E.0046
G1 X114.184 Y123.408 E.31925
G3 X115.92 Y123.331 I1.462 J13.328 E.05344
G3 X116.816 Y123.408 I-.401 J9.893 E.02765
G1 X127.117 Y124.764 E.31925
G3 X127.288 Y124.983 I-.02 J.192 E.00953
G1 X126.297 Y132.506 E.23313
M73 P94 R1
G3 X126.076 Y132.676 I-.192 J-.02 E.00962
G1 X115.768 Y131.319 E.31946
G2 X115.232 Y131.319 I-.268 J2.377 E.01649
G1 X104.924 Y132.676 E.31948
G1 X104.854 Y132.674 E.00214
G1 X104.771 Y132.635 E.00283
G3 X104.718 Y132.563 I.132 J-.153 E.00275
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.455 Y130.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 80 start: 394
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer80 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X115.851 Y130.568 F42000
G1 Z16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F2038
M204 S6000
G2 X115.149 Y130.568 I-.351 J8.224 E.01944
G1 X111.485 Y131.051 E.1024
G1 X111.38 Y130.904 E.00499
G1 X110.578 Y124.806 E.17042
G1 X110.64 Y124.637 E.00499
G1 X114.274 Y124.162 E.10154
G3 X116.734 Y124.158 I1.244 J10.103 E.06831
G1 X120.36 Y124.636 E.10133
G1 X120.423 Y124.805 E.00499
G1 X119.62 Y130.904 E.17045
G1 X119.515 Y131.051 E.00499
G1 X115.91 Y130.576 E.10074
M204 S10000
G1 X120.082 Y125.187 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2038
M204 S6000
G1 X120.111 Y124.969 E.00731
G1 X118.715 Y124.785 E.0467
G1 X113.017 Y130.483 E.26732
G3 X115.501 Y130.183 I3.523 J18.683 E.08309
G3 X117.983 Y130.483 I-1.065 J19.174 E.08299
G1 X112.285 Y124.785 E.26731
G1 X110.889 Y124.97 E.0467
G1 X110.918 Y125.187 E.00725
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X110.889 Y124.97 E-.08307
G1 X112.285 Y124.785 E-.53501
G1 X112.549 Y125.049 E-.14192
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 81/85
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z16.4 I-.845 J-.876 P1  F42000
G1 X105.066 Y132.262 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X104.127 Y125.127 E.2387
G1 X114.231 Y123.797 E.33807
G3 X115.909 Y123.723 I1.41 J12.812 E.05575
G3 X116.769 Y123.797 I-.398 J9.599 E.02865
G1 X126.873 Y125.127 E.33807
G1 X125.934 Y132.262 E.2387
G1 X115.817 Y130.93 E.33851
G2 X115.19 Y130.929 I-.318 J3.342 E.02083
G1 X105.125 Y132.254 E.33673
M204 S250
G1 X104.703 Y132.505 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.714 Y124.916 E.23517
G3 X103.883 Y124.764 I.189 J.041 E.00745
G1 X114.184 Y123.408 E.31925
G3 X115.926 Y123.331 I1.463 J13.333 E.05361
G3 X116.816 Y123.408 I-.412 J9.939 E.02748
G1 X127.117 Y124.764 E.31925
G3 X127.287 Y124.986 I-.02 J.192 E.00961
G1 X126.297 Y132.506 E.23306
G3 X126.076 Y132.676 I-.191 J-.019 E.00963
G1 X115.77 Y131.319 E.3194
G2 X115.232 Y131.319 I-.27 J2.811 E.01655
G1 X104.854 Y132.674 E.32159
G3 X104.718 Y132.564 I.041 J-.19 E.00558
; WIPE_START
M204 S6000
G1 X104.458 Y130.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 81 start: 394
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer81 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X105.237 Y131.9 F42000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4266
M106 S255
G1 F3000
M204 S6000
G1 X111.134 Y131.123 E.18597
G1 X111.084 Y130.743 E.012
G1 X105.355 Y131.497 E.18067
G1 X105.305 Y131.117 E.012
G1 X111.034 Y130.363 E.18067
G1 X110.984 Y129.982 E.012
G1 X105.255 Y130.736 E.18067
G1 X105.205 Y130.356 E.012
G1 X110.934 Y129.602 E.18067
G1 X110.884 Y129.221 E.012
G1 X105.155 Y129.976 E.18067
G1 X105.105 Y129.595 E.012
G1 X110.834 Y128.841 E.18067
G1 X110.784 Y128.461 E.012
G1 X105.055 Y129.215 E.18067
G1 X105.005 Y128.834 E.012
G1 X110.734 Y128.08 E.18067
G1 X110.684 Y127.7 E.012
G1 X104.955 Y128.454 E.18067
G1 X104.904 Y128.074 E.012
G1 X110.634 Y127.319 E.18067
G1 X110.584 Y126.939 E.012
G1 X104.854 Y127.693 E.18067
G1 X104.804 Y127.313 E.012
G1 X110.533 Y126.559 E.18067
G1 X110.483 Y126.178 E.012
G1 X104.754 Y126.932 E.18067
G1 X104.704 Y126.552 E.012
G1 X110.433 Y125.798 E.18067
G1 X110.383 Y125.417 E.012
G1 X104.654 Y126.172 E.18067
G1 X104.604 Y125.791 E.012
G1 X110.333 Y125.037 E.18067
G1 X110.283 Y124.657 E.012
G1 X104.386 Y125.433 E.18597
M106 S201.45
; WIPE_START
G1 X106.369 Y125.172 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.6 I-.876 J.845 P1  F42000
G1 X111.227 Y130.206 Z16.6
G1 Z16.2
G1 E.8 F1800
; LINE_WIDTH: 0.40412
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X111.997 Y130.976 E.05696
G1 X112.565 Y130.902 E.02991
G1 X111.364 Y129.701 E.08872
G1 X111.267 Y128.962 E.03898
G1 X113.132 Y130.827 E.13786
G1 X113.7 Y130.752 E.02991
G1 X111.17 Y128.222 E.187
G1 X111.072 Y127.482 E.03898
G1 X114.267 Y130.677 E.23613
G1 X114.835 Y130.603 E.02991
G1 X110.975 Y126.743 E.28527
G1 X110.878 Y126.003 E.03899
G1 X115.418 Y130.544 E.33561
G3 X116.112 Y130.596 I.035 J4.228 E.0364
G1 X110.78 Y125.264 E.39408
G1 X110.697 Y124.635 E.03312
G1 X110.783 Y124.624 E.0045
G1 X116.852 Y130.693 E.44855
G1 X117.591 Y130.791 E.03899
G1 X111.35 Y124.549 E.46127
G1 X111.918 Y124.475 E.02991
G1 X118.331 Y130.888 E.47398
G1 X119.071 Y130.985 E.03899
G1 X112.485 Y124.4 E.4867
G1 X113.053 Y124.325 E.02991
G1 X119.495 Y130.768 E.47614
G1 X119.57 Y130.2 E.02991
G1 X113.62 Y124.251 E.43972
G1 X114.188 Y124.176 E.02991
G1 X119.645 Y129.633 E.4033
G1 X119.719 Y129.065 E.02991
M73 P95 R1
G1 X114.775 Y124.121 E.36543
G3 X115.389 Y124.093 I.468 J3.503 E.03217
G1 X119.794 Y128.498 E.32556
G1 X119.869 Y127.93 E.02991
G1 X116.044 Y124.106 E.28266
G3 X116.748 Y124.167 I-.344 J7.954 E.03695
G1 X119.944 Y127.363 E.23615
G1 X120.018 Y126.795 E.02991
G1 X117.488 Y124.265 E.18701
G1 X118.227 Y124.362 E.03898
G1 X120.093 Y126.228 E.13787
G1 X120.168 Y125.66 E.02991
G1 X118.967 Y124.459 E.08873
G1 X119.707 Y124.557 E.03898
G1 X120.423 Y125.273 E.05293
M106 S201.45
M204 S10000
G1 X120.549 Y124.634 F42000
; LINE_WIDTH: 0.42661
; LAYER_HEIGHT: 0.2
M106 S255
G1 F3000
M204 S6000
G1 X121.44 Y124.752 E.02811
G1 X121.483 Y124.808 E.00221
G1 X126.44 Y125.46 E.1563
G1 X126.396 Y125.791 E.01043
G1 X120.667 Y125.037 E.18067
G1 X120.617 Y125.417 E.012
G1 X126.346 Y126.171 E.18067
G1 X126.296 Y126.552 E.012
G1 X120.567 Y125.798 E.18067
G1 X120.517 Y126.178 E.012
G1 X126.246 Y126.932 E.18067
G1 X126.196 Y127.313 E.012
G1 X120.467 Y126.558 E.18067
G1 X120.417 Y126.939 E.012
G1 X126.146 Y127.693 E.18067
G1 X126.096 Y128.073 E.012
G1 X120.366 Y127.319 E.18067
G1 X120.316 Y127.7 E.012
G1 X126.045 Y128.454 E.18067
G1 X125.995 Y128.834 E.012
G1 X120.266 Y128.08 E.18067
G1 X120.216 Y128.46 E.012
G1 X125.945 Y129.215 E.18067
G1 X125.895 Y129.595 E.012
G1 X120.166 Y128.841 E.18067
G1 X120.116 Y129.221 E.012
G1 X125.845 Y129.976 E.18067
G1 X125.795 Y130.356 E.012
G1 X120.066 Y129.602 E.18067
G1 X120.016 Y129.982 E.012
G1 X125.745 Y130.736 E.18067
G1 X125.695 Y131.117 E.012
G1 X119.966 Y130.362 E.18067
G1 X119.916 Y130.743 E.012
G1 X125.645 Y131.497 E.18067
G1 X125.601 Y131.828 E.01043
G1 X120.645 Y131.176 E.15631
G1 X120.589 Y131.219 E.00221
G1 X119.697 Y131.101 E.02811
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F3000
G1 X120.589 Y131.219 E-.34163
G1 X120.645 Y131.176 E-.02683
G1 X121.666 Y131.31 E-.39154
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 82/85
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z16.6 I-.07 J-1.215 P1  F42000
G1 X105.072 Y132.261 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4975
M204 S6000
G1 X104.133 Y125.127 E.2387
G1 X114.231 Y123.797 E.33785
G3 X115.914 Y123.723 I1.41 J12.813 E.05592
G3 X116.769 Y123.797 I-.409 J9.652 E.02849
G1 X126.867 Y125.127 E.33785
G1 X125.928 Y132.261 E.2387
G1 X115.81 Y130.929 E.33851
G2 X115.19 Y130.929 I-.31 J2.811 E.02062
G1 X105.132 Y132.253 E.33652
M204 S250
G1 X104.709 Y132.503 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4975
M204 S5000
G1 X103.719 Y124.985 E.23301
G1 X103.722 Y124.911 E.00229
G3 X103.895 Y124.762 I.191 J.049 E.00747
G1 X114.184 Y123.408 E.31886
G3 X115.931 Y123.331 I1.463 J13.332 E.05377
G3 X116.816 Y123.408 I-.423 J9.998 E.02731
G1 X127.105 Y124.762 E.31887
G3 X127.281 Y124.985 I-.015 J.193 E.0098
G1 X126.291 Y132.505 E.23305
G3 X126.063 Y132.674 I-.193 J-.022 E.00977
G1 X115.768 Y131.319 E.31908
G2 X115.232 Y131.319 I-.268 J2.346 E.01649
G1 X104.937 Y132.674 E.31908
G1 X104.849 Y132.67 E.00271
G1 X104.778 Y132.633 E.00245
G3 X104.724 Y132.561 I.131 J-.153 E.00278
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.461 Y130.578 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 82 start: 394
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer82 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X105.199 Y125.151 F42000
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42121
G1 F4975
M204 S6000
G1 X104.557 Y125.793 E.02797
G1 X104.619 Y126.266 E.0147
G1 X105.618 Y125.267 E.04352
G1 X106.234 Y125.186 E.01916
G1 X104.681 Y126.738 E.06766
G1 X104.744 Y127.211 E.0147
G1 X106.85 Y125.105 E.09181
G1 X107.466 Y125.024 E.01916
G1 X104.806 Y127.684 E.11595
G1 X104.868 Y128.157 E.0147
G1 X108.082 Y124.943 E.1401
G1 X108.698 Y124.862 E.01916
G1 X104.93 Y128.629 E.16424
G1 X104.993 Y129.102 E.0147
G1 X109.314 Y124.781 E.18839
G1 X109.93 Y124.7 E.01916
G1 X105.055 Y129.575 E.21253
G1 X105.117 Y130.048 E.0147
G1 X110.546 Y124.618 E.23668
G1 X111.162 Y124.537 E.01916
G1 X105.179 Y130.52 E.26082
G1 X105.242 Y130.993 E.0147
G1 X111.778 Y124.456 E.28497
G1 X112.395 Y124.375 E.01916
G1 X105.304 Y131.466 E.30911
G1 X105.359 Y131.887 E.0131
G1 X105.426 Y131.878 E.00209
G1 X113.011 Y124.294 E.33063
G1 X113.627 Y124.213 E.01916
G1 X106.043 Y131.797 E.33063
G1 X106.659 Y131.716 E.01916
G1 X114.243 Y124.132 E.33063
G3 X114.83 Y124.079 I.898 J6.722 E.01819
G1 X107.275 Y131.635 E.32938
G1 X107.891 Y131.554 E.01916
G1 X115.388 Y124.056 E.32685
G3 X115.922 Y124.058 I.256 J3.067 E.01646
G1 X108.507 Y131.473 E.32324
G1 X109.123 Y131.392 E.01916
G1 X116.414 Y124.101 E.31783
G3 X116.899 Y124.15 I-.319 J5.518 E.01504
G1 X109.739 Y131.31 E.31213
G1 X110.355 Y131.229 E.01916
G1 X117.372 Y124.213 E.30588
G1 X117.845 Y124.275 E.0147
G1 X110.971 Y131.148 E.29964
G1 X111.587 Y131.067 E.01916
G1 X118.317 Y124.337 E.29339
G1 X118.79 Y124.399 E.0147
G1 X112.203 Y130.986 E.28714
G1 X112.82 Y130.905 E.01916
G1 X119.263 Y124.462 E.28089
G1 X119.736 Y124.524 E.0147
G1 X113.436 Y130.824 E.27464
G1 X114.052 Y130.743 E.01916
G1 X120.208 Y124.586 E.26839
G1 X120.681 Y124.648 E.0147
G1 X114.668 Y130.662 E.26214
G3 X115.275 Y130.59 I.834 J4.443 E.01885
G1 X121.154 Y124.711 E.25629
G1 X121.626 Y124.773 E.0147
G1 X115.805 Y130.595 E.2538
G3 X116.28 Y130.655 I-.205 J3.534 E.01477
G1 X122.099 Y124.835 E.2537
G1 X122.572 Y124.897 E.0147
G1 X116.752 Y130.717 E.2537
G1 X117.225 Y130.779 E.0147
G1 X123.045 Y124.96 E.2537
G1 X123.517 Y125.022 E.0147
G1 X117.698 Y130.841 E.2537
G1 X118.171 Y130.904 E.0147
G1 X123.99 Y125.084 E.2537
G1 X124.463 Y125.146 E.0147
G1 X118.643 Y130.966 E.2537
G1 X119.116 Y131.028 E.0147
G1 X124.936 Y125.208 E.2537
G1 X125.408 Y125.271 E.0147
G1 X119.589 Y131.09 E.2537
G1 X120.062 Y131.153 E.0147
G1 X125.881 Y125.333 E.2537
G1 X126.354 Y125.395 E.0147
G1 X120.534 Y131.215 E.2537
G1 X121.007 Y131.277 E.0147
G1 X126.436 Y125.848 E.23665
M73 P96 R1
G1 X126.355 Y126.465 E.01916
G1 X121.48 Y131.339 E.21251
G1 X121.953 Y131.401 E.0147
G1 X126.273 Y127.081 E.18836
G1 X126.192 Y127.697 E.01916
G1 X122.425 Y131.464 E.16422
G1 X122.898 Y131.526 E.0147
G1 X126.111 Y128.313 E.14007
G1 X126.03 Y128.929 E.01916
G1 X123.371 Y131.588 E.11593
G1 X123.844 Y131.65 E.0147
G1 X125.949 Y129.545 E.09178
G1 X125.868 Y130.161 E.01916
G1 X124.316 Y131.713 E.06764
G1 X124.789 Y131.775 E.0147
G1 X125.787 Y130.777 E.04349
G1 X125.706 Y131.393 E.01916
G1 X125.111 Y131.988 E.02594
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9516.508
M73 P96 R0
G1 X125.706 Y131.393 E-.31979
G1 X125.787 Y130.777 E-.23613
G1 X125.407 Y131.157 E-.20408
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 83/85
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z16.8 I-.066 J-1.215 P1  F42000
G1 X105.124 Y132.254 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4881
M204 S6000
G1 X104.185 Y125.12 E.23869
G1 X114.231 Y123.797 E.33612
G3 X115.919 Y123.723 I1.41 J12.812 E.05611
G3 X116.769 Y123.797 I-.42 J9.701 E.02831
G1 X126.815 Y125.12 E.33612
G1 X125.876 Y132.254 E.23869
G1 X115.81 Y130.929 E.33678
G2 X115.183 Y130.93 I-.309 J3.31 E.02082
G1 X105.183 Y132.246 E.33458
M204 S250
G1 X104.761 Y132.497 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4881
M204 S5000
G1 X103.77 Y124.976 E.2331
G1 X103.789 Y124.871 E.00329
G3 X104.015 Y124.747 I.247 J.183 E.00818
G1 X114.184 Y123.408 E.31515
G3 X115.936 Y123.331 I1.462 J13.328 E.05394
G3 X116.816 Y123.408 I-.435 J10.054 E.02714
G1 X126.983 Y124.746 E.31511
G3 X127.23 Y124.976 I.02 J.225 E.01167
G1 X126.239 Y132.497 E.2331
G3 X125.97 Y132.661 I-.212 J-.045 E.01085
G1 X115.768 Y131.319 E.31619
G2 X115.23 Y131.319 I-.267 J2.786 E.01655
G1 X105.032 Y132.661 E.31607
G3 X104.781 Y132.553 I-.058 J-.21 E.00905
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.517 Y130.571 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 83 start: 394
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer83 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X105.952 Y131.98 F42000
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42708
G1 F4881
M204 S6000
G1 X105.344 Y131.371 E.02693
G1 X105.262 Y130.746 E.01975
G1 X106.281 Y131.765 E.04514
G1 X106.761 Y131.702 E.01516
G1 X105.179 Y130.12 E.07004
G1 X105.097 Y129.494 E.01975
G1 X107.241 Y131.639 E.09494
G1 X107.721 Y131.576 E.01516
G1 X105.014 Y128.869 E.11984
G1 X104.932 Y128.243 E.01975
G1 X108.201 Y131.512 E.14474
G1 X108.682 Y131.449 E.01516
G1 X104.85 Y127.617 E.16964
G1 X104.767 Y126.992 E.01975
G1 X109.162 Y131.386 E.19454
G1 X109.642 Y131.323 E.01516
G1 X104.685 Y126.366 E.21944
G1 X104.603 Y125.74 E.01975
G1 X110.122 Y131.26 E.24434
G1 X110.602 Y131.197 E.01516
G1 X104.783 Y125.377 E.25763
G1 X105.263 Y125.314 E.01516
G1 X111.082 Y131.133 E.25763
G1 X111.562 Y131.07 E.01516
G1 X105.743 Y125.251 E.25763
G1 X106.223 Y125.188 E.01516
G1 X112.042 Y131.007 E.25763
G1 X112.522 Y130.944 E.01516
G1 X106.703 Y125.124 E.25763
G1 X107.183 Y125.061 E.01516
G1 X113.002 Y130.881 E.25763
G1 X113.483 Y130.817 E.01516
G1 X107.663 Y124.998 E.25763
G1 X108.143 Y124.935 E.01516
G1 X113.963 Y130.754 E.25763
G1 X114.443 Y130.691 E.01516
G1 X108.623 Y124.872 E.25763
G1 X109.103 Y124.808 E.01516
G1 X114.923 Y130.628 E.25764
G3 X115.418 Y130.58 I.617 J3.811 E.01559
G1 X109.583 Y124.745 E.25832
G1 X110.064 Y124.682 E.01516
G1 X115.999 Y130.618 E.26278
G1 X116.625 Y130.7 E.01975
G1 X110.544 Y124.619 E.26922
G1 X111.024 Y124.556 E.01516
G1 X117.25 Y130.782 E.27566
G1 X117.876 Y130.865 E.01975
G1 X111.504 Y124.492 E.28211
G1 X111.984 Y124.429 E.01516
G1 X118.502 Y130.947 E.28855
G1 X119.127 Y131.029 E.01975
G1 X112.464 Y124.366 E.29499
G1 X112.944 Y124.303 E.01516
G1 X119.753 Y131.112 E.30144
G1 X120.379 Y131.194 E.01975
G1 X113.424 Y124.24 E.30788
G1 X113.904 Y124.176 E.01516
G1 X121.004 Y131.276 E.31432
G1 X121.63 Y131.359 E.01975
G1 X114.389 Y124.118 E.32056
G1 X114.888 Y124.074 E.0157
G1 X122.255 Y131.441 E.32614
G1 X122.881 Y131.523 E.01975
G1 X115.414 Y124.056 E.33058
G3 X115.962 Y124.061 I.246 J3.138 E.01719
G1 X123.507 Y131.606 E.334
G1 X124.132 Y131.688 E.01975
G1 X116.557 Y124.113 E.33534
G3 X117.174 Y124.187 I-.533 J7.098 E.01945
G1 X124.758 Y131.77 E.33574
G1 X125.383 Y131.853 E.01975
G1 X117.8 Y124.269 E.33573
G1 X118.426 Y124.351 E.01975
G1 X125.632 Y131.557 E.31902
G1 X125.695 Y131.077 E.01516
G1 X119.051 Y124.434 E.29412
G1 X119.677 Y124.516 E.01975
G1 X125.758 Y130.597 E.26922
G1 X125.821 Y130.117 E.01516
G1 X120.302 Y124.599 E.24432
G1 X120.928 Y124.681 E.01975
G1 X125.884 Y129.637 E.21942
G1 X125.948 Y129.157 E.01516
G1 X121.554 Y124.763 E.19452
G1 X122.179 Y124.846 E.01975
G1 X126.011 Y128.677 E.16962
G1 X126.074 Y128.197 E.01516
G1 X122.805 Y124.928 E.14472
G1 X123.431 Y125.01 E.01975
G1 X126.137 Y127.717 E.11982
G1 X126.2 Y127.237 E.01516
G1 X124.056 Y125.093 E.09492
G1 X124.682 Y125.175 E.01975
G1 X126.264 Y126.757 E.07002
G1 X126.327 Y126.277 E.01516
G1 X125.308 Y125.257 E.04512
G1 X125.933 Y125.34 E.01975
G1 X126.541 Y125.948 E.02691
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9371.095
G1 X125.933 Y125.34 E-.32671
G1 X125.308 Y125.257 E-.2398
G1 X125.668 Y125.618 E-.19349
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 84/85
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z17 I-.375 J-1.158 P1  F42000
G1 X105.238 Y132.226 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4849
M204 S6000
G1 X104.303 Y125.117 E.23785
G1 X114.232 Y123.81 E.33223
G3 X115.553 Y123.728 I1.68 J16.334 E.04391
G3 X116.768 Y123.81 I-.114 J10.692 E.0404
G1 X126.697 Y125.117 E.33223
G1 X125.762 Y132.226 E.23785
G1 X115.817 Y130.917 E.33273
G2 X115.187 Y130.916 I-.318 J3.382 E.02091
G1 X105.298 Y132.218 E.33088
M204 S250
G1 X104.889 Y132.524 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4849
M204 S5000
G1 X103.888 Y124.968 E.23421
G1 X103.9 Y124.887 E.00253
G1 X103.961 Y124.821 E.00275
G3 X104.278 Y124.725 I.452 J.922 E.01023
G1 X114.185 Y123.421 E.30706
G3 X115.562 Y123.336 I1.726 J16.779 E.04238
G3 X116.815 Y123.421 I-.122 J11.081 E.0386
G1 X126.722 Y124.725 E.30706
G3 X127.107 Y124.902 I.012 J.48 E.01348
G1 X127.112 Y124.968 E.00205
G1 X126.123 Y132.483 E.2329
G1 X126.067 Y132.573 E.00326
G3 X125.708 Y132.614 I-.232 J-.434 E.01137
G1 X115.771 Y131.306 E.30797
G2 X115.23 Y131.306 I-.271 J2.848 E.01664
G1 X105.292 Y132.614 E.30802
G3 X104.935 Y132.561 I-.124 J-.391 E.0115
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.661 Y130.58 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 84 start: 394
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer84 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X104.576 Y125.939 F42000
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42358
G1 F4849
M204 S6000
G1 X105.176 Y125.338 E.02634
G1 X105.796 Y125.257 E.0194
G1 X104.79 Y126.263 E.04416
G1 X104.852 Y126.739 E.01488
G1 X106.416 Y125.175 E.06861
G1 X107.036 Y125.093 E.0194
G1 X104.915 Y127.215 E.09306
G1 X104.978 Y127.69 E.01488
G1 X107.656 Y125.012 E.1175
G1 X108.276 Y124.93 E.0194
G1 X105.04 Y128.166 E.14195
G1 X105.103 Y128.642 E.01488
G1 X108.896 Y124.849 E.1664
G1 X109.516 Y124.767 E.0194
G1 X105.165 Y129.118 E.19085
G1 X105.228 Y129.593 E.01488
G1 X110.136 Y124.685 E.2153
G1 X110.756 Y124.604 E.0194
G1 X105.291 Y130.069 E.23975
G1 X105.353 Y130.545 E.01488
G1 X111.376 Y124.522 E.26419
G1 X111.996 Y124.44 E.0194
G1 X105.416 Y131.02 E.28864
G1 X105.479 Y131.496 E.01488
G1 X112.616 Y124.359 E.31309
G1 X113.236 Y124.277 E.0194
G1 X105.681 Y131.832 E.33139
G1 X106.301 Y131.75 E.0194
G1 X113.856 Y124.196 E.33139
G3 X114.466 Y124.124 I1.129 J6.98 E.01906
G1 X106.921 Y131.668 E.33095
G1 X107.541 Y131.587 E.0194
M73 P97 R0
G1 X115.056 Y124.072 E.32964
G3 X115.603 Y124.064 I.466 J12.004 E.01697
G1 X108.161 Y131.505 E.32645
G1 X108.781 Y131.424 E.0194
G1 X116.118 Y124.087 E.32185
G3 X116.615 Y124.128 I-.077 J3.899 E.01547
G1 X109.401 Y131.342 E.31644
G1 X110.021 Y131.26 E.0194
G1 X117.092 Y124.189 E.31021
G1 X117.568 Y124.251 E.01488
G1 X110.641 Y131.179 E.30388
G1 X111.261 Y131.097 E.0194
G1 X118.044 Y124.314 E.29756
G1 X118.52 Y124.377 E.01488
G1 X111.881 Y131.016 E.29123
G1 X112.501 Y130.934 E.0194
G1 X118.995 Y124.439 E.2849
G1 X119.471 Y124.502 E.01488
G1 X113.121 Y130.852 E.27858
G1 X113.741 Y130.771 E.0194
G1 X119.947 Y124.565 E.27225
G1 X120.422 Y124.627 E.01488
G1 X114.361 Y130.689 E.26592
G1 X114.98 Y130.607 E.0194
G1 X120.898 Y124.69 E.25959
G1 X121.374 Y124.752 E.01488
G1 X115.56 Y130.566 E.25503
G3 X116.053 Y130.612 I-.105 J3.801 E.01535
G1 X121.85 Y124.815 E.25429
G1 X122.325 Y124.878 E.01488
G1 X116.528 Y130.674 E.25429
G1 X117.004 Y130.737 E.01488
G1 X122.801 Y124.94 E.25429
G1 X123.277 Y125.003 E.01488
G1 X117.48 Y130.8 E.25429
G1 X117.956 Y130.862 E.01488
G1 X123.752 Y125.066 E.25429
G1 X124.228 Y125.128 E.01488
G1 X118.431 Y130.925 E.25429
G1 X118.907 Y130.988 E.01488
G1 X124.704 Y125.191 E.25429
G1 X125.18 Y125.253 E.01488
G1 X119.383 Y131.05 E.25429
G1 X119.858 Y131.113 E.01488
G1 X125.655 Y125.316 E.25429
G1 X126.131 Y125.379 E.01488
G1 X120.334 Y131.175 E.25429
G1 X120.81 Y131.238 E.01488
G1 X126.275 Y125.773 E.23974
G1 X126.193 Y126.393 E.0194
G1 X121.286 Y131.301 E.21529
G1 X121.761 Y131.363 E.01488
G1 X126.112 Y127.013 E.19084
G1 X126.03 Y127.633 E.0194
G1 X122.237 Y131.426 E.16639
G1 X122.713 Y131.489 E.01488
G1 X125.948 Y128.253 E.14194
G1 X125.867 Y128.873 E.0194
G1 X123.188 Y131.551 E.11749
G1 X123.664 Y131.614 E.01488
G1 X125.785 Y129.493 E.09304
G1 X125.704 Y130.113 E.0194
G1 X124.14 Y131.676 E.0686
G1 X124.616 Y131.739 E.01488
G1 X125.622 Y130.733 E.04415
G1 X125.54 Y131.353 E.0194
G1 X124.94 Y131.953 E.02633
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9457.259
G1 X125.54 Y131.353 E-.32259
G1 X125.622 Y130.733 E-.23761
G1 X125.25 Y131.104 E-.1998
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 85/85
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; OBJECT_ID: 394
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z17.2 I-.081 J-1.214 P1  F42000
G1 X105.111 Y132.444 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5186
M204 S5000
G1 X104.125 Y124.925 E.23303
G3 X104.295 Y124.847 I.186 J.181 E.00591
G1 X114.201 Y123.542 E.30701
G3 X115.62 Y123.46 I1.587 J15.027 E.04368
G3 X116.799 Y123.542 I-.162 J10.756 E.03632
G1 X126.705 Y124.847 E.30702
G3 X126.877 Y124.94 I.021 J.167 E.00642
G1 X125.889 Y132.444 E.23257
G1 X125.817 Y132.488 E.00258
G3 X125.695 Y132.489 I-.065 J-.385 E.00376
G1 X115.788 Y131.185 E.30707
G2 X115.215 Y131.184 I-.288 J2.97 E.01764
G1 X105.305 Y132.489 E.30714
G3 X105.16 Y132.478 I-.059 J-.184 E.00456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.888 Y130.497 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
; object ids of layer 85 start: 394
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


; object ids of this layer85 end: 394
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
G1 X126.594 Y125.496 F42000
G1 Z17
G1 E.8 F1800
; FEATURE: Top surface
G1 F5186
M204 S2000
G1 X126.07 Y124.972 E.02276
G1 X125.456 Y124.891
G1 X126.532 Y125.967 E.04674
G1 X126.469 Y126.438
G1 X124.842 Y124.81 E.07072
G1 X124.228 Y124.73
G1 X126.407 Y126.909 E.0947
G1 X126.345 Y127.38
G1 X123.614 Y124.649 E.11868
G1 X123 Y124.568
G1 X126.283 Y127.851 E.14266
G1 X126.22 Y128.322
G1 X122.386 Y124.487 E.16664
G1 X121.771 Y124.406
G1 X126.158 Y128.793 E.19062
G1 X126.096 Y129.264
G1 X121.157 Y124.325 E.21459
G1 X120.543 Y124.245
G1 X126.033 Y129.735 E.23857
G1 X125.971 Y130.206
G1 X119.929 Y124.164 E.26255
G1 X119.315 Y124.083
G1 X125.909 Y130.677 E.28653
G1 X125.847 Y131.148
G1 X118.701 Y124.002 E.31051
G1 X118.087 Y123.921
G1 X125.784 Y131.619 E.33449
G1 X125.722 Y132.09
G1 X117.473 Y123.84 E.35847
G1 X116.859 Y123.759
G1 X125.331 Y132.232 E.36817
G1 X124.717 Y132.151
G1 X116.264 Y123.698 E.36734
G1 X115.704 Y123.671
G1 X124.103 Y132.07 E.36497
G1 X123.489 Y131.989
G1 X115.172 Y123.673 E.3614
G1 X114.675 Y123.709
G1 X122.875 Y131.909 E.35631
G1 X122.261 Y131.828
G1 X114.186 Y123.754 E.35086
G1 X113.715 Y123.816
G1 X121.646 Y131.747 E.34465
G1 X121.032 Y131.666
G1 X113.244 Y123.878 E.33844
G1 X112.773 Y123.94
G1 X120.418 Y131.585 E.33223
G1 X119.804 Y131.504
G1 X112.302 Y124.002 E.32603
G1 X111.83 Y124.064
G1 X119.19 Y131.423 E.31982
G1 X118.576 Y131.343
G1 X111.359 Y124.126 E.31361
G1 X110.888 Y124.188
G1 X117.962 Y131.262 E.3074
G1 X117.348 Y131.181
G1 X110.417 Y124.25 E.30119
G1 X109.945 Y124.312
G1 X116.734 Y131.1 E.29498
G1 X116.119 Y131.019
G1 X109.474 Y124.374 E.28877
G1 X109.003 Y124.436
G1 X115.527 Y130.96 E.28349
G1 X115.033 Y130.999
G1 X108.532 Y124.498 E.28251
G1 X108.061 Y124.56
G1 X114.562 Y131.061 E.28251
G1 X114.09 Y131.123
G1 X107.589 Y124.622 E.28251
G1 X107.118 Y124.684
G1 X113.619 Y131.185 E.28251
G1 X113.148 Y131.247
G1 X106.647 Y124.746 E.28251
G1 X106.176 Y124.808
G1 X112.677 Y131.309 E.28251
G1 X112.206 Y131.371
G1 X105.704 Y124.87 E.28251
G1 X105.233 Y124.932
G1 X111.734 Y131.433 E.28251
G1 X111.263 Y131.495
G1 X104.762 Y124.994 E.28251
G1 X104.357 Y125.122
G1 X110.792 Y131.557 E.27965
G1 X110.321 Y131.619
G1 X104.438 Y125.737 E.25564
G1 X104.519 Y126.351
G1 X109.849 Y131.682 E.23163
G1 X109.378 Y131.744
G1 X104.6 Y126.966 E.20762
G1 X104.682 Y127.58
G1 X108.907 Y131.806 E.18361
G1 X108.436 Y131.868
G1 X104.763 Y128.195 E.1596
G1 X104.844 Y128.809
G1 X107.965 Y131.93 E.1356
G1 X107.493 Y131.992
G1 X104.926 Y129.424 E.11159
G1 X105.007 Y130.038
G1 X107.022 Y132.054 E.08758
G1 X106.551 Y132.116
G1 X105.088 Y130.653 E.06357
G1 X105.169 Y131.267
G1 X106.08 Y132.178 E.03956
G1 X105.609 Y132.24
G1 X105.251 Y131.882 E.01555
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.609 Y132.24 E-.19232
G1 X106.08 Y132.178 E-.18061
G1 X105.359 Y131.458 E-.38707
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.986 Y131.756 Z17.4 F42000
G1 X125.719 Y132.255 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11535
M73 P98 R0
G1 F5186
M204 S6000
G1 X125.329 Y132.234 E.00231
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X125.719 Y132.255 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.4 I1.217 J0 P1  F42000
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
G1 Z17.4 F900 ; lower z a little
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

