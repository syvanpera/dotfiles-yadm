# Defined in - @ line 1
function mount-videos --description 'alias mount-videos sudo mount -t nfs kuunappi:/Videos /mnt/kuunappi/videos/'
	sudo mount -t nfs kuunappi:/Videos /mnt/kuunappi/videos/ $argv;
end
