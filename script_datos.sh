#!/usr/bin/env bash
function espacio_disco {
	/usr/bin/df | /usr/bin/grep "/dev/sda1" | /usr/bin/awk '{print $4}'
}
disk_avail=$(espacio_disco)

function fans_theweekend {
	/usr/bin/curl https://api.deezer.com/artist/4050205 | /usr/bin/jq | /usr/bin/grep "nb_fan" | /usr/bin/awk '{print $2}'
}
fans=$(fans_theweekend)

function ram_ocupada {
	 /usr/bin/vmstat -s | /usr/bin/grep "used memory" | /usr/bin/awk '{print $1}'
}
ram=$(ram_ocupada)


function carga_1 {
	/usr/bin/uptime | /usr/bin/awk '{print $9}'
}
primera_carga=$(carga_1)

function carga_5 {
	 /usr/bin/uptime | /usr/bin/awk '{print $10}'
}
segunda_carga=$(carga_5)

function carga_15 {
	/usr/bin/uptime | /usr/bin/awk '{print $11}'
}
tercera_carga=$(carga_15)

/usr/bin/curl https://api.thingspeak.com/update?api_key=JMDZUON4WQ443TGJ\&field1=${disk_avail}\&field2=${fans}\&field3=${ram}\&field4=${primera_carga}\&field5=${segunda_carga}\&field6=${tercera_carga}

