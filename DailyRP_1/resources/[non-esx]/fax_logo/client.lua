-- Made by FAXES, Based off HRC
AddEventHandler('onClientMapStart', function()
  Citizen.CreateThread(function()
    local display = true
    local startTime = GetGameTimer()
    local delay = 70000 -- ms

    TriggerEvent('logo:display', true)

    while display do
      Citizen.Wait(1)
      if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
        display = false
        TriggerEvent('logo:display', false)
      end
    end
  end)
end)

RegisterNetEvent('logo:display')
AddEventHandler('logo:display', function(value)
  SendNUIMessage({
    type = "logo",
    display = value
  })
end)

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end