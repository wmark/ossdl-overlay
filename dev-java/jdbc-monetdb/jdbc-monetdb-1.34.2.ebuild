# Copyright 2009-2010 W-Mark Kubacki
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PN="MonetDB-java"
MY_P=${MY_PN}-${PV}

DESCRIPTION="MonetDB JDBC driver"
HOMEPAGE="http://monetdb.cwi.nl/"
SRC_URI="http://monetdb.cwi.nl/downloads/sources/Nov2009-SP1/${MY_P}.tar.lzma"
RESTRICT="nomirror"

LICENSE="MonetDBPL-1.1"
SLOT="5"
KEYWORDS="amd64 x86 arm"
IUSE="curl iconv bzip2 zlib coroutines odbc"

RDEPEND="dev-java/ant
	>=virtual/jdk-1.4
	<=virtual/jdk-1.6"
DEPEND="|| ( app-arch/xz-utils app-arch/lzma-utils )
	${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_compile() {
	local myconf="--enable-jdbc"
	econf ${myconf} || die "econf"
	emake || die "emake"
}

src_install() {
	emake DESTDIR="${D}" install || die "install"
}