# Defined in - @ line 1
function kv --description alias\ kv\ kubectl\ get\ pods\ -o=jsonpath=\'\{range\ .items\[\*\]\}\{\"\\n\"\}\{range\ .spec.containers\[\*\]\}\{.name\}\{\":\\t\"\}\{.image\}\{end\}\{end\}\'\|column\ -t\|uniq\|sort
	kubectl get pods -o=jsonpath='{range .items[*]}{"\n"}{range .spec.containers[*]}{.name}{":\t"}{.image}{end}{end}'|column -t|uniq|sort $argv;
end
