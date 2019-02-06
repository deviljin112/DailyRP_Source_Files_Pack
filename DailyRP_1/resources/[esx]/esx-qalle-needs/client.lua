ESX                             = nil

Config = {
    Commands = true,
    StatusBars = true,
    Key = 166
}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
end)

RegisterNetEvent('esx-qalle-needs:openMenu')
AddEventHandler('esx-qalle-needs:openMenu', function()
    OpenNeedsMenu()
end)

if Config.Commands then

    RegisterCommand('pee', function()
        if Config.StatusBars then
            TriggerEvent('esx_status:getStatus', 'pee', function(status)
                if status.val < 200000 then
                    TriggerServerEvent('esx-qalle-needs:add', 'pee', 1000000)
                    local hashSkin = GetHashKey("mp_m_freemode_01")

                    if GetEntityModel(PlayerPedId()) == hashSkin then
                        TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'pee', 'male')
                    else
                        TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'pee', 'female')
                    end

                else
                    ESX.ShowNotification('You dont have to pee')
                end
            end)
        else
            local hashSkin = GetHashKey("mp_m_freemode_01")

            if GetEntityModel(PlayerPedId()) == hashSkin then
                TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'pee', 'male')
            else
                TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'pee', 'female')
            end
        end
    end, false)

    RegisterCommand('poop', function()
        if Config.StatusBars then
            TriggerEvent('esx_status:getStatus', 'shit', function(status)
                if status.val < 200000 then
                    TriggerServerEvent('esx-qalle-needs:add', 'shit', 1000000)
                    TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'poop')
                else
                    ESX.ShowNotification('You dont have to shit')
                end
            end)
        else
            TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'poop')
        end
    end, false)
else
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5)
            if IsControlJustReleased(0, Config.Key) then
                OpenNeedsMenu()
            end
        end
    end)
end

function OpenNeedsMenu()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'esx-qalle-needsmenu',
        {
            title    = 'Needs Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Pee', value = 'pee' },
                { label = 'Poop', value = 'poop' }
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'pee' then
            menu.close()
            if Config.StatusBars then
                TriggerEvent('esx_status:getStatus', 'pee', function(status)
                    if status.val < 200000 then
                        TriggerServerEvent('esx-qalle-needs:add', 'pee', 1000000)
                        local hashSkin = GetHashKey("mp_m_freemode_01")

                        if GetEntityModel(PlayerPedId()) == hashSkin then
                            TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'pee', 'male')
                        else
                            TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'pee', 'female')
                        end

                    else
                        ESX.ShowNotification('You don\'t have to pee')
                    end
                end)
            else
                local hashSkin = GetHashKey("mp_m_freemode_01")

                if GetEntityModel(PlayerPedId()) == hashSkin then
                    TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'pee', 'male')
                else
                    TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'pee', 'female')
                end
            end

        elseif value == 'poop' then
            menu.close()
            if Config.StatusBars then
                TriggerEvent('esx_status:getStatus', 'shit', function(status)
                    if status.val < 200000 then
                        TriggerServerEvent('esx-qalle-needs:add', 'shit', 1000000)
                        TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'poop')
                    else
                        ESX.ShowNotification('You don\'t have to poop')
                    end
                end)
            else
                TriggerServerEvent('esx-qalle-needs:sync', GetPlayerServerId(PlayerId()), 'poop')
            end
        end

    end,
    function(data, menu)
        menu.close()
    end)
end

RegisterNetEvent('esx-qalle-needs:syncCL')
AddEventHandler('esx-qalle-needs:syncCL', function(ped, need, sex)
    if need == 'pee' then
        Pee(ped, sex)
    else
        Poop(ped)
    end
end)


function Pee(ped, sex)
    local Player = ped
    local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))

    local particleDictionary = "core"
    local particleName = "ent_amb_peeing"
    local animDictionary = 'misscarsteal2peeing'
    local animName = 'peeing_loop'

    RequestNamedPtfxAsset(particleDictionary)

    while not HasNamedPtfxAssetLoaded(particleDictionary) do
        Citizen.Wait(0)
    end

    RequestAnimDict(animDictionary)

    while not HasAnimDictLoaded(animDictionary) do
        Citizen.Wait(0)
    end

    RequestAnimDict('missfbi3ig_0')

    while not HasAnimDictLoaded('missfbi3ig_0') do
        Citizen.Wait(1)
    end

    if sex == 'male' then

        SetPtfxAssetNextCall(particleDictionary)

        local bone = GetPedBoneIndex(PlayerPed, 11816)

        local heading = GetEntityPhysicsHeading(PlayerPed)

        TaskPlayAnim(PlayerPed, animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)

        local effect = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.2, 0.0, -140.0, 0.0, 0.0, bone, 2.5, false, false, false)

        Wait(3500)

        StopParticleFxLooped(effect, 0)
        ClearPedTasks(PlayerPed)
    else

        SetPtfxAssetNextCall(particleDictionary)

        bone = GetPedBoneIndex(PlayerPed, 11816)

        local heading = GetEntityPhysicsHeading(PlayerPed)

        TaskPlayAnim(PlayerPed, 'missfbi3ig_0', 'shit_loop_trev', 8.0, -8.0, -1, 0, 0, false, false, false)

        local effect = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.55, 0.0, 0.0, 20.0, bone, 2.0, false, false, false)

        Wait(3500)

        Citizen.Wait(100)
        StopParticleFxLooped(effect, 0)
        ClearPedTasks(PlayerPed)
    end
end

function Poop(ped)
    local Player = ped
    local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))

    local particleDictionary = "scr_amb_chop"
    local particleName = "ent_anim_dog_poo"
    local animDictionary = 'missfbi3ig_0'
    local animName = 'shit_loop_trev'

    RequestNamedPtfxAsset(particleDictionary)

    while not HasNamedPtfxAssetLoaded(particleDictionary) do
        Citizen.Wait(0)
    end

    RequestAnimDict(animDictionary)

    while not HasAnimDictLoaded(animDictionary) do
        Citizen.Wait(0)
    end

    SetPtfxAssetNextCall(particleDictionary)

    --gets bone on specified ped
    bone = GetPedBoneIndex(PlayerPed, 11816)

    --animation
    TaskPlayAnim(PlayerPed, animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)

    --2 effets for more shit
    effect = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.0, false, false, false)
    Wait(3500)
    effect2 = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.0, false, false, false)
    Wait(1000)

    StopParticleFxLooped(effect, 0)
    Wait(10)
    StopParticleFxLooped(effect2, 0)
end
