#!/bin/bash

# --- Konfiguration der auszuführenden Skripte ---
# Stellen Sie sicher, dass diese Skripte ausführbar sind (chmod +x)
# und im gleichen Verzeichnis liegen, oder geben Sie den vollen Pfad an.

SCRIPT_1="./augment-bashrc.sh"
SCRIPT_2="./copy-workshop-bash.sh"
SCRIPT_3="./create-kubeconfig-folder.sh"

echo "Starte sequenzielle Ausführung der Workshop-Skripte..."
echo "---"

# 1. Ausführung des .bashrc Skripts
echo "▶️ Starte SCRIPT 1: $SCRIPT_1"
if "$SCRIPT_1"; then
    echo "✅ SCRIPT 1 erfolgreich beendet."
else
    echo "❌ FEHLER: SCRIPT 1 ($SCRIPT_1) ist fehlgeschlagen. Breche ab."
    exit 1
fi

echo "---"

# 2. Ausführung des workshop-bash Skripts
echo "▶️ Starte SCRIPT 2: $SCRIPT_2"
if "$SCRIPT_2"; then
    echo "✅ SCRIPT 2 erfolgreich beendet."
else
    echo "❌ FEHLER: SCRIPT 2 ($SCRIPT_2) ist fehlgeschlagen. Breche ab."
    exit 1
fi

echo "---"

# 3. Ausführung des kubeconfig Skripts
echo "▶️ Starte SCRIPT 3: $SCRIPT_3"
if "$SCRIPT_3"; then
    echo "✅ SCRIPT 3 erfolgreich beendet."
else
    echo "❌ FEHLER: SCRIPT 3 ($SCRIPT_3) ist fehlgeschlagen. Breche ab."
    exit 1
fi

echo "---"
echo "🎉 Alle Skripte erfolgreich und sequenziell ausgeführt."