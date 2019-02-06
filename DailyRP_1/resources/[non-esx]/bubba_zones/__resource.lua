version '1.0.0'

server_scripts {
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'config.lua',
  'gangs.lua',
  'common.lua',
  'server/database_store.lua',
  'server/player_wrapper.lua',
  'server/bubba_zones_sv.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'config.lua',
  'gangs.lua',
  'common.lua',
  'client/bubba_zones_cl.lua',
  'client/menus.lua'
}
