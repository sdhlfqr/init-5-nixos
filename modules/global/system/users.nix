{ ... }: {
  users.users = builtins.mapAttrs (name: _: import (../profiles + "/${profile_name}/users/${name}/home/${profile_name}" + ".nix")) (builtins.readDir ../profiles "/${profile_name}/users");
}
