fx_version 'cerulean'
games { 'gta5' }
author 'zaps6000'
lua54 'yes'
client_scripts {
'client/*'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
'server/*'
}
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}
dependency 'oxmysql'
