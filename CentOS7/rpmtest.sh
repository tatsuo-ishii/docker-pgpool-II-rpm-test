#! /bin/sh

cd /var/volum/RPMS/x86_64
rpmname=pgdg.rhel7.x86_64.rpm
rpm1=pgpool-II-pg${POSTGRESQL_VERSION}-${PGPOOL_VERSION}-${RPM_VERSION}${rpmname}
rpm2=pgpool-II-pg${POSTGRESQL_VERSION}-debuginfo-${PGPOOL_VERSION}-${RPM_VERSION}${rpmname}
rpm3=pgpool-II-pg${POSTGRESQL_VERSION}-devel-${PGPOOL_VERSION}-${RPM_VERSION}${rpmname}
rpm4=pgpool-II-pg${POSTGRESQL_VERSION}-extensions-${PGPOOL_VERSION}-${RPM_VERSION}${rpmname}
rpms="$rpm1 $rpm2 $rpm3 $rpm4"
echo installing: $rpms
yum install -y $rpms >> /var/volum/rpmtest.log 2>&1

if [ $? = 0 ];then
    echo "rpm install succeeded"
else
    echo "rpm install failed"
fi
