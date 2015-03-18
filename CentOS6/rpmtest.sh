#! /bin/sh

major_version=${PGPOOL_VERSION%.*}
repo_url=http://www.pgpool.net/yum/rpms/

rpmname=pgdg.rhel6.x86_64.rpm
rpms=(
    "pgpool-II-pg${POSTGRESQL_VERSION}-${PGPOOL_VERSION}-${RPM_VERSION}${rpmname}"
    "pgpool-II-pg${POSTGRESQL_VERSION}-devel-${PGPOOL_VERSION}-${RPM_VERSION}${rpmname}"
    "pgpool-II-pg${POSTGRESQL_VERSION}-extensions-${PGPOOL_VERSION}-${RPM_VERSION}${rpmname}"
)
# "pgpool-II-pg${POSTGRESQL_VERSION}-debuginfo-${PGPOOL_VERSION}-${RPM_VERSION}${rpmname}"

cd /var/volum/RPMS/x86_64

for rpm in ${rpms[*]}; do
    if [ ! -e ${rpm} ]; then
        echo -n "getting ${rpm} ..."
        wget ${repo_url}/${major_version}/redhat/rhel-6-x86_64/${rpm} > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "failed"
            exit 1
        fi
        echo "succeeded"
    fi

    echo -n "installing: $rpm ..."
    yum install -y ${rpm} >> /var/volum/rpmtest.log 2>&1

    if [ $? -ne 0 ]; then
        echo "failed"
        exit 1
    fi
    echo "succeeded"

    echo
done
