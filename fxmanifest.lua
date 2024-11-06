fx_version 'cerulean'
game 'gta5'
description 'VibrantRP Fleeca Heist'

client_scripts {
	'client/*.lua',
	'menus/*.lua',
}

server_scripts  {
	'server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
	'config.lua',
}

lua54 'yes'