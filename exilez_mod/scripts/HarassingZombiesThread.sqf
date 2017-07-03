/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

private ["_chanceRoll","_nPlayer","_sTime","_group","_count","_groupSize","_vestGroup","_lootGroup","_zombieGroup","_playerObj","_playerName","_playerPosition"];

_groupSize =         (_this select 0) select 0;
_vestGroup =         (_this select 0) select 1;
_lootGroup =         (_this select 0) select 2;
_zombieGroup =       (_this select 0) select 3;

// Wait 2 minutes before starting Harassing Zombie Loop
if (time < 120) exitWith 
{
    if (ExtendedLogging) then 
    {
        diag_log format["ExileZ Mod: Waiting until the server has been up at least 2 minutes (it has currently been up for %1 seconds)",time];
    };
};

// Run the Harassing Zombie Loop
{
	if (Debug) then
	{
		diag_log format["ExileZ Mod: HarassingZombiesLoop: GroupSize : %1 | Vest : %2 | Loot : %3 | ZGroup : %4",_groupSize,_vestGroup,_lootGroup,_zombieGroup];
	};
	
	// Not in Traders
	if ((RemoveZfromTraders) && ((getPosATL _x) call ExileClient_util_world_isInTraderZone)) exitWith {};
	
	// Not in SafeZone
	if ((RemoveZfromTerritory) && ((getPosATL _x) call ExileClient_util_world_isInTerritory)) exitWith {};
	
	// Roll for Harassing Zombie chance..
	_chanceRoll = random (floor 99);
	if (HarassingZedChance <= _chanceRoll) exitWith
	{
		if (ExtendedLogging) then 
		{
			_playerObj = _x;
			_playerName = name _playerObj;
			diag_log format["ExileZ Mod: %1 got lucky, no Harassing Zombie for them.",_playerName];
		};
	};	

	if ((HarassingZombieAtNightOnly && (daytime >= NightStartTime or daytime < NightEndTime)) || !(HarassingZombieAtNightOnly)) then 
	{
		if (isPlayer _x) then 
		{ 
			if (alive _x) then 
			{	
				_playerObj = _x;
				_playerName = name _playerObj;
				_playerPosition = getPos _playerObj;
				
				// Get group from player
				_group = _playerObj getvariable ["group", objNull];
				
				// If nul create group
				if (isNull _group) then 
				{
					_group = [_playerObj] call InitGroup;
					sleep 1;
				};

				// Count number of zombie alive in the group
				_count = {alive _x} count units _group; 	
				
				// Spawn 1 zombie if count is low enough
				if (_count < _groupSize) then 
				{
					nul = [_group,_playerPosition,_vestGroup,_lootGroup,_zombieGroup] spawn SpawnZombie;
					if (ExtendedLogging) then 
					{
						diag_log format["ExileZ Mod: Spawning 1 Harassing Zombie for %1.",_playerName];
					};
				};
			};
		};
	};	
}
forEach (allPlayers - entities "HeadlessClient_F");