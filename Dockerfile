FROM translucent/atlassian-plugin-sdk

RUN apt-get update -y && \
	apt-get install -y \
	ant;
