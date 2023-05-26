-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD

local Proxy = module("vrp","lib/Proxy")
local Tunnel = module("vrp","lib/Tunnel")
local vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- Config
-----------------------------------------------------------------------------------------------------------------------------------------

local cfg = {}

cfg.Localizacoes = vec3(-269.0, -956.01, 31.23)

cfg.LocalPistola = { -- Onde o player vai ser teletransportado se usar pistola
    { ['x'] = 1939.362, ['y'] = 3791.913, ['z'] = 32.122},
    { ['x'] = 1908.541, ['y'] = 3726.505, ['z'] = 32.678},
    { ['x'] = 1745.329, ['y'] = 3699.525, ['z'] = 34.362},
    { ['x'] = 1853.184, ['y'] = 3778.560, ['z'] = 33.060},
    { ['x'] = 1767.899, ['y'] = 3825.877, ['z'] = 34.395},
    { ['x'] = 1703.395, ['y'] = 3756.474, ['z'] = 34.336},
    { ['x'] = 1722.448, ['y'] = 3846.608, ['z'] = 34.793},
}

cfg.Pistolas = { -- Pistolas que virao ao player
    'WEAPON_PISTOL_MK2',
    'WEAPON_PISTOL',
    'WEAPON_COMBATPISTOL',
}

cfg.LocalRifle = { -- Onde o player vai ser teletransportado se usar pistola
    { ['x'] = 1939.362, ['y'] = 3791.913, ['z'] = 32.122},
    { ['x'] = 1908.541, ['y'] = 3726.505, ['z'] = 32.678},
    { ['x'] = 1745.329, ['y'] = 3699.525, ['z'] = 34.362},
    { ['x'] = 1853.184, ['y'] = 3778.560, ['z'] = 33.060},
    { ['x'] = 1767.899, ['y'] = 3825.877, ['z'] = 34.395},
    { ['x'] = 1703.395, ['y'] = 3756.474, ['z'] = 34.336},
    { ['x'] = 1722.448, ['y'] = 3846.608, ['z'] = 34.793},
}

cfg.Rifles = { -- Pistolas que virao ao player
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_CARBINERIFLE',
    'WEAPON_ASSAULTRIFLE_MK2',
    'WEAPON_CARBINERIFLE_MK2',
}


return cfg