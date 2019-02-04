#!/bin/bash
echo "Installing Curl"
sudo apt-get update && sudo apt install apt-transport-https curl

echo "Retriving InfluxDB Repo"
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -source /etc/os-release

echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

echo "Installing InfluxDB"
sudo apt-get update && sudo apt-get install influxdb

echo "Starting InfluxDB"
sudo service influxdb start


echo "Retriving Grafana Repo"
curl https://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add -

echo "deb https://dl.bintray.com/fg2it/deb stretch main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

sudo apt-get update

echo "Installing Grafana"
sudo apt-get install grafana

echo "Creating Influxdb database HomeAssistant."
curl -s "http://localhost:8086/db?u=root&p=root" -d "{\"name\": \"HomeAssistant\"}"

echo "Creating Influxdb database IoTaWatt."
curl -s "http://localhost:8086/db?u=root&p=root" -d "{\"name\": \"IoTaWatt\"}"
