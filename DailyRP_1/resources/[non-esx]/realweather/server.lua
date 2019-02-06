--Made by Jijamik, feel free to modify


local cityid = "756135" -- Warsaw
local apikey = "cd810d5cb08171ec4b19ff665d46b3f8"
local GetWeather = "http://api.openweathermap.org/data/2.5/weather?id="..cityid.."&lang=pl&units=metric&APPID="..apikey

function sendToDiscordMeteo (type, name,message,color)
    local DiscordWebHook = "https://discordapp.com/api/webhooks/494595006049550337/JS-312-XNbs60z2ptK2DW1KrWPacn223GAZCGCDpyv7ylT40f71p5g_aVWCKo95-8ka3"

    local avatar = "https://i.imgur.com/HbYoo0e.png"


    local embeds = {
        {

            ["title"]=message,
            ["type"]="rich",
            ["color"] =color,
            ["footer"]=  {
            ["text"]= "-------------------------------------------------------------------------------------------------------------------",
            },
        }
    }

    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds,avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
end

function checkMeteo(err,response)
    local data = json.decode(response)
    local type = data.weather[1].main
    local id = data.weather[1].id
    local description = data.weather[1].description
    local wind = math.floor(data.wind.speed)
    local windrot = data.wind.deg
    local meteo = "EXTRASUNNY"
    local ville = data.name
    local temp = math.floor(data.main.temp)
    local tempmini = math.floor(data.main.temp_min)
    local tempmaxi = math.floor(data.main.temp_max)
    local emoji = ":white_sun_small_cloud:"
    if type == "Thunderstorm" then
        meteo = "THUNDER"
        emoji = ":cloud_lightning:"
    end
    if type == "Rain" then
        meteo = "RAIN"
        emoji = ":cloud_rain:"
    end
    if type == "Drizzle" then
        meteo = "CLEARING"
        emoji = ":white_sun_rain_cloud:"
        if id == 608  then
            meteo = "OVERCAST"
        end
    end
    if type == "Clear" then
        meteo = "CLEAR"
        emoji = ":sun_with_face:"
    end
    if type == "Clouds" then
        meteo = "CLOUDS"
        emoji = ":cloud:"
        if id == 804  then
            meteo = "OVERCAST"
        end
    end
    if type == "Snow" then
        meteo = "SNOW"
        emoji = ":cloud_snow:"
        if id == 600 or id == 602 or id == 620 or id == 621 or id == 622 then
            meteo = "XMAS"
        end
    end

    Data = {
        ["Pogoda"] = meteo,
        ["Predkosc Wiatru"] = wind,
        ["Kierunek Wiatru"] = windrot
    }
    TriggerClientEvent("meteo:actu", -1, Data)
    sendToDiscordMeteo(1,('Pogoda'), emoji.." Aktualna pogoda na wyspie to "..description..". \n:thermometer: Obecnie jest "..temp.."°C z minimalna temperatura "..tempmini.."°C i maxymalna "..tempmaxi.."°C. \n:wind_blowing_face: Wiatr z aktualna predkoscia "..wind.."m/s.",16711680)
    SetTimeout(60*60*1000, checkMeteoHTTPRequest)
end

function checkMeteoHTTPRequest()
    PerformHttpRequest(GetWeather, checkMeteo, "GET")
end

checkMeteoHTTPRequest()

RegisterServerEvent("meteo:sync")
AddEventHandler("meteo:sync",function()
    TriggerClientEvent("meteo:actu", source, Data)
end)

--[[
"EXTRASUNNY"
"SMOG"
"CLEAR"
"CLOUDS"
"FOGGY"
"OVERCAST"
"RAIN"
"THUNDER"
"CLEARING"
"NEUTRAL"
"SNOW"
"BLIZZARD"
"SNOWLIGHT"
"XMAS"
]]