ARG  JAVA_VERSION=21.0
FROM cimg/openjdk:${JAVA_VERSION}

USER root:root

#### Switching to a fixed version of the Atlassian SDK as the latest version is broken
#### Change the URL back to the latest version once the issue is fixed
#### See also https://community.developer.atlassian.com/t/atlassian-sdk-9-0-2-error-when-using-atlas-mvn-install/82804/5
#
#    wget https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz -O /tmp/atlassian-plugin-sdk.tar.gz; \
#

RUN apt-get update -y; \
    apt-get install g++ build-essential; \
    wget https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz -O /tmp/atlassian-plugin-sdk.tar.gz; \
    mkdir /opt/atlassian-plugin-sdk; \
    tar -xvzf /tmp/atlassian-plugin-sdk.tar.gz --strip-components 1 -C /opt/atlassian-plugin-sdk;

ENV PATH="${PATH}:/opt/atlassian-plugin-sdk/bin"
RUN atlas-version;
