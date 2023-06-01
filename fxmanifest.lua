fx_version "bodacious"

game "gta5"

author "kibra#9999"

version "1.0.0"

description "for standalone server"

client_scripts {
     "carlist.lua",
     "client.lua",
     "ped.lua",
     "ayar.lua"
}

ui_page "index.html"

files {
     "index.html",
     "main.js"
}

server_script "server.lua"