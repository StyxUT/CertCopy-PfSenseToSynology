# manually replace sections below with the name of the cert, and the scp port number
mkdir -p /volume1/LetsEncrypt/<name of cert>
scp -P<port number> -v pfsense@pfsense.home:/conf/acme/<name of cert>* /volume1/LetsEncrypt/<name of cert>
# remove test cert if present
rm -f /volume1/LetsEncrypt/<name of cert>/*TEST*