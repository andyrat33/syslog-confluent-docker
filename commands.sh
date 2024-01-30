# Delete the connector:
curl -X DELETE http://localhost:8083/connectors/syslog-tcp
# Get status
curl -X GET http://localhost:8083/connectors/syslog-tcp/status
#Configure the connector:
curl -X POST -H "Content-Type: application/json" --data @syslog-connector-config.json http://localhost:8083/connectors

#Check connector is running:
curl http://localhost:8083/connector-plugins
# list connectors
curl http://localhost:8083/connectors
# Test messaged
echo "<34>1 2003-10-11T22:14:15.003Z mymachine.example.com su - ID47 - Your refrigerator is running" | nc -v -w 0 localhost 5454

docker compose up --remove-orphans