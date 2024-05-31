local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state['isLoggedIn']

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('ns-achievements:CheckDB')
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then
        return
    end
    while not isLoggedIn do Wait(100) end
    TriggerServerEvent('ns-achievements:CheckDB')
end)

RegisterNetEvent('ns-achievements:OpenAchievements',function()
    OpenAchievements()
end)

function OpenAchievements()
    QBCore.Functions.TriggerCallback('ns-achievements:GetAchievements', function(achievements)
        if achievements then
            local Array = {}
            for key, value in pairs(achievements) do
                value.code = key
                table.insert(Array, value)
            end
            SendNUIMessage({
                action = "open-achievements",
                Achievements = Array
            })
            SetNuiFocus(true, true)
        else
            print("error getting achievements")
        end
    end)
end

RegisterNetEvent('ns-achievements:AchievementEarned',function(code)
    if not Config.Achievements[code] then return print("Error Wrong Code") end
    local timer = 10000
    if Config.NotificationTimeout ~= nil then
        timer = Config.NotificationTimeout * 1000
    end
    SendNUIMessage({
        action = "achievement-earned",
        Image = Config.Achievements[code].imgSrc,
        Title = Config.Achievements[code].title,
        Timer = timer
    })
end)

RegisterCommand(Config.OpenUICommand,   function() OpenAchievements() end, false)

RegisterNUICallback('close-ui', function(data, cb)
    SetNuiFocus(false, false)
end)