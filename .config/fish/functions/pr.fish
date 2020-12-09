function pr
	cd ~/Code/$argv[1] && fish_greeting
end

function __fish_project_list
	gfind ~/Code/ -mindepth 1 -maxdepth 1 -type d -printf '%f\tChanged %CY-%Cm-%Cd %CH:%CM\n'
end
complete -c pr -r -x -A -a '(__fish_project_list)' -d 'Goto project'
