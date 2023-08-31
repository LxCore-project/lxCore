fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

authors 'Zaps6000, AlvWasHere'
description 'A lightweight LUA 5.4 FiveM Framework'
url 'https://github.com/LxCore-project/lxCore'
documentation 'Coming Soon'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/*'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*'
}

ui_page 'html/index.html'
files {
    'html/*.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/img/*'
}

dependencies {
    'oxmysql',
    'ox_lib'
}
