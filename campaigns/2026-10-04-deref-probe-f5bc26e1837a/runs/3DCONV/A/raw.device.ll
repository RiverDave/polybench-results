; ModuleID = 'device_cuda_nvptx64_nvidia_cuda__sm_86'
source_filename = "device_cuda_nvptx64_nvidia_cuda__sm_86"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv = comdat any

@blockIdx = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z20convolution3D_kerneliiiPfS_i(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  %20 = alloca float, align 4
  %21 = alloca float, align 4
  %22 = alloca float, align 4
  %23 = alloca float, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store i32 %5, ptr %12, align 4
  call void @llvm.lifetime.start.p0(ptr %13)
  br label %24

24:                                               ; preds = %6
  %25 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %26 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %27 = mul i32 %25, %26
  %28 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %29 = add i32 %27, %28
  store i32 %29, ptr %13, align 4
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %30

30:                                               ; preds = %24
  %31 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %32 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %33 = mul i32 %31, %32
  %34 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %35 = add i32 %33, %34
  store i32 %35, ptr %14, align 4
  call void @llvm.lifetime.start.p0(ptr %15)
  br label %36

36:                                               ; preds = %30
  call void @llvm.lifetime.start.p0(ptr %16)
  br label %37

37:                                               ; preds = %36
  call void @llvm.lifetime.start.p0(ptr %17)
  br label %38

38:                                               ; preds = %37
  call void @llvm.lifetime.start.p0(ptr %18)
  br label %39

39:                                               ; preds = %38
  call void @llvm.lifetime.start.p0(ptr %19)
  br label %40

40:                                               ; preds = %39
  call void @llvm.lifetime.start.p0(ptr %20)
  br label %41

41:                                               ; preds = %40
  call void @llvm.lifetime.start.p0(ptr %21)
  br label %42

42:                                               ; preds = %41
  call void @llvm.lifetime.start.p0(ptr %22)
  br label %43

43:                                               ; preds = %42
  call void @llvm.lifetime.start.p0(ptr %23)
  br label %44

44:                                               ; preds = %43
  store float 2.000000e+00, ptr %15, align 4
  store float 5.000000e+00, ptr %18, align 4
  store float -8.000000e+00, ptr %21, align 4
  store float -3.000000e+00, ptr %16, align 4
  store float 6.000000e+00, ptr %19, align 4
  store float -9.000000e+00, ptr %22, align 4
  store float 4.000000e+00, ptr %17, align 4
  store float 7.000000e+00, ptr %20, align 4
  store float 1.000000e+01, ptr %23, align 4
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %12, align 4
  %47 = load i32, ptr %7, align 4
  %48 = sub nsw i32 %47, 1
  %49 = icmp slt i32 %46, %48
  br i1 %49, label %50, label %55

50:                                               ; preds = %45
  %51 = load i32, ptr %14, align 4
  %52 = load i32, ptr %8, align 4
  %53 = sub nsw i32 %52, 1
  %54 = icmp slt i32 %51, %53
  br label %56

55:                                               ; preds = %45
  br label %56

56:                                               ; preds = %50, %55
  %57 = phi i1 [ false, %55 ], [ %54, %50 ]
  br label %58

58:                                               ; preds = %56
  br i1 %57, label %59, label %64

59:                                               ; preds = %58
  %60 = load i32, ptr %13, align 4
  %61 = load i32, ptr %9, align 4
  %62 = sub nsw i32 %61, 1
  %63 = icmp slt i32 %60, %62
  br label %65

64:                                               ; preds = %58
  br label %65

65:                                               ; preds = %59, %64
  %66 = phi i1 [ false, %64 ], [ %63, %59 ]
  br label %67

67:                                               ; preds = %65
  br i1 %66, label %68, label %71

68:                                               ; preds = %67
  %69 = load i32, ptr %12, align 4
  %70 = icmp sgt i32 %69, 0
  br label %72

71:                                               ; preds = %67
  br label %72

72:                                               ; preds = %68, %71
  %73 = phi i1 [ false, %71 ], [ %70, %68 ]
  br label %74

74:                                               ; preds = %72
  br i1 %73, label %75, label %78

75:                                               ; preds = %74
  %76 = load i32, ptr %14, align 4
  %77 = icmp sgt i32 %76, 0
  br label %79

78:                                               ; preds = %74
  br label %79

79:                                               ; preds = %75, %78
  %80 = phi i1 [ false, %78 ], [ %77, %75 ]
  br label %81

81:                                               ; preds = %79
  br i1 %80, label %82, label %85

82:                                               ; preds = %81
  %83 = load i32, ptr %13, align 4
  %84 = icmp sgt i32 %83, 0
  br label %86

85:                                               ; preds = %81
  br label %86

86:                                               ; preds = %82, %85
  %87 = phi i1 [ false, %85 ], [ %84, %82 ]
  br label %88

88:                                               ; preds = %86
  br i1 %87, label %89, label %354

89:                                               ; preds = %88
  %90 = load float, ptr %15, align 4
  %91 = load i32, ptr %12, align 4
  %92 = sub nsw i32 %91, 1
  %93 = mul nsw i32 %92, 65536
  %94 = load i32, ptr %14, align 4
  %95 = sub nsw i32 %94, 1
  %96 = mul nsw i32 %95, 256
  %97 = add nsw i32 %93, %96
  %98 = load i32, ptr %13, align 4
  %99 = sub nsw i32 %98, 1
  %100 = add nsw i32 %97, %99
  %101 = sext i32 %100 to i64
  %102 = load ptr, ptr %10, align 8
  %103 = getelementptr float, ptr %102, i64 %101
  %104 = load float, ptr %103, align 4
  %105 = fmul contract float %90, %104
  %106 = load float, ptr %17, align 4
  %107 = load i32, ptr %12, align 4
  %108 = add nsw i32 %107, 1
  %109 = mul nsw i32 %108, 65536
  %110 = load i32, ptr %14, align 4
  %111 = sub nsw i32 %110, 1
  %112 = mul nsw i32 %111, 256
  %113 = add nsw i32 %109, %112
  %114 = load i32, ptr %13, align 4
  %115 = sub nsw i32 %114, 1
  %116 = add nsw i32 %113, %115
  %117 = sext i32 %116 to i64
  %118 = load ptr, ptr %10, align 8
  %119 = getelementptr float, ptr %118, i64 %117
  %120 = load float, ptr %119, align 4
  %121 = fmul contract float %106, %120
  %122 = fadd contract float %105, %121
  %123 = load float, ptr %18, align 4
  %124 = load i32, ptr %12, align 4
  %125 = sub nsw i32 %124, 1
  %126 = mul nsw i32 %125, 65536
  %127 = load i32, ptr %14, align 4
  %128 = sub nsw i32 %127, 1
  %129 = mul nsw i32 %128, 256
  %130 = add nsw i32 %126, %129
  %131 = load i32, ptr %13, align 4
  %132 = sub nsw i32 %131, 1
  %133 = add nsw i32 %130, %132
  %134 = sext i32 %133 to i64
  %135 = load ptr, ptr %10, align 8
  %136 = getelementptr float, ptr %135, i64 %134
  %137 = load float, ptr %136, align 4
  %138 = fmul contract float %123, %137
  %139 = fadd contract float %122, %138
  %140 = load float, ptr %20, align 4
  %141 = load i32, ptr %12, align 4
  %142 = add nsw i32 %141, 1
  %143 = mul nsw i32 %142, 65536
  %144 = load i32, ptr %14, align 4
  %145 = sub nsw i32 %144, 1
  %146 = mul nsw i32 %145, 256
  %147 = add nsw i32 %143, %146
  %148 = load i32, ptr %13, align 4
  %149 = sub nsw i32 %148, 1
  %150 = add nsw i32 %147, %149
  %151 = sext i32 %150 to i64
  %152 = load ptr, ptr %10, align 8
  %153 = getelementptr float, ptr %152, i64 %151
  %154 = load float, ptr %153, align 4
  %155 = fmul contract float %140, %154
  %156 = fadd contract float %139, %155
  %157 = load float, ptr %21, align 4
  %158 = load i32, ptr %12, align 4
  %159 = sub nsw i32 %158, 1
  %160 = mul nsw i32 %159, 65536
  %161 = load i32, ptr %14, align 4
  %162 = sub nsw i32 %161, 1
  %163 = mul nsw i32 %162, 256
  %164 = add nsw i32 %160, %163
  %165 = load i32, ptr %13, align 4
  %166 = sub nsw i32 %165, 1
  %167 = add nsw i32 %164, %166
  %168 = sext i32 %167 to i64
  %169 = load ptr, ptr %10, align 8
  %170 = getelementptr float, ptr %169, i64 %168
  %171 = load float, ptr %170, align 4
  %172 = fmul contract float %157, %171
  %173 = fadd contract float %156, %172
  %174 = load float, ptr %23, align 4
  %175 = load i32, ptr %12, align 4
  %176 = add nsw i32 %175, 1
  %177 = mul nsw i32 %176, 65536
  %178 = load i32, ptr %14, align 4
  %179 = sub nsw i32 %178, 1
  %180 = mul nsw i32 %179, 256
  %181 = add nsw i32 %177, %180
  %182 = load i32, ptr %13, align 4
  %183 = sub nsw i32 %182, 1
  %184 = add nsw i32 %181, %183
  %185 = sext i32 %184 to i64
  %186 = load ptr, ptr %10, align 8
  %187 = getelementptr float, ptr %186, i64 %185
  %188 = load float, ptr %187, align 4
  %189 = fmul contract float %174, %188
  %190 = fadd contract float %173, %189
  %191 = load float, ptr %16, align 4
  %192 = load i32, ptr %12, align 4
  %193 = add nsw i32 %192, 0
  %194 = mul nsw i32 %193, 65536
  %195 = load i32, ptr %14, align 4
  %196 = sub nsw i32 %195, 1
  %197 = mul nsw i32 %196, 256
  %198 = add nsw i32 %194, %197
  %199 = load i32, ptr %13, align 4
  %200 = add nsw i32 %199, 0
  %201 = add nsw i32 %198, %200
  %202 = sext i32 %201 to i64
  %203 = load ptr, ptr %10, align 8
  %204 = getelementptr float, ptr %203, i64 %202
  %205 = load float, ptr %204, align 4
  %206 = fmul contract float %191, %205
  %207 = fadd contract float %190, %206
  %208 = load float, ptr %19, align 4
  %209 = load i32, ptr %12, align 4
  %210 = add nsw i32 %209, 0
  %211 = mul nsw i32 %210, 65536
  %212 = load i32, ptr %14, align 4
  %213 = add nsw i32 %212, 0
  %214 = mul nsw i32 %213, 256
  %215 = add nsw i32 %211, %214
  %216 = load i32, ptr %13, align 4
  %217 = add nsw i32 %216, 0
  %218 = add nsw i32 %215, %217
  %219 = sext i32 %218 to i64
  %220 = load ptr, ptr %10, align 8
  %221 = getelementptr float, ptr %220, i64 %219
  %222 = load float, ptr %221, align 4
  %223 = fmul contract float %208, %222
  %224 = fadd contract float %207, %223
  %225 = load float, ptr %22, align 4
  %226 = load i32, ptr %12, align 4
  %227 = add nsw i32 %226, 0
  %228 = mul nsw i32 %227, 65536
  %229 = load i32, ptr %14, align 4
  %230 = add nsw i32 %229, 1
  %231 = mul nsw i32 %230, 256
  %232 = add nsw i32 %228, %231
  %233 = load i32, ptr %13, align 4
  %234 = add nsw i32 %233, 0
  %235 = add nsw i32 %232, %234
  %236 = sext i32 %235 to i64
  %237 = load ptr, ptr %10, align 8
  %238 = getelementptr float, ptr %237, i64 %236
  %239 = load float, ptr %238, align 4
  %240 = fmul contract float %225, %239
  %241 = fadd contract float %224, %240
  %242 = load float, ptr %15, align 4
  %243 = load i32, ptr %12, align 4
  %244 = sub nsw i32 %243, 1
  %245 = mul nsw i32 %244, 65536
  %246 = load i32, ptr %14, align 4
  %247 = sub nsw i32 %246, 1
  %248 = mul nsw i32 %247, 256
  %249 = add nsw i32 %245, %248
  %250 = load i32, ptr %13, align 4
  %251 = add nsw i32 %250, 1
  %252 = add nsw i32 %249, %251
  %253 = sext i32 %252 to i64
  %254 = load ptr, ptr %10, align 8
  %255 = getelementptr float, ptr %254, i64 %253
  %256 = load float, ptr %255, align 4
  %257 = fmul contract float %242, %256
  %258 = fadd contract float %241, %257
  %259 = load float, ptr %17, align 4
  %260 = load i32, ptr %12, align 4
  %261 = add nsw i32 %260, 1
  %262 = mul nsw i32 %261, 65536
  %263 = load i32, ptr %14, align 4
  %264 = sub nsw i32 %263, 1
  %265 = mul nsw i32 %264, 256
  %266 = add nsw i32 %262, %265
  %267 = load i32, ptr %13, align 4
  %268 = add nsw i32 %267, 1
  %269 = add nsw i32 %266, %268
  %270 = sext i32 %269 to i64
  %271 = load ptr, ptr %10, align 8
  %272 = getelementptr float, ptr %271, i64 %270
  %273 = load float, ptr %272, align 4
  %274 = fmul contract float %259, %273
  %275 = fadd contract float %258, %274
  %276 = load float, ptr %18, align 4
  %277 = load i32, ptr %12, align 4
  %278 = sub nsw i32 %277, 1
  %279 = mul nsw i32 %278, 65536
  %280 = load i32, ptr %14, align 4
  %281 = add nsw i32 %280, 0
  %282 = mul nsw i32 %281, 256
  %283 = add nsw i32 %279, %282
  %284 = load i32, ptr %13, align 4
  %285 = add nsw i32 %284, 1
  %286 = add nsw i32 %283, %285
  %287 = sext i32 %286 to i64
  %288 = load ptr, ptr %10, align 8
  %289 = getelementptr float, ptr %288, i64 %287
  %290 = load float, ptr %289, align 4
  %291 = fmul contract float %276, %290
  %292 = fadd contract float %275, %291
  %293 = load float, ptr %20, align 4
  %294 = load i32, ptr %12, align 4
  %295 = add nsw i32 %294, 1
  %296 = mul nsw i32 %295, 65536
  %297 = load i32, ptr %14, align 4
  %298 = add nsw i32 %297, 0
  %299 = mul nsw i32 %298, 256
  %300 = add nsw i32 %296, %299
  %301 = load i32, ptr %13, align 4
  %302 = add nsw i32 %301, 1
  %303 = add nsw i32 %300, %302
  %304 = sext i32 %303 to i64
  %305 = load ptr, ptr %10, align 8
  %306 = getelementptr float, ptr %305, i64 %304
  %307 = load float, ptr %306, align 4
  %308 = fmul contract float %293, %307
  %309 = fadd contract float %292, %308
  %310 = load float, ptr %21, align 4
  %311 = load i32, ptr %12, align 4
  %312 = sub nsw i32 %311, 1
  %313 = mul nsw i32 %312, 65536
  %314 = load i32, ptr %14, align 4
  %315 = add nsw i32 %314, 1
  %316 = mul nsw i32 %315, 256
  %317 = add nsw i32 %313, %316
  %318 = load i32, ptr %13, align 4
  %319 = add nsw i32 %318, 1
  %320 = add nsw i32 %317, %319
  %321 = sext i32 %320 to i64
  %322 = load ptr, ptr %10, align 8
  %323 = getelementptr float, ptr %322, i64 %321
  %324 = load float, ptr %323, align 4
  %325 = fmul contract float %310, %324
  %326 = fadd contract float %309, %325
  %327 = load float, ptr %23, align 4
  %328 = load i32, ptr %12, align 4
  %329 = add nsw i32 %328, 1
  %330 = mul nsw i32 %329, 65536
  %331 = load i32, ptr %14, align 4
  %332 = add nsw i32 %331, 1
  %333 = mul nsw i32 %332, 256
  %334 = add nsw i32 %330, %333
  %335 = load i32, ptr %13, align 4
  %336 = add nsw i32 %335, 1
  %337 = add nsw i32 %334, %336
  %338 = sext i32 %337 to i64
  %339 = load ptr, ptr %10, align 8
  %340 = getelementptr float, ptr %339, i64 %338
  %341 = load float, ptr %340, align 4
  %342 = fmul contract float %327, %341
  %343 = fadd contract float %326, %342
  %344 = load i32, ptr %12, align 4
  %345 = mul nsw i32 %344, 65536
  %346 = load i32, ptr %14, align 4
  %347 = mul nsw i32 %346, 256
  %348 = add nsw i32 %345, %347
  %349 = load i32, ptr %13, align 4
  %350 = add nsw i32 %348, %349
  %351 = sext i32 %350 to i64
  %352 = load ptr, ptr %11, align 8
  %353 = getelementptr float, ptr %352, i64 %351
  store float %343, ptr %353, align 4
  br label %354

354:                                              ; preds = %89, %88
  br label %355

355:                                              ; preds = %354
  br label %356

356:                                              ; preds = %355
  call void @llvm.lifetime.end.p0(ptr %23)
  br label %357

357:                                              ; preds = %356
  br label %358

358:                                              ; preds = %357
  br label %359

359:                                              ; preds = %358
  call void @llvm.lifetime.end.p0(ptr %22)
  br label %360

360:                                              ; preds = %359
  br label %361

361:                                              ; preds = %360
  br label %362

362:                                              ; preds = %361
  call void @llvm.lifetime.end.p0(ptr %21)
  br label %363

363:                                              ; preds = %362
  br label %364

364:                                              ; preds = %363
  br label %365

365:                                              ; preds = %364
  call void @llvm.lifetime.end.p0(ptr %20)
  br label %366

366:                                              ; preds = %365
  br label %367

367:                                              ; preds = %366
  br label %368

368:                                              ; preds = %367
  call void @llvm.lifetime.end.p0(ptr %19)
  br label %369

369:                                              ; preds = %368
  br label %370

370:                                              ; preds = %369
  br label %371

371:                                              ; preds = %370
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %372

372:                                              ; preds = %371
  br label %373

373:                                              ; preds = %372
  br label %374

374:                                              ; preds = %373
  call void @llvm.lifetime.end.p0(ptr %17)
  br label %375

375:                                              ; preds = %374
  br label %376

376:                                              ; preds = %375
  br label %377

377:                                              ; preds = %376
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %378

378:                                              ; preds = %377
  br label %379

379:                                              ; preds = %378
  br label %380

380:                                              ; preds = %379
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %381

381:                                              ; preds = %380
  br label %382

382:                                              ; preds = %381
  br label %383

383:                                              ; preds = %382
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %384

384:                                              ; preds = %383
  br label %385

385:                                              ; preds = %384
  br label %386

386:                                              ; preds = %385
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %387

387:                                              ; preds = %386
  br label %388

388:                                              ; preds = %387
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z20convolution3D_kerneliiiPfS_i__noalias(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  %20 = alloca float, align 4
  %21 = alloca float, align 4
  %22 = alloca float, align 4
  %23 = alloca float, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store i32 %5, ptr %12, align 4
  call void @llvm.lifetime.start.p0(ptr %13)
  br label %24

24:                                               ; preds = %6
  %25 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %26 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %27 = mul i32 %25, %26
  %28 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %29 = add i32 %27, %28
  store i32 %29, ptr %13, align 4
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %30

30:                                               ; preds = %24
  %31 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %32 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %33 = mul i32 %31, %32
  %34 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %35 = add i32 %33, %34
  store i32 %35, ptr %14, align 4
  call void @llvm.lifetime.start.p0(ptr %15)
  br label %36

36:                                               ; preds = %30
  call void @llvm.lifetime.start.p0(ptr %16)
  br label %37

37:                                               ; preds = %36
  call void @llvm.lifetime.start.p0(ptr %17)
  br label %38

38:                                               ; preds = %37
  call void @llvm.lifetime.start.p0(ptr %18)
  br label %39

39:                                               ; preds = %38
  call void @llvm.lifetime.start.p0(ptr %19)
  br label %40

40:                                               ; preds = %39
  call void @llvm.lifetime.start.p0(ptr %20)
  br label %41

41:                                               ; preds = %40
  call void @llvm.lifetime.start.p0(ptr %21)
  br label %42

42:                                               ; preds = %41
  call void @llvm.lifetime.start.p0(ptr %22)
  br label %43

43:                                               ; preds = %42
  call void @llvm.lifetime.start.p0(ptr %23)
  br label %44

44:                                               ; preds = %43
  store float 2.000000e+00, ptr %15, align 4
  store float 5.000000e+00, ptr %18, align 4
  store float -8.000000e+00, ptr %21, align 4
  store float -3.000000e+00, ptr %16, align 4
  store float 6.000000e+00, ptr %19, align 4
  store float -9.000000e+00, ptr %22, align 4
  store float 4.000000e+00, ptr %17, align 4
  store float 7.000000e+00, ptr %20, align 4
  store float 1.000000e+01, ptr %23, align 4
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %12, align 4
  %47 = load i32, ptr %7, align 4
  %48 = sub nsw i32 %47, 1
  %49 = icmp slt i32 %46, %48
  br i1 %49, label %50, label %55

50:                                               ; preds = %45
  %51 = load i32, ptr %14, align 4
  %52 = load i32, ptr %8, align 4
  %53 = sub nsw i32 %52, 1
  %54 = icmp slt i32 %51, %53
  br label %56

55:                                               ; preds = %45
  br label %56

56:                                               ; preds = %50, %55
  %57 = phi i1 [ false, %55 ], [ %54, %50 ]
  br label %58

58:                                               ; preds = %56
  br i1 %57, label %59, label %64

59:                                               ; preds = %58
  %60 = load i32, ptr %13, align 4
  %61 = load i32, ptr %9, align 4
  %62 = sub nsw i32 %61, 1
  %63 = icmp slt i32 %60, %62
  br label %65

64:                                               ; preds = %58
  br label %65

65:                                               ; preds = %59, %64
  %66 = phi i1 [ false, %64 ], [ %63, %59 ]
  br label %67

67:                                               ; preds = %65
  br i1 %66, label %68, label %71

68:                                               ; preds = %67
  %69 = load i32, ptr %12, align 4
  %70 = icmp sgt i32 %69, 0
  br label %72

71:                                               ; preds = %67
  br label %72

72:                                               ; preds = %68, %71
  %73 = phi i1 [ false, %71 ], [ %70, %68 ]
  br label %74

74:                                               ; preds = %72
  br i1 %73, label %75, label %78

75:                                               ; preds = %74
  %76 = load i32, ptr %14, align 4
  %77 = icmp sgt i32 %76, 0
  br label %79

78:                                               ; preds = %74
  br label %79

79:                                               ; preds = %75, %78
  %80 = phi i1 [ false, %78 ], [ %77, %75 ]
  br label %81

81:                                               ; preds = %79
  br i1 %80, label %82, label %85

82:                                               ; preds = %81
  %83 = load i32, ptr %13, align 4
  %84 = icmp sgt i32 %83, 0
  br label %86

85:                                               ; preds = %81
  br label %86

86:                                               ; preds = %82, %85
  %87 = phi i1 [ false, %85 ], [ %84, %82 ]
  br label %88

88:                                               ; preds = %86
  br i1 %87, label %89, label %354

89:                                               ; preds = %88
  %90 = load float, ptr %15, align 4
  %91 = load i32, ptr %12, align 4
  %92 = sub nsw i32 %91, 1
  %93 = mul nsw i32 %92, 65536
  %94 = load i32, ptr %14, align 4
  %95 = sub nsw i32 %94, 1
  %96 = mul nsw i32 %95, 256
  %97 = add nsw i32 %93, %96
  %98 = load i32, ptr %13, align 4
  %99 = sub nsw i32 %98, 1
  %100 = add nsw i32 %97, %99
  %101 = sext i32 %100 to i64
  %102 = load ptr, ptr %10, align 8
  %103 = getelementptr float, ptr %102, i64 %101
  %104 = load float, ptr %103, align 4
  %105 = fmul contract float %90, %104
  %106 = load float, ptr %17, align 4
  %107 = load i32, ptr %12, align 4
  %108 = add nsw i32 %107, 1
  %109 = mul nsw i32 %108, 65536
  %110 = load i32, ptr %14, align 4
  %111 = sub nsw i32 %110, 1
  %112 = mul nsw i32 %111, 256
  %113 = add nsw i32 %109, %112
  %114 = load i32, ptr %13, align 4
  %115 = sub nsw i32 %114, 1
  %116 = add nsw i32 %113, %115
  %117 = sext i32 %116 to i64
  %118 = load ptr, ptr %10, align 8
  %119 = getelementptr float, ptr %118, i64 %117
  %120 = load float, ptr %119, align 4
  %121 = fmul contract float %106, %120
  %122 = fadd contract float %105, %121
  %123 = load float, ptr %18, align 4
  %124 = load i32, ptr %12, align 4
  %125 = sub nsw i32 %124, 1
  %126 = mul nsw i32 %125, 65536
  %127 = load i32, ptr %14, align 4
  %128 = sub nsw i32 %127, 1
  %129 = mul nsw i32 %128, 256
  %130 = add nsw i32 %126, %129
  %131 = load i32, ptr %13, align 4
  %132 = sub nsw i32 %131, 1
  %133 = add nsw i32 %130, %132
  %134 = sext i32 %133 to i64
  %135 = load ptr, ptr %10, align 8
  %136 = getelementptr float, ptr %135, i64 %134
  %137 = load float, ptr %136, align 4
  %138 = fmul contract float %123, %137
  %139 = fadd contract float %122, %138
  %140 = load float, ptr %20, align 4
  %141 = load i32, ptr %12, align 4
  %142 = add nsw i32 %141, 1
  %143 = mul nsw i32 %142, 65536
  %144 = load i32, ptr %14, align 4
  %145 = sub nsw i32 %144, 1
  %146 = mul nsw i32 %145, 256
  %147 = add nsw i32 %143, %146
  %148 = load i32, ptr %13, align 4
  %149 = sub nsw i32 %148, 1
  %150 = add nsw i32 %147, %149
  %151 = sext i32 %150 to i64
  %152 = load ptr, ptr %10, align 8
  %153 = getelementptr float, ptr %152, i64 %151
  %154 = load float, ptr %153, align 4
  %155 = fmul contract float %140, %154
  %156 = fadd contract float %139, %155
  %157 = load float, ptr %21, align 4
  %158 = load i32, ptr %12, align 4
  %159 = sub nsw i32 %158, 1
  %160 = mul nsw i32 %159, 65536
  %161 = load i32, ptr %14, align 4
  %162 = sub nsw i32 %161, 1
  %163 = mul nsw i32 %162, 256
  %164 = add nsw i32 %160, %163
  %165 = load i32, ptr %13, align 4
  %166 = sub nsw i32 %165, 1
  %167 = add nsw i32 %164, %166
  %168 = sext i32 %167 to i64
  %169 = load ptr, ptr %10, align 8
  %170 = getelementptr float, ptr %169, i64 %168
  %171 = load float, ptr %170, align 4
  %172 = fmul contract float %157, %171
  %173 = fadd contract float %156, %172
  %174 = load float, ptr %23, align 4
  %175 = load i32, ptr %12, align 4
  %176 = add nsw i32 %175, 1
  %177 = mul nsw i32 %176, 65536
  %178 = load i32, ptr %14, align 4
  %179 = sub nsw i32 %178, 1
  %180 = mul nsw i32 %179, 256
  %181 = add nsw i32 %177, %180
  %182 = load i32, ptr %13, align 4
  %183 = sub nsw i32 %182, 1
  %184 = add nsw i32 %181, %183
  %185 = sext i32 %184 to i64
  %186 = load ptr, ptr %10, align 8
  %187 = getelementptr float, ptr %186, i64 %185
  %188 = load float, ptr %187, align 4
  %189 = fmul contract float %174, %188
  %190 = fadd contract float %173, %189
  %191 = load float, ptr %16, align 4
  %192 = load i32, ptr %12, align 4
  %193 = add nsw i32 %192, 0
  %194 = mul nsw i32 %193, 65536
  %195 = load i32, ptr %14, align 4
  %196 = sub nsw i32 %195, 1
  %197 = mul nsw i32 %196, 256
  %198 = add nsw i32 %194, %197
  %199 = load i32, ptr %13, align 4
  %200 = add nsw i32 %199, 0
  %201 = add nsw i32 %198, %200
  %202 = sext i32 %201 to i64
  %203 = load ptr, ptr %10, align 8
  %204 = getelementptr float, ptr %203, i64 %202
  %205 = load float, ptr %204, align 4
  %206 = fmul contract float %191, %205
  %207 = fadd contract float %190, %206
  %208 = load float, ptr %19, align 4
  %209 = load i32, ptr %12, align 4
  %210 = add nsw i32 %209, 0
  %211 = mul nsw i32 %210, 65536
  %212 = load i32, ptr %14, align 4
  %213 = add nsw i32 %212, 0
  %214 = mul nsw i32 %213, 256
  %215 = add nsw i32 %211, %214
  %216 = load i32, ptr %13, align 4
  %217 = add nsw i32 %216, 0
  %218 = add nsw i32 %215, %217
  %219 = sext i32 %218 to i64
  %220 = load ptr, ptr %10, align 8
  %221 = getelementptr float, ptr %220, i64 %219
  %222 = load float, ptr %221, align 4
  %223 = fmul contract float %208, %222
  %224 = fadd contract float %207, %223
  %225 = load float, ptr %22, align 4
  %226 = load i32, ptr %12, align 4
  %227 = add nsw i32 %226, 0
  %228 = mul nsw i32 %227, 65536
  %229 = load i32, ptr %14, align 4
  %230 = add nsw i32 %229, 1
  %231 = mul nsw i32 %230, 256
  %232 = add nsw i32 %228, %231
  %233 = load i32, ptr %13, align 4
  %234 = add nsw i32 %233, 0
  %235 = add nsw i32 %232, %234
  %236 = sext i32 %235 to i64
  %237 = load ptr, ptr %10, align 8
  %238 = getelementptr float, ptr %237, i64 %236
  %239 = load float, ptr %238, align 4
  %240 = fmul contract float %225, %239
  %241 = fadd contract float %224, %240
  %242 = load float, ptr %15, align 4
  %243 = load i32, ptr %12, align 4
  %244 = sub nsw i32 %243, 1
  %245 = mul nsw i32 %244, 65536
  %246 = load i32, ptr %14, align 4
  %247 = sub nsw i32 %246, 1
  %248 = mul nsw i32 %247, 256
  %249 = add nsw i32 %245, %248
  %250 = load i32, ptr %13, align 4
  %251 = add nsw i32 %250, 1
  %252 = add nsw i32 %249, %251
  %253 = sext i32 %252 to i64
  %254 = load ptr, ptr %10, align 8
  %255 = getelementptr float, ptr %254, i64 %253
  %256 = load float, ptr %255, align 4
  %257 = fmul contract float %242, %256
  %258 = fadd contract float %241, %257
  %259 = load float, ptr %17, align 4
  %260 = load i32, ptr %12, align 4
  %261 = add nsw i32 %260, 1
  %262 = mul nsw i32 %261, 65536
  %263 = load i32, ptr %14, align 4
  %264 = sub nsw i32 %263, 1
  %265 = mul nsw i32 %264, 256
  %266 = add nsw i32 %262, %265
  %267 = load i32, ptr %13, align 4
  %268 = add nsw i32 %267, 1
  %269 = add nsw i32 %266, %268
  %270 = sext i32 %269 to i64
  %271 = load ptr, ptr %10, align 8
  %272 = getelementptr float, ptr %271, i64 %270
  %273 = load float, ptr %272, align 4
  %274 = fmul contract float %259, %273
  %275 = fadd contract float %258, %274
  %276 = load float, ptr %18, align 4
  %277 = load i32, ptr %12, align 4
  %278 = sub nsw i32 %277, 1
  %279 = mul nsw i32 %278, 65536
  %280 = load i32, ptr %14, align 4
  %281 = add nsw i32 %280, 0
  %282 = mul nsw i32 %281, 256
  %283 = add nsw i32 %279, %282
  %284 = load i32, ptr %13, align 4
  %285 = add nsw i32 %284, 1
  %286 = add nsw i32 %283, %285
  %287 = sext i32 %286 to i64
  %288 = load ptr, ptr %10, align 8
  %289 = getelementptr float, ptr %288, i64 %287
  %290 = load float, ptr %289, align 4
  %291 = fmul contract float %276, %290
  %292 = fadd contract float %275, %291
  %293 = load float, ptr %20, align 4
  %294 = load i32, ptr %12, align 4
  %295 = add nsw i32 %294, 1
  %296 = mul nsw i32 %295, 65536
  %297 = load i32, ptr %14, align 4
  %298 = add nsw i32 %297, 0
  %299 = mul nsw i32 %298, 256
  %300 = add nsw i32 %296, %299
  %301 = load i32, ptr %13, align 4
  %302 = add nsw i32 %301, 1
  %303 = add nsw i32 %300, %302
  %304 = sext i32 %303 to i64
  %305 = load ptr, ptr %10, align 8
  %306 = getelementptr float, ptr %305, i64 %304
  %307 = load float, ptr %306, align 4
  %308 = fmul contract float %293, %307
  %309 = fadd contract float %292, %308
  %310 = load float, ptr %21, align 4
  %311 = load i32, ptr %12, align 4
  %312 = sub nsw i32 %311, 1
  %313 = mul nsw i32 %312, 65536
  %314 = load i32, ptr %14, align 4
  %315 = add nsw i32 %314, 1
  %316 = mul nsw i32 %315, 256
  %317 = add nsw i32 %313, %316
  %318 = load i32, ptr %13, align 4
  %319 = add nsw i32 %318, 1
  %320 = add nsw i32 %317, %319
  %321 = sext i32 %320 to i64
  %322 = load ptr, ptr %10, align 8
  %323 = getelementptr float, ptr %322, i64 %321
  %324 = load float, ptr %323, align 4
  %325 = fmul contract float %310, %324
  %326 = fadd contract float %309, %325
  %327 = load float, ptr %23, align 4
  %328 = load i32, ptr %12, align 4
  %329 = add nsw i32 %328, 1
  %330 = mul nsw i32 %329, 65536
  %331 = load i32, ptr %14, align 4
  %332 = add nsw i32 %331, 1
  %333 = mul nsw i32 %332, 256
  %334 = add nsw i32 %330, %333
  %335 = load i32, ptr %13, align 4
  %336 = add nsw i32 %335, 1
  %337 = add nsw i32 %334, %336
  %338 = sext i32 %337 to i64
  %339 = load ptr, ptr %10, align 8
  %340 = getelementptr float, ptr %339, i64 %338
  %341 = load float, ptr %340, align 4
  %342 = fmul contract float %327, %341
  %343 = fadd contract float %326, %342
  %344 = load i32, ptr %12, align 4
  %345 = mul nsw i32 %344, 65536
  %346 = load i32, ptr %14, align 4
  %347 = mul nsw i32 %346, 256
  %348 = add nsw i32 %345, %347
  %349 = load i32, ptr %13, align 4
  %350 = add nsw i32 %348, %349
  %351 = sext i32 %350 to i64
  %352 = load ptr, ptr %11, align 8
  %353 = getelementptr float, ptr %352, i64 %351
  store float %343, ptr %353, align 4
  br label %354

354:                                              ; preds = %89, %88
  br label %355

355:                                              ; preds = %354
  br label %356

356:                                              ; preds = %355
  call void @llvm.lifetime.end.p0(ptr %23)
  br label %357

357:                                              ; preds = %356
  br label %358

358:                                              ; preds = %357
  br label %359

359:                                              ; preds = %358
  call void @llvm.lifetime.end.p0(ptr %22)
  br label %360

360:                                              ; preds = %359
  br label %361

361:                                              ; preds = %360
  br label %362

362:                                              ; preds = %361
  call void @llvm.lifetime.end.p0(ptr %21)
  br label %363

363:                                              ; preds = %362
  br label %364

364:                                              ; preds = %363
  br label %365

365:                                              ; preds = %364
  call void @llvm.lifetime.end.p0(ptr %20)
  br label %366

366:                                              ; preds = %365
  br label %367

367:                                              ; preds = %366
  br label %368

368:                                              ; preds = %367
  call void @llvm.lifetime.end.p0(ptr %19)
  br label %369

369:                                              ; preds = %368
  br label %370

370:                                              ; preds = %369
  br label %371

371:                                              ; preds = %370
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %372

372:                                              ; preds = %371
  br label %373

373:                                              ; preds = %372
  br label %374

374:                                              ; preds = %373
  call void @llvm.lifetime.end.p0(ptr %17)
  br label %375

375:                                              ; preds = %374
  br label %376

376:                                              ; preds = %375
  br label %377

377:                                              ; preds = %376
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %378

378:                                              ; preds = %377
  br label %379

379:                                              ; preds = %378
  br label %380

380:                                              ; preds = %379
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %381

381:                                              ; preds = %380
  br label %382

382:                                              ; preds = %381
  br label %383

383:                                              ; preds = %382
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %384

384:                                              ; preds = %383
  br label %385

385:                                              ; preds = %384
  br label %386

386:                                              ; preds = %385
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %387

387:                                              ; preds = %386
  br label %388

388:                                              ; preds = %387
  ret void
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  ret i32 %1
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3

attributes #0 = { convergent noinline "target-cpu"="sm_86" "target-features"="+ptx87" "uniform-work-group-size" }
attributes #1 = { alwaysinline convergent "target-cpu"="sm_86" "target-features"="+ptx87" "uniform-work-group-size" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { convergent "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
