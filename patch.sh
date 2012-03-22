#!/bin/bash
#
# Copyright (c) 2009-2012 Robert Nelson <robertcnelson@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Split out, so build_kernel.sh and build_deb.sh can share..

# DIR=`pwd`

echo "Starting patch.sh"

function git_add {
git add .
git commit -a -m 'testing patchset'
}

function bugs_trivial {
	echo "bugs and trivial stuff"
	git am "${DIR}/patches/trivial/0001-kbuild-deb-pkg-set-host-machine-after-dpkg-gencontro.patch"
}

function micrel {
	echo "Micrel KZ8851 patches for: zippy2"
	#originaly from:
	#ftp://www.micrel.com/ethernet/8851/beagle_zippy_patches.tar.gz 137 KB 04/10/2010 12:26:00 AM

	git am "${DIR}/patches/micrel/0001-ks8851.h-it-helps-to-include-the-include-file.patch"
	git am "${DIR}/patches/micrel/0002-ksz8851-move-to-header.patch"
	git am "${DIR}/patches/micrel/0003-ksz8851-move-more-to-header.patch"
	git am "${DIR}/patches/micrel/0004-ksz8851-share-ks8851_tx_hdr-union.patch"
	git am "${DIR}/patches/micrel/0005-ksz8851-add-is_level_irq.patch"
	git am "${DIR}/patches/micrel/0006-ksz8851-turn-off-hardware-interrupt-druing-receive-p.patch"
	git am "${DIR}/patches/micrel/0007-ksz8851-add-ks8851_tx_check.patch"
}

function beagle {
	echo "Board Patches for: BeagleBoard"

	git am "${DIR}/patches/beagle/expansion/0001-expansion-add-buddy-param-for-expansionboard-names.patch"
	git am "${DIR}/patches/beagle/expansion/0002-expansion-add-mmc-regulator-and-ds1307-rtc.patch"
	git am "${DIR}/patches/beagle/expansion/0003-expansion-add-zippy.patch"
	git am "${DIR}/patches/beagle/expansion/0004-expansion-add-zippy2.patch"
	git am "${DIR}/patches/beagle/expansion/0005-expansion-add-trainer.patch"
	git am "${DIR}/patches/beagle/expansion/0006-expansion-add-ulcd.patch"

	git am "${DIR}/patches/beagle/0001-beagleboard-reinstate-usage-of-hi-speed-PLL-divider.patch"
	git am "${DIR}/patches/beagle/0001-Turn-on-the-USB-regulator-on-Beagle-xM-explicitly-wh.patch"
	git am "${DIR}/patches/beagle/0001-ARM-OMAP3-clock-data-fill-in-some-missing-clockdomai.patch"
	git am "${DIR}/patches/beagle/0001-ARM-OMAP3-USB-Fix-the-EHCI-ULPI-PHY-reset-issue.patch"
	git am "${DIR}/patches/beagle/0001-omap3_beagle-init-uart2-for-beagle-rev-AX-BX-only.patch"

	git am "${DIR}/patches/beagle/0001-meego-modedb-add-Toshiba-LTA070B220F-800x480-support.patch"
	git am "${DIR}/patches/beagle/0001-default-to-fifo-mode-5-for-old-musb-beagles.patch"

	git am "${DIR}/patches/omap/0001-omap3-Increase-limit-on-bootarg-mpurate.patch"

	git am "${DIR}/patches/beagle/0001-ASoC-omap-add-MODULE_ALIAS-to-mcbsp-and-pcm-drivers.patch"
	git am "${DIR}/patches/beagle/0001-ASoC-omap-convert-per-board-modules-to-platform-driv.patch"

	git am "${DIR}/patches/sakoman/2.6.39/0006-OMAP-DSS2-add-bootarg-for-selecting-svideo-or-compos.patch"
	git am "${DIR}/patches/sakoman/2.6.39/0007-video-add-timings-for-hd720.patch"
	git am "${DIR}/patches/sakoman/2.6.39/0025-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch"
}

function devkit8000 {
	echo "Board Patches for: devkit8000"
	git am "${DIR}/patches/devkit8000/0001-arm-omap-devkit8000-for-lcd-use-samsung_lte_panel-2.6.37-git10.patch"
}

function touchbook {
	echo "Board Patches for: Touchbook"
	git am "${DIR}/patches/touchbook/0001-omap3-touchbook-remove-mmc-gpio_wp.patch"
	git am "${DIR}/patches/touchbook/0002-omap3-touchbook-drop-u-boot-readonly.patch"
}

function pandaboard {
	echo "Board Patches for: PandaBoard"
	git am "${DIR}/patches/panda/0001-panda-fix-wl12xx-regulator.patch"
	git am "${DIR}/patches/panda/0001-panda-enable-bluetooth.patch"
}

function omapdrm {
	echo "omap testing omapdrm/kms"

	echo "Patches for cma-v22"
	git am "${DIR}/patches/drm/cma/0001-mm-page_alloc-remove-trailing-whitespace.patch"
	git am "${DIR}/patches/drm/cma/0002-mm-compaction-introduce-isolate_migratepages_range.patch"
	git am "${DIR}/patches/drm/cma/0003-mm-compaction-introduce-map_pages.patch"
	git am "${DIR}/patches/drm/cma/0004-mm-compaction-introduce-isolate_freepages_range.patch"
	git am "${DIR}/patches/drm/cma/0005-mm-compaction-export-some-of-the-functions.patch"
	git am "${DIR}/patches/drm/cma/0006-mm-page_alloc-introduce-alloc_contig_range.patch"
	git am "${DIR}/patches/drm/cma/0007-mm-page_alloc-change-fallbacks-array-handling.patch"
	git am "${DIR}/patches/drm/cma/0008-mm-mmzone-MIGRATE_CMA-migration-type-added.patch"
	git am "${DIR}/patches/drm/cma/0009-mm-page_isolation-MIGRATE_CMA-isolation-functions-ad.patch"
	git am "${DIR}/patches/drm/cma/0010-mm-Serialize-access-to-min_free_kbytes.patch"
	git am "${DIR}/patches/drm/cma/0011-mm-extract-reclaim-code-from-__alloc_pages_direct_re.patch"
	git am "${DIR}/patches/drm/cma/0012-mm-trigger-page-reclaim-in-alloc_contig_range-to-sta.patch"
	git am "${DIR}/patches/drm/cma/0013-drivers-add-Contiguous-Memory-Allocator.patch"
	git am "${DIR}/patches/drm/cma/0014-X86-integrate-CMA-with-DMA-mapping-subsystem.patch"
	git am "${DIR}/patches/drm/cma/0015-ARM-integrate-CMA-with-DMA-mapping-subsystem.patch"

	echo "Patches for cma-v23"
	git am "${DIR}/patches/drm/cma/0001-cma-23-mm-compaction-export-some-of-the-functions.patch"
	git am "${DIR}/patches/drm/cma/0002-cma-23-drivers-add-Contiguous-Memory-Allocator.patch"

	echo "omapdrm driver patches for 3.4"
	git am "${DIR}/patches/drm/0001-staging-drm-omap-get-supported-color-formats-from-ov.patch"
	git am "${DIR}/patches/drm/0002-staging-drm-omap-add-a-workqueue.patch"
	git am "${DIR}/patches/drm/0003-staging-drm-omap-call-omap_gem_roll-in-non-atomic-ct.patch"
	git am "${DIR}/patches/drm/0004-staging-drm-omap-some-minor-fb-cleanups.patch"
	git am "${DIR}/patches/drm/0005-staging-drm-omap-defer-unpin-until-scanout-completes.patch"
	git am "${DIR}/patches/drm/0006-staging-drm-omap-debugfs-for-object-and-fb-tracking.patch"
	git am "${DIR}/patches/drm/0007-staging-drm-omap-Disable-DMM-debugfs-for-OMAP3.patch"
	git am "${DIR}/patches/drm/0008-staging-drm-omap-Validate-debugfs-device.patch"
	git am "${DIR}/patches/drm/0009-staging-drm-omap-Get-DMM-resources-from-hwmod.patch"
	git am "${DIR}/patches/drm/0010-staging-drm-omap-mmap-of-tiled-buffers-with-stride-4.patch"

	#posted: 11 Mar 2012 19:12:01 for 3.4
	git am "${DIR}/patches/drm/0001-staging-drm-omap-avoid-multiple-planes-having-same-z.patch"
	git am "${DIR}/patches/drm/0002-staging-drm-omap-send-page-flip-event-after-endwin.patch"
	git am "${DIR}/patches/drm/0003-staging-drm-omap-use-current-time-for-page-flip-even.patch"

	#posted: 13 Mar 2012 for 3.4
	git am "${DIR}/patches/drm/0001-omap2-add-drm-device.patch"

	#might be merged in 3.4
	git am "${DIR}/patches/drm/0001-ARM-OMAP2-3-HWMOD-Add-missing-flags-for-dispc-class.patch"
	git am "${DIR}/patches/drm/0002-ARM-OMAP2-3-HWMOD-Add-missing-flag-for-rfbi-class.patch"
	git am "${DIR}/patches/drm/0003-ARM-OMAP3-HWMOD-Add-omap_hwmod_class_sysconfig-for-d.patch"
}

function fixes {
	echo "omap cherry pick fixes"
	#3/22/2012: replaces: 0001-OMAP-UART-Enable-tx-wakeup-bit-in-wer.patch
	git am "${DIR}/patches/omap/0001-OMAP2-UART-Remove-cpu-checks-for-populating-errata-f.patch"
	git am "${DIR}/patches/omap/0002-OMAP2-UART-enable-tx-wakeup-bit-for-wer-reg.patch"
	git am "${DIR}/patches/omap/0003-OMAP2-UART-replace-omap34xx-omap4xx-cpu-checks-with-.patch"

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

#4.03.00.02 + 2.6.40 (2.6.39-git11)
patch -s -p1 < "${DIR}/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-2.6.40-display.h-to-omapdss..patch"

#with v3.0-git16
#drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:324:15: error: ‘OMAP_DSS_UPDATE_AUTO’ undeclared (first use in this function)
#drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:327:15: error: ‘OMAP_DSS_UPDATE_MANUAL’ undeclared (first use in this function)
#drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:330:15: error: ‘OMAP_DSS_UPDATE_DISABLED’ undeclared (first use in this function)
#drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:337:16: error: ‘struct omap_dss_driver’ has no member named ‘set_update_mode’
#drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:312:28: warning: unused variable ‘eDSSMode’
#make[4]: *** [drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.o] Error 1
#make[3]: *** [drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux] Error 2
#make[2]: *** [drivers/staging/omap3-sgx] Error 2
#for <3.2
#patch -s -p1 < "${DIR}/patches/sgx/0001-Revert-OMAP-DSS2-remove-update_mode-from-omapdss.patch"
#for >3.2
patch -s -p1 < "${DIR}/patches/sgx/0001-Revert-OMAP-DSS2-remove-update_mode-from-omapdss-v3.2.patch"

}

bugs_trivial

micrel
beagle
devkit8000
touchbook
pandaboard

omapdrm
fixes

#no chance of being pushed ever tree's
#sgx

echo "patch.sh ran successful"

