function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
    case insert
      set_color --bold green
    case replace_one
      set_color --bold green
    case visual
      set_color --bold brmagenta
    case '*'
      set_color --bold red
  end
  
  echo '$' 
  set_color normal
end
