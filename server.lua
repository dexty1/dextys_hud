local QBCore = exports['qb-core']:GetCoreObject()


if GetCurrentResourceName() ~= "dextys_hud" then
    print("The folder name must be dextys_hud!")
    return
end


RegisterCommand('giveMoney', function(source, args, rawCommand)
    local player = QBCore.Functions.GetPlayer(source)
    local amount = tonumber(args[1]) or 0
    if amount > 0 then
        player.Functions.AddMoney('cash', amount)  -- Lisää rahaa pelaajalle
        TriggerClientEvent('QBCore:Client:SetPlayerData', source)  -- Lähetetään tiedot päivitettäväksi HUD:iin
    end
end, false)

-- Asetetaan pelaajalle työ komennolla:
RegisterCommand('setJob', function(source, args, rawCommand)
    local player = QBCore.Functions.GetPlayer(source)
    local job = args[1] or 'unemployed'  -- Asetetaan työ "työtön", jos ei anneta arvoa
    player.Functions.SetJob(job, 0)  -- Asetetaan pelaajalle uusi työ
    TriggerClientEvent('QBCore:Client:SetPlayerData', source)  -- Lähetetään tiedot päivitettäväksi HUD:iin
end, false)
