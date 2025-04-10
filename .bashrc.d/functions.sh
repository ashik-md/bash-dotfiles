# Create a new directory and enter it
mkcd() {
    mkdir -p "$1"
    cd "$1" || return
}

# Extracts various types of archive files into a newly created directory based on the archive name.
# Supported formats include: .tar, .zip, .rar, .gz, .bz2, .xz, .lz, .zst, and their compressed variants.

extract() {
    check_tool() {
        command -v "$1" >/dev/null 2>&1 || { echo "Install '$2' package"; return 1; }
    }

    if [ -f "$1" ]; then
        base_name=$(basename "$1")
        dir_name="${base_name%.*}"

        mkdir -p "$dir_name"

        case "$1" in
            *.tar.bz2)   tar xjf "$1" -C "$dir_name" ;;
            *.tar.gz)    tar xzf "$1" -C "$dir_name" ;;
            *.tar.xz)    tar xf "$1" -C "$dir_name" ;;
            *.tar.lz)    tar --lzip -xf "$1" -C "$dir_name" ;;
            *.tar.lzma)  tar --lzma -xf "$1" -C "$dir_name" ;;
            *.tar)       tar xf "$1" -C "$dir_name" ;;
            *.tbz2)      tar xjf "$1" -C "$dir_name" ;;
            *.tgz)       tar xzf "$1" -C "$dir_name" ;;
            *.gz)        gunzip -c "$1" > "$dir_name/${base_name%.gz}" ;;
            *.bz2)       bunzip2 -c "$1" > "$dir_name/${base_name%.bz2}" ;;
            *.zip)       unzip -d "$dir_name" "$1" ;;
            *.rar)       check_tool unrar "unrar" || return; unrar x "$1" "$dir_name" ;;
            *.Z)         check_tool uncompress "ncompress" || return; uncompress -c "$1" > "$dir_name/${base_name%.Z}" ;;
            *.lz)        check_tool lzip "lzip" || return; lzip -d "$1" -o "$dir_name/${base_name%.lz}" ;;
            *.xz)        check_tool unxz "xz-utils" || return; unxz -c "$1" > "$dir_name/${base_name%.xz}" ;;
            *.zst)       check_tool unzstd "zstd" || return; unzstd -o "$dir_name/${base_name%.zst}" "$1" ;;
            *)           echo "'$1' cannot be extracted." ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}