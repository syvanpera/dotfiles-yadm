# Defined in - @ line 1
function caverion-upgrade-prod --description 'alias caverion-upgrade-prod helm-caverion upgrade --namespace caverion --install --values helm/production/customer-platform/values.yaml  --wait app-stack-prod helm/production/customer-platform'
	helm-caverion upgrade --namespace caverion --install --values helm/production/customer-platform/values.yaml  --wait app-stack-prod helm/production/customer-platform $argv;
end
