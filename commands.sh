# paste above into your terminal and then run the "docker compose up" command

#Delete the connector:
# curl -X DELETE http://localhost:8083/connectors/syslog-tcp

#Configure the connector:
# curl -X POST -H "Content-Type: application/json" --data @syslog-connector-config.json http://localhost:8083/connectors

#Check connector is running:
# curl http://localhost:8083/connector-plugins
# list connectors
# curl http://localhost:8083/connectors

# See test data to the connector
echo "<34>1 2003-10-11T22:14:15.003Z mymachine.example.com su - ID47 - Your refrigerator is running" | nc -v -w 0 localhost 5454

# Restart the container (if needed remove orphans)
# docker compose up --remove-orphans