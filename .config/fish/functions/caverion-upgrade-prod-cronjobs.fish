# Defined in - @ line 1
function caverion-upgrade-prod-cronjobs --description 'alias caverion-upgrade-prod-cronjobs helm-caverion upgrade --namespace caverion --install --values helm/cronjobs/values.yaml  --wait app-stack-cronjob helm/cronjobs'
	helm-caverion upgrade --namespace caverion --install --values helm/cronjobs/values.yaml  --wait app-stack-cronjob helm/cronjobs $argv;
end
