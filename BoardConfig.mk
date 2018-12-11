# Copyright 2013 The Android Open Source Project
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

include device/sony/c2105/PlatformConfig.mk

# the two variables below have impact on loading .so from /system/lib/hw/
# see hardware/libhardware/modules/README.android
# and first one has impact on the fast boot flashing process so it is removed
#TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Platform
PRODUCT_PLATFORM := c2105

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := true
TARGET_NO_KERNEL := false

# the androidboot.hardware has impact on loading .rc files
BOARD_KERNEL_CMDLINE := androidboot.hardware=sony user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2

TARGET_USERIMAGES_USE_EXT4 := true

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
#Reserve space for data encryption (1711292416-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1711276032

# GL
TARGET_USES_C2D_COMPOSITION := true
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/sony/c2105/egl.cfg
ENABLE_WEBGL := true

# audio is enabled
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
USE_PROPRIETARY_AUDIO_EXTENSIONS := false

# video is enabled
TARGET_USES_ION := true

# camera is enabled
USE_CAMERA_STUB := false

# wlan is enabled
WIFI_DRIVER_MODULE_ARG := ""
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"

# bluetooth is not enabled yet
#BOARD_HAVE_BLUETOOTH := true
ifeq ($(BOARD_HAVE_BLUETOOTH), true)
    BOARD_HAVE_BLUETOOTH_BLUEZ := true
    ifneq ($(BOARD_HAVE_BLUETOOTH_BLUEZ), true)
        BOARD_HAVE_BLUETOOTH_QCOM := true
        BLUETOOTH_HCI_USE_MCT := true
    endif
    BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
    BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
endif

# gps is not enabled yet
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
#TARGET_NO_RPC := true

