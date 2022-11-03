
# Full path to the new certificate (*.pem)
# Manually updated path below
SOURCE_CERT="/volume1/LetsEncrypt/<name of cert>/<name of cert>.all.pem"

# Existing certificates are replaced below
DEFAULT_CERT_ROOT_DIR="/usr/syno/etc/certificate"
DEFAULT_ARCHIVE_CERT_DIR="${DEFAULT_CERT_ROOT_DIR}/_archive"
DEFAULT_ARCHIVE_CERT_NAME=${DEFAULT_ARCHIVE_CERT_DIR}/$(cat ${DEFAULT_ARCHIVE_CERT_DIR}/DEFAULT)
EXISTING_CERT_FOLDERS=$(find /usr/syno/etc/certificate -path */_archive/* -prune -o -name cert.pem -exec dirname '{}' \;)

for _dir in ${EXISTING_CERT_FOLDERS} ${DEFAULT_ARCHIVE_CERT_NAME}; do
    echo "Replacing certificates from ${_dir}"
    _certs=$(find ${_dir} -name "*.pem")
    for _cert in ${_certs}; do
        echo "Replacing ${_cert} with ${SOURCE_CERT}"
        cp -f ${SOURCE_CERT} ${_cert}
    done
done

# Restart necessary services
systemctl restart nginx
systemctl restart nmbd
systemctl restart avahi