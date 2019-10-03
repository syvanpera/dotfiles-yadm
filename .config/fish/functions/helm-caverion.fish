# Defined in - @ line 1
function helm-caverion --description 'alias helm-caverion docker run -it --rm -v (pwd):/apps -v ~/.kube/config:/root/.kube/config -v ~/.helm:/root/.helm alpine/helm:2.13.0'
	docker run -it --rm -v (pwd):/apps -v ~/.kube/config:/root/.kube/config -v ~/.helm:/root/.helm alpine/helm:2.13.0 $argv;
end
