AddEventHandler('chatMessage', function(Source, Name, Msg)

    Msg = Emojit(Msg)
    CancelEvent()

    TriggerClientEvent('chatMessage', -1, "^9OOC | " .. Name .. "", { 0, 153, 204 }, "^0 " .. Msg)
end)

function Emojit(text)
    for i = 1, #emoji do
      for k = 1, #emoji[i][1] do
        text = string.gsub(text, emoji[i][1][k], emoji[i][2])
      end
    end
    return text
end