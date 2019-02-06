local damagedParts = {}

RegisterServerEvent('ngrp_dmgsys:storeDamage')
AddEventHandler('ngrp_dmgsys:storeDamage', function(parts, id)
  damagedParts[id] = parts
end)

RegisterServerEvent('ngrp_dmgsys:sendDamage')
AddEventHandler('ngrp_dmgsys:sendDamage', function()
  local _source = source
  TriggerClientEvent('ngrp_dmgsys:receiveDamage', _source, damagedParts)
end)

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
