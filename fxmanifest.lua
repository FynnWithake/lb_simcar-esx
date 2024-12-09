
fx_version 'adamant'
game 'gta5'
version '1.0.0'
author '187.fynn x Arcadia'
shared_script '@es_extended/imports.lua'
lua54 "yes"

client_scripts {
    '@es_extended/locale.lua',
    'client/*.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server/*.lua'
}
dependencies {
    'es_extended'
}