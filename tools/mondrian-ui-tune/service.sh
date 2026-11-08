#!/system/bin/sh
MODDIR=${0%/*}
LOG="$MODDIR/ui-tune.log"
exec >"$LOG" 2>&1
echo "Mondrian UI Tune: $(date)"
# No mounts, vendor writes, SELinux policy changes or permanent daemon.
i=0
while [ "$(getprop sys.boot_completed)" != 1 ]; do
  sleep 2
  i=$((i + 1))
  [ "$i" -lt 300 ] || { echo "boot timeout; skipped"; exit 0; }
done
sleep 20
put() {
  node=$1
  value=$2
  [ -e "$node" ] || { echo "missing $node"; return; }
  echo "before $node=$(cat "$node")"
  if printf '%s\n' "$value" > "$node"; then
    echo "after $node=$(cat "$node")"
  else
    echo "write failed: $node (not bypassing policy)"
  fi
}
# Retry for only one minute, to cover late init/PowerHAL. No endless tug-of-war.
i=0
while [ "$i" -lt 6 ]; do
  echo "pass=$i $(date)"
  put /proc/sys/walt/input_boost/input_boost_freq "1228800 0 0 0 1555200 0 0 1651200"
  put /proc/sys/walt/input_boost/input_boost_ms 120
  put /proc/sys/walt/input_boost/sched_boost_on_input 1
  put /dev/cpuctl/top-app/cpu.uclamp.min 10
  for q in /sys/block/sd*/queue; do
    dev=$(readlink -f "$q/../device")
    case "$dev" in
      *ufs*)
        node="$q/scheduler"
        available=$(cat "$node" 2>/dev/null)
        case " $available " in
          *"[adios]"*) echo "already ADIOS: $node" ;;
          *" adios "*) put "$node" adios ;;
          *) echo "ADIOS unavailable: $node=$available" ;;
        esac ;;
      *) echo "not identified as UFS; skip $q ($dev)" ;;
    esac
  done
  i=$((i + 1))
  [ "$i" -ge 6 ] || sleep 10
done
echo "Completed; check these values again during use for later PowerHAL overrides."
