# ExileZ Crashes by [FPS]kuplion - Based on Heli Crashes by Darth Rogue

This is a modification of Heli Crashes by Darth Rogue to allow it to work with ExileZ Mod and spawn Zombies around the crashes, much like the classic DayZ Mod crashsites.

## Features

Classic DayZ Mod style crashsites

Loot scattered around the wrecks

Dynamic Zombie spawning

## Requirements

ExileZ Mod (http://www.exilemod.com/topic/22531-release-exilez-mod-by-fpskuplion-based-on-exilez-20-by-patrix87/)

Zombies and Demons (http://steamcommunity.com/sharedfiles/filedetails/?id=501966277)

ExileMod (http://www.exilemod.com/downloads/)

## Upcoming Changes

Code optimisation

More wrecks / loot positions

## Download

https://github.com/kuplion/ExileZ-Crashes

## Installation

1: Edit the main settings in 'exilez_crashes\config.sqf'.

2: Edit 'ExileClient_system_lootManager_thread_spawn.sqf' to add any additional wreck classes (Line 23).

3: Add 'ExileClient_system_lootManager_thread_spawn.sqf' to your CfgExileCustomCode.

4: Edit 'wreck_loot_positions.hpp' with any additional wrecks and loot positions.

5: Add 'wreck_loot_positions.hpp' to your 'exile_server_config.pbo' and '#include "wreck_loot_positions.hpp"' to the top of 'class CfgBuildings' just after the bracket (Line 28).

6: Pack 'exilez_crashes.pbo' with either PBO Manager 1.4b x64 (http://www.armaholic.com/page.php?id=16369) or Eliteness/MikeRo tools if you have them.

7: Repack 'exile_server_config.pbo'.

8: Place 'exilez_crashes.pbo' in your '@ExileServer\addons\' folder.

## Donations

If you feel so inclined, donations can be sent to PayPal donate@FriendlyPlayerShooting.com

## Credits

Original code base by Darth_Rogue, Vampire, xBowBii, and Richie

## License
Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
