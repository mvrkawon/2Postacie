ESX              = nil
local PlayerData = {}
local spawn = 0
local spawny = vector3(1.0,1.0,1.0)
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShiwannabeaidontknowaredObjiwannabeaidontknowect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	spawn = math.random(1,11)
	if spawn == 1 then
	spawny = 	vector3(-214.7, -1962.5,26.9)
	elseif spawn == 2 then
	spawny = 	vector3(-1028.7, -2734.5,12.9)
	elseif spawn == 3 then
	spawny = 	vector3(-254.5, -986.5,30.3)
	elseif spawn == 4 then
	spawny = 	vector3(-1281.06,302.7,64.03)
	elseif spawn == 5 then
	spawny = 	vector3(242.06,-568.7,42.32)
	elseif spawn == 6 then	
	spawny = 	vector3(-1258.66,-1480.8,3.4) 
	elseif spawn == 7 then	
	spawny = 	vector3(296.78,190.99,103.4) 
	elseif spawn == 8 then	
	spawny = 	vector3(-693.66,298.8,81.95) 	
	elseif spawn == 9 then	
	spawny = 	vector3(1845.35,3666.8,32.95) 	
	elseif spawn == 10 then	
	spawny = 	vector3(1219.67,-1394.75,34.3) 	
	elseif spawn == 11 then	
	spawny = 	vector3(-234.33,6317.04,30.54) 		
	end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('routeC:SetupDonator')
AddEventHandler('routeC:SetupDonator', function()
    SendNUIMessage({action = "donator"})
end)

Citizen.CreateThread(function()
    Citizen.Wait(0)
    if NetworkIsSessionStarted() then
	local ped = PlayerPedId()

 	SetEntityCoords(ped, spawny.x, spawny.y, spawny.z, 0.0, 0.0, 0.0, 0.0)
        Citizen.Wait(100)
        TriggerServerEvent("routeS:SetupCharacters")
        TriggerEvent("routeC:SetupCharacters")
        DoScreenFadeOut(0)
    end
end)

RegisterNetEvent('esx:starttp')
AddEventHandler('esx:starttp', function()
	local ped = PlayerPedId()
 	SetEntityCoords(ped, spawny.x, spawny.y, spawny.z, 0.0, 0.0, 0.0, 0.0)
end)

local PedTerapeuta = nil
local PedGraczPierwszy = nil
local PedGraczDrugi = nil
local IsChoosing = false
local Ped1Ready = false
local Ped2Ready = false
local Ped3Ready = false
local Anuluj = false

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        if Ped3Ready == false and IsChoosing == true and Anuluj == false then
            DoScreenFadeOut(0)
		else
			Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        if Ped1Ready == false and IsChoosing == true then
            Ped1Ready = true
            Citizen.Wait(6000)
            local model = -1549575121
            RequestModel(model)
            Citizen.Wait(500)
            PedTerapeuta = CreatePed(5, model, -1907.85, -575.32, 18.09, 181.5, false, false)
            Citizen.Wait(100)
            SetEntityInvincible(PedTerapeuta, true)
            SetBlockingOfNonTemporaryEvents(PedTerapeuta, true)
            ESX.Streaming.RequestAnimDict("anim@heists@prison_heistunfinished_biztarget_idle", function()
                TaskPlayAnim(PedTerapeuta,"anim@heists@prison_heistunfinished_biztarget_idle","target_idle", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
            end)
		else 
			Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Ped2Ready == false and IsChoosing == true then
            Ped2Ready = true
            Citizen.Wait(6000)
            local model
            local fart = math.random(1, 4)
            if fart == 1 then
                model = -680474188
            elseif fart == 2 then
                model = 1767447799
            elseif fart == 3 then
                model = 1464257942
            elseif fart == 4 then
                model = -1280051738
            end
            RequestModel(model)
            Citizen.Wait(500)
            PedGraczPierwszy = CreatePed(5, model, -1905.14, -576.84, 18.53, 45.5, false, false)
            Citizen.Wait(100)
            SetEntityInvincible(PedGraczPierwszy, true)
            SetBlockingOfNonTemporaryEvents(PedGraczPierwszy, true)
            startAnim("timetable@ron@ig_3_couch", "base", 1, 0, PedGraczPierwszy)
		else
			Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        if Ped3Ready == false and IsChoosing == true then
            Ped3Ready = true
            Citizen.Wait(6000)
            local model
            local fart = math.random(1, 4)
            if fart == 1 then
                model = -1988720319
            elseif fart == 2 then
                model = 117698822
            elseif fart == 3 then
                model = -1106743555
            elseif fart == 4 then
                model = 920595805
            end
            RequestModel(model)
            Citizen.Wait(500)
            PedGraczDrugi = CreatePed(5, model, -1907.66, -577.32, 18.51, 337.5, false, false)
            Citizen.Wait(100)
            SetEntityInvincible(PedGraczDrugi, true)
            SetBlockingOfNonTemporaryEvents(PedGraczDrugi, true)
            startAnim("amb@world_human_picnic@female@base", "base", 1, 0, PedGraczDrugi)
		else
			Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent('postacie:1ready')
AddEventHandler('postacie:1ready', function()
    Ped2Ready = true
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1000)
        if IsChoosing then
            SetEntityCoords(GetPlayerPed(-1), -1910.04, -571.61, 19.09, 1, 0, 0, 0)
            SetEntityVisible(GetPlayerPed(-1), false, false)
            DisplayHud(false)
        end
    end
end)
local cam = nil
local cam2 = nil
RegisterNetEvent('routeC:SetupCharacters')
AddEventHandler('routeC:SetupCharacters', function()
    IsChoosing = true
    SetEntityCoords(GetPlayerPed(-1), -1910.04, -571.61, 19.09, 1, 0, 0, 0)
    DoScreenFadeOut(10)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    SetEntityVisible(GetPlayerPed(-1), false, false)
    SetTimecycleModifier('default')
    SetEntityCoords(GetPlayerPed(-1), -1910.04, -571.61, 19.09, 1, 0, 0, 0)
    FreezeEntityPosition(GetPlayerPed(-1), true)
    SetHdArea(-1906.44,-571.2,20.09, 29.0)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -1906.44,-571.2,20.09, -5.0,0.00,182.5, 50.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
end)

function postacie(kilka,characters)
if not kilka then
if characters[i] == nil then
TriggerEvent('CharacterChosen', 1, "false")	
else
TriggerEvent('CharacterChosen', 1, "true")	
end

else
Citizen.Wait(2000)
		local characterssorted = {}
		for i=1,3 do 
		 if characters[i] == nil then
			break
		 end
		 local numb = string.sub(characters[i].identifier, 1, 5)
			if numb == 'Char1' then
				table.insert(characterssorted, {
				imie = characters[i].firstname,
				nazwisko = characters[i].lastname,
				idpostaci = string.sub(characters[i].identifier, 5, 5)
				})
			elseif numb == 'Char3' then
				table.insert(characterssorted, {
				imie = characters[i].firstname,
				nazwisko = characters[i].lastname,
				idpostaci = string.sub(characters[i].identifier, 5, 5)
				})
			elseif numb == 'Char4' then
				table.insert(characterssorted, {
				imie = characters[i].firstname,
				nazwisko = characters[i].lastname,
				idpostaci = string.sub(characters[i].identifier, 5, 5)
				})
			end
		 end

	
		local elements = {
		}		

		
		for i=1,3 do 
			 if characters[i] == nil then
				table.insert(elements, {label = ''..'Nowa'..' '..'Postać'..'', value = 1, check = 'xd'})				 
				break
			 end
		 local numb = string.sub(characters[i].identifier, 1, 5)
			if numb == 'Char1' then			
				table.insert(elements, {label = ''..characterssorted[i].imie..' '..characterssorted[i].nazwisko..'', value = 1, check = 'as'})
				break
			end
		 end		



	
		if kilka == "tak" then	
		for i=1,3 do 
			 if characters[i] == nil then
				table.insert(elements, {label = ''..'Nowa'..' '..'Postać'..'', value = 3, check = 'xd'})					 
				break
			 end
		 local numb = string.sub(characters[i].identifier, 1, 5)
			if numb == 'Char3' then			
				table.insert(elements, {label = ''..characterssorted[i].imie..' '..characterssorted[i].nazwisko..'', value = 3, check = 'as'})
				break
			end
		 end		




		for i=1,3 do 
			 if characters[i] == nil then
				table.insert(elements, {label = ''..'Nowa'..' '..'Postać'..'', value = 4, check = 'xd'})						 
				break
			 end
			local numb = string.sub(characters[i].identifier, 1, 5)
			if numb == 'Char4' then			
					table.insert(elements, {label = ''..characterssorted[i].imie..' '..characterssorted[i].nazwisko..'', value = 4, check = 'as'})
				break
			end
		 end	
		end
	
	
	



			
		


		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wybierzp', {
			title    = ('Wybierz Postać'),
			align    = 'center',
			elements = elements
		}, function(data, menu)
	

			if data.current.value then
				if data.current.check == 'xd' then
					TriggerEvent('CharacterChosen', data.current.value, "false")					
				else
					TriggerEvent('CharacterChosen', data.current.value, "true")	
				end				
			end	
			
				menu.close()		
		end, function(data, menu)
			menu.close()
		end)
end		
		
end  	
		
RegisterNetEvent('CharacterChosen')
AddEventHandler('CharacterChosen', function(charid,ischar)
    TriggerEvent('route68_chatMenu:FocusActive', false)
    --SetNuiFocus(false,false)
    DoScreenFadeOut(500)
    Citizen.Wait(500)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    SetCamActive(cam2, false)
    DestroyCam(cam2, true)
    RenderScriptCams(false, true, 0, true, true)
    TriggerServerEvent('routeS:CharacterChosen', charid, ischar)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
end)		

RegisterNetEvent('routeC:SetupUI')
AddEventHandler('routeC:SetupUI', function(kilka,characters)
    Anuluj = true
    Citizen.Wait(500)
    DoScreenFadeIn(500)
    Citizen.Wait(500)
	postacie(kilka,characters)
    TriggerEvent('route68_chatMenu:FocusActive', true)
    --SetNuiFocus(true, true)
	TriggerEvent('route68:kino_state', true)
end)

local tworzyPostac = false

RegisterNetEvent('routeC:SpawnCharacter')
AddEventHandler('routeC:SpawnCharacter', function(spawn, already)
	local pos = spawn
	TriggerEvent('route68_chatMenu:FocusActive', false)
    --SetNuiFocus(false,false)
    DeleteEntity(PedTerapeuta)
    DeleteEntity(PedGraczPierwszy)
    DeleteEntity(PedGraczDrugi)
	DoScreenFadeOut(500)
    Citizen.Wait(1000)
    PedTerapeuta = nil
    PedGraczPierwszy = nil
    PedGraczDrugi = nil
    TriggerServerEvent('es:firstJoinProper') 
    TriggerEvent('es:allowedToSpawn') 
	SetTimecycleModifier('default')
    FreezeEntityPosition(GetPlayerPed(-1), true)	
    Citizen.Wait(500)
	if not already then
		SetEntityCoords(GetPlayerPed(-1), spawny.x, spawny.y, spawny.z + 0.5)
	else
		SetEntityCoords(GetPlayerPed(-1), pos.x, pos.y, pos.z + 0.5)
	end
	exports.spawnmanager:setAutoSpawn(false)
    --SetNuiFocus(false,false)
    IsChoosing = false

    DisplayHud(true)
    TriggerEvent('esx_gym:JestWGrze')
    Citizen.Wait(300)
    TriggerEvent('route68:sila')
    Citizen.Wait(500)
    SetControlNormal(0, 166, 1.0)
    Citizen.Wait(1500)
	if tworzyPostac == true then
		TriggerEvent('rt68:LoadSkinFirst')
		TriggerEvent('esx:restoreLoadout')
	end
	Citizen.Wait(1000)
	TriggerServerEvent('route68:opisGet')
	TriggerEvent('route68:kino_state', false)
    FreezeEntityPosition(GetPlayerPed(-1), false)
	SetEntityVisible(GetPlayerPed(-1), true, true)	
	DoScreenFadeIn(500)
	TriggerServerEvent('route68_bwStart:GetDeathStatus')
	Citizen.Wait(1500)
	if tworzyPostac == true then
		TriggerEvent('wybranopostac', true)
	end
  --[[  ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(isDead)
        Citizen.Wait(500)
        if isDead then
            local playerPed = GetPlayerPed(-1)
            SetEntityHealth(playerPed, 0)
            TriggerEvent("pNotify:SendNotification", {text = 'Jesteś nieprzytomny/a, ponieważ przed wyjściem z serwera Twoja postać miała BW', timeout=20000})
        end
    end)	]]	
end)



RegisterNetEvent('route68:wczytajnumer')
AddEventHandler('route68:wczytajnumer', function(numer)
    TriggerServerEvent("route68:SetNumberWejscie", numer)
end)

RegisterNetEvent('route68_postacie:tworzyPostac')
AddEventHandler('route68_postacie:tworzyPostac', function(state)
	if state == true then
		tworzyPostac = true
	elseif state == false then
		tworzyPostac = false
    end
end)

RegisterNetEvent('route68_bw:Zabij')
AddEventHandler('route68_bw:Zabij', function()
	Citizen.Wait(5000)
    local playerPed = GetPlayerPed(-1)
    SetEntityHealth(playerPed, 1)
    TriggerEvent("pNotify:SendNotification", {text = 'Jesteś nieprzytomny/a, ponieważ przed wyjściem z serwera Twoja postać miała BW', timeout=20000})
end)

RegisterNetEvent('routeC:ReloadCharacters')
AddEventHandler('routeC:ReloadCharacters', function()
    TriggerServerEvent("routeS:SetupCharacters")
    TriggerEvent("routeC:SetupCharacters")
	TriggerEvent('wybranopostac', false)
end)

RegisterNUICallback("CharacterChosen", function(data, cb)
    TriggerEvent('route68_chatMenu:FocusActive', false)
    --SetNuiFocus(false,false)
    DoScreenFadeOut(500)
    Citizen.Wait(500)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    SetCamActive(cam2, false)
    DestroyCam(cam2, true)
    RenderScriptCams(false, true, 0, true, true)
    TriggerServerEvent('routeS:CharacterChosen', data.charid, data.ischar)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    cb("ok")
end)

RegisterNUICallback("DeleteCharacter", function(data, cb)
    TriggerEvent('route68_chatMenu:FocusActive', false)
    SetNuiFocus(false,false)
    DoScreenFadeOut(500)
    TriggerServerEvent('routeS:DeleteCharacter', data.charid)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    cb("ok")
end)

RegisterNUICallback("niedonator", function()
    TriggerEvent('pNotify:SendNotification', {text = "Drugi slot na postać zarezerwowany jest dla osób zasłużonych!", timeout = 10000})
end)

--- ZMIANA POSTACI

local juzWszedl = false
local wMarkerze = false

-- Wyjście
AddEventHandler('routeC:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- Markery
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		local coords = GetEntityCoords(PlayerPedId())
		wMarkerze = false

		for i=1, #Config.Postacie, 1 do
			local distance = GetDistanceBetweenCoords(coords, Config.Postacie[i], true)

			if distance < 10 then
                --DrawMarker(Config.MarkerPostacie, Config.Postacie[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.PostacieSize.x, Config.PostacieSize.y, Config.PostacieSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                local Pozycja = {
                    ["x"] = 1887.46,
                    ["y"] = 904.67,
                    ["z"] = 30.97
                }
                ESX.Game.Utils.DrawText3D(Pozycja, "NACIŚNIJ [~g~E~s~] ABY PRZEŁĄCZYĆ SIĘ~n~MIĘDZY POSTACIAMI", 0.55, 1.5, "~b~ZMIANA POSTACI", 0.7)
			end

			if distance < (Config.PostacieSize.x) then
				wMarkerze = true
			end
		end

		if wMarkerze and not juzWszedl then
			juzWszedl = true
		end

		if not wMarkerze and juzWszedl then
			juzWszedl = false
			TriggerEvent('routeC:hasExitedMarker')
		end
	end
end)

-- Sterowanie
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, 38) and wMarkerze then
			-- TriggerServerEvent('duty:offduty')
			TriggerServerEvent("routeS:saveplayer")
			TriggerEvent("pNotify:SendNotification", {text = 'Poczekaj chwilę na załadowanie menu!'})
			ESX.UI.Menu.CloseAll()
			TriggerServerEvent("routeS:SetupCharacters")
			Citizen.Wait(2400)
			TriggerEvent("pNotify:SendNotification", {text = 'Uwaga! Załadowanie broni po zmianie postaci może chwilę potrwać!', timeout = 10000})
			TriggerEvent('route68_chatMenu:FocusActive', true)
            --SetNuiFocus(true, true)
		end

	end
end)

--[[
-- Blipy

local blips = {
	{title="Zmiana Postaci",colour=83, id=280,x =-285.97, y =-1062.07, z =27.2},
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end

end)]]


function startAnim(lib, anim, loop, car, bot)
	if IsPedInAnyVehicle(bot, true) and car == 1 then
		SetCurrentPedWeapon(bot, -1569615261,true)
		Citizen.Wait(1)
		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(bot, lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		end)
	elseif not IsPedInAnyVehicle(GetPlayerPed(-1), true) and car <= 1 then
		SetCurrentPedWeapon(bot, -1569615261,true)
		Citizen.Wait(1)
		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(bot, lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		end)
	elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) and car == 2 then
		SetCurrentPedWeapon(bot, -1569615261,true)
		Citizen.Wait(1)
		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(bot, lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		end)
	end
end