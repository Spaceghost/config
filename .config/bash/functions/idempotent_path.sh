idempotent_path_prepend() { # idempotent_path_append dir1 dir2 dir3 => dir1:dir2:dir3:$PATH
  for ((i=$#; i>0; i--)); do ARG=${!i}
    if [ -d "$ARG" ]; then # Only add to path if the path currently exists. Might remove.
      PATH=${PATH//":$ARG"/} # delete any instances in the middle or at the end
      PATH=${PATH//"$ARG:"/} # delete any instances at the beginning
      export PATH="$ARG:$PATH" # prepend to beginning
    fi
  done
}

idempotent_path_append() { # idempotent_path_append dir1 dir2 dir3 => $PATH:dir1:dir2:dir3
  for ((i=$#; i>0; i--)); do ARG=${!i}
    if [ -d "$ARG" ]; then
      PATH=${PATH//":$ARG"/} # delete any instances in the middle or at the end
      PATH=${PATH//"$ARG:"/} # delete any instances at the beginning
      export PATH="$PATH:$ARG" # append to end
    fi
  done
}

idempotent_path_remove() { # idempotent_path_remove dir1 dir2 dir3
  for ((i=$#; i>0; i--)); do ARG=${!i}
    if [ -d "$ARG" ]; then # Only add to path if the path currently exists. Might remove.
      PATH=${PATH//":$ARG"/} # delete any instances in the middle or at the end
      PATH=${PATH//"$ARG:"/} # delete any instances at the beginning
      export PATH
    fi
  done
}
