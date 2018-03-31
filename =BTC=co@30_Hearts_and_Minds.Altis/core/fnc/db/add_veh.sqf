params ["_veh"];

if !(isServer) exitWith {
    _veh remoteExec ["btc_fnc_db_add_veh", 2];
};

btc_vehicles pushBackUnique _veh;
_veh addMPEventHandler ["MPKilled", {
	if (isServer) then {_this call btc_fnc_eh_veh_killed};
}];
if ((isNumber (configfile >> "CfgVehicles" >> typeof _veh >> "ace_fastroping_enabled")) && !(typeof _veh isEqualTo "RHS_UH1Y_d")) then {
	[_veh] call ace_fastroping_fnc_equipFRIES
};
