# OneDark Palette
set -l foreground abb2bf
set -l selection 5c6370
set -l comment 5c6370
set -l red e06c75
set -l orange ffb86c
set -l yellow d19a66
set -l green 98c379
set -l purple c678dd
set -l cyan 56b6c2
set -l pink c678dd
set -l blue 5BA5E1

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $blue
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_match --background=$selection
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $blue
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
