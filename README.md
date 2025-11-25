# Kubernetes Workshop

Dieses Repository enthält alle notwendigen Dateien und Anleitungen für einen praxisorientierten Kubernetes-Workshop. Die Teilnehmer lernen die Grundlagen von Containern, Docker und Kubernetes kennen und wenden ihr Wissen anhand praktischer Übungen an.

## Inhaltsverzeichnis

- [Voraussetzungen](#voraussetzungen)
- [Setup](#setup)
  - [1. Repository klonen](#1-repository-klonen)
  - [2. Windows Terminal konfigurieren (Optional)](#2-windows-terminal-konfigurieren-optional)
  - [3. Umgebung einrichten](#3-umgebung-einrichten)
  - [4. Kubernetes-Cluster starten](#4-kubernetes-cluster-starten)
- [Struktur des Workshops](#struktur-des-workshops)
  - [Kubernetes-Manifeste](#kubernetes-manifeste)
  - [MariaDB-Setup](#mariadb-setup)
- [Mitwirken](#mitwirken)
- [Lizenz](#lizenz)

## Voraussetzungen

Bevor Sie mit dem Workshop beginnen, stellen Sie bitte sicher, dass die folgende Software auf Ihrem Windows-System installiert ist:

- **[Git](https://git-scm.com/download/win)**: Zur Versionskontrolle und zum Klonen dieses Repositories.
- **[Windows Terminal](https://aka.ms/terminal)**: Eine moderne Terminal-Anwendung für Windows.

Stellen Sie außerdem sicher, dass die folgenden Kommandozeilen-Tools installiert und über Ihre `PATH`-Variable erreichbar sind:

- **[kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/)**: Das Kubernetes-Kommandozeilen-Tool.
  - *Download für Windows*: [kubectl.exe](https://dl.k8s.io/v1.30.0/bin/windows/amd64/kubectl.exe)
- **[helm](https://helm.sh/docs/intro/install/)**: Der Paketmanager für Kubernetes.
  - *Download*: Siehe [Helm-Releases auf GitHub](https://github.com/helm/helm/releases).

## Setup

Folgen Sie diesen Schritten, um Ihre Umgebung für den Workshop vorzubereiten.

### 1. Repository klonen

Öffnen Sie das Windows Terminal (oder Git Bash) und klonen Sie dieses Repository an einen Ort Ihrer Wahl:

```bash
# Ersetzen Sie die URL durch die tatsächliche Repository-URL
git clone https://github.com/iScraM12/k8s-workshop-files.git
cd k8s-workshop-files
```

### 2. Windows Terminal konfigurieren (Optional)

Dieses Repository enthält eine empfohlene Konfigurationsdatei für das Windows Terminal, die nützliche Profile und Tastenkombinationen einrichtet.

1.  Öffnen Sie die Einstellungen im Windows Terminal (Strg + ,).
2.  Klicken Sie unten links auf "JSON-Datei öffnen".
3.  Ersetzen Sie den Inhalt der `settings.json` mit dem Inhalt der Datei `terminal-config/terminal.json` aus diesem Repository.
4.  Speichern und schließen Sie die Datei. Das Terminal sollte die neuen Profile, einschließlich "GitBash", automatisch laden.

### 3. Umgebung einrichten

Das `git-config`-Verzeichnis enthält Skripte, um Ihre Bash-Umgebung für den Workshop vorzubereiten.

Führen Sie das Haupt-Skript von Git Bash aus:

```bash
cd git-config
./prepare-git-config.sh
```

Dieses Skript führt die folgenden Aktionen aus:
- **`augment-bashrc.sh`**: Erweitert Ihre `~/.bashrc`-Datei um nützliche Aliase und Funktionen für den Workshop.
- **`copy-workshop-bash.sh`**: Kopiert zusätzliche Skripte in Ihr Home-Verzeichnis.
- **`create-kubeconfig-folder.sh`**: Erstellt das `.kube`-Verzeichnis in Ihrem Home-Verzeichnis, falls es nicht existiert.

Starten Sie Ihr Terminal nach der Ausführung neu, damit die Änderungen wirksam werden.

## Struktur des Workshops

Der Workshop ist in mehrere Module unterteilt, die aufeinander aufbauen.

### Kubernetes-Manifeste

Das Verzeichnis `k8s-files` enthält alle für die Übungen benötigten Kubernetes-YAML-Dateien. Die Dateien sind nummeriert, um der Reihenfolge des Workshops zu folgen:

- **Pods, Deployments, Services**: Grundlagen der Anwendungsbereitstellung.
- **ConfigMaps und Secrets**: Verwaltung von Konfigurationen und sensiblen Daten.
- **Ingress**: Bereitstellung von Anwendungen nach außen.
- **Jobs**: Ausführung von einmaligen Aufgaben.
- **StatefulSets**: Verwaltung von zustandsbehafteten Anwendungen.

### MariaDB-Setup

Das Verzeichnis `setup` enthält die Manifeste zur Bereitstellung einer MariaDB-Datenbank als Beispiel für eine zustandsbehaftete Anwendung. Diese wird im Laufe des Workshops verwendet.

- `mariadb-config-map.yml`: Konfiguration für die Datenbank.
- `mariadb-secret.yml`: Geheime Zugangsdaten (bitte für die Produktion anpassen!).
- `mariadb-stateful-set.yml`: Definiert das StatefulSet für die Datenbank-Pods.
- `mariadb-service.yml`: Stellt einen stabilen Netzwerkendpunkt für die Datenbank bereit.
