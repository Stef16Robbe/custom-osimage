#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/40/x86_64/repoview/index.html&protocol=https&redirect=1

rpm-ostree upgrade

# Use COPR zellij repo with rpm-ostree: https://discussion.fedoraproject.org/t/how-to-use-copr-on-fedora-atomic/106067/3
curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/varlad/zellij/repo/fedora-40/varlad-zellij-fedora-40.repo

rpm-ostree install fish helix zellij zoxide eza fd-find ripgrep bat

#### Example for enabling a System Unit File
systemctl enable podman.socket
