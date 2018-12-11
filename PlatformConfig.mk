# Copyright 2014 The Android Open Source Project
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

# Platform path
PLATFORM_COMMON_PATH := device/sony/c2105
PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := msm8960
KERNEL_PATH := kernel/sony/msm-4.9

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET :=
BOARD_RAMDISK_OFFSET     := 0x02000000


# Serial console
BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8

TARGET_NO_RECOVERY := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000


# Wi-Fi definitions for Qualcomm solution
BOARD_HAS_QCOM_WLAN := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X

WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_STA := "sta"

# RIL
TARGET_PER_MGR_ENABLED := true

# Cache partititon
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4


TARGET_COPY_OUT_VENDOR := system/vendor

include device/sony/common/CommonConfig.mk
