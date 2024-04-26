VERSION=$1
echo ">>>>> Install Katalon version ${VERSION}"
SETUP_DIR=$2
echo ">>>>> Setup dir ${SETUP_DIR}"
mkdir -p ${SETUP_DIR}
cd ${SETUP_DIR}

if grep -q "export PATH=\$PATH:${SETUP_DIR}/katalon" ~/.bashrc; then
    echo "Existing PATH export found in ~/.bashrc. Removing..."
    sed -i '/export PATH=\$PATH:'"${SETUP_DIR//\//\\/}"'\/katalon/d' ~/.bashrc
fi
wget -O katalon-${VERSION}.tgz https://github.com/katalon-studio/katalon-studio/releases/download/free-v${VERSION}/Katalon_Studio_Free_Linux_64-${VERSION}.tar.gz
tar -xf katalon-${VERSION}.tgz -C ${SETUP_DIR}
rm -rf katalon-${VERSION}.tgz
mv ${SETUP_DIR}/Katalon_Studio_* ${SETUP_DIR}/katalon
if [ -d "${SETUP_DIR}/katalon" ]; then
  echo "DONE! Setup katalon version ${VERSION} completed!!!"
fi
echo "export PATH=\$PATH:${SETUP_DIR}/katalon" > ~/.bashrc
source ~/.bashrc
