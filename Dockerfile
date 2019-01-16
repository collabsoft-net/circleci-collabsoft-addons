FROM circleci/openjdk:8-browsers

RUN sudo apt-get update -y && sudo apt-get install -y apt-transport-https apt-utils; \
	sudo sh -c 'echo "deb https://packages.atlassian.com/atlassian-sdk-deb stable contrib" >>/etc/apt/sources.list'; \
	sudo wget https://packages.atlassian.com/api/gpg/key/public; \
	sudo apt-key add public; \
	sudo apt-get update -y && \
	sudo apt-get install -y \
	atlassian-plugin-sdk \
	ant;\
	ant --version; \
	atlas-version;
