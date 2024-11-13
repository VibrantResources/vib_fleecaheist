# vib-banks
Fleeca bank heist resource

# DEPENDENCIES

- QBCore
- ox_lib
- ox_inventory
- ox_target
- bl_ui

# What does this resource provide?

- Ability to hack in & rob preset locations with Fleeca vaults
- Ability to load hacking software onto [Config.HackerItem] and match it with a vault to begin the hack
- Armed guard response to provide interaction before player police arrive
- Security level upgrading of individual vaults, providing slower opening doors and quicker closing times
- Camera access from a configurable locations
- Configurable rewards, locations, models and more

# Why is there no middle table loot or cash trolleys like other bank heist resources?

Fleeca are small banks, with small holdings. The table in the middle would typically be used to stand stuff on when opening your own safety deposit box NOT for storing piles or trolleys of cash

# Why aren't you using [marked_bills] for your currency of dirty money?

Because we don't like them. We prefer the use of the dirty money item

# DRILLING MINIGAME REQUIREMENTS

https://github.com/meta-hub/fivem-drilling?tab=readme-ov-file

https://github.com/meta-hub/meta_libs/releases

Both of these are required for the mini game to work - If you'd rather stick with the progressbar then uncomment the progress bar code block from the client/client file and re-comment out the drilling block

# HACKING MINIGAMES REQUIREMENT

https://github.com/Byte-Labs-Studio/bl_ui

# Thanks to Baubles for the suggestions