ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('simcard', function(source)
    TriggerClientEvent('simcard:useSimCard', source)
end)

RegisterNetEvent('simcard:updatePhoneNumber')
AddEventHandler('simcard:updatePhoneNumber', function(newPhoneNumber)
    local xPlayer = ESX.GetPlayerFromId(source)
    local license = xPlayer.identifier

    exports.oxmysql:execute('SELECT COUNT(*) as count FROM phone_phones WHERE phone_number = ?', {newPhoneNumber}, function(result)
        if result[1] and result[1].count > 0 then
            TriggerClientEvent("md_hud-v2:notify", source, "error", "Fehler", "Diese Telefonnummer ist bereits vergeben!", "FEHLER", 5000)
        else
            exports.oxmysql:execute('UPDATE phone_phones SET phone_number = ? WHERE owner_id = ?', {newPhoneNumber, license}, function(result)
                local affectedRows = result and result.affectedRows or 0

                if affectedRows > 0 then
                    xPlayer.removeInventoryItem('simcard', 1)
                    xPlayer.kick("Deine Nummer hat sich geändert!")
                else
                    TriggerClientEvent("md_hud-v2:notify", source, "error", "Fehler", "Bei der Änderung ist etwas fehlgeschlagen!", "FEHLER", 5000)
                end
            end)
        end
    end)
end)
