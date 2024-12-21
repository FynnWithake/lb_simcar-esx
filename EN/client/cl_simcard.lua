RegisterNetEvent('simcard:useSimCard')
AddEventHandler('simcard:useSimCard', function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'simcard_input', {
        title = "Enter a new nubmer..."
    }, function(data, menu)
        local newPhoneNumber = tonumber(data.value)

        if newPhoneNumber == nil or newPhoneNumber < 10000 or newPhoneNumber > 90000000 then
            ESX.ShowNotification("You number needs to be between 10000 and 90000000.")
        else
            menu.close()
            TriggerServerEvent('simcard:updatePhoneNumber', newPhoneNumber)
        end
    end, function(data, menu)
        menu.close()
    end)
end)
