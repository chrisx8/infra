#!/bin/bash
set -e

XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_RUNTIME_DIR

OP="$1"  # Operation = restart, start, stop
CONTAINERS="{% for ct in container_specs %} {{ ct.name }} {% endfor %}"

for ct in $CONTAINERS; do
    case "$OP" in
        restart)
            echo "Restarting $ct"
	        systemctl enable --user "c-$ct"
	        systemctl restart --user "c-$ct"
            ;;
        start)
            echo "Starting $ct"
            systemctl enable --user --now "c-$ct"
            ;;
        stop)
            echo "Stopping $ct"
            systemctl disable --user --now "c-$ct"
            ;;
        *)
            echo "Usage: ct_util (restart|start|stop)"
            exit 1
            ;;
    esac
done
