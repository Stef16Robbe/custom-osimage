#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/40/x86_64/repoview/index.html&protocol=https&redirect=1

# Use COPR repo's with rpm-ostree: https://github.com/boredsquirrel/COPR-command
# TODO: https://discussion.fedoraproject.org/t/need-help-using-copr-in-fedora-silverblue/74522/2
wget https://raw.githubusercontent.com/trytomakeyouprivate/COPR-OSTree/main/copr -P /tmp && chmod +x /tmp/copr
/tmp/copr enable varlad/zellij

rpm-ostree install fish helix zellij zoxide eza fd-find ripgrep bat

#### Example for enabling a System Unit File
systemctl enable podman.socket
