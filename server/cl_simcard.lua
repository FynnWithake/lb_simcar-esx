RegisterNetEvent('simcard:useSimCard')
AddEventHandler('simcard:useSimCard', function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'simcard_input', {
        title = "Gib eine neue Nummer ein.."
    }, function(data, menu)
        local newPhoneNumber = tonumber(data.value)

        if newPhoneNumber == nil or newPhoneNumber < 10000 or newPhoneNumber > 90000000 then
            ESX.ShowNotification("Die Nummer muss zwischen 10000 und 90000000 liegen.")
        else
            menu.close()
            TriggerServerEvent('simcard:updatePhoneNumber', newPhoneNumber)
        end
    end, function(data, menu)
        menu.close()
    end)
end)
