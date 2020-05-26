source ~/.asdf/asdf.fish

set -gx MAKEFLAGS -j (nproc --ignore=4)
# if status --is-interactive
#     set -g fish_user_abbreviations
#     abbr -a mvl move-last-download
# end

