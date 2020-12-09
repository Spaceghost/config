function download-exercism --argument track
    curl -LS https://exercism.io/tracks/$track/exercises | grep "/tracks/$track/exercises/" | awk '{print $3}' | cut -d/ -f5 | cut -d\" -f1 >~/Code/Exercism/$track-exercises.txt
    cat ~/Code/Exercism/$track-exercises.txt | while read -l exercise
        exercism download --exercise="$exercise" --track=$track
    end
end
