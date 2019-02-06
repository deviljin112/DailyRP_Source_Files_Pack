description 'esx_twitter'

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	'config.lua',
    'server.lua'
}

client_scripts {	
	'config.lua',
    'client.lua'
}