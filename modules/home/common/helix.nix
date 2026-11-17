{ pkgs, ... }:
let
  # Light-only variant so it matches pandoc's (light) syntax highlighting
  github-css = pkgs.fetchurl {
    url = "https://cdn.jsdelivr.net/npm/github-markdown-css@5.8.1/github-markdown-light.min.css";
    hash = "sha256-iMLsBNTE7RMkZeWlMv8UsVfeY/Z2576Pzx0m6odDE8A=";
  };

  template = pkgs.writeText "github.html" ''
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>$pagetitle$</title>
      <style>
        $highlighting-css$
        body { margin: 0; background: #fff; }
        .markdown-body { box-sizing: border-box; max-width: 980px; margin: 0 auto; padding: 45px; }
        .markdown-body .sourceCode { background: transparent; }
      </style>
      <link rel="stylesheet" href="${github-css}">
    </head>
    <body>
      <article class="markdown-body">
    $body$
      </article>
    </body>
    </html>
  '';

  # Render a markdown file to HTML and open it in the browser (bound to space-o in helix)
  md-preview = pkgs.writeShellApplication {
    name = "md-preview";
    runtimeInputs = [ pkgs.pandoc ];
    text = ''
      name="$(basename "$1")"
      out="/tmp/$name.html"
      pandoc --from gfm --standalone --embed-resources \
        --template ${template} --highlight-style pygments \
        --metadata pagetitle="$name" "$1" -o "$out"
      if command -v xdg-open >/dev/null; then
        xdg-open "$out" >/dev/null 2>&1 &
      else
        open "$out"
      fi
    '';
  };
in
{
  programs.helix = {
    enable = true;
  };
  home.packages = [ md-preview ];
  xdg.configFile."helix/config.toml".source = ../../../dotfiles/.config/helix/config.toml;
  xdg.configFile."helix/languages.toml".source = ../../../dotfiles/.config/helix/languages.toml;
}
