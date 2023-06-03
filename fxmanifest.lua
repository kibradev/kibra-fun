fx_version "bodacious"

game "gta5"

author "kibra#9999"

version "1.0.0"

description "for standalone server"

client_scripts {
     "weapons.lua",
     "cars.lua",
     "addons.lua",
     "client.lua",
}

ui_page "index.html"

files {
     "index.html",
     "main.js"
}

server_script "server.lua"
