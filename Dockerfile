FROM cimg/openjdk:11.0.21-node

USER root:root

RUN apt-get update -y;
RUN wget https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz -O /tmp/atlassian-plugin-sdk.tar.gz;
RUN mkdir /opt/atlassian-plugin-sdk;
RUN tar -xvzf /tmp/atlassian-plugin-sdk.tar.gz --strip-components 1 -C /opt/atlassian-plugin-sdk;
ENV PATH="${PATH}:/opt/atlassian-plugin-sdk/bin"
RUN atlas-version;
