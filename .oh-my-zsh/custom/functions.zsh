# Get minimal weather info for Taipei
function get_weather() {
    local weather_info=$(curl -s "wttr.in/Taipei?format=3")
    echo "Today's weather in $weather_info"
}

# Get cheatsheet info with cht.sh
function cheat() {
    local language="$1"
    local query="$2"
    curl -s "https://cht.sh/${language}/${query}"
}


# DOES NOT WORK
# Preview a file depending on its extension
function preview_file() {
    local file="$1"
    local extension="${file##*.}"
    
    case "$extension" in
        ipynb)
            nbpreview -t dracula "$file"
            ;;
        png|jpg|jpeg|gif|bmp)
            wezterm imgcat "$file"
            ;;
        *)
            bat --style=numbers --color=always --line-range :500 "$file"
            ;;
    esac
}

