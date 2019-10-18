# Defined in - @ line 1
function docker-rmi-untagged --description alias\ docker-rmi-untagged\ docker\ images\ \|\ awk\ \'\{if\(match\(\$1,\"\<none\>\"\)\)\{print\ \"docker\ rmi\ \"\ \$3\ \"\;\"\ \|\ \"/bin/bash\"\}\}\'
	docker images | awk '{if(match($1,"<none>")){print "docker rmi " $3 ";" | "/bin/bash"}}' $argv;
end
