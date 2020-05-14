function edit-function --argument name
    set file ~/.config/fish/functions/$name.fish
    $EDITOR $file
    source $file
end
