local QBCore = exports['qb-core']:GetCoreObject()

if GetCurrentResourceName() ~= "dextys_hud" then
    print("The folder name must be dextys_hud!")
    return
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) 

        local playerData = QBCore.Functions.GetPlayerData()

        if playerData then
            local cash = playerData.money['cash']  -- Käteinen
            local bank = playerData.money['bank']  -- Pankkitili
            local job = playerData.job.name  -- Työ
            local jobLabel = playerData.job.label  -- Työn nimi
            local gang = playerData.gang.name  -- Jengi (jos on)

            SendNUIMessage({
                action = "setValue",
                key = "cash",
                value = "$" .. tostring(cash)  -- Varmistetaan, että cash on merkkijono
            })
            SendNUIMessage({
                action = "setValue",
                key = "bankmoney",
                value = "$" .. tostring(bank)  -- Varmistetaan, että bank on merkkijono
            })
            SendNUIMessage({
                action = "setValue",
                key = "job",
                value = "Työ - " .. tostring(jobLabel)  -- Varmistetaan, että jobLabel on merkkijono
            })

            -- Lähetetään jengi tiedot vain, jos jengi on olemassa
            if gang and gang ~= "" then
                SendNUIMessage({
                    action = "setValue",
                    key = "gang",
                    value = "Jengi - " .. tostring(gang)  -- Varmistetaan, että gang on merkkijono
                })
                SendNUIMessage({
                    action = "showGang",
                    show = true
                })
            else
                SendNUIMessage({
                    action = "showGang",
                    show = false
                })
            end
        end
    end
end)
