preview_file() {
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
