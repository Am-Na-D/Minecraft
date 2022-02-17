#!/bin/bash

if [[ ! -f server.jar ]] 
then
	echo --------intializing----------
	mv /server.jar ./
	java -Xmx1024M -Xms1024M -Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.PollSelectorProvider -jar server.jar --nogui
	sed -i 's/false/true/g' eula.txt
	sed -i 's/server-ip=/server-ip=0.0.0.0/g' server.properties
	sed -i 's/server-port=/server-port=25565/g' server.properties
	sed -i 's/online-mode=true/online-mode=false/g' server.properties
fi

java -Xmx1024M -Xms1024M -Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.PollSelectorProvider -jar server.jar --nogui
