_: {
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
    ignores = [
      ".build/"
      "!.gitignore"
    ];
  };
}
