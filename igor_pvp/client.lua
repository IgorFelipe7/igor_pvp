-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
    

local Proxy = module("vrp","lib/Proxy")
local Tunnel = module("vrp","lib/Tunnel")

local config = module(GetCurrentResourceName(),"config")

local vRP = Proxy.getInterface("vRP")

local IgorS = Tunnel.getInterface('igor_pvp')

Igor = {}
Tunnel.bindInterface("igor_pvp",Igor)

Pistola = false
Rifle = false

-----------------------------------------------------------------------------------------------------------------------------------------
-- Blip Concessionaria
-----------------------------------------------------------------------------------------------------------------------------------------

CreateThread(function()
    repeat
        IgorWait = 1000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local distance = #(coords - config.Localizacoes)
        if distance <= 10.0 then
            IgorWait = 1
            DrawMarker(30,config.Localizacoes.x,config.Localizacoes.y,config.Localizacoes.z-0.6,0,0,0,0.0,0,0,0.8,0.8,0.8,255,140,0,50,0,0,0,1)
            if distance <= 2.0 then
                if IsControlJustPressed(0, 38) then
                    OpenPvp()
                end
            end
        end 
        Wait(IgorWait)
    until false
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Pistola
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("Pistola", function(data, cb)

    CloseNui()

    local ped = PlayerPedId()
    Pistola = true

    IgorS.setWeapons()

    local quantidade = #(config.LocalPistola)
    local numero = math.random(quantidade)
    SetEntityCoords(ped, config.LocalPistola[numero].x,config.LocalPistola[numero].y,config.LocalPistola[numero].z)

    RemoveAllPedWeapons(ped, true)

    for k,v in pairs(config.Pistolas) do
        GiveWeaponToPed(ped, GetHashKey(v), 1000, true, false)
    end
    
end)

CreateThread(function()
    repeat
        local ped = PlayerPedId()
        if Pistola then
            local vida = GetEntityHealth(ped)
            if vida <= 101 then
                SetEntityHealth(ped, 400)
                local quantidade = #(config.LocalPistola)
                local numero = math.random(quantidade)
                SetEntityCoords(ped, config.LocalPistola[numero].x,config.LocalPistola[numero].y,config.LocalPistola[numero].z)
            end
        end
        Wait(10000)
    until false
end)

CreateThread(function()
    repeat
        if Pistola or Rifle then
            TriggerEvent('Notify', 'aviso', 'Para sair, digite /sair')
        end
        Wait(120000)
    until false
end)

RegisterCommand('sair', function(source)
    local ped = PlayerPedId()
    if Pistola or Rifle then

        RemoveAllPedWeapons(ped, true)

        SetEntityHealth(ped, 400)
        SetEntityCoords(ped, config.Localizacoes)

        local sucess, table = IgorS.Sair()
        if sucess then
            for k,v in pairs(table) do
                if k then
                    GiveWeaponToPed(ped, GetHashKey(k), tonumber(v.ammo), false, false)
                end
            end
        end

        IgorS.DelTable()

        Pistola = false
        Rifle = false
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Rifle
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("Fuzil", function(data, cb)

    CloseNui()

    local ped = PlayerPedId()
    Rifle = true

    IgorS.setWeapons()

    local quantidade = #(config.LocalRifle)
    local numero = math.random(quantidade)
    SetEntityCoords(ped, config.LocalRifle[numero].x,config.LocalRifle[numero].y,config.LocalRifle[numero].z)

    RemoveAllPedWeapons(ped, true)

    for k,v in pairs(config.Rifles) do
        GiveWeaponToPed(ped, GetHashKey(v), 1000, true, false)
    end
    
end)

CreateThread(function()
    repeat
        local ped = PlayerPedId()
        if Rifle then
            local vida = GetEntityHealth(ped)
            if vida <= 101 then
                SetEntityHealth(ped, 400)
                local quantidade = #(config.LocalRifle)
                local numero = math.random(quantidade)
                SetEntityCoords(ped, config.LocalRifle[numero].x,config.LocalRifle[numero].y,config.LocalRifle[numero].z)
            end
        end
        Wait(10000)
    until false
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Abrir Nui
-----------------------------------------------------------------------------------------------------------------------------------------

function OpenPvp()
    SendNUIMessage({
        type = "open"
    })
    StartScreenEffect("MenuMGSelectionIn", 0, true)
    SetNuiFocus(true,true)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- Fechar Nui
-----------------------------------------------------------------------------------------------------------------------------------------

function CloseNui()
    SendNUIMessage({
        type = "close"
    })
    StopScreenEffect("MenuMGSelectionIn")
    SetNuiFocus(false, false)
end

RegisterNUICallback("Fechar", function(data, cb)
    CloseNui()       
end)
