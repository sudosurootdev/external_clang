LOCAL_PATH:= $(call my-dir)

# For the host only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libclangFrontendTool

LOCAL_MODULE_TAGS := optional

TBLGEN_TABLES := \
  DiagnosticCommonKinds.inc \
  DiagnosticFrontendKinds.inc \
  CC1Options.inc

clang_frontend_tool_SRC_FILES := \
  ExecuteCompilerInvocation.cpp

LOCAL_CFLAGS += -DCLANG_ENABLE_STATIC_ANALYZER
LOCAL_CFLAGS += -DCLANG_ENABLE_REWRITER

LOCAL_SRC_FILES := $(clang_frontend_tool_SRC_FILES)
LOCAL_CFLAGS := -fno-strict-aliasing $(call-cc-cpp-option,-Qunused-arguments)

include $(CLANG_HOST_BUILD_MK)
include $(CLANG_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
