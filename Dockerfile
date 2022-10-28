FROM rust:latest
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update \
    && apt-get upgrade -y
RUN apt-get install curl sudo wget jq libssl-dev libncurses5 libcppunit-dev autoconf automake autotools-dev autopoint libtool software-properties-common git tar unzip zip pigz coreutils pkg-config python3 python3-pip cmake alien at bc bsdextrautils bsdmainutils cpio cron cups-bsd cups-client cups-common debhelper debugedit dh-autoreconf dh-strip-nondeterminism dwz ed gettext gettext-base groff-base gsasl-common guile-3.0-libs intltool-debian libarchive-cpio-perl libarchive-zip-perl libavahi-client3 libavahi-common-data libavahi-common3 libcups2 libdebhelper-perl libfile-stripnondeterminism-perl libfribidi0 libfsverity0 libgc1 libgpm2 libgsasl7 liblua5.3-0 libmail-sendmail-perl libncurses5 libnspr4 libnss3 libntlm0 libpipeline1 libpopt0 libpq5 librpm9 librpmbuild9 librpmio9 librpmsign9 libsub-override-perl libsys-hostname-long-perl libtinfo5 libuchardet0 locales mailutils mailutils-common man-db mysql-common ncal ncurses-term pax po-debconf psmisc rpm rpm-common rpm2cpio rsync time adb autoconf automake axel bc bison build-essential clang curl expat fastboot flex gawk git gnupg gperf htop lib32ncurses5-dev lib32z1-dev libtinfo5 libc6-dev libcap-dev libexpat1-dev libgmp-dev '^liblz4-.*' '^liblzma.*' libmpc-dev libmpfr-dev libncurses5-dev libsdl1.2-dev libssl-dev libtool libxml2 libxml2-utils '^lzma.*' lzop maven ncftp ncurses-dev patch patchelf pkg-config pngcrush pngquant python2.7 python-is-python3 re2c schedtool squashfs-tools subversion texinfo unzip w3m xsltproc zip zlib1g-dev lzip libxml-simple-perl aria2 libswitch-perl apt-utils -y
RUN curl https://rclone.org/install.sh | sudo bash
RUN curl https://gist.githubusercontent.com/karthik4579/74b9c5a4ba31c0cab00fdfa65b55f20b/raw/940f61a4663b406bdff7f21315ad365683c8b57e/installmake.sh | bash
RUN git clone  https://github.com/akhilnarang/scripts.git && cd scripts && bash setup/android_build_env.sh && cd ..

ENTRYPOINT ["/bin/bash"]
