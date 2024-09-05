FROM cimg/openjdk:21.0-node

USER root:root

RUN apt-get update -y; \
    apt-get install g++ build-essential; \
    wget https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz -O /tmp/atlassian-plugin-sdk.tar.gz; \
    mkdir /opt/atlassian-plugin-sdk; \
    tar -xvzf /tmp/atlassian-plugin-sdk.tar.gz --strip-components 1 -C /opt/atlassian-plugin-sdk;
ENV PATH="${PATH}:/opt/atlassian-plugin-sdk/bin"
RUN atlas-version;
