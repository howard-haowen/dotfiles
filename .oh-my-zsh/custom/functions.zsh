# ╭──────────────────────────────────────────────────────────╮
# │ Get minimal weather info for Taipei                      │
# ╰──────────────────────────────────────────────────────────╯
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

# ╭──────────────────────────────────────────────────────────╮
# │ Function to remove duplicate entries from PATH           │
# ╰──────────────────────────────────────────────────────────╯
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

# ╭──────────────────────────────────────────────────────────╮
# │ Function to find the most frequent commands, with topK   │
# │ as an argument                                           │
# ╰──────────────────────────────────────────────────────────╯
function top_commands() {
  local topK=${1:-10} # Default to 10 if no argument is provided
  # Extract commands, count them, sort by frequency, and display the top K
  awk -F';' '{print $2}' ~/.zsh_history 2>/dev/null | \
  LC_ALL=C sort | \
  uniq -c | \
  sort -rn | \
  head -n $topK
}


# ╭──────────────────────────────────────────────────────────╮
# │ Function to convert the clipboard text to a d2 diagram   │
# ╰──────────────────────────────────────────────────────────╯
function d2clip() {
  local tmp_file="temp.d2"
  local output_file="./out.svg"  # Always use out.svg in the present directory

  pbpaste > "$tmp_file" || {
    echo "❌ Failed to read clipboard"
    return 1
  }

  d2 --layout=elk --sketch=true "$tmp_file" "$output_file" || {
    echo "❌ D2 rendering failed"
    rm -f "$tmp_file"
    return 1
  }

  rm -f "$tmp_file"
  echo "✅ Diagram saved as $output_file"
  open "$output_file"
}

# ╭──────────────────────────────────────────────────────────╮
# │ rg_search: interactive regex search across a chosen      │
# │ directory with live preview and jump-to-file             │
# ╰──────────────────────────────────────────────────────────╯
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

# ╭──────────────────────────────────────────────────────────╮
# │ Convert a pdf to multiple png images with magick         │
# ╰──────────────────────────────────────────────────────────╯
function pdf2png() {
  local input_pdf="$1"
  local output_prefix="${input_pdf:r}"
  magick -density 300 "$input_pdf" "${output_prefix}.png"
}
# ╭──────────────────────────────────────────────────────────╮
# │ RSS feeds                                                │
# ╰──────────────────────────────────────────────────────────╯
# Read newsfeed.opml with the CLI newsroom
function rss() {
  local opml_file="$HOME/dotfiles/newsfeed.opml"

  if [[ -f "$opml_file" ]]; then
    newsroom -o "$opml_file"
  else
    echo "❌ OPML file not found at $opml_file"
    return 1
  fi
}

# List feeds in newsfeed.opml with the CLI yq
function list_feeds() {
  local opml_file="$HOME/dotfiles/newsfeed.opml"

  if [[ -z "$opml_file" ]]; then
    echo "Usage: opml_texts <opml_file>"
    return 1
  fi

  if [[ ! -f "$opml_file" ]]; then
    echo "Error: File '$opml_file' not found."
    return 1
  fi

  # Extract all 'text' values from outline elements with type attribute
  yq -p=xml -o=yaml '.opml.body.outline[].outline[] | select(.["+@type"] != null) | .["+@text"]' $opml_file
}

# ╭──────────────────────────────────────────────────────────╮
# │ Format the output of tldr to markdown with awk           │
# ╰──────────────────────────────────────────────────────────╯
function tldr2md() {
  if [[ -z "$1" ]]; then
    echo "Usage: tldr2md <package-name>"
    return 1
  fi

  local pkg="$1"
  tldr "$pkg" --raw | awk '
  /^>/ { print; next }                     # Print description lines
  /^- / {
      if (!printed_blank) { print ""; printed_blank=1 }  # Add empty line before first bullet
      explanation=$0; next
  }
  /^`/ {
      gsub(/`/, "", $0);                   # Remove backticks
      print explanation "\n```shell\n" $0 "\n```"; print ""
  }
  '
}

# ╭──────────────────────────────────────────────────────────╮
# │ Format the output of brew info to markdown               │
# ╰──────────────────────────────────────────────────────────╯
function brew2md() {
  local pkg="$1"
  [[ -z "$pkg" ]] && return

  # Capture brew info output
  local info
  info=$(brew info "$pkg" 2>/dev/null) || return

  # If brew didn't find the package, return nothing
  [[ -z "$info" ]] && return

  # Extract tagline (second line of output)
  local tagline
  tagline=$(echo "$info" | sed -n '2p')

  # Check if Installed is present
  local installed binpath
  if echo "$info" | grep -q "^Installed"; then
    installed="✅"
    # Use 'which' to double check the bin path
    binpath=$(which "$pkg" 2>/dev/null)
    [[ -z "$binpath" ]] && binpath=""
  else
    installed="❌"
  fi

  # Output in Markdown format
  echo "- Tagline: $tagline"
  echo "- Installed: $installed"
  echo "- Bin: \`$binpath\`"
}

# ╭──────────────────────────────────────────────────────────╮
# │ Render the output of tldr as markdown on the terminal    │
# │ with rich                                                │
# ╰──────────────────────────────────────────────────────────╯
function tldr2rich() {
  if [[ -z "$1" ]]; then
    echo "Usage: tldr2rich <package-name>"
    return 1
  fi

  local pkg="$1"
  tldr "$pkg" --raw | rich --markdown -
}

# ╭──────────────────────────────────────────────────────────╮
# │ Syn Brewfile with DumpBrewfile                           │
# ╰──────────────────────────────────────────────────────────╯
function sync_brew() {
    echo "🔄 Syncing Homebrew..."

    local dotfiles_dir="$HOME/dotfiles"
    local oldpwd="$PWD"
    cd "$dotfiles_dir" || { echo "❌ Failed to cd to $dotfiles_dir"; return 1; }

    echo "📦 Installing from Brewfile..."
    brew bundle install || { local status=$?; cd "$oldpwd"; return $status; }

    echo "🧹 Cleaning up unused Homebrew packages..."
    brew bundle cleanup --force || { local status=$?; cd "$oldpwd"; return $status; }

    echo "📝 Dumping current Homebrew state to DumpBrewfile..."
    brew bundle dump --file=DumpBrewfile --force || { local status=$?; cd "$oldpwd"; return $status; }

    cd "$oldpwd"
    echo "✅ Homebrew sync complete!"
}

# ╭──────────────────────────────────────────────────────────╮
# │ For the Yazi text editor                                 │
# ╰──────────────────────────────────────────────────────────╯
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ╭──────────────────────────────────────────────────────────╮
# │ List books in Apple Books on iCloud                      │
# ╰──────────────────────────────────────────────────────────╯
function list_ibooks() {
    local books_path="$HOME/Library/Mobile Documents/iCloud~com~apple~iBooks/Documents/"
    [[ -d "$books_path" ]] || return 1

    {
        find "$books_path" -type d -name "*.epub" -print0 \
        | while IFS= read -r -d '' book_dir; do
            printf 'EPUB: %s\n' "$(basename "$book_dir" .epub)"
        done

        find "$books_path" -type f -name "*.pdf" -print0 \
        | while IFS= read -r -d '' book_file; do
            printf 'PDF: %s\n' "$(basename "$book_file" .pdf)"
        done
    } | LC_ALL=C sort -f
}
