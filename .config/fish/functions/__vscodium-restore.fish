# Defined in /Users/jack/.config/fish/functions/__vscodium-restore.fish @ line 1
function __vscodium-restore
cat ~/.config/vscodium_extensions.txt | xargs -n 1 code --install-extension
end
