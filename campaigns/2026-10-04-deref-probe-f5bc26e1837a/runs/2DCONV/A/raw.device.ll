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
define dso_local ptx_kernel void @_Z20convolution2D_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %20

20:                                               ; preds = %4
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %22 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %23 = mul i32 %21, %22
  %24 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %25 = add i32 %23, %24
  store i32 %25, ptr %9, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %26

26:                                               ; preds = %20
  %27 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %28 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %29 = mul i32 %27, %28
  %30 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %31 = add i32 %29, %30
  store i32 %31, ptr %10, align 4
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %32

32:                                               ; preds = %26
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %33

33:                                               ; preds = %32
  call void @llvm.lifetime.start.p0(ptr %13)
  br label %34

34:                                               ; preds = %33
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %35

35:                                               ; preds = %34
  call void @llvm.lifetime.start.p0(ptr %15)
  br label %36

36:                                               ; preds = %35
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
  store float 2.000000e-01, ptr %11, align 4
  store float 5.000000e-01, ptr %14, align 4
  store float -8.000000e-01, ptr %17, align 4
  store float -3.000000e-01, ptr %12, align 4
  store float 6.000000e-01, ptr %15, align 4
  store float f0xBF666666, ptr %18, align 4
  store float 4.000000e-01, ptr %13, align 4
  store float f0x3F333333, ptr %16, align 4
  store float 1.000000e-01, ptr %19, align 4
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %10, align 4
  %43 = load i32, ptr %5, align 4
  %44 = sub nsw i32 %43, 1
  %45 = icmp slt i32 %42, %44
  br i1 %45, label %46, label %51

46:                                               ; preds = %41
  %47 = load i32, ptr %9, align 4
  %48 = load i32, ptr %6, align 4
  %49 = sub nsw i32 %48, 1
  %50 = icmp slt i32 %47, %49
  br label %52

51:                                               ; preds = %41
  br label %52

52:                                               ; preds = %46, %51
  %53 = phi i1 [ false, %51 ], [ %50, %46 ]
  br label %54

54:                                               ; preds = %52
  br i1 %53, label %55, label %58

55:                                               ; preds = %54
  %56 = load i32, ptr %10, align 4
  %57 = icmp sgt i32 %56, 0
  br label %59

58:                                               ; preds = %54
  br label %59

59:                                               ; preds = %55, %58
  %60 = phi i1 [ false, %58 ], [ %57, %55 ]
  br label %61

61:                                               ; preds = %59
  br i1 %60, label %62, label %65

62:                                               ; preds = %61
  %63 = load i32, ptr %9, align 4
  %64 = icmp sgt i32 %63, 0
  br label %66

65:                                               ; preds = %61
  br label %66

66:                                               ; preds = %62, %65
  %67 = phi i1 [ false, %65 ], [ %64, %62 ]
  br label %68

68:                                               ; preds = %66
  br i1 %67, label %69, label %193

69:                                               ; preds = %68
  %70 = load float, ptr %11, align 4
  %71 = load i32, ptr %10, align 4
  %72 = sub nsw i32 %71, 1
  %73 = mul nsw i32 %72, 4096
  %74 = load i32, ptr %9, align 4
  %75 = sub nsw i32 %74, 1
  %76 = add nsw i32 %73, %75
  %77 = sext i32 %76 to i64
  %78 = load ptr, ptr %7, align 8
  %79 = getelementptr float, ptr %78, i64 %77
  %80 = load float, ptr %79, align 4
  %81 = fmul contract float %70, %80
  %82 = load float, ptr %14, align 4
  %83 = load i32, ptr %10, align 4
  %84 = sub nsw i32 %83, 1
  %85 = mul nsw i32 %84, 4096
  %86 = load i32, ptr %9, align 4
  %87 = add nsw i32 %86, 0
  %88 = add nsw i32 %85, %87
  %89 = sext i32 %88 to i64
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr float, ptr %90, i64 %89
  %92 = load float, ptr %91, align 4
  %93 = fmul contract float %82, %92
  %94 = fadd contract float %81, %93
  %95 = load float, ptr %17, align 4
  %96 = load i32, ptr %10, align 4
  %97 = sub nsw i32 %96, 1
  %98 = mul nsw i32 %97, 4096
  %99 = load i32, ptr %9, align 4
  %100 = add nsw i32 %99, 1
  %101 = add nsw i32 %98, %100
  %102 = sext i32 %101 to i64
  %103 = load ptr, ptr %7, align 8
  %104 = getelementptr float, ptr %103, i64 %102
  %105 = load float, ptr %104, align 4
  %106 = fmul contract float %95, %105
  %107 = fadd contract float %94, %106
  %108 = load float, ptr %12, align 4
  %109 = load i32, ptr %10, align 4
  %110 = add nsw i32 %109, 0
  %111 = mul nsw i32 %110, 4096
  %112 = load i32, ptr %9, align 4
  %113 = sub nsw i32 %112, 1
  %114 = add nsw i32 %111, %113
  %115 = sext i32 %114 to i64
  %116 = load ptr, ptr %7, align 8
  %117 = getelementptr float, ptr %116, i64 %115
  %118 = load float, ptr %117, align 4
  %119 = fmul contract float %108, %118
  %120 = fadd contract float %107, %119
  %121 = load float, ptr %15, align 4
  %122 = load i32, ptr %10, align 4
  %123 = add nsw i32 %122, 0
  %124 = mul nsw i32 %123, 4096
  %125 = load i32, ptr %9, align 4
  %126 = add nsw i32 %125, 0
  %127 = add nsw i32 %124, %126
  %128 = sext i32 %127 to i64
  %129 = load ptr, ptr %7, align 8
  %130 = getelementptr float, ptr %129, i64 %128
  %131 = load float, ptr %130, align 4
  %132 = fmul contract float %121, %131
  %133 = fadd contract float %120, %132
  %134 = load float, ptr %18, align 4
  %135 = load i32, ptr %10, align 4
  %136 = add nsw i32 %135, 0
  %137 = mul nsw i32 %136, 4096
  %138 = load i32, ptr %9, align 4
  %139 = add nsw i32 %138, 1
  %140 = add nsw i32 %137, %139
  %141 = sext i32 %140 to i64
  %142 = load ptr, ptr %7, align 8
  %143 = getelementptr float, ptr %142, i64 %141
  %144 = load float, ptr %143, align 4
  %145 = fmul contract float %134, %144
  %146 = fadd contract float %133, %145
  %147 = load float, ptr %13, align 4
  %148 = load i32, ptr %10, align 4
  %149 = add nsw i32 %148, 1
  %150 = mul nsw i32 %149, 4096
  %151 = load i32, ptr %9, align 4
  %152 = sub nsw i32 %151, 1
  %153 = add nsw i32 %150, %152
  %154 = sext i32 %153 to i64
  %155 = load ptr, ptr %7, align 8
  %156 = getelementptr float, ptr %155, i64 %154
  %157 = load float, ptr %156, align 4
  %158 = fmul contract float %147, %157
  %159 = fadd contract float %146, %158
  %160 = load float, ptr %16, align 4
  %161 = load i32, ptr %10, align 4
  %162 = add nsw i32 %161, 1
  %163 = mul nsw i32 %162, 4096
  %164 = load i32, ptr %9, align 4
  %165 = add nsw i32 %164, 0
  %166 = add nsw i32 %163, %165
  %167 = sext i32 %166 to i64
  %168 = load ptr, ptr %7, align 8
  %169 = getelementptr float, ptr %168, i64 %167
  %170 = load float, ptr %169, align 4
  %171 = fmul contract float %160, %170
  %172 = fadd contract float %159, %171
  %173 = load float, ptr %19, align 4
  %174 = load i32, ptr %10, align 4
  %175 = add nsw i32 %174, 1
  %176 = mul nsw i32 %175, 4096
  %177 = load i32, ptr %9, align 4
  %178 = add nsw i32 %177, 1
  %179 = add nsw i32 %176, %178
  %180 = sext i32 %179 to i64
  %181 = load ptr, ptr %7, align 8
  %182 = getelementptr float, ptr %181, i64 %180
  %183 = load float, ptr %182, align 4
  %184 = fmul contract float %173, %183
  %185 = fadd contract float %172, %184
  %186 = load i32, ptr %10, align 4
  %187 = mul nsw i32 %186, 4096
  %188 = load i32, ptr %9, align 4
  %189 = add nsw i32 %187, %188
  %190 = sext i32 %189 to i64
  %191 = load ptr, ptr %8, align 8
  %192 = getelementptr float, ptr %191, i64 %190
  store float %185, ptr %192, align 4
  br label %193

193:                                              ; preds = %69, %68
  br label %194

194:                                              ; preds = %193
  br label %195

195:                                              ; preds = %194
  call void @llvm.lifetime.end.p0(ptr %19)
  br label %196

196:                                              ; preds = %195
  br label %197

197:                                              ; preds = %196
  br label %198

198:                                              ; preds = %197
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %199

199:                                              ; preds = %198
  br label %200

200:                                              ; preds = %199
  br label %201

201:                                              ; preds = %200
  call void @llvm.lifetime.end.p0(ptr %17)
  br label %202

202:                                              ; preds = %201
  br label %203

203:                                              ; preds = %202
  br label %204

204:                                              ; preds = %203
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %205

205:                                              ; preds = %204
  br label %206

206:                                              ; preds = %205
  br label %207

207:                                              ; preds = %206
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %208

208:                                              ; preds = %207
  br label %209

209:                                              ; preds = %208
  br label %210

210:                                              ; preds = %209
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %211

211:                                              ; preds = %210
  br label %212

212:                                              ; preds = %211
  br label %213

213:                                              ; preds = %212
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %214

214:                                              ; preds = %213
  br label %215

215:                                              ; preds = %214
  br label %216

216:                                              ; preds = %215
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %217

217:                                              ; preds = %216
  br label %218

218:                                              ; preds = %217
  br label %219

219:                                              ; preds = %218
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %220

220:                                              ; preds = %219
  br label %221

221:                                              ; preds = %220
  br label %222

222:                                              ; preds = %221
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %223

223:                                              ; preds = %222
  br label %224

224:                                              ; preds = %223
  br label %225

225:                                              ; preds = %224
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %226

226:                                              ; preds = %225
  br label %227

227:                                              ; preds = %226
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z20convolution2D_kerneliiPfS___noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %20

20:                                               ; preds = %4
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %22 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %23 = mul i32 %21, %22
  %24 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %25 = add i32 %23, %24
  store i32 %25, ptr %9, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %26

26:                                               ; preds = %20
  %27 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %28 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %29 = mul i32 %27, %28
  %30 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %31 = add i32 %29, %30
  store i32 %31, ptr %10, align 4
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %32

32:                                               ; preds = %26
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %33

33:                                               ; preds = %32
  call void @llvm.lifetime.start.p0(ptr %13)
  br label %34

34:                                               ; preds = %33
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %35

35:                                               ; preds = %34
  call void @llvm.lifetime.start.p0(ptr %15)
  br label %36

36:                                               ; preds = %35
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
  store float 2.000000e-01, ptr %11, align 4
  store float 5.000000e-01, ptr %14, align 4
  store float -8.000000e-01, ptr %17, align 4
  store float -3.000000e-01, ptr %12, align 4
  store float 6.000000e-01, ptr %15, align 4
  store float f0xBF666666, ptr %18, align 4
  store float 4.000000e-01, ptr %13, align 4
  store float f0x3F333333, ptr %16, align 4
  store float 1.000000e-01, ptr %19, align 4
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %10, align 4
  %43 = load i32, ptr %5, align 4
  %44 = sub nsw i32 %43, 1
  %45 = icmp slt i32 %42, %44
  br i1 %45, label %46, label %51

46:                                               ; preds = %41
  %47 = load i32, ptr %9, align 4
  %48 = load i32, ptr %6, align 4
  %49 = sub nsw i32 %48, 1
  %50 = icmp slt i32 %47, %49
  br label %52

51:                                               ; preds = %41
  br label %52

52:                                               ; preds = %46, %51
  %53 = phi i1 [ false, %51 ], [ %50, %46 ]
  br label %54

54:                                               ; preds = %52
  br i1 %53, label %55, label %58

55:                                               ; preds = %54
  %56 = load i32, ptr %10, align 4
  %57 = icmp sgt i32 %56, 0
  br label %59

58:                                               ; preds = %54
  br label %59

59:                                               ; preds = %55, %58
  %60 = phi i1 [ false, %58 ], [ %57, %55 ]
  br label %61

61:                                               ; preds = %59
  br i1 %60, label %62, label %65

62:                                               ; preds = %61
  %63 = load i32, ptr %9, align 4
  %64 = icmp sgt i32 %63, 0
  br label %66

65:                                               ; preds = %61
  br label %66

66:                                               ; preds = %62, %65
  %67 = phi i1 [ false, %65 ], [ %64, %62 ]
  br label %68

68:                                               ; preds = %66
  br i1 %67, label %69, label %193

69:                                               ; preds = %68
  %70 = load float, ptr %11, align 4
  %71 = load i32, ptr %10, align 4
  %72 = sub nsw i32 %71, 1
  %73 = mul nsw i32 %72, 4096
  %74 = load i32, ptr %9, align 4
  %75 = sub nsw i32 %74, 1
  %76 = add nsw i32 %73, %75
  %77 = sext i32 %76 to i64
  %78 = load ptr, ptr %7, align 8
  %79 = getelementptr float, ptr %78, i64 %77
  %80 = load float, ptr %79, align 4
  %81 = fmul contract float %70, %80
  %82 = load float, ptr %14, align 4
  %83 = load i32, ptr %10, align 4
  %84 = sub nsw i32 %83, 1
  %85 = mul nsw i32 %84, 4096
  %86 = load i32, ptr %9, align 4
  %87 = add nsw i32 %86, 0
  %88 = add nsw i32 %85, %87
  %89 = sext i32 %88 to i64
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr float, ptr %90, i64 %89
  %92 = load float, ptr %91, align 4
  %93 = fmul contract float %82, %92
  %94 = fadd contract float %81, %93
  %95 = load float, ptr %17, align 4
  %96 = load i32, ptr %10, align 4
  %97 = sub nsw i32 %96, 1
  %98 = mul nsw i32 %97, 4096
  %99 = load i32, ptr %9, align 4
  %100 = add nsw i32 %99, 1
  %101 = add nsw i32 %98, %100
  %102 = sext i32 %101 to i64
  %103 = load ptr, ptr %7, align 8
  %104 = getelementptr float, ptr %103, i64 %102
  %105 = load float, ptr %104, align 4
  %106 = fmul contract float %95, %105
  %107 = fadd contract float %94, %106
  %108 = load float, ptr %12, align 4
  %109 = load i32, ptr %10, align 4
  %110 = add nsw i32 %109, 0
  %111 = mul nsw i32 %110, 4096
  %112 = load i32, ptr %9, align 4
  %113 = sub nsw i32 %112, 1
  %114 = add nsw i32 %111, %113
  %115 = sext i32 %114 to i64
  %116 = load ptr, ptr %7, align 8
  %117 = getelementptr float, ptr %116, i64 %115
  %118 = load float, ptr %117, align 4
  %119 = fmul contract float %108, %118
  %120 = fadd contract float %107, %119
  %121 = load float, ptr %15, align 4
  %122 = load i32, ptr %10, align 4
  %123 = add nsw i32 %122, 0
  %124 = mul nsw i32 %123, 4096
  %125 = load i32, ptr %9, align 4
  %126 = add nsw i32 %125, 0
  %127 = add nsw i32 %124, %126
  %128 = sext i32 %127 to i64
  %129 = load ptr, ptr %7, align 8
  %130 = getelementptr float, ptr %129, i64 %128
  %131 = load float, ptr %130, align 4
  %132 = fmul contract float %121, %131
  %133 = fadd contract float %120, %132
  %134 = load float, ptr %18, align 4
  %135 = load i32, ptr %10, align 4
  %136 = add nsw i32 %135, 0
  %137 = mul nsw i32 %136, 4096
  %138 = load i32, ptr %9, align 4
  %139 = add nsw i32 %138, 1
  %140 = add nsw i32 %137, %139
  %141 = sext i32 %140 to i64
  %142 = load ptr, ptr %7, align 8
  %143 = getelementptr float, ptr %142, i64 %141
  %144 = load float, ptr %143, align 4
  %145 = fmul contract float %134, %144
  %146 = fadd contract float %133, %145
  %147 = load float, ptr %13, align 4
  %148 = load i32, ptr %10, align 4
  %149 = add nsw i32 %148, 1
  %150 = mul nsw i32 %149, 4096
  %151 = load i32, ptr %9, align 4
  %152 = sub nsw i32 %151, 1
  %153 = add nsw i32 %150, %152
  %154 = sext i32 %153 to i64
  %155 = load ptr, ptr %7, align 8
  %156 = getelementptr float, ptr %155, i64 %154
  %157 = load float, ptr %156, align 4
  %158 = fmul contract float %147, %157
  %159 = fadd contract float %146, %158
  %160 = load float, ptr %16, align 4
  %161 = load i32, ptr %10, align 4
  %162 = add nsw i32 %161, 1
  %163 = mul nsw i32 %162, 4096
  %164 = load i32, ptr %9, align 4
  %165 = add nsw i32 %164, 0
  %166 = add nsw i32 %163, %165
  %167 = sext i32 %166 to i64
  %168 = load ptr, ptr %7, align 8
  %169 = getelementptr float, ptr %168, i64 %167
  %170 = load float, ptr %169, align 4
  %171 = fmul contract float %160, %170
  %172 = fadd contract float %159, %171
  %173 = load float, ptr %19, align 4
  %174 = load i32, ptr %10, align 4
  %175 = add nsw i32 %174, 1
  %176 = mul nsw i32 %175, 4096
  %177 = load i32, ptr %9, align 4
  %178 = add nsw i32 %177, 1
  %179 = add nsw i32 %176, %178
  %180 = sext i32 %179 to i64
  %181 = load ptr, ptr %7, align 8
  %182 = getelementptr float, ptr %181, i64 %180
  %183 = load float, ptr %182, align 4
  %184 = fmul contract float %173, %183
  %185 = fadd contract float %172, %184
  %186 = load i32, ptr %10, align 4
  %187 = mul nsw i32 %186, 4096
  %188 = load i32, ptr %9, align 4
  %189 = add nsw i32 %187, %188
  %190 = sext i32 %189 to i64
  %191 = load ptr, ptr %8, align 8
  %192 = getelementptr float, ptr %191, i64 %190
  store float %185, ptr %192, align 4
  br label %193

193:                                              ; preds = %69, %68
  br label %194

194:                                              ; preds = %193
  br label %195

195:                                              ; preds = %194
  call void @llvm.lifetime.end.p0(ptr %19)
  br label %196

196:                                              ; preds = %195
  br label %197

197:                                              ; preds = %196
  br label %198

198:                                              ; preds = %197
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %199

199:                                              ; preds = %198
  br label %200

200:                                              ; preds = %199
  br label %201

201:                                              ; preds = %200
  call void @llvm.lifetime.end.p0(ptr %17)
  br label %202

202:                                              ; preds = %201
  br label %203

203:                                              ; preds = %202
  br label %204

204:                                              ; preds = %203
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %205

205:                                              ; preds = %204
  br label %206

206:                                              ; preds = %205
  br label %207

207:                                              ; preds = %206
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %208

208:                                              ; preds = %207
  br label %209

209:                                              ; preds = %208
  br label %210

210:                                              ; preds = %209
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %211

211:                                              ; preds = %210
  br label %212

212:                                              ; preds = %211
  br label %213

213:                                              ; preds = %212
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %214

214:                                              ; preds = %213
  br label %215

215:                                              ; preds = %214
  br label %216

216:                                              ; preds = %215
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %217

217:                                              ; preds = %216
  br label %218

218:                                              ; preds = %217
  br label %219

219:                                              ; preds = %218
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %220

220:                                              ; preds = %219
  br label %221

221:                                              ; preds = %220
  br label %222

222:                                              ; preds = %221
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %223

223:                                              ; preds = %222
  br label %224

224:                                              ; preds = %223
  br label %225

225:                                              ; preds = %224
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %226

226:                                              ; preds = %225
  br label %227

227:                                              ; preds = %226
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
