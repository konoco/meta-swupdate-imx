FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

FILES:${PN} += "/etc/*"

SRC_URI += " file://0001-imx95-enable-env_redunand-bootcount-limit-lf-6.12.34-2.1.0.patch \
             file://0002-imx95-default-env-lf-6.12.34-2.1.0.patch"

SWU_HW_REV ?= "1.0"

do_install:append:mx95-nxp-bsp () {

    echo "/dev/mmcblk0 0x700000 0x4000" > ${D}/${sysconfdir}/fw_env.config
    echo "/dev/mmcblk0 0x704000 0x4000" >> ${D}/${sysconfdir}/fw_env.config
    echo "${MACHINE} ${SWU_HW_REV}" > ${D}/${sysconfdir}/hwrevision
    install -D -m 644  ${D}/${sysconfdir}/fw_env.config  ${DEPLOYDIR}
    install -D -m 644  ${D}/${sysconfdir}/hwrevision  ${DEPLOYDIR}

}