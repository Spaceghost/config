function fetch-function --argument url --description "Download and save fish function"
    curl -O -J $url ~/.config/fish/functions/
end
