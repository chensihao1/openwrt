include ./common-buffalo.mk
include ./common-nec.mk

define Device/buffalo_whr-g301n
  $(Device/buffalo_common)
  SOC := ar7240
  DEVICE_MODEL := WHR-G301N
  BUFFALO_PRODUCT := WHR-G301N
  IMAGE_SIZE := 3712k
  SUPPORTED_DEVICES += whr-g301n
  DEFAULT := n
endef
TARGET_DEVICES += buffalo_whr-g301n

define Device/dlink_dir-615-e4
  SOC := ar7240
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DIR-615
  DEVICE_VARIANT := E4
  IMAGE_SIZE := 3776k
  FACTORY_IMAGE_SIZE := 3456k
  IMAGES += factory.bin
  IMAGE/default := append-kernel | append-rootfs | pad-rootfs
  IMAGE/sysupgrade.bin := $$(IMAGE/default) | append-metadata | \
	check-size
  IMAGE/factory.bin := $$(IMAGE/default) | \
	check-size $$$$(FACTORY_IMAGE_SIZE) | pad-to $$$$(FACTORY_IMAGE_SIZE) | \
	append-string "AP99-AR7240-RT-091105-05"
  SUPPORTED_DEVICES += dir-615-e4
  DEFAULT := n
endef
TARGET_DEVICES += dlink_dir-615-e4

define Device/nec_wg300hp
  $(Device/nec-netbsd-aterm)
  SOC := ar9342
  DEVICE_MODEL := Aterm WG300HP
  IMAGE_SIZE := 3840k
endef
TARGET_DEVICES += nec_wg300hp

define Device/nec_wr8175n
  $(Device/nec-netbsd-aterm)
  SOC := ar9341
  DEVICE_MODEL := Aterm WR8175N
  IMAGE_SIZE := 3840k
endef
TARGET_DEVICES += nec_wr8175n

define Device/pqi_air-pen
  SOC := ar9330
  DEVICE_VENDOR := PQI
  DEVICE_MODEL := Air-Pen
  DEVICE_PACKAGES := kmod-usb2
  IMAGE_SIZE := 7680k
  SUPPORTED_DEVICES += pqi-air-pen
endef
TARGET_DEVICES += pqi_air-pen
