
fx_version "bodacious"
game "gta5"

ui_page {
	"html/index.html",
}

client_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"client.lua",
}

server_scripts {
	"@vrp/lib/utils.lua",
    "config.lua",
	"server.lua",
}

files {
	"html/*",
	"html/**/*",
}