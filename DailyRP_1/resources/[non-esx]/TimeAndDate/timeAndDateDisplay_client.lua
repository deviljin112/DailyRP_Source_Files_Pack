local displayTime = true
local useMilitaryTime = true
local displayDayOfWeek = false -- DO NOT USE WITH REAL TIME SYNC
local displayDate = true

local timeAndDateString = nil
local hour
local minute
local dayOfWeek
local month
local dayOfMonth
local year

-- Display Time and Date at top right of screen -- format: | 12:13 | Wednesday | January 17, 2017 |
Citizen.CreateThread(function()
	while true do
		Wait(0)
		timeAndDateString = "|"
		
		if displayTime == true then
			CalculateTimeToDisplay()
			timeAndDateString = timeAndDateString .. " " .. hour .. ":" .. minute .. " |"
		end
		if displayDayOfWeek == true then
			CalculateDayOfWeekToDisplay()
			timeAndDateString = timeAndDateString .. " " .. dayOfWeek .. " |"
		end
		if displayDate == true then
			CalculateDateToDisplay()
			timeAndDateString = timeAndDateString .. " " .. month .. " " .. dayOfMonth .. ", " .. year .. " |"
		end
		
		SetTextFont(0)
		SetTextProportional(1)
		SetTextScale(0.30, 0.30)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextRightJustify(true)
		SetTextWrap(0,0.95)
		SetTextEntry("STRING")
		
		AddTextComponentString(timeAndDateString)
		DrawText(0.5, 0.01)
	end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()

	if useMilitaryTime == false then
		if hour == 0 or hour == 24 then
			hour = 12
		elseif hour >= 13 then
			hour = hour - 12
		end
	end

	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end

function CalculateDayOfWeekToDisplay()
	dayOfWeek = GetClockDayOfWeek()
	
	if dayOfWeek == 0 then
		dayOfWeek = "Sunday"
	elseif dayOfWeek == 1 then
		dayOfWeek = "Monday"
	elseif dayOfWeek == 2 then
		dayOfWeek = "Tuesday"
	elseif dayOfWeek == 3 then
		dayOfWeek = "Wednesday"
	elseif dayOfWeek == 4 then
		dayOfWeek = "Thursday"
	elseif dayOfWeek == 5 then
		dayOfWeek = "Friday"
	elseif dayOfWeek == 6 then
		dayOfWeek = "Saturday"
	end
end

function CalculateDateToDisplay()	
	year, month, dayOfMonth, hour, minute, second = GetLocalTime(year, month, day, hour, minute, second)

	if month == 0 then
		month = "Styczen"
	elseif month == 1 then
		month = "Luty"
	elseif month == 2 then
		month = "Marzec"
	elseif month == 3 then
		month = "Kwiecien"
	elseif month == 4 then
		month = "Maj"
	elseif month == 5 then
		month = "Czerwiec"
	elseif month == 6 then
		month = "Lipiec"
	elseif month == 7 then
		month = "Sierpien"
	elseif month == 8 then
		month = "Wrzesien"
	elseif month == 9 then
		month = "Pazdziernik"
	elseif month == 10 then
		month = "Listopad"
	elseif month == 11 then
		month = "Grudzien"
	end
end
