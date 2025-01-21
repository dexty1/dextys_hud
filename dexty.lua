local QBCore = exports['qb-core']:GetCoreObject()

if GetCurrentResourceName() ~= "dextys_hud" then
    print("Kansion nimen oltava dextys_hud!")
    return
end


Citizen.CreateThread(function()
    -- Odotetaan, että pelaajan data on ladattu
    while true do
        Citizen.Wait(1000)

        local playerData = QBCore.Functions.GetPlayerData()

        if playerData and playerData.money then
            local cash = playerData.money['cash'] or 0  -- Käteinen, jos ei ole, asetetaan 0
            local bank = playerData.money['bank'] or 0  -- Pankkitili, jos ei ole, asetetaan 0
            local job = playerData.job.name or "Työtön"  -- Työ, jos ei ole, asetetaan "Työtön"
            local jobLabel = playerData.job.label or "Työtön"  -- Työn nimi
            local jobGrade = playerData.job.grade.name or ""  -- Työn arvo, esimerkiksi "Johtaja"

            -- Yhdistetään työ ja arvo
            local jobTitle = jobLabel
            if jobGrade ~= "" then
                jobTitle = jobTitle .. " - " .. jobGrade  -- Lisää työn arvo, esim. "Johtaja"
            end

            -- Päivitetään HUD:n tiedot
            SendNUIMessage({
                action = "setValue",
                key = "cash",
                value = "$" .. tostring(cash)
            })
            SendNUIMessage({
                action = "setValue",
                key = "bankmoney",
                value = "$" .. tostring(bank)
            })
            -- Lähetetään yhdistetty työ ja arvo
            SendNUIMessage({
                action = "setValue",
                key = "job",
                value = jobTitle  -- Lähetetään yhdistetty työ ja arvo
            })
        end
    end
end)
