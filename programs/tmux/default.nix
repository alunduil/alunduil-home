{ ... }:
{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    clock24 = true;
    escapeTime = 0;
    extraConfig = ''
      set -g status-keys vi
      setw -g monitor-activity on
      setw -g clock-mode-colour white
      bind C-b send-prefix
      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind -n S-down new-window
      bind -n S-left prev
      bind -n S-right next
      bind -n C-S-left swap-window -t -1
      bind -n C-S-right swap-window -t +1
      set -g status "on"
      set -g status-fg "default"
      set -g status-bg "default"
      set -g status-justify "left"
      set -g status-left-length "100"
      set -g status-right-length "100"
      set -g status-right-attr "none"
      set -g status-attr "none"
      set -g status-left-attr "none"
      set -g status-interval 1
      set -g pane-active-border-style fg="default"
      set-option -g message-style fg="default",bg="default,reverse"
      set-option -g message-command-style fg="default",bg="default,reverse"
      setw -g window-status-attr "none"
      setw -g window-status-activity-attr "none"
      setw -g window-status-separator ""
      set -g status-left " #S ❙ "
      set -g status-right " ❙ %FT%T%z ❙ #h"
      setw -g window-status-format "   #I | #W(#{window_panes}) - #{b:pane_current_path} "
      setw -g window-status-current-format " ▶ #I | #W(#{window_panes}) - #{b:pane_current_path} "
      set -sg repeat-time 600
      set -g visual-activity off
      setw -g automatic-rename on
    '';
    historyLimit = 50000;
    keyMode = "vi";
    prefix = "C-b";
    resizeAmount = 10;
    terminal = "screen-256color";
  };
}
