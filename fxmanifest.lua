fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'matsy.dev'
description 'matsyMinimapsSwitcher est un script FiveM qui permet de changer de minimap en jeu via un menu simple.'
version '1.0.0'

files {
    'preview/**'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_script 'client/*.lua'