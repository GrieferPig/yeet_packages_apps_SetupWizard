LOCAL_PATH:= $(call my-dir)

# 清除除了LOCAL_PATH外的所有变量
include $(CLEAR_VARS)

# support包的根目录，因为编译时我们只能引用来自于framework的support包
support_library_root_dir := frameworks/support

# 设置src 和 res
LOCAL_SRC_FILES := $(call all-java-files-under, app/src/main/java)
LOCAL_RESOURCE_DIR := $(addprefix $(LOCAL_PATH)/, app/src/main/res) \
    $(support_library_root_dir)/v7/appcompat/res

# 指定Manifest文件
LOCAL_MANIFEST_FILE := app/src/main/AndroidManifest.xml

# 重复资源自动覆盖
LOCAL_AAPT_FLAGS += \
    --auto-add-overlay \
    --extra-packages android.support.v7.appcompat \
    --extra-packages android.support.constraint

# frameworks/support/ 下有v7 和 v4的源码
LOCAL_STATIC_JAVA_LIBRARIES := android-support-v7-appcompat android-support-v4
# constraint-layout需要的jar
LOCAL_STATIC_JAVA_LIBRARIES += constraint-layout-solver

# 依赖库，aar
LOCAL_STATIC_JAVA_AAR_LIBRARIES := constraint-layout

# Apk名称
LOCAL_PACKAGE_NAME := SetupWizard

# BUILD_PACKAGE 是一个预定义的宏，里面包含编译一个APK的脚本。
include $(BUILD_PACKAGE)

include $(CLEAR_VARS)

# 构建依赖的jar
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := constraint-layout-solver:app/src/main/lib/constraint-layout-solver-2.0.4.jar
# 构建依赖的aar
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += constraint-layout:app/src/main/lib/constraint-layout-2.0.4.aar

include $(BUILD_MULTI_PREBUILT)

include $(call all-makefiles-under,$(LOCAL_PATH))
