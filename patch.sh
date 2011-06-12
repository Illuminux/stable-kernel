#!/bin/bash
# Split out, so build_kernel.sh and build_deb.sh can share..

echo "Starting patch.sh"

function bugs_trivial {
echo "bugs and trivial stuff"

patch -s -p1 < "${DIR}/patches/trivial/0001-staging-add-airlink-awll7025-id-for-rt2860.patch"

#Bisected from 2.6.35 -> 2.6.36 to find this..
#This commit breaks some lcd monitors..
#rcn-ee Feb 26, 2011...
#Still needs more work for 2.6.38, causes:
#[   14.962829] omapdss DISPC error: GFX_FIFO_UNDERFLOW, disabling GFX
patch -s -p1 < "${DIR}/patches/trivial/0001-Revert-OMAP-DSS2-OMAPFB-swap-front-and-back-porches-.patch"

patch -s -p1 < "${DIR}/patches/trivial/0001-kbuild-deb-pkg-set-host-machine-after-dpkg-gencontro.patch"
}

function dss2_next {
echo "dss2 from for-next"

patch -s -p1 < "${DIR}/patches/dss2_next/0001-OMAP4-DSS2-Register-configuration-changes-for-DSI.patch"

}

function dspbridge_next {
echo "dspbridge from for-next"

}

function omap_fixes {
echo "omap fixes"

}

function for_next_40 {
echo "for_next from tmlind's tree.."
#patch -s -p1 < "${DIR}/patches/for_next_40/0003-OMAP3-voltage-remove-spurious-pr_notice-for-debugfs.patch"
#patch -s -p1 < "${DIR}/patches/for_next_40/0004-OMAP4-PM-remove-redundant-ifdef-CONFIG_PM.patch"
#patch -s -p1 < "${DIR}/patches/for_next_40/0005-OMAP3-smartreflex-fix-sr_late_init-error-path-in-pro.patch"
#patch -s -p1 < "${DIR}/patches/for_next_40/0006-OMAP3-smartreflex-request-the-memory-region.patch"
#patch -s -p1 < "${DIR}/patches/for_next_40/0007-OMAP3-smartreflex-fix-ioremap-leak-on-probe-error.patch"
#patch -s -p1 < "${DIR}/patches/for_next_40/0008-OMAP3-smartreflex-delete-instance-from-sr_list-on-pr.patch"
#patch -s -p1 < "${DIR}/patches/for_next_40/0009-OMAP3-smartreflex-delete-debugfs-entries-on-probe-er.patch"
patch -s -p1 < "${DIR}/patches/for_next_40/0013-omap-gpmc-smsc911x-always-set-irq-flags-to-IORESOURC.patch"
patch -s -p1 < "${DIR}/patches/for_next_40/0014-omap-convert-boards-that-use-SMSC911x-to-use-gpmc-sm.patch"
patch -s -p1 < "${DIR}/patches/for_next_40/0015-OMAP3-4-l3-fix-omap3_l3_probe-error-path.patch"
patch -s -p1 < "${DIR}/patches/for_next_40/0016-OMAP3-4-l3-minor-cleanup-for-parenthesis-and-extra-s.patch"
}


function wip_to_be_pushed_git  {
echo "wip patches for mainline"

git_add
git am "${DIR}/patches/wip_to_be_pushed/0001-omap3-beagle-convert-printk-KERN_INFO-to-pr_info.patch"
git am "${DIR}/patches/wip_to_be_pushed/0002-omap3-beagle-convert-printk-KERN_ERR-to-pr_err.patch"
git am "${DIR}/patches/wip_to_be_pushed/0003-omap3-beagle-detect-new-xM-revision-B.patch"
git am "${DIR}/patches/wip_to_be_pushed/0004-omap3-beagle-detect-new-xM-revision-C.patch"
git am "${DIR}/patches/wip_to_be_pushed/0005-omap3-beagle-if-rev-unknown-assume-xM-revision-C.patch"
git am "${DIR}/patches/wip_to_be_pushed/0006-omap3-beagle-add-i2c-bus2.patch"
git am "${DIR}/patches/wip_to_be_pushed/0007-omap3-beagle-add-initial-expansionboard-infrastructu.patch"
git am "${DIR}/patches/wip_to_be_pushed/0008-omap3-beagle-expansionboard-zippy.patch"
git am "${DIR}/patches/wip_to_be_pushed/0009-omap3-beagle-expansionboard-zippy2.patch"

}

function wip_to_be_pushed  {
echo "wip patches for mainline"

patch -s -p1 < "${DIR}/patches/wip_to_be_pushed/0001-omap3-beagle-convert-printk-KERN_INFO-to-pr_info.patch"
patch -s -p1 < "${DIR}/patches/wip_to_be_pushed/0002-omap3-beagle-convert-printk-KERN_ERR-to-pr_err.patch"
patch -s -p1 < "${DIR}/patches/wip_to_be_pushed/0003-omap3-beagle-detect-new-xM-revision-B.patch"
patch -s -p1 < "${DIR}/patches/wip_to_be_pushed/0004-omap3-beagle-detect-new-xM-revision-C.patch"
patch -s -p1 < "${DIR}/patches/wip_to_be_pushed/0005-omap3-beagle-if-rev-unknown-assume-xM-revision-C.patch"
patch -s -p1 < "${DIR}/patches/wip_to_be_pushed/0006-omap3-beagle-add-i2c-bus2.patch"
patch -s -p1 < "${DIR}/patches/wip_to_be_pushed/0007-omap3-beagle-add-initial-expansionboard-infrastructu.patch"
patch -s -p1 < "${DIR}/patches/wip_to_be_pushed/0008-omap3-beagle-expansionboard-zippy.patch"
patch -s -p1 < "${DIR}/patches/wip_to_be_pushed/0009-omap3-beagle-expansionboard-zippy2.patch"

}

function sakoman {
echo "sakoman's patches"

patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0001-OMAP-DSS2-DSI-fix-use_sys_clk-highfreq.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0002-OMAP-DSS2-DSI-fix-dsi_dump_clocks.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0003-OMAP2PLUS-DSS2-Fix-Return-correct-lcd-clock-source-f.patch"

patch -s -p1 < "${DIR}/patches/sakoman/2.6.40/0004-OMAP-DSS-DSI-Fix-DSI-PLL-power-bug.patch"

patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0005-OMAP-DSS2-fix-panel-Kconfig-dependencies.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0006-OMAP-DSS2-add-bootarg-for-selecting-svideo-or-compos.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0007-video-add-timings-for-hd720.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0008-drivers-net-smsc911x-return-ENODEV-if-device-is-not-.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0009-drivers-input-touchscreen-ads7846-return-ENODEV-if-d.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0010-Revert-omap2_mcspi-Flush-posted-writes.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0011-Revert-omap_hsmmc-improve-interrupt-synchronisation.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0012-Don-t-turn-SDIO-cards-off-to-save-power.-Doing-so-wi.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0013-Enable-the-use-of-SDIO-card-interrupts.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0014-soc-codecs-Enable-audio-capture-by-default-for-twl40.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0015-soc-codecs-twl4030-Turn-on-mic-bias-by-default.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0016-RTC-add-support-for-backup-battery-recharge.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0017-ARM-OMAP2-mmc-twl4030-move-clock-input-selection-pri.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0018-Add-power-off-support-for-the-TWL4030-companion.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0019-ARM-OMAP-Add-twl4030-madc-support-to-Beagle.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0020-ARM-OMAP-Add-twl4030-madc-support-to-Overo.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0021-Enabling-Hwmon-driver-for-twl4030-madc.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0022-mfd-twl-core-enable-madc-clock.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0023-rtc-twl-Switch-to-using-threaded-irq.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0024-ARM-OMAP-automatically-set-musb-mode-in-platform-dat.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0025-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0026-omap-Fix-mtd-subpage-read-alignment.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0027-mtd-nand-omap2-Force-all-buffer-reads-to-u32-alignme.patch"

#fixed in 2.6.39.1
#patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0028-omap-nand-fix-subpage-ecc-issue-with-prefetch.patch"

patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0029-OMAP-Overo-Add-support-for-spidev.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0030-unionfs-Add-support-for-unionfs-2.5.9.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0031-OMAP3-beagle-add-support-for-beagleboard-xM-revision.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0032-OMAP3-beagle-add-support-for-expansionboards.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0033-omap-Change-omap_device-activate-dectivate-latency-m.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0034-omap-Add-omap3_defconfig.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0035-omap-overo-Add-opp-init.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0036-OMAP3-voltage-remove-spurious-pr_notice-for-debugfs.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0037-OMAP4-PM-remove-redundant-ifdef-CONFIG_PM.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0038-OMAP3-smartreflex-fix-sr_late_init-error-path-in-pro.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0039-OMAP3-smartreflex-request-the-memory-region.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0040-OMAP3-smartreflex-fix-ioremap-leak-on-probe-error.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0041-OMAP3-smartreflex-delete-instance-from-sr_list-on-pr.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0042-OMAP3-smartreflex-delete-debugfs-entries-on-probe-er.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0043-OMAP3-cpuidle-remove-useless-SDP-specific-timings.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0044-OMAP3-SR-make-notify-independent-of-class.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0045-OMAP3-SR-disable-interrupt-by-default.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0046-OMAP3-SR-enable-disable-SR-only-on-need.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0047-OMAP3-SR-fix-cosmetic-indentation.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0048-OMAP-CPUfreq-ensure-driver-initializes-after-cpufreq.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0049-OMAP-CPUfreq-ensure-policy-is-fully-initialized.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0050-OMAP3-PM-CPUFreq-driver-for-OMAP3.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0051-OMAP-PM-CPUFREQ-Fix-conditional-compilation.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0052-cpufreq-fixup-after-new-OPP-layer-merged.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0053-OMAP-cpufreq-Split-OMAP1-and-OMAP2PLUS-CPUfreq-drive.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0054-OMAP2PLUS-cpufreq-Add-SMP-support-to-cater-OMAP4430.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0055-OMAP2PLUS-cpufreq-Fix-typo-when-attempting-to-set-mp.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0056-cpufreq-helpers-for-walking-the-frequency-table.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0057-cpufreq-introduce-hotplug-governor.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0058-OMAP2-cpufreq-free-up-table-on-exit.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0059-OMAP2-cpufreq-handle-invalid-cpufreq-table.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0060-OMAP2-cpufreq-minor-comment-cleanup.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0061-OMAP2-cpufreq-use-clk_init_cpufreq_table-if-OPPs-not.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0062-OMAP2-cpufreq-use-cpufreq_frequency_table_target.patch"
patch -s -p1 < "${DIR}/patches/sakoman/2.6.39/0063-OMAP2-cpufreq-fix-freq_table-leak.patch"

}

function musb {
echo "musb patches"
patch -s -p1 < "${DIR}/patches/musb/0001-default-to-fifo-mode-5-for-old-musb-beagles.patch"
}

function micrel {
echo "micrel patches"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/01_eeprom_93cx6_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/02_eeprom_93cx6_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/03_ksz8851_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.38/04_ksz8851_2.6.38.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/06_ksz8851_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/07_ksz8851_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/08_ksz8851_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/09_ksz8851_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/10_ksz8851_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/11_ksz8851_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/12_ksz8851_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/15_ksz8851_2.6.35.patch"
patch -s -p1 < "${DIR}/patches/micrel/linux-2.6.35/18_ksz8851_2.6.35.patch"

}

function beagle {
echo "beagle patches"
patch -s -p1 < "${DIR}/patches/arago-project/0001-omap3-Increase-limit-on-bootarg-mpurate.patch"
#patch -s -p1 < "${DIR}/patches/beagle/0001-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch"
patch -s -p1 < "${DIR}/patches/beagle/0001-omap3-alsa-soc-Remove-restrictive-checks-for-cpu-typ.patch"
patch -s -p1 < "${DIR}/patches/display/0001-meego-modedb-add-Toshiba-LTA070B220F-800x480-support.patch"
#patch -s -p1 < "${DIR}/patches/beagle/0001-omap3-beaglexm-fix-user-button.patch"

}

function igepv2 {
echo "igepv2 board related patches"
}

function devkit8000 {
echo "devkit8000"
patch -s -p1 < "${DIR}/patches/devkit8000/0001-arm-omap-devkit8000-for-lcd-use-samsung_lte_panel-2.6.37-git10.patch"
}

function touchbook {
echo "touchbook patches"
patch -s -p1 < "${DIR}/patches/touchbook/0001-omap3-touchbook-remove-mmc-gpio_wp.patch"
patch -s -p1 < "${DIR}/patches/touchbook/0002-omap3-touchbook-drop-u-boot-readonly.patch"
}

function omap4 {
echo "omap4 related patches"
patch -s -p1 < "${DIR}/patches/panda/0001-OMAP4-DSS2-add-dss_dss_clk.patch"
patch -s -p1 < "${DIR}/patches/panda/0001-panda-twl6040-Add-twl6040-codec-data-to-SDP4430.patch"
patch -s -p1 < "${DIR}/patches/panda/0001-alsa-twl6040-panda-add-ramp-data-for-panda.patch"
}

function sgx {
echo "merge in ti sgx modules"
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-Merge-TI-3.01.00.02-Kernel-Modules.patch"
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-enable-driver-building.patch"

#3.01.00.06
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-Merge-TI-3.01.00.06-into-TI-3.01.00.02.patch"

#3.01.00.07 'the first wget-able release!!'
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-Merge-TI-3.01.00.07-into-TI-3.01.00.06.patch"

#4.00.00.01 adds ti8168 support, drops bc_cat.c patch
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-Merge-TI-4.00.00.01-into-TI-3.01.00.07.patch"

#4.03.00.01
#Note: git am has problems with this patch...
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-Merge-TI-4.03.00.01-into-TI-4.00.00.01.patch"

#4.03.00.02 (main *.bin drops omap4)
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-Merge-TI-4.03.00.02-into-TI-4.03.00.01.patch"

#4.03.00.02
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-2.6.32-PSP.patch"

#4.03.00.02 + 2.6.38-merge (2.6.37-git5)
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-2.6.38-merge-AUTOCONF_INCLUD.patch"

#4.03.00.02 + 2.6.38-rc3
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-2.6.38-rc3-_console_sem-to-c.patch"

#4.03.00.01
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.01-add-outer_cache.clean_all.patch"

#4.03.00.02
#omap3 doesn't work on omap3630
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-use-omap3630-as-TI_PLATFORM.patch"

#4.03.00.02 + 2.6.39 (2.6.38-git2)
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-2.6.39-rc-SPIN_LOCK_UNLOCKED.patch"

}

bugs_trivial

#for_next tree's
dss2_next
#omap_fixes
#dspbridge_next
for_next_40

#work in progress
#wip_to_be_pushed_git
#wip_to_be_pushed

#external tree's
sakoman
musb
micrel

#random board patches
beagle
igepv2
devkit8000
touchbook

omap4

#no chance of being pushed ever tree's
sgx

echo "patch.sh ran successful"

