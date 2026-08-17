{pkgs, ...}:
{
  home = {
    packages = with pkgs; [
      hledger
      hledger-ui
    ];
    sessionVariables = {
      LEDGER_FILE = "~/Finance/main.journal";
    };
  };
}
