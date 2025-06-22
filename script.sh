#!/bin/bash

######## 2.2. Ограничение механизмов получения пивелегий ##################################
grep -qxF 'auth required pam_wheel.so use_uid' /etc/pam.d/su || echo 'auth required pam_wheel.so use_uid' >> /etc/pam.d/su

############# 2.3. file system ########################
chmod 644 /etc/passwd
chmod 644 /etc/group
chmod go-rwx /etc/shadow

######## 2.3.11 Права доступа на домашние директории ##################################
chmod 700  $(find /home/ -maxdepth 1 -type d)

############ 2.4. - * #################################
vsyscall=none
sysctl -w kernel.dmesg_restrict=1
sysctl -w kernel.kptr_restrict=2
init_on_alloc=1
slab_nomerge
CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
CONFIG_IOMMU_SUPPORT=y
randomize_kstack_offset=1
mitigations=auto,nosmt
sysctl -w net.core.bpf_jit_harden=2
sysctl -w kernel.perf_event_paranoid=3
debugfs=no-mount
sysctl -w kernel.kexec_load_disabled=1
sysctl -w kernel.unprivileged_bpf_disabled=1
sysctl -w vm.unprivileged_userfaultfd=0
sysctl -w dev.tty.ldisc_autoload=0
tsx=off
sysctl -w vm.mmap_min_addr=4096
sysctl -w kernel.randomize_va_space=2
sysctl -w kernel.yama.ptrace_scope=3
sysctl -w fs.protected_symlinks=1
sysctl -w fs.protected_hardlinks=1
sysctl -w fs.protected_fifos=2
sysctl -w fs.protected_regular=2
sysctl -w fs.suid_dumpable=0
sysctl -w net.ipv4.conf.default.log_martians=1
sysctl -w net.ipv6.conf.default.accept_source_route=0
sysctl -w net.ipv4.tcp_syncookies=1
sysctl -w net.ipv4.tcp_max_syn_backlog=2048
sysctl -w net.ipv4.tcp_synack_retries=3