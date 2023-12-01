{...}:
{
  # ssh agent is managed by 1password
  home.file.".ssh/config".text = ''
    Host *
      AddKeysToAgent yes
      IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
  '';
}
