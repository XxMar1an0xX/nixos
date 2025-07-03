{pkgs, lib, config, ...}: {
  programs.rofi = {
    enable = true;
    cycle = true;
    extraConfig = {

modi = ["drun" "window" "run"];
      icon-theme = "Papyrus-Dark";
      show-icons = true;
      drun-display-format = "{icon} {name}";
    display-drun = " ";
    display-run = " ";
    display-window = " ";

      kb-row-up = "Up,Control+k";
      kb-row-down = "Down,Control+j";
      kb-accept-entry = "Control+z,Control+y,Return,KP_Enter";
      kb-remove-to-eol = "";
      kb-move-char-back = "Control+b";
      kb-remove-char-back = "BackSpace";
      kb-move-char-forward = "Control+f";
      kb-mode-complete = "Control+o";
    };
    # theme = ".local/share/rofi/themes/custom1.rasi";
    theme = "rofi-custom";
    terminal = "\${pkgs.kitty}/bin/kitty";
  };
  home.file.".local/share/rofi/themes/rofi-custom.rasi".text = let
    stylix = config.lib.stylix.colors;
  in ''
      * {
    bg: #${stylix.base01};
    hv: #${stylix.base04}; 
    primary: #${stylix.base0D}; 
    ug: #${stylix.base03};
    font: "Monospace 11";
    background-color: @bg;
    //dark: @bg;
    border: 0px;
    kl: #${stylix.base06};
    black: #${stylix.base00};

    transparent: rgba(${stylix.base02-rgb-r},${stylix.base02-rgb-g},${stylix.base02-rgb-b},0);
}

window {
    width: 700;
    /*since line wont work with height, i comment it out 
    if you rather control the size via height
    just comment it out */
    //height: 500;

    orientation: horizontal;
    location: center;
    anchor: center;
    transparency: "screenshot";
    border-color: @transparent;   
    border: 0px;
    border-radius: 6px;
    spacing: 0;
    children: [ mainbox ];
}

mainbox {
    spacing: 0;
    children: [ inputbar, message, listview ];
}

inputbar {
    color: @kl;
    padding: 11px;
    border: 3px 3px 2px 3px;
   border-color: @primary;
    border-radius: 6px 6px 0px 0px;
}

message {
    padding: 0;
    border-color: @primary;
    border: 0px 1px 1px 1px;
}

entry, prompt, case-indicator {
    text-font: inherit;
    text-color: inherit;
}

entry {
    cursor: pointer;
}

prompt {
    margin: 0px 5px 0px 0px;
}

listview {
    layout: vertical;
    //spacing: 5px;
    padding: 8px;
    lines: 7;
    columns: 1;
    border: 0px 3px 3px 3px; 
    border-radius: 0px 0px 6px 6px;
    border-color: @primary;
    dynamic: false;
}

element {
    padding: 2px;
    vertical-align: 1;
   color: @kl;
    font: inherit;
}

element-text {
    background-color: inherit;
    text-color: inherit;
    vertical-align: 0.5;
}

element selected.normal {
    color: @black;
    background-color: @hv;
}

element normal active {
    background-color: @hv;
   color: @black;
}

element-icon {
    background-color: inherit;
    text-color: inherit;
    size: 2.5em;
}

element normal urgent {
    background-color: @primary;
}

element selected active {
    background: @hv;
    foreground: @bg;
}

button {
    padding: 6px;
    color: @primary;
    horizonatal-align: 0.5;

    border: 2px 0px 2px 2px;
    border-radius: 4px 0px 0px 4px;
    border-color: @primary;
}

button selected normal {
    border: 2px 0px 2px 2px;
    border-color: @primary;
}
    '';
}
