function fish_greeting
        if not type fortune > /dev/null 2>&1
                brew install fortune
        end
        if not type cowsay > /dev/null 2>&1
                brew install cowsay
        end
 	if not type lolcat > /dev/null 2>&1
		brew install lolcat
	end
        fortune | cowsay | lolcat

	if not type mdv > /dev/null 2>&1
		pip3 install mdv
	end
	mdv TODO.md
end
