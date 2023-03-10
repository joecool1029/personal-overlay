# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zi0Black/microarchitectural-attacks-mitigations-checker.git"
else
	SRC_URI="https://github.com/speed47/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

DESCRIPTION="Spectre, Meltdown, Foreshadow, Fallout, RIDL, ZombieLoad vulnerability/mitigation checker for Linux & BSD"
HOMEPAGE="https://github.com/zi0Black/microarchitectural-attacks-mitigations-checker"

LICENSE="GPL-3+"
SLOT="0"

DEPEND="!app-admin/spectre-meltdown-checker"

src_install() {
	default
	newbin spectre-meltdown-checker.sh spectre-meltdown-checker
}
