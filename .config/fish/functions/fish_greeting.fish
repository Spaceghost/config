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
	bat TODO.md
end
