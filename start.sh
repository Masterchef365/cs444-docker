docker run -it \
    --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$HOME/.Xauthority:/root/.Xauthority:rw"\
    -v $PWD:/cwd\
    -w /cwd \
    --name cs444\
    cs444-jos \
    $@
