FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive \
    SLAPD_DOMAIN=example.com \
    SLAPD_ORGANISATION="Example Organization" \
    SLAPD_PASSWORD=admin \
    SLAPD_CONFIG_PASSWORD=config

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        slapd \
        ldap-utils && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /etc/ldap/slapd.d/* && \
    slaptest -f /etc/ldap/slapd.conf -F /etc/ldap/slapd.d && \
    chown -R openldap:openldap /etc/ldap/slapd.d && \
    chown -R openldap:openldap /var/lib/ldap

RUN cat <<EOF > /tmp/base.ldif
dn: ou=people,dc=example,dc=com
objectClass: organizationalUnit
ou: people

dn: ou=groups,dc=example,dc=com
objectClass: organizationalUnit
ou: groups
EOF

RUN ldapadd -x -D "cn=admin,dc=example,dc=com" -w "$SLAPD_PASSWORD" -f /tmp/base.ldif

EXPOSE 389 636

CMD ["slapd", "-d", "0", "-h", "ldap:/// ldaps:///"]

