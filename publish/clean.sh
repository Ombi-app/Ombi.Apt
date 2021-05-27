#!/bin/bash

cd /source || exit

echo -e "${INPUT_GPG_PRIV}" | gpg --batch --import

package=ombi
distro=jessie

if [ "${INPUT_STATE}" == "stable" ]; then
    branch="master"

else
    branch="develop"
fi

aptly repo remove -config="repo/${branch}.aptly.conf" "${package}" '$Version (<< 4.0.1330)'
aptly publish update -config="repo/${branch}.aptly.conf" -batch -passphrase="${INPUT_GPG_PASSPHRASE}" "${distro}" filesystem:public:${branch}
aptly db cleanup -config="repo/${branch}.aptly.conf"
aptly publish update -config="repo/${branch}.aptly.conf" -batch -passphrase="${INPUT_GPG_PASSPHRASE}" "${distro}" filesystem:public:${branch}
