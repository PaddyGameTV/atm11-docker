#!/bin/bash
set -e

cd /server

echo "ATM11 Server startet..."

JAVA_XMS=${JAVA_XMS:-8G}
JAVA_XMX=${JAVA_XMX:-12G}

# EULA
echo "eula=true" > eula.txt

# Falls später Modpack-Logik rein soll → hier Platz

if [ -f "run.sh" ]; then
    chmod +x run.sh
    exec ./run.sh
fi

if [ -f "server.jar" ]; then
    exec java -Xms$JAVA_XMS -Xmx$JAVA_XMX -jar server.jar nogui
fi

echo "Kein Startskript gefunden!"
exit 1
