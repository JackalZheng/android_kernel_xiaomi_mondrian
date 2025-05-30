ifeq ($(CONFIG_BOARD_MONDRIAN),y)
dtbo-$(CONFIG_BOARD_MONDRIAN) += \
                mondrian-sm8475-pm8008-overlay.dtbo
mondrian-sm8475-pm8008-overlay.dtbo-base := cape.dtb cape-v2.dtb capep.dtb
endif


ifeq ($(CONFIG_BUILD_ARM64_DT_OVERLAY),y)
dtbo-$(CONFIG_ARCH_CAPE) += cape-mtp-pm8008-overlay.dtbo \
	mondrian-sm8475-pm8008-overlay.dtbo \
	marble-sm7475-pm8008-overlay.dtbo

mondrian-sm8475-pm8008-overlay.dtbo-base := cape.dtb cape-v2.dtb capep.dtb
marble-sm7475-pm8008-overlay.dtbo-base := ukee.dtb

else
dtb-$(CONFIG_ARCH_CAPE) += cape-mtp-pm8008.dtb \
	cape-mtp-120fps-pm8008.dtb \
	cape-mtp-nodisplay-pm8008.dtb \
        cape-cdp-pm8008.dtb \
        cape-cdp-qhd-pm8008.dtb \
        cape-atp-pm8008.dtb \
        cape-qrd-pm8008.dtb \
        cape-v2-mtp-pm8008.dtb \
        cape-v2-cdp-pm8008.dtb \
        cape-v2-atp-pm8008.dtb \
        cape-v2-qrd-pm8008.dtb \
	capep-mtp-pm8008.dtb \
	capep-cdp-pm8008.dtb \
	capep-atp-pm8008.dtb \
        cape-mtp-pm8010.dtb \
        cape-mtp-120fps-pm8010.dtb \
	cape-mtp-nodisplay-pm8010.dtb \
        cape-cdp-pm8010.dtb \
        cape-cdp-qhd-pm8010.dtb \
        cape-atp-pm8010.dtb \
        cape-qrd-pm8010.dtb \
        cape-v2-mtp-pm8010.dtb \
        cape-v2-cdp-pm8010.dtb \
        cape-v2-atp-pm8010.dtb \
        cape-v2-qrd-pm8010.dtb \
	capep-mtp-pm8010.dtb \
	capep-cdp-pm8010.dtb \
	capep-atp-pm8010.dtb \
	ukee-atp-pm8008.dtb \
	ukee-atp-pm8010.dtb \
	ukee-cdp-pm8008.dtb \
	ukee-cdp-pm8010.dtb \
	ukee-cdp-qhd-pm8008.dtb \
	ukee-cdp-qhd-pm8010.dtb \
	ukee-mtp-pm8008.dtb \
	ukee-mtp-pm8010.dtb \
	ukee-mtp-120fps-pm8008.dtb \
	ukee-mtp-120fps-pm8010.dtb \
	ukee-mtp-nodisplay-pm8008.dtb \
	ukee-mtp-nodisplay-pm8010.dtb \
	ukee-qrd-pm8008.dtb \
	ukee-qrd-pm8010.dtb

endif

always-y	:= $(dtb-y)
subdir-y	:= $(dts-dirs)
clean-files	:= *.dtb *.dtbo
