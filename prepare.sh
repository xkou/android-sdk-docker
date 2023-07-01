apt update
apt install -y wget curl unzip

cd /root

set -e

N=" --show-progress --progress=bar:force:noscroll " 

[ ! -e /usr/local/bin/java ] && {
    wget $N https://repo.huaweicloud.com/java/jdk/11.0.2+9/jdk-11.0.2_linux-x64_bin.tar.gz 
    tar xf jdk-11.0.2_linux-x64_bin.tar.gz 
    mv jdk-11.0.2 /usr/local/ 
    rm jdk-11.0.2_linux-x64_bin.tar.gz 
    ln -s /usr/local/jdk-11.0.2/bin/java /usr/local/bin/java 
}

# https://developer.android.com/studio
[ -e /usr/local/sdk/cmdline-tools/latest ] || {
    wget $N https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O t.zip 
    unzip t.zip 
    rm t.zip 
    mkdir -p /usr/local/sdk/cmdline-tools 
    mv cmdline-tools /usr/local/sdk/cmdline-tools/latest
}

exit 0
cd /usr/local/sdk/
MAN=./cmdline-tools/latest/bin/sdkmanager
yes | $MAN --licenses
$MAN "platforms;android-33-ext5"
$MAN "build-tools;33.0.2"
$MAN "ndk;23.1.7779620"
$MAN "cmake;3.18.1"
$MAN "platform-tools"
