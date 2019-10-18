# Defined in - @ line 1
function mount-photos --description 'alias mount-photos sudo mount -t nfs kuunappi:/Photos /mnt/kuunappi/photos/'
	sudo mount -t nfs kuunappi:/Photos /mnt/kuunappi/photos/ $argv;
end
