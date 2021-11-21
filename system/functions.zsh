# Render a markdown file as html in the browser
# do a "brew install browser" to get the browser app so you can pipe html to
# your browser
function html {
    CSS="https://rawgit.com/lorin/macdown/master/MacDown/Resources/Styles/GitHub2.css"
    if [ $#@ -eq 0 ]; then
        if [[ -a README.md ]]; then
            FNAME=README.md
        else
            FNAME=(*.md)
        fi
    else
        FNAME="$1"
    fi
    pandoc -c $CSS $FNAME | browser
}