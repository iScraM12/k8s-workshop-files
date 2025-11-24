#!/bin/bash

# --- Konfiguration ---
# Der Name des Ordners, der im Home-Verzeichnis erstellt werden soll.
CONFIG_DIR_NAME="kubeconfig"

# Der vollständige Pfad zum Zielordner.
TARGET_DIR="$HOME/$CONFIG_DIR_NAME"

# --- Skript-Logik ---

echo "Starte Überprüfung und Erstellung des Ordners..."

# 1. Prüfen, ob der Zielordner existiert
if [ ! -d "$TARGET_DIR" ]; then

    echo "Ordner '$TARGET_DIR' existiert nicht. Erstelle..."

    # 2. Ordner erstellen
    # Die Option -p sorgt dafür, dass keine Fehlermeldung ausgegeben wird,
    # falls der Ordner bereits existiert, und erstellt ggf. übergeordnete Ordner.
    mkdir -p "$TARGET_DIR"

    # 3. Überprüfung des Erfolgs
    if [ $? -eq 0 ]; then
        echo "✅ Erfolg: Ordner '$CONFIG_DIR_NAME' wurde erfolgreich unter $HOME angelegt."
    else
        echo "❌ FEHLER: Konnte den Ordner '$TARGET_DIR' nicht erstellen. Berechtigungen prüfen."
        exit 1
    fi
else
    echo "⚠️ Ordner '$TARGET_DIR' existiert bereits. Keine Aktion erforderlich."
fi