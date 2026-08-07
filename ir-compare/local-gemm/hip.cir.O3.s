	.amdgcn_target "amdgcn-amd-amdhsa--gfx942"
	.amdhsa_code_object_version 6
	.text
	.protected	gemm_kernel             ; -- Begin function gemm_kernel
	.globl	gemm_kernel
	.p2align	8
	.type	gemm_kernel,@function
gemm_kernel:                            ; @gemm_kernel
; %bb.0:
	s_mov_b64 s[34:35], s[4:5]
	s_add_u32 s50, s34, 48
	s_addc_u32 s51, s35, 0
	s_mov_b64 s[48:49], s[0:1]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_get_group_id@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_get_group_id@gotpcrel32@hi+12
	s_load_dwordx2 s[54:55], s[0:1], 0x0
	s_load_dwordx4 s[64:67], s[4:5], 0x0
	s_mov_b32 s33, s10
	s_mov_b32 s52, s9
	s_mov_b32 s53, s8
	s_mov_b64 s[36:37], s[6:7]
	v_mov_b32_e32 v40, v0
	s_mov_b64 s[4:5], s[48:49]
	s_mov_b64 s[6:7], s[2:3]
	s_mov_b64 s[8:9], s[50:51]
	s_mov_b64 s[10:11], s[36:37]
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	s_mov_b32 s14, s33
	v_mov_b32_e32 v31, v0
	v_mov_b32_e32 v0, 0
	s_mov_b32 s32, 0
	s_mov_b64 s[38:39], s[2:3]
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[54:55]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_get_local_size@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_get_local_size@gotpcrel32@hi+12
	s_load_dwordx2 s[68:69], s[0:1], 0x0
	v_mov_b32_e32 v41, v0
	s_mov_b64 s[4:5], s[48:49]
	s_mov_b64 s[6:7], s[38:39]
	s_mov_b64 s[8:9], s[50:51]
	s_mov_b64 s[10:11], s[36:37]
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	s_mov_b32 s14, s33
	v_mov_b32_e32 v31, v40
	v_mov_b32_e32 v0, 0
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[68:69]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_get_local_id@gotpcrel32@lo+4
	s_addc_u32 s1, s1, __ockl_get_local_id@gotpcrel32@hi+12
	s_load_dwordx2 s[70:71], s[0:1], 0x0
	v_mov_b32_e32 v42, v0
	s_mov_b64 s[4:5], s[48:49]
	s_mov_b64 s[6:7], s[38:39]
	s_mov_b64 s[8:9], s[50:51]
	s_mov_b64 s[10:11], s[36:37]
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	s_mov_b32 s14, s33
	v_mov_b32_e32 v31, v40
	v_mov_b32_e32 v0, 0
                                        ; implicit-def: $sgpr15
	s_waitcnt lgkmcnt(0)
	s_swappc_b64 s[30:31], s[70:71]
	v_mad_u64_u32 v[44:45], s[0:1], v42, v41, v[0:1]
	s_mov_b64 s[4:5], s[48:49]
	s_mov_b64 s[6:7], s[38:39]
	s_mov_b64 s[8:9], s[50:51]
	s_mov_b64 s[10:11], s[36:37]
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	s_mov_b32 s14, s33
	v_mov_b32_e32 v31, v40
	v_mov_b32_e32 v0, 1
	s_swappc_b64 s[30:31], s[54:55]
	v_mov_b32_e32 v41, v0
	s_mov_b64 s[4:5], s[48:49]
	s_mov_b64 s[6:7], s[38:39]
	s_mov_b64 s[8:9], s[50:51]
	s_mov_b64 s[10:11], s[36:37]
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	s_mov_b32 s14, s33
	v_mov_b32_e32 v31, v40
	v_mov_b32_e32 v0, 1
	s_swappc_b64 s[30:31], s[68:69]
	v_mov_b32_e32 v42, v0
	s_mov_b64 s[4:5], s[48:49]
	s_mov_b64 s[6:7], s[38:39]
	s_mov_b64 s[8:9], s[50:51]
	s_mov_b64 s[10:11], s[36:37]
	s_mov_b32 s12, s53
	s_mov_b32 s13, s52
	s_mov_b32 s14, s33
	v_mov_b32_e32 v31, v40
	v_mov_b32_e32 v0, 1
                                        ; implicit-def: $sgpr15
	s_swappc_b64 s[30:31], s[70:71]
	v_mad_u64_u32 v[2:3], s[0:1], v42, v41, v[0:1]
	v_cmp_gt_i32_e32 vcc, s64, v2
	v_cmp_gt_i32_e64 s[0:1], s65, v44
	s_and_b64 s[0:1], s[0:1], vcc
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_cbranch_execz .LBB0_10
; %bb.1:
	s_load_dwordx2 s[0:1], s[34:35], 0x28
	v_mad_u64_u32 v[0:1], s[2:3], v2, s65, v[44:45]
	v_ashrrev_i32_e32 v1, 31, v0
	s_cmp_lt_i32 s66, 1
	s_waitcnt lgkmcnt(0)
	v_lshl_add_u64 v[0:1], v[0:1], 2, s[0:1]
	global_load_dword v3, v[0:1], off
	s_load_dword s0, s[34:35], 0x10
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mul_f32_e32 v8, s0, v3
	global_store_dword v[0:1], v8, off
	s_cbranch_scc1 .LBB0_10
; %bb.2:                                ; %.lr.ph
	s_load_dwordx4 s[0:3], s[34:35], 0x18
	v_mul_lo_u32 v2, v2, s66
	s_and_b32 s8, s66, 7
	s_cmp_lt_u32 s66, 8
	v_ashrrev_i32_e32 v3, 31, v2
	s_cbranch_scc1 .LBB0_6
; %bb.3:                                ; %.lr.ph.new
	s_ashr_i32 s7, s65, 31
	s_mov_b32 s6, s65
	s_waitcnt lgkmcnt(0)
	v_lshl_add_u64 v[4:5], v[2:3], 2, s[0:1]
	s_and_b32 s5, s66, 0x7ffffff8
	s_lshl_b64 s[6:7], s[6:7], 2
	s_lshl_b32 s9, s65, 3
	v_lshl_add_u64 v[4:5], v[4:5], 0, 16
	s_mov_b32 s4, 0
	v_mov_b32_e32 v6, v44
.LBB0_4:                                ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v7, 31, v6
	global_load_dword v9, v[4:5], off offset:-16
	v_lshl_add_u64 v[10:11], v[6:7], 2, s[2:3]
	global_load_dword v7, v[10:11], off
	v_lshl_add_u64 v[10:11], v[10:11], 0, s[6:7]
	s_add_i32 s4, s4, 8
	v_add_u32_e32 v6, s9, v6
	s_cmp_eq_u32 s5, s4
	s_waitcnt vmcnt(1)
	v_mul_f32_e32 v9, s67, v9
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v7, v9, v7
	v_add_f32_e32 v7, v8, v7
	global_store_dword v[0:1], v7, off
	global_load_dword v12, v[4:5], off offset:-12
	global_load_dword v13, v[10:11], off
	v_lshl_add_u64 v[8:9], v[10:11], 0, s[6:7]
	s_waitcnt vmcnt(1)
	v_mul_f32_e32 v10, s67, v12
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v10, v10, v13
	v_add_f32_e32 v7, v7, v10
	global_store_dword v[0:1], v7, off
	global_load_dword v10, v[4:5], off offset:-8
	global_load_dword v11, v[8:9], off
	v_lshl_add_u64 v[8:9], v[8:9], 0, s[6:7]
	s_waitcnt vmcnt(1)
	v_mul_f32_e32 v10, s67, v10
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v10, v10, v11
	v_add_f32_e32 v7, v7, v10
	global_store_dword v[0:1], v7, off
	global_load_dword v10, v[4:5], off offset:-4
	global_load_dword v11, v[8:9], off
	v_lshl_add_u64 v[8:9], v[8:9], 0, s[6:7]
	s_waitcnt vmcnt(1)
	v_mul_f32_e32 v10, s67, v10
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v10, v10, v11
	v_add_f32_e32 v7, v7, v10
	global_store_dword v[0:1], v7, off
	global_load_dword v10, v[4:5], off
	global_load_dword v11, v[8:9], off
	v_lshl_add_u64 v[8:9], v[8:9], 0, s[6:7]
	s_waitcnt vmcnt(1)
	v_mul_f32_e32 v10, s67, v10
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v10, v10, v11
	v_add_f32_e32 v7, v7, v10
	global_store_dword v[0:1], v7, off
	global_load_dword v10, v[4:5], off offset:4
	global_load_dword v11, v[8:9], off
	v_lshl_add_u64 v[8:9], v[8:9], 0, s[6:7]
	s_waitcnt vmcnt(1)
	v_mul_f32_e32 v10, s67, v10
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v10, v10, v11
	v_add_f32_e32 v7, v7, v10
	global_store_dword v[0:1], v7, off
	global_load_dword v10, v[4:5], off offset:8
	global_load_dword v11, v[8:9], off
	v_lshl_add_u64 v[8:9], v[8:9], 0, s[6:7]
	s_waitcnt vmcnt(1)
	v_mul_f32_e32 v10, s67, v10
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v10, v10, v11
	v_add_f32_e32 v7, v7, v10
	global_store_dword v[0:1], v7, off
	global_load_dword v10, v[4:5], off offset:12
	global_load_dword v11, v[8:9], off
	v_lshl_add_u64 v[4:5], v[4:5], 0, 32
	s_waitcnt vmcnt(1)
	v_mul_f32_e32 v8, s67, v10
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v8, v8, v11
	v_add_f32_e32 v8, v7, v8
	global_store_dword v[0:1], v8, off
	s_cbranch_scc0 .LBB0_4
; %bb.5:                                ; %common.ret.loopexit.unr-lcssa
	s_cmp_lg_u32 s8, 0
	s_cselect_b64 s[6:7], -1, 0
	s_branch .LBB0_7
.LBB0_6:
	s_mov_b64 s[6:7], -1
	s_mov_b32 s4, 0
.LBB0_7:                                ; %Flow41
	s_and_b64 vcc, exec, s[6:7]
	s_cbranch_vccz .LBB0_10
; %bb.8:                                ; %.epil.preheader
	s_mul_i32 s5, s4, s65
	v_add_u32_e32 v4, s5, v44
	s_mov_b32 s5, 0
	v_lshl_add_u64 v[2:3], v[2:3], 0, s[4:5]
	s_waitcnt lgkmcnt(0)
	v_lshl_add_u64 v[2:3], v[2:3], 2, s[0:1]
.LBB0_9:                                ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v5, 31, v4
	global_load_dword v9, v[2:3], off
	v_lshl_add_u64 v[6:7], v[4:5], 2, s[2:3]
	global_load_dword v5, v[6:7], off
	s_add_i32 s8, s8, -1
	v_lshl_add_u64 v[2:3], v[2:3], 0, 4
	v_add_u32_e32 v4, s65, v4
	s_cmp_lg_u32 s8, 0
	s_waitcnt vmcnt(1)
	v_mul_f32_e32 v6, s67, v9
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v5, v6, v5
	v_add_f32_e32 v8, v8, v5
	global_store_dword v[0:1], v8, off
	s_cbranch_scc1 .LBB0_9
.LBB0_10:                               ; %common.ret
	s_endpgm
.Lfunc_end0:
	.size	gemm_kernel, .Lfunc_end0-gemm_kernel
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel gemm_kernel
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 304
		.amdhsa_user_sgpr_count 8
		.amdhsa_user_sgpr_dispatch_ptr 1
		.amdhsa_user_sgpr_queue_ptr 1
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 1
		.amdhsa_user_sgpr_kernarg_preload_length 0
		.amdhsa_user_sgpr_kernarg_preload_offset 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 1
		.amdhsa_enable_private_segment 1
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 1
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 2
		.amdhsa_next_free_vgpr max(totalnumvgprs(.Lgemm_kernel.num_agpr, .Lgemm_kernel.num_vgpr), 1, 0)
		.amdhsa_next_free_sgpr max(.Lgemm_kernel.numbered_sgpr+6, 1, 0)-6
		.amdhsa_accum_offset (((((alignto(max(1, .Lgemm_kernel.num_vgpr), 4)/4)-1)&~65536)&63)+1)*4
		.amdhsa_reserve_vcc 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
                                        ; -- End function
	.set .Lgemm_kernel.num_vgpr, max(46, amdgpu.max_num_vgpr)
	.set .Lgemm_kernel.num_agpr, max(0, amdgpu.max_num_agpr)
	.set .Lgemm_kernel.numbered_sgpr, max(72, amdgpu.max_num_sgpr)
	.set .Lgemm_kernel.num_named_barrier, max(0, amdgpu.max_num_named_barrier)
	.set .Lgemm_kernel.private_seg_size, 0
	.set .Lgemm_kernel.uses_vcc, 1
	.set .Lgemm_kernel.uses_flat_scratch, 1
	.set .Lgemm_kernel.has_dyn_sized_stack, 1
	.set .Lgemm_kernel.has_recursion, 1
	.set .Lgemm_kernel.has_indirect_call, 1
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 1188
; TotalNumSgprs: .Lgemm_kernel.numbered_sgpr+6
; NumVgprs: .Lgemm_kernel.num_vgpr
; NumAgprs: .Lgemm_kernel.num_agpr
; TotalNumVgprs: totalnumvgprs(.Lgemm_kernel.num_agpr, .Lgemm_kernel.num_vgpr)
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: (alignto(max(max(.Lgemm_kernel.numbered_sgpr+extrasgprs(.Lgemm_kernel.uses_vcc, .Lgemm_kernel.uses_flat_scratch, 1), 1, 0), 1), 8)/8)-1
; VGPRBlocks: (alignto(max(max(totalnumvgprs(.Lgemm_kernel.num_agpr, .Lgemm_kernel.num_vgpr), 1, 0), 1), 8)/8)-1
; NumSGPRsForWavesPerEU: max(.Lgemm_kernel.numbered_sgpr+6, 1, 0)
; NumVGPRsForWavesPerEU: max(totalnumvgprs(.Lgemm_kernel.num_agpr, .Lgemm_kernel.num_vgpr), 1, 0)
; AccumOffset: ((alignto(max(1, .Lgemm_kernel.num_vgpr), 4)/4)-1+1)*4
; Occupancy: occupancy(8, 8, 512, 8, 8, max(.Lgemm_kernel.numbered_sgpr+extrasgprs(.Lgemm_kernel.uses_vcc, .Lgemm_kernel.uses_flat_scratch, 1), 1, 0), max(totalnumvgprs(.Lgemm_kernel.num_agpr, .Lgemm_kernel.num_vgpr), 1, 0))
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: (((alignto(max(1, .Lgemm_kernel.num_vgpr), 4)/4)-1)&~65536)&63
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.section	.AMDGPU.gpr_maximums,"",@progbits
	.set amdgpu.max_num_vgpr, 0
	.set amdgpu.max_num_agpr, 0
	.set amdgpu.max_num_sgpr, 0
	.set amdgpu.max_num_named_barrier, 0
	.text
	.type	__hip_cuid_d221fc8a527e7627,@object ; @__hip_cuid_d221fc8a527e7627
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_d221fc8a527e7627
__hip_cuid_d221fc8a527e7627:
	.byte	0                               ; 0x0
	.size	__hip_cuid_d221fc8a527e7627, 1

	.section	".note.GNU-stack","",@progbits
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           4
        .value_kind:     by_value
      - .offset:         4
        .size:           4
        .value_kind:     by_value
      - .offset:         8
        .size:           4
        .value_kind:     by_value
      - .offset:         12
        .size:           4
        .value_kind:     by_value
      - .offset:         16
        .size:           4
        .value_kind:     by_value
      - .address_space:  generic
        .offset:         24
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  generic
        .offset:         32
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  generic
        .offset:         40
        .size:           8
        .value_kind:     global_buffer
      - .offset:         48
        .size:           4
        .value_kind:     hidden_block_count_x
      - .offset:         52
        .size:           4
        .value_kind:     hidden_block_count_y
      - .offset:         56
        .size:           4
        .value_kind:     hidden_block_count_z
      - .offset:         60
        .size:           2
        .value_kind:     hidden_group_size_x
      - .offset:         62
        .size:           2
        .value_kind:     hidden_group_size_y
      - .offset:         64
        .size:           2
        .value_kind:     hidden_group_size_z
      - .offset:         66
        .size:           2
        .value_kind:     hidden_remainder_x
      - .offset:         68
        .size:           2
        .value_kind:     hidden_remainder_y
      - .offset:         70
        .size:           2
        .value_kind:     hidden_remainder_z
      - .offset:         88
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         96
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         104
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         112
        .size:           2
        .value_kind:     hidden_grid_dims
      - .offset:         128
        .size:           8
        .value_kind:     hidden_hostcall_buffer
      - .offset:         136
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
      - .offset:         144
        .size:           8
        .value_kind:     hidden_heap_v1
      - .offset:         152
        .size:           8
        .value_kind:     hidden_default_queue
      - .offset:         160
        .size:           8
        .value_kind:     hidden_completion_action
      - .offset:         248
        .size:           8
        .value_kind:     hidden_queue_ptr
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 304
    .max_flat_workgroup_size: 1024
    .name:           gemm_kernel
    .private_segment_fixed_size: 0
    .sgpr_count:     78
    .sgpr_spill_count: 0
    .symbol:         gemm_kernel.kd
    .uses_dynamic_stack: true
    .vgpr_count:     46
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx942
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata
