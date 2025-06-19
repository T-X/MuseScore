#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-only
# MuseScore-Studio-CLA-applies
#
# MuseScore Studio
# Music Composition & Notation
#
# Copyright (C) 2021 MuseScore Limited
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
echo "Setup macOS build environment, HOME: $HOME"

trap 'echo Setup failed; exit 1' ERR

export MACOSX_DEPLOYMENT_TARGET=10.15

# Install build tools
echo "Install build tools"
brew install cmake ninja --formula --quiet

# Download dependencies
echo "Download dependencies"

#wget -q --show-progress -O musescore_deps_macos.tar.gz https://raw.githubusercontent.com/T-X/musescore_deps/main/musescore_deps_macos.tar.gz
wget -q --show-progress -O musescore_deps_macos.tar.gz https://raw.githubusercontent.com/T-X/musescore_deps/libinstpatch-dep/musescore_deps_macos.tar.gz
mkdir -p $HOME/musescore_deps_macos
tar xf musescore_deps_macos.tar.gz -C $HOME/musescore_deps_macos
rm musescore_deps_macos.tar.gz
#echo "musescore_deps_macos directory:"
#ls $HOME/musescore_deps_macos
#echo "expected libinstpatch-2 parent include directory:"
#ls /Users/runner/work/musescore_deps/musescore_deps/musescore_deps_macos/include/
#echo "expected libinstpatch-2 include directory:"
#ls /Users/runner/work/musescore_deps/musescore_deps/musescore_deps_macos/include/libinstpatch-2
echo "find $HOME/musescore_deps_macos"
find "$HOME/musescore_deps_macos" || true
echo "find /Users/runner/work/musescore_deps/musescore_deps/"
find "/Users/runner/work/musescore_deps/musescore_deps/" || true

echo "Setup script done"
