# Get minimal weather info for Taipei
function get_weather() {
    local weather_info=$(curl -s "https://wttr.in/Taipei?0pqQF")
    echo "Today's weather: $weather_info"
}

# Get cheatsheet info with cht.sh
# function cheat() {
#     local language="$1"
#     local query="$2"
#     curl -s "https://cht.sh/${language}/${query}"
# }

# Function to remove duplicate entries from PATH
function remove_duplicate_path_entries() {
    local -a unique_paths
    local path_entry
    for path_entry in ${(s/:/)PATH}; do
        if [[ ! ${unique_paths[(r)$path_entry]} ]]; then
            unique_paths+=($path_entry)
        fi
    done
    PATH="${(j/:/)unique_paths}"
}
# DOES NOT WORK
# Preview a file depending on its extension
# function preview_file() {
#     local file="$1"
#     local extension="${file##*.}"
#     
#     case "$extension" in
#         ipynb)
#             nbpreview -t dracula "$file"
#             ;;
#         png|jpg|jpeg|gif|bmp)
#             wezterm imgcat "$file"
#             ;;
#         *)
#             bat --style=numbers --color=always --line-range :500 "$file"
#             ;;
#     esac
# }

