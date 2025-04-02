fx_version 'cerulean'
game 'gta5'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/sv_database.lua',
    'server/sv_ban.lua',
    'server/sv_main.lua'
}

client_scripts {
    'client/cl_main.lua',
    'client/cl_admin.lua'
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/script.js',
    'web/style.css'
}