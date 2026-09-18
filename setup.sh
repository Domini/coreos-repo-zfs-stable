#!/bin/sh -ex
sudo rpm-ostree initramfs --enable

sudo tee /etc/yum.repos.d/coreos-repo-zfs-stable.repo <<EOF
[coreos-repo-zfs-stable]
name=coreos-repo-zfs-stable
baseurl=https://github.com/Domini/coreos-repo-zfs-stable/releases/download/
enabled=1
repo_gpgcheck=0
type=rpm
gpgcheck=0
metadata_expire=6h
skip_if_unavailable=False
EOF

sudo tee /etc/modules-load.d/zfs.conf <<EOF
zfs
EOF
sudo rpm-ostree install python3-pyzfs ublue-os-ucore-addons zfs zfs-dracut
