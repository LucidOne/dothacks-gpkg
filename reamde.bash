# https://www.reddit.com/r/linux/comments/43nq2l/cool_hack_for_viewing_markdown_files/
function reamde() { # open a markdown file in a browser
    if [ -z $1 ]; then
        echo "Usage: reamde README.md"
    else 
        grip $1 &
        nc -z localhost 5000
        while [ $? != 0 ]; do
            sleep 1
            nc -z localhost 5000
        done
        xdg-open "http://localhost:5000"
        fg
    fi
}
