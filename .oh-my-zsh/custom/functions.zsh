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

# Function to find the most frequent commands, with topK as an argument
function top_commands() {
  local topK=${1:-10} # Default to 10 if no argument is provided
  # Extract commands, count them, sort by frequency, and display the top K
  awk -F';' '{print $2}' ~/.zsh_history 2>/dev/null | \
  LC_ALL=C sort | \
  uniq -c | \
  sort -rn | \
  head -n $topK
}

# Function to convert the clipboard text to a d2 diagram
function d2clip() {
  local tmp_file="temp.d2"
  local output_file="diagram.svg"

  pbpaste > "$tmp_file" || {
    echo "❌ Failed to read clipboard"
    return 1
  }

  d2 "$tmp_file" "$output_file" || {
    echo "❌ D2 rendering failed"
    rm -f "$tmp_file"
    return 1
  }

  rm -f "$tmp_file"
  echo "✅ Diagram saved as $output_file"
  open "$output_file"
}

# rg_search: interactive regex search across a chosen directory with live preview and jump-to-file
function rg_search() {
  # Load environment if needed (especially for zoxide or Oh My Zsh plugins)
  [[ -f ~/.zshrc ]] && source ~/.zshrc

  # Step 1: Choose a target directory from zoxide history
  local target_dir=$(zoxide query --interactive)
  if [[ -z "$target_dir" ]]; then
    echo "❌ Cancelled"
    return 1
  fi

  cd "$target_dir" || {
    echo "❌ Failed to cd into $target_dir"
    return 1
  }

  # Step 2: Prompt the user for a regex pattern
  echo -n "🔍 Regex to search: "
  read -r pattern
  if [[ -z "$pattern" ]]; then
    echo "❌ No pattern entered"
    return 1
  fi

  # Step 3: Run ripgrep and pipe matches into fzf
  rg --with-filename --line-number --context=5 --color=always "$pattern" . 2>/dev/null | \
    fzf --ansi --delimiter : \
      --preview 'file={1}; line={2}; [[ -n "$line" && "$line" -gt 0 ]] && bat --style=numbers --color=always --highlight-line "$line" "$file" || bat --style=numbers --color=always "$file"' \
      --bind "enter:execute(${EDITOR:-nvim} {1} +{2})"
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

