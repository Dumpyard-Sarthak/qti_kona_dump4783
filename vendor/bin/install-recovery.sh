#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:602f1314cb4c111c2eea643cc2d4805bf0eebfd1; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:9a209d4b527522179790d4a917111ab2b48ae8b4 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:602f1314cb4c111c2eea643cc2d4805bf0eebfd1 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
