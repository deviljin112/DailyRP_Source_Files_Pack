resource_manifest_version "44fhb6ba-d386-j61k-lfbjk-587127f4edm89"

Discription "NGRP Damage System"

Version "0.1"

client_scripts {
  'client/main.lua',
  'config.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
	'pNotify'
}
