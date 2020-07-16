while :
do
    curl http://influxdb:8086/ping
    if [ $? == 0 ]
    then
        break
    fi
    sleep 10
done

telegraf
