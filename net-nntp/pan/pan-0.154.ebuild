# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools gnome2

DESCRIPTION="A newsreader for GNOME"
HOMEPAGE="https://gitlab.gnome.org/GNOME/pan/"
SRC_URI="https://gitlab.gnome.org/GNOME/pan/-/archive/v${PVR}/${PN}-v${PVR}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="dbus libnotify nls spell ssl"

RDEPEND="
	>=dev-libs/glib-2.26:2
	dev-libs/gmime:3.0
	>=sys-libs/zlib-1.2.0
	>=x11-libs/gtk+-3.00:3
	libnotify? ( >=x11-libs/libnotify-0.4.1:0= )
	spell? (
		>=app-text/enchant-2.2.3:2
		>=app-text/gtkspell-3.0.10:3 )
	ssl? ( >=net-libs/gnutls-3:0= )
"
DEPEND="${RDEPEND}
	app-text/yelp-tools
	>=sys-devel/gettext-0.19.7
	virtual/pkgconfig
"

S="${WORKDIR}/pan-v${PVR}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myconf=(
		$(use_with dbus) \
		$(use_with nls) \
		$(use_with spell gtkspell) \
		$(use_enable libnotify) \
		$(use_with ssl gnutls)
	)

	gnome2_src_configure "${myconf[@]}"
}