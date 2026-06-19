{ pkgs, ... }:

{
  users.users.riki = {
    isNormalUser = true;
    description = "riki";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICdoRyVI03LsqevvuNXq+fIRrqdcqACkTHB0gDwC4btj rickunderstars@gmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvLHOn57SHTqJl8/GC3SGBJP3/Wbartww29PpOyHQ3n rickunderstars@gmail.com"
    ];
    extraGroups = [
      "networkmanager"
      "bluetooth"
      "wheel"
      "openrazer"
      "dialout"
      "uucp"
      "audio"
      "video"
      "input"
      "plugdev"
      "storage"
      "uinput"
    ];
    shell = pkgs.fish;
  };

  services.getty = {
    autologinUser = "riki";
    autologinOnce = true;
    greetingLine = ''


      b.             8  8 8888 `8.`8888.      ,8'  ,o888888o.       d888888o.
      888o.          8  8 8888  `8.`8888.    ,8'. 8888     `88.   .`8888:' `88.
      Y88888o.       8  8 8888   `8.`8888.  ,8',8 8888       `8b  8.`8888.   Y8
      .`Y888888o.    8  8 8888    `8.`8888.,8' 88 8888        `8b `8.`8888.
      8o. `Y888888o. 8  8 8888     `8.`88888'  88 8888         88  `8.`8888.
      8`Y8o. `Y88888o8  8 8888     .88.`8888.  88 8888         88   `8.`8888.
      8   `Y8o. `Y8888  8 8888    .8'`8.`8888. 88 8888        ,8P    `8.`8888.
      8      `Y8o. `Y8  8 8888   .8'  `8.`8888.`8 8888       ,8P 8b   `8.`8888.
      8         `Y8o.`  8 8888  .8'    `8.`8888.` 8888     ,88'  `8b.  ;8.`8888
      8            `Yo  8 8888 .8'      `8.`8888.  `8888888P'     `Y8888P ,88P'


    '';

    #          _              _     _      _              _            _
    #         /\ \     _     /\ \ /_/\    /\ \           /\ \         / /\
    #        /  \ \   /\_\   \ \ \\ \ \   \ \_\         /  \ \       / /  \
    #       / /\ \ \_/ / /   /\ \_\\ \ \__/ / /        / /\ \ \     / / /\ \__
    #      / / /\ \___/ /   / /\/_/ \ \__ \/_/        / / /\ \ \   / / /\ \___\
    #     / / /  \/____/   / / /     \/_/\__/\       / / /  \ \_\  \ \ \ \/___/
    #    / / /    / / /   / / /       _/\/__\ \     / / /   / / /   \ \ \
    #   / / /    / / /   / / /       / _/_/\ \ \   / / /   / / /_    \ \ \
    #  / / /    / / /___/ / /__     / / /   \ \ \ / / /___/ / //_/\__/ / /
    # / / /    / / //\__\/_/___\   / / /    /_/ // / /____\/ / \ \/___/ /
    # \/_/     \/_/ \/_________/   \/_/     \_\/ \/_________/   \_____\/

    #  ,ggg, ,ggggggg,                         _,gggggg,_          ,gg,
    # dP""Y8,8P"""""Y8b                      ,d8P""d8P"Y8b,       i8""8i
    # Yb, `8dP'     `88                     ,d8'   Y8   "8b,dP    `8,,8'
    #  `"  88'       88   gg                d8'    `Ybaaad88P'     `88'
    #      88        88   ""                8P       `""""Y8       dP"8,
    #      88        88   gg      ,gg,   ,gg8b            d8      dP' `8a
    #      88        88   88     d8""8b,dP" Y8,          ,8P     dP'   `Yb
    #      88        88   88    dP   ,88"   `Y8,        ,8P' _ ,dP'     I8
    #      88        Y8,_,88,_,dP  ,dP"Y8,   `Y8b,,__,,d8P'  "888,,____,dP
    #      88        `Y88P""Y88"  dP"   "Y88   `"Y8888P"'    a8P"Y88888P"
  };
}
