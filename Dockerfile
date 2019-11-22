FROM circleci/openjdk:8u232-node-browsers

USER root:root

RUN apt-get update -y && apt-get install -y apt-transport-https apt-utils; \
	sh -c 'echo "deb https://packages.atlassian.com/atlassian-sdk-deb stable contrib" >>/etc/apt/sources.list'; \
	wget https://packages.atlassian.com/api/gpg/key/public; \
	apt-key add public; \
	apt-get update -y && \
	apt-get install -y \
	atlassian-plugin-sdk \
	ant;\
	ant --version; \
	atlas-version;
