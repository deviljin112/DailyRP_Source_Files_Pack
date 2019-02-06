resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Toggles the vehicle engine'	-- Resource Description

server_script {								-- Server Scripts
	'config.lua',
	'server/server.lua',
}

client_script {								-- Client Scripts
	'config.lua',
	'client/client.lua',
}

