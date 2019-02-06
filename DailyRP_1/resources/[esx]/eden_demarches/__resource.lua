resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Eden Demarches'



client_scripts {
    '@es_extended/locale.lua',
    'locales/fr.lua',
	'config.lua',
	'client/main.lua',
	'GUI.lua'
}

exports {
	'openMarches'
}