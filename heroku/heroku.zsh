# bashrc/zshrc
heroku(){
    docker run -it --rm -u $(id -u):$(id -g) -w "$HOME" \
           -v /etc/passwd:/etc/passwd:ro \
           -v /etc/group:/etc/group:ro \
           -v /etc/localtime:/etc/localtime:ro \
           -v /home:/home \
           -v /tmp:/tmp \
           -v /run/user/$(id -u):/run/user/$(id -u) \
           -v $(pwd):/workdir \
           -w /workdir \
           --name heroku \
           johnnagro/heroku-toolbelt "$@"
}
