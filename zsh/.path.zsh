# Set path
PATH_ELEMENTS=(
    "/usr/local/sbin"
    "/usr/local/bin"
    "/usr/sbin"
    "/usr/bin"
    "/sbin"
    "/bin"
    "/snap/bin"
    "/usr/games"
    "/usr/local/games"

    "${HOME}/bin"
    "${HOME}/scripts"

    "${HOME}/.npm-packages"
)

PATH=$(echo $PATH_ELEMENTS | sed "s/ /:/g")
echo $PATH


