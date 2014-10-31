yum install -y java-1.7.0-openjdk.x86_64

systemctl stop firewalld
systemctl disable firewalld

rpm -ivh --nodeps /vagrant/software/opendj-2.6.0-1.noarch.rpm

/opt/opendj/setup \
          --cli \
          --baseDN dc=example,dc=com \
          --sampleData 5 \
          --ldapPort 1389 \
          --adminConnectorPort 4444 \
          --rootUserDN cn=Directory\ Manager \
          --rootUserPassword password \
          --enableStartTLS \
          --ldapsPort 1636 \
          --generateSelfSignedCertificate \
          --hostName localhost.localdomain \
          --no-prompt \
          --noPropertiesFile \
          --acceptLicense
