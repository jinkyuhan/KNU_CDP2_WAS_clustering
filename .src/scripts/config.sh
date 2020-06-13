#!/bin/sh


echo "########################################"
echo ""
echo "config.sh"
echo ""
echo "########################################"
echo ""
echo ""

CLUSTER_ROOT=$(git rev-parse --show-toplevel)

app_name_checked=false
until [ $app_name_checked = true ]; do
    printf "Enter your webapp's name: "
    read app_name
    printf "Your webapp's name is $app_name, Are you sure? (y/n): "
    read check_char
    if [ $check_char = "y" ]; then
        app_name_checked=true
    fi
done

port_num_checked=false
until [ $port_num_checked = true ]; do
    printf "Enter the port number of your webapp to listen: "
    read port_num
    printf "Your webapp listens on $port_num port, right? (y/n): "
    read check_char
    if [ $check_char = "y" ]; then
        port_num_checked=true
    fi
done

echo $app_name > $CLUSTER_ROOT/.app_config
echo $port_num > $CLUSTER_ROOT/.server_config





