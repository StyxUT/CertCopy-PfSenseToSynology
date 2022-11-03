
* [Create a Let's Encrypt Cert](https://docs.netgate.com/pfsense/en/latest/packages/acme/index.html)
* Create a pfSense user in Synology to perform pfSenese related tasks
* Create a pfSense user in pfSense for use by Synology
  * Must be an Admin account
  * Will require use of SSH Key for authentication
    * Create keys
      * ssh-keygen
    * Copy pub key to pfSense
      * cat ~/.ssh/id_rsa.pub | ssh -p 2222 pfsense@pfsense.home "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
  * Account should be set to not expire
* Schedule scripts to run with Synology's Task Scheduler
  * Schedule contents of CopyCertToSynologyFromPfSense.sh to execute as pfSense user
  * Schedule content of ApplyCert.sh to execute as root user
