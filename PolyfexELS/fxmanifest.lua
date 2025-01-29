fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'Ninja'
description "A simple, no mess, ELS system, that's half decent"
version '3.1.3'

client_scripts {
	'client/*.lua',
	'local.lua',
}

server_scripts {
	'server/*.lua',
}

shared_scripts {
	'config.lua'
}

ui_page 'html/index.html'

files {
	'vehicles/*.json',
	'html/index.html',
	'html/999mode.mp3',
}

escrow_ignore {
  'config.lua',
  'local.lua',
  'vehicles/*.json',
  'html/**',
}

dependencies {
	'/onesync',
}

dependency '/assetpacks'