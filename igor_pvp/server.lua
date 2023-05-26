-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
-- https://discord.gg/V7KQCcQFXD
    
-----------------------------------------------------------------------------------------------------------------------------------------
-- Proxy, Module
-----------------------------------------------------------------------------------------------------------------------------------------

local Proxy = module("vrp","lib/Proxy")
local Tunnel = module("vrp","lib/Tunnel")
local vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")
local config = module(GetCurrentResourceName(),"config")

local Igor = {}
Tunnel.bindInterface("igor_pvp",Igor)

IgorC = Tunnel.getInterface("igor_pvp")

-----------------------------------------------------------------------------------------------------------------------------------------
-- Pistola
-----------------------------------------------------------------------------------------------------------------------------------------

vRP.prepare('igor/SetPistol', 'INSERT INTO igor_pvp(user_id, weapons) VALUES(@user_id, @weapons)')
vRP.prepare('igor/GetWeapons', 'SELECT * FROM igor_pvp WHERE user_id = @user_id')
vRP.prepare('igor/DelTable', 'DELETE FROM igor_pvp WHERE user_id = @user_id')

function Igor.setWeapons(weapon)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local data = vRP.getUserDataTable(user_id)
        if data then
            if data['weapons'] then
                vRP.execute('igor/SetPistol', {
                    user_id = user_id,
                    weapons = json.encode(data['weapons'])
                })
            end
        end
        if weapon then
            SetPlayerRoutingBucket(source, 900)
        else
            SetPlayerRoutingBucket(source, 800)
        end
    end
end

function Igor.Sair()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local result = vRP.query('igor/GetWeapons', {
            user_id = user_id
        })
        if result then
            if result[1] then
                if result[1].weapons then
                    SetPlayerRoutingBucket(source, 0)
                    return true, json.decode(result[1].weapons)
                end
            end
        end
        SetPlayerRoutingBucket(source, 0)
        return false
    end
end

function Igor.DelTable()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.execute('igor/DelWeapons', {
            user_id = user_id
        })
        
    end
end