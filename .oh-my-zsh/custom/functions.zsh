# ╭──────────────────────────────────────────────────────────╮
# │ Get minimal weather info for Taipei                      │
# ╰──────────────────────────────────────────────────────────╯
function get_weather() {
    local weather_info=$(curl -s "https://wttr.in/Taipei?0pqQF")
    echo "Today's weather: $weather_info"
}
# - `curl -s` fetches the compact wttr.in weather report without progress output.
# - The result is stored in `weather_info` and printed with a short label.

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
# - Splits `$PATH` on `:` into individual entries using zsh parameter expansion.
# - Adds each path to `unique_paths` only if it is not already present.
# - Joins the unique entries back together with `:` and assigns them to `$PATH`.

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
# - Uses the first argument as the number of results, defaulting to `10`.
# - Reads `~/.zsh_history`, splits each entry on `;`, and extracts the command text.
# - Sorts commands, counts duplicates with `uniq -c`, sorts by count descending, and shows the top results.


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
# - Saves clipboard text from `pbpaste` into a temporary `.d2` file.
# - Runs `d2` with the ELK layout engine and sketch styling to render `out.svg`.
# - Removes the temporary file, prints the output path, and opens the SVG.

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
# - Reloads `~/.zshrc` so interactive tools such as zoxide are available.
# - Uses `zoxide query --interactive` to choose a search directory.
# - Prompts for a regex, searches with `rg`, previews matches in `fzf` using `bat`, and opens the selected match in `$EDITOR`.

# ╭──────────────────────────────────────────────────────────╮
# │ Convert a pdf to multiple png images with magick         │
# ╰──────────────────────────────────────────────────────────╯
function pdf2png() {
  local input_pdf="$1"
  local output_prefix="${input_pdf:r}"
  magick -density 300 "$input_pdf" "${output_prefix}.png"
}
# - Takes the input PDF path from the first argument.
# - Uses zsh's `${input_pdf:r}` modifier to remove the file extension for the output prefix.
# - Runs ImageMagick at 300 DPI to export PNG image files.

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
# - Points `opml_file` at the default dotfiles `newsfeed.opml` file.
# - Checks that the OPML file exists before running the command.
# - Launches `newsroom` with `-o` to read feeds from the OPML file.

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
# - Uses the default dotfiles `newsfeed.opml` file.
# - Validates that the OPML file exists before parsing it.
# - Uses `yq` to parse XML and output the nested feed `text` attributes as YAML.

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
# - Requires a package name and prints a usage message if it is missing.
# - Gets raw `tldr` output for the package.
# - Uses `awk` to keep descriptions, pair explanations with commands, and wrap commands in Markdown shell fences.

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
# - Takes a Homebrew formula or cask name from the first argument.
# - Runs `brew info`, extracts the tagline with `sed`, and checks installation status with `grep`.
# - Uses `which` to find the executable path and prints the result as Markdown bullets.

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
# - Requires a package name and prints a usage message if it is missing.
# - Gets raw `tldr` output for the package.
# - Pipes the raw Markdown-like output into `rich --markdown -` for terminal rendering.

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
# - Changes to the dotfiles directory while saving the original directory.
# - Runs `brew bundle install` and `brew bundle cleanup --force` against the Brewfile.
# - Dumps the current Homebrew state to `DumpBrewfile`, then returns to the original directory.

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
# - Creates a temporary file for Yazi to write its final working directory.
# - Runs `yazi` with all provided arguments and `--cwd-file`.
# - Changes the shell directory to Yazi's final directory, then removes the temporary file.

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
# - Points to the Apple Books iCloud documents directory and exits if it is missing.
# - Finds `.epub` directories and `.pdf` files safely with null-delimited output.
# - Prints each title with its format and sorts the combined list case-insensitively.

# ╭──────────────────────────────────────────────────────────╮
# │ Convert an OPML file to a markdown table with yq         │
# ╰──────────────────────────────────────────────────────────╯
function opml2md() {
    local opml_file="$1"

    if [[ -z "$opml_file" ]]; then
        echo "Usage: opml2md <opml-file>" >&2
        return 1
    fi

    if [[ ! -f "$opml_file" ]]; then
        echo "Error: file not found: $opml_file" >&2
        return 1
    fi

    {
        printf '| Title | RSS URL |\n|---|---|\n'
        yq -p=xml -o=tsv '.opml.body.outline[] | [."+@title", ."+@xmlUrl"]' "$opml_file" |
            awk -F '\t' '{
                gsub(/\|/, "\\|", $1)
                gsub(/\|/, "\\|", $2)
                printf "| %s | %s |\n", $1, $2
            }'
    }
}
# - Requires an OPML file argument and validates that the file exists.
# - Prints the Markdown table header before processing feeds.
# - Uses `yq` to parse XML as TSV, then `awk` escapes pipe characters and formats each feed as a Markdown row.
