{pkgs, ...}:
{
  home = {
    packages = with pkgs; [
      hledger
      hledger-ui
    ];
    sessionVariabels = {
      LEDGER_FILE = "~/Finance/main.journal";
    };
  };
}
