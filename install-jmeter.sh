VERSION=$1
SETUP_DIR=$2
mkdir -p ${SETUP_DIR}
cd ${SETUP_DIR}
wget -O apache-jmeter-${VERSION}.tgz https://downloads.apache.org/jmeter/binaries/apache-jmeter-${VERSION}.tgz
tar -xvf apache-jmeter-${VERSION}.tgz
rm -rf apache-jmeter-${VERSION}.tgz
echo "#Jmeter" >> ~/.bashrc
echo "export JMETER_HOME=${SETUP_DIR}/apache-jmeter-${VERSION}" >> ~/.bashrc
echo "export PATH=\$PATH:\${JMETER_HOME}/bin" >> ~/.bashrc
