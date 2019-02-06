ESX               = nil

EnableLicense     = true

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function LoadOwnedLicenses (source)
        TriggerEvent('esx_license:getLicenses', source, function (licenses)
        TriggerClientEvent('NoLicense:loadLicenses', source, licenses)
    end)
end
  
if EnableLicense == true then
        AddEventHandler('esx:playerLoaded', function (source)
        LoadOwnedLicenses(source)
    end)
end