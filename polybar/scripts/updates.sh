#/usr/bin/env bash

NOTIFY_ICON=/home/h1pukema/.local/icons/actualizar-pagina.png

get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates

    # notify user of updates
    if hash notify-send &>/dev/null; then
        if (( UPDATES > 50 )); then
            notify-send -u low -i $NOTIFY_ICON -t 5000 \
                "Actualiza ya!!!" "$UPDATES Nuevos paquetes"
        elif (( UPDATES > 25 )); then
            notify-send -u low -i $NOTIFY_ICON -t 5000 \
                "Debes actualizar" "$UPDATES Nuevos paquetes"
        elif (( UPDATES > 2 )); then
            notify-send -u low -i $NOTIFY_ICON -t 5000 \
                "$UPDATES Nuevos paquetes"
        fi
    fi

    # when there are updates available
    # every 10 seconds another check for updates is done
    while (( UPDATES > 0 )); do
        if (( UPDATES == 1 )); then
            echo " $UPDATES Actualizar"
        elif (( UPDATES > 1 )); then
            echo " $UPDATES Actualizar"
        else
            echo " Actualizado"
        fi
        sleep 10
        get_total_updates
    done

    # when no updates are available, use a longer loop, this saves on CPU
    # and network uptime, only checking once every 30 min for new updates
    while (( UPDATES == 0 )); do
        echo " Actualizado"
        sleep 1800
        get_total_updates
    done
done
