#!/bin/bash

# --- Konfiguration ---
# 1. Quellpfad: Der Pfad zur Datei, die kopiert werden soll.
SOURCE_FILE="./source/workshop.bash"

# 2. Unterordner im Home-Verzeichnis, in den kopiert werden soll.
CONFIG_SUBDIR="config"

# 3. Zieldateiname: Der Name, den die Datei im Zielordner haben soll.
DEST_FILENAME="workshop.bash"

# 4. Finaler Zielordner: Setzt den Pfad auf $HOME/config
DEST_DIR="$HOME/$CONFIG_SUBDIR"

# --- Skript-Logik ---

echo "Starte Kopiervorgang..."

# 1. Überprüfung, ob die Quelldatei existiert
if [ ! -f "$SOURCE_FILE" ]; then
    echo "FEHLER: Quelldatei '$SOURCE_FILE' nicht gefunden."
    echo "Bitte stellen Sie sicher, dass die Datei im aktuellen Verzeichnis liegt."
    exit 1
fi

# 2. Überprüfung und Erstellung des Zielordners ($HOME/config)
echo "Prüfe, ob Zielordner '$DEST_DIR' existiert..."
if [ ! -d "$DEST_DIR" ]; then
    echo "Ordner existiert nicht. Erstelle '$DEST_DIR'..."
    # -p Option stellt sicher, dass übergeordnete Ordner (hier $HOME)
    # nicht existieren müssen und keine Fehlermeldung kommt, falls der Ordner
    # bereits existiert (was hier aber durch die if-Bedingung bereits ausgeschlossen ist).
    mkdir -p "$DEST_DIR"

    # Überprüfen, ob die Erstellung erfolgreich war
    if [ $? -ne 0 ]; then
        echo "SCHWERER FEHLER: Konnte den Ordner '$DEST_DIR' nicht erstellen. Prüfen Sie die Berechtigungen."
        exit 1
    fi
else
    echo "Ordner existiert bereits. Fahre fort..."
fi

# 3. Kopierbefehl ausführen
# Kopiert die Quelldatei in den neu erstellten (oder existierenden) Ordner.
cp -v "$SOURCE_FILE" "$DEST_DIR/$DEST_FILENAME"

# 4. Überprüfung des Kopiererfolgs
if [ $? -eq 0 ]; then
    echo "---"
    echo "**Kopiervorgang erfolgreich abgeschlossen!**"
    echo "Zieldatei: $DEST_DIR/$DEST_FILENAME"
    echo "---"
else
    echo "---"
    echo "FEHLER: Der Kopiervorgang ist fehlgeschlagen."
    echo "Überprüfen Sie die Dateiberechtigungen."
    echo "---"
    exit 1
fi