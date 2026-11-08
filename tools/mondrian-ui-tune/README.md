# Mondrian UI defaults (2026-11-08)

Image contains the UFS-only ADIOS registration default. Other queues retain the
existing selection. Vendor init can override it. ADIOS is not guaranteed faster;
compare launch latency, frame pacing, temperature and battery on the phone.

CONFIG_SCHED_WALT=m: in-tree defaults do not replace vendor walt.ko in an
Image-only AnyKernel installation (do.modules=0). The companion KernelSU module
is required for the input boost and top-app cgroup defaults. It waits for boot
completion +20 s and applies six passes 10 s apart, logging actual values and
failures in /data/adb/modules/mondrian_ui_tune/ui-tune.log. It does not replace
vendor .ko files or change SELinux/permissions. Persistent policy denial or
later PowerHAL overrides are not bypassed and require phone-side diagnosis.

Targets: input frequencies 1228800 0 0 0 1555200 0 0 1651200 kHz, 120 ms,
sched_boost_on_input=1, top-app cpu.uclamp.min=10 (percentage on this cgroup
interface; not a fixed CPU-frequency or performance guarantee).

I/O statistics and entropy settings are deliberately unchanged for diagnostics.
Only input boost was explicitly confirmed beneficial by the user; uclamp and
ADIOS remain experimental. Do not flash any generated DTBO.

Install the separately packaged module through KernelSU, then reboot. Disable
or remove it and reboot to restore Android defaults. To revert the kernel,
flash the known-good 26.11.08 zip. Disabling the module alone does not undo the
kernel ADIOS default; flashing the old kernel alone does not disable the module.
