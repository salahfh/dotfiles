from qutebrowser.config.configfiles import ConfigAPI  # type:ignore
from qutebrowser.config.config import ConfigContainer  # type:ignore

# Initialization
config = config  # type: ConfigAPI
c = c  # type: ConfigContainer


# ------------------------------------------------------------------------------------------
# General
# ------------------------------------------------------------------------------------------
# Auto load configs are start
config.load_autoconfig(True)

# Tabs bar position
c.tabs.position = "bottom"

# c.tabs.background = True

# Editor to use when pressing Ctrl+E on a text field (e.g., Neovim/Vim in a terminal)
c.editor.command = ["ghostty", "-e", "nvim", "{}"]

# Smooth scrolling
c.scrolling.smooth = True

# Enable Native Adblocker (requires `adblock` python package installed)
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
]

# Search engines shortcuts
c.url.searchengines = {
    "DEFAULT": "https://google.com/search?q={}",
    "!d": "https://duckduckgo.com/?q={}",
    "!w": "https://en.wikipedia.org/wiki/{}",
    "!yt": "https://youtube.com/results?search_query={}",
    "!gh": "https://github.com/search?q={}",
}

# Start/Default page
c.url.start_pages = ["https://google.com"]
c.url.default_page = "https://google.com"


# --- 1. PERFORMANCE & CORE ADJUSTMENTS ---
# Enable the hardware-accelerated GPU rendering
c.qt.args = ["enable-gpu-memory-buffer-video-frames", "enable-accelerated-video-decode"]
# ------------------------------------------------------------------------------------------
# Keybindings
# ------------------------------------------------------------------------------------------
# Bindings for Normal Mode

# Fast config reloading
config.bind("<space>r", "config-source")

# Cycle through tabs quickly
config.bind("gT", "tab-prev")
config.bind("gt", "tab-next")


# Use 't' to open a new tab with the default page (instead of 'gT')
config.bind("t", "open -t")


# Spawn an external video player (like mpv) with ',m'
config.bind("<space>m", "spawn mpv {url}")

# Quick Escape to Firefox
config.bind("<Alt+f>", "spawn -d firefox-developer-edition {url} ;; tab-close")


# Wayback Machine Integration
# If a page drops a 404 error, press '<space>w' to view its most recent archive
config.bind("<space>w", "open http://web.archive.org/{url}")


# --- Completion Menu Navigation ---
# Bind Ctrl+N and Ctrl+P to cycle through options in the command menu
config.bind("<Ctrl+n>", "completion-item-focus next", mode="command")
config.bind("<Ctrl+p>", "completion-item-focus prev", mode="command")


config.bind(
    "<space>yd", """spawn -v -m bash -c 'cd ~/Videos/yt && yt-dlp "$@"' _ {url}"""
)


# ------------------------------------------------------------------------------------------
# Looks and Theme
# ------------------------------------------------------------------------------------------
# --- 2. FONTS & APPEARANCE ---
# Standardize clean, modern fonts across the UI
c.fonts.default_family = "JetBrains Mono"
c.fonts.default_size = "10pt"
c.fonts.hints = "bold 11pt JetBrains Mono"


# Minimalist tabs layout
c.tabs.position = "top"
c.tabs.show = "multiple"  # Hides tab bar if only 1 tab is open
c.tabs.favicons.show = "never"


# --- 3. PRIVACY & SMOOTH BEHAVIOR ---
c.content.cookies.accept = "no-3rdparty"
c.content.geolocation = False
c.content.notifications.enabled = "ask"

# ------------------------------------------------------------------------------------------
# Gruvbox Theme
# ------------------------------------------------------------------------------------------
config.source("gruvbox.py")
