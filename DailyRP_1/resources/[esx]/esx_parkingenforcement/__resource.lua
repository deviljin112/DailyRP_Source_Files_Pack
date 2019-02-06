resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Parking Enforcement Job'

client_scripts {
  '@es_extended/locale.lua',
  'config.lua',
  'locales/en.lua',
  'client/main.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'config.lua',
  'locales/en.lua',
  'server/main.lua',
  '@mysql-async/lib/MySQL.lua'
}

exports {
  'openParking'
}