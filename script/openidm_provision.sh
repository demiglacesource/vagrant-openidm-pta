yum install -y java-1.7.0-openjdk.x86_64

unzip /vagrant/software/openidm-3.0.0.zip -d /opt && cd /opt/openidm

\cp -r samples/sample2b/* .
\cp /vagrant/file/provisioner.openicf-ldap.json /opt/openidm/conf/

cd bin
sh create-openidm-rc.sh
cp openidm /etc/init.d/

service openidm start
chkconfig openidm on

sleep 40
curl -k -H "Content-type: application/json" -u "openidm-admin:openidm-admin" -X POST "http://localhost:8080/openidm/recon?_action=recon&mapping=systemLdapAccounts_managedUser"
sleep 5
curl -k -u "openidm-admin:openidm-admin" "http://localhost:8080/openidm/managed/user?_queryId=query-all-ids&_prettyPrint=true"
