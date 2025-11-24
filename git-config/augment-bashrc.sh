#!/bin/bash

# --- Konfiguration ---

# 1. Pfad zur Quell- oder Template-Datei (die hinzugefügten Zeilen)
SOURCE_TEMPLATE="./source/.bashrc"

# 2. Zielpfad der Bash-Konfigurationsdatei
TARGET_BASHRC="$HOME/.bashrc"

# --- Skript-Logik ---

echo "Starte BashRC-Konfigurationsprozess..."
echo "Ziel: $TARGET_BASHRC"

# 1. Überprüfung, ob die Quelldatei (Template) existiert
if [ ! -f "$SOURCE_TEMPLATE" ]; then
    echo "❌ FEHLER: Quell-Datei (Template) '$SOURCE_TEMPLATE' nicht gefunden."
    echo "Stellen Sie sicher, dass die Datei existiert und den gewünschten Inhalt enthält."
    exit 1
fi

# 2. Inhalt der Quelldatei in einer Variablen speichern
# Wir verwenden cat und eine Subshell, um den gesamten Inhalt einzulesen.
CONTENT_TO_ADD=$(cat "$SOURCE_TEMPLATE")

# 3. Überprüfen, ob die .bashrc existiert
if [ -f "$TARGET_BASHRC" ]; then

    # Datei existiert: Inhalt anhängen
    echo "ℹ️ .bashrc existiert. Hänge Inhalt von '$SOURCE_TEMPLATE' an das Ende an."

    # Fügen Sie vor dem neuen Inhalt eine Trennlinie hinzu, um ihn leichter identifizierbar zu machen
    echo "" >> "$TARGET_BASHRC"
    echo "# --- Start of custom additions from script $(date +%Y-%m-%d) ---" >> "$TARGET_BASHRC"
    echo "$CONTENT_TO_ADD" >> "$TARGET_BASHRC"
    echo "# --- End of custom additions ---" >> "$TARGET_BASHRC"

    if [ $? -eq 0 ]; then
        echo "✅ Erfolg: Inhalt wurde an $TARGET_BASHRC angehängt."
    else
        echo "❌ FEHLER beim Anhängen. Berechtigungen prüfen."
        exit 1
    fi

else

    # Datei existiert nicht: Datei neu anlegen und Inhalt schreiben
    echo "⚠️ .bashrc existiert NICHT. Lege neue Datei '$TARGET_BASHRC' an."

    # Schreibe den Inhalt direkt in die neue Datei.
    # Hier könnte man zuerst die Standard-Kopfzeile der bashrc hinzufügen.
    echo "# .bashrc - Erstellt am $(date +%Y-%m-%d) durch Konfigurationsskript" > "$TARGET_BASHRC"
    echo "" >> "$TARGET_BASHRC"
    echo "$CONTENT_TO_ADD" >> "$TARGET_BASHRC"

    if [ $? -eq 0 ]; then
        echo "✅ Erfolg: Neue .bashrc wurde mit dem Template-Inhalt erstellt."
    else
        echo "❌ FEHLER beim Erstellen der Datei. Berechtigungen prüfen."
        exit 1
    fi
fi

# 4. Abschließende Anweisung
echo ""
echo "Bitte führen Sie 'source ~/.bashrc' aus, um die Änderungen sofort zu aktivieren."