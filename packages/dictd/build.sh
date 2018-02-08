TERMUX_PKG_HOMEPAGE=http://sourceforge.net/projects/dict/
TERMUX_PKG_DESCRIPTION="Online dictionary client and server"
TERMUX_PKG_VERSION=1.12.1
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/project/dict/dictd/dictd-${TERMUX_PKG_VERSION}/dictd-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=a237f6ecdc854ab10de5145ed42eaa2d9b6d51ffdc495f7daee59b05cc363656
TERMUX_PKG_DEPENDS="libmaa"
TERMUX_PKG_BUILD_DEPENDS="libmaa-dev"

termux_step_pre_configure() {
	LDLAGS+=" -lmaa"
}

termux_step_post_make_install () {
	mkdir -p $TERMUX_PREFIX/var/run
	echo "dictd needs this folder to put dictd.pid in" >> $TERMUX_PREFIX/var/run/README.dictd
}