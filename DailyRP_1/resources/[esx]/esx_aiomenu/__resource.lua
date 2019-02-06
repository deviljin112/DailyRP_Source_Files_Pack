version '1.0.0'

ui_page {
    'client/html/UI.html'
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}

client_script {
    'client/client.lua'
}

files {
    'client/html/UI.html',
    'client/html/style.css'
}
