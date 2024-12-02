fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'vib_fleecaheist'
author 'Vibrant Resources'
version '1.0.2'
repository 'https://github.com/VibrantResources/vib_fleecaheist'
description 'A small heist simulator targeting Fleeca banks with varying hack requirements, armed guard respoonses and randomised rewards'

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