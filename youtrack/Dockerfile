FROM openjdk:11-jre

ENV YOUTRACK_VERSION youtrack-2020.3.12000

WORKDIR /opt
RUN wget -q https://download.jetbrains.com/charisma/$YOUTRACK_VERSION.zip \
	&& unzip -q $YOUTRACK_VERSION.zip \
	&& mv $YOUTRACK_VERSION youtrack \
	&& rm $YOUTRACK_VERSION.zip

WORKDIR youtrack/bin

EXPOSE 8080
CMD ["/bin/bash", "./youtrack.sh", "run", "--no-browser"]
