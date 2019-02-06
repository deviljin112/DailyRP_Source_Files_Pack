ESX = nil
local IsOnDrug = false
local DrugLevel = -1

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- Add valeus to the esx_status
AddEventHandler('esx_status:loaded', function(status)

  TriggerEvent('esx_status:registerStatus', 'drug', 0, '#b139e5', 
    function(status)
      if status.val > 0 then
        return true
      else
        return false
      end
    end,
    function(status)
      status.remove(1500)
    end
  )

--Control how much drugs is taking
Citizen.CreateThread(function()
  while true do
      Wait(1000)
      TriggerEvent('esx_status:getStatus', 'drug', function(status)
  
  if status.val > 0 then
      local start = true

      if IsOnDrug then
         start = false
      end
  
  local level = 0

    if 2800000 > status.val and status.val > 0 then
        level = 0
    else
        overdose() 
    end

  if level ~= DrugLevel then
       Drug(level, start)
  end

  IsOnDrug = true
       DrugLevel = level
  end

  if status.val == 0 then
     if IsOnDrug then
        Normal()
     end

     IsOnDrug = false
        DrugLevel = -1
  end
end)

     end
   end)
end)

--Adds a diffrent Anim & efect to each drug
function Drug(level, start)
  
  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

    if start then
     Wait(800)
    end

    if item == 'weed' then
      RequestAnimSet("move_p_m_zero_slow") 
    while not HasAnimSetLoaded("move_p_m_zero_slow") do
      Citizen.Wait(0)
    end

      SetPedMovementClipset(playerPed, "move_p_m_zero_slow", true)
      SetRunSprintMultiplierForPlayer (playerPed, 1.2)
	  
    elseif item == 'opium' then
      RequestAnimSet("move_m@drunk@moderatedrunk")
    while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
      Citizen.Wait(0)
    end

      SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)

    elseif item == 'meth' then
      RequestAnimSet("move_injured_generic")
    while not HasAnimSetLoaded("move_injured_generic") do
      Citizen.Wait(0)
    end

      SetPedMovementClipset(playerPed, "move_injured_generic", true)
	  
    elseif item == 'coke' then
      RequestAnimSet("move_m@brave")
    while not HasAnimSetLoaded("mmove_m@brave") do
      Citizen.Wait(0)
    end

      SetPedMovementClipset(playerPed, "move_m@brave", true)

    end

    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedIsDrug(playerPed, true)

    end)

end

--When effects ends go back to normal
function Normal()

  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

   Wait(800)

    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrug(playerPed, false)
    SetPedMotionBlur(playerPed, false)

   end)

end

--In case too much drugs dies of overdose set everything back
function overdose()

Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)
	
	SetEntityHealth(playerPed, 0)
	
	ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrug(playerPed, false)
    SetPedMotionBlur(playerPed, false)
    status.val = 0
	
   end)
end

RegisterNetEvent('esx_drugseffects:onDrug')
AddEventHandler('esx_drugseffects:onDrug', function()
  
  local playerPed = GetPlayerPed(-1)
  
  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
  Citizen.Wait(2000)
  ClearPedTasksImmediately(playerPed)

end)
