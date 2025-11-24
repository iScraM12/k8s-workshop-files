echo Konfiguriere Workshop Einstellungen

export KUBECONFIG=~/kubeconfig/local.yaml

alias k="kubectl.exe"

function sn(){ 
	k config set-context --current --namespace=$1;
}