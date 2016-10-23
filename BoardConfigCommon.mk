# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_HARDWARE_CLASS := device/htc/msm7x30-common/cmhw

TARGET_SPECIFIC_HEADER_PATH := device/htc/msm7x30-common/include

# General
TARGET_BOARD_PLATFORM := msm7x30
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := scorpion
TARGET_CPU_SMP := false
TARGET_USES_QCOM_BSP := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_USES_QCOM_HARDWARE := true
USE_CLANG_PLATFORM_BUILD := true

# No bootloader image with ROM
TARGET_NO_BOOTLOADER := true

# Build EXT4 and F2FS tools
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Audio
BOARD_HAVE_HTC_AUDIO := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true # Check later
BOARD_USES_LEGACY_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := false

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Display
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_ION := true
BOARD_USES_PMEM_ADSP := true
TARGET_USES_C2D_COMPOSITION := true
USE_OPENGL_RENDERER := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
USE_DEVICE_SPECIFIC_GPS := true

# Media
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DNO_UPDATE_PREVIEW
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Misc
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_PROVIDES_LIBLIGHT := true
BLOCK_BASED_OTA := false
TARGET_NEEDS_NON_PIE_SUPPORT := true
TARGET_DISABLE_ARM_PIE := true
BOARD_PROVIDES_LIBRIL := true
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true

# Use dlmalloc instead of jemalloc because it's
# supposedly better in single-threaded applications
# http://blog.poweredbytoast.com/memory-allocators
MALLOC_IMPL := dlmalloc

# This file is for bcmdhd wifi since so many HTC 8660 devices use it
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_BAND                        := 802_11_ABG
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# rmt_storage
BOARD_USES_LEGACY_MMAP := true

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm7x30

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += device/htc/msm7x30-common

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
ifeq ($(WITH_DEXPREOPT),)
	WITH_DEXPREOPT := true
endif
endif
