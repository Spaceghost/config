function smartdot
	commandline -i (commandline -b | awk '{print $0 ~ /\.\.$/ ? "/.." : "."}')
end
