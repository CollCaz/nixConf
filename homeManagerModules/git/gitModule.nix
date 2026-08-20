{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
	    user = {
	      name = "CollCaz";
	      email = "62307305+CollCaz@users.noreply.github.com";
	    };
	    aliases = {
	      pu = "push";
	      co = "checkout";
	      cm = "commit";
	    };
    };
  };
}
