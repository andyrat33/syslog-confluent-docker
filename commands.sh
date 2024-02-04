export BOOTSTRAP_SERVERS=
export SCHEMA_REGISTRY_URL=
export BASIC_AUTH_CREDENTIALS_SOURCE="USER_INFO"
export SCHEMA_REGISTRY_BASIC_AUTH_USER_INFO=
export SASL_JAAS_CONFIG=
# paste above into your terminal and then run the "docker compose up" command

#Delete the connector:
# curl -X DELETE http://localhost:8083/connectors/syslog-tcp

#Configure the connector:
# curl -X POST -H "Content-Type: application/json" --data @syslog-connector-config.json http://localhost:8083/connectors

#Check connector is running:
# curl http://localhost:8083/connector-plugins
# list connectors
# curl http://localhost:8083/connectors
# Get status of connector
curl -X GET http://localhost:8083/connectors/syslog-tcp/status | jq .
# See test data to the connector
# echo "<34>1 2003-10-11T22:14:15.003Z mymachine.example.com su - ID47 - Your refrigerator is running" | nc -v -w 0 localhost 5454
# date +'%FT%T.%3NZ'
echo "<34>1 $(date +'%FT%T.%3NZ') mymachine.example.com su - ID47 - Your refrigerator is running" | nc -v -w 0 localhost 5454
echo "<34>1 $(date +'%FT%T.%3NZ') mymachine.example.com su - ID47 - docker1 test 1" | nc -v -w 0 172.31.254.216 5454

<34>1 2024-02-04T18:57:45:45.245Z mymachine.example.com su - ID47 - docker1 test 1
<34>1 2024-02-04T15:55:15.003Z mymachine.example.com su - ID47 - docker1 test 1
# Restart the container (if needed remove orphans)
# docker compose up --remove-orphans

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