fx_version 'cerulean'
games { 'gta5' }
author 'zaps6000'
lua54 'yes'
client_scripts {
'client/*'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
'server/*'
}

dependency 'oxmysql'
