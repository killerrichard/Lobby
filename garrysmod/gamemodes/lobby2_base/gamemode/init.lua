--[[-----------------------------------------------------------

	██╗      ██████╗ ██████╗ ██████╗ ██╗   ██╗    ██████╗ 
	██║     ██╔═══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝    ╚════██╗
	██║     ██║   ██║██████╔╝██████╔╝ ╚████╔╝      █████╔╝
	██║     ██║   ██║██╔══██╗██╔══██╗  ╚██╔╝      ██╔═══╝ 
	███████╗╚██████╔╝██████╔╝██████╔╝   ██║       ███████╗
	╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝    ╚═╝       ╚══════╝

	
	Copyright (c) James Swift, 2015
	
-----------------------------------------------------------]]--

--[[--------------------------------
	Serverside and shared includes
--------------------------------]]--

include( "extensions/buffer.lua" )
include( "extensions/meshpanel.lua" )
include( "sh_util.lua" )

include( "sv_mysql.lua" )
include( "mysql/sv_player.lua" )
include( "mysql/sv_map.lua" )
include( "mysql/sv_bans.lua" )

include( "sh_modules.lua" )
include( "sh_usergroups.lua" )
include( "sv_resources.lua" )
include( "sv_player.lua" )
include( "sv_admin.lua" )

include( "multiserver/sv_server.lua" )
include( "multiserver/sv_client.lua" )
include( "multiserver/sv_packet.lua" )
include( "multiserver/sv_coms.lua" )
include( "multiserver/gameservers.lua" )
include( "multiserver/methods/cat.lua" )

include( "inventory/sv_init.lua" )

include( "shared.lua" )

--[[--------------------------------
	Clientside and shared files
--------------------------------]]--

AddCSLuaFile( "extensions/utf8.lua" )
AddCSLuaFile( "extensions/buffer.lua" )
AddCSLuaFile( "extensions/meshpanel.lua" )

AddCSLuaFile( "sh_util.lua" )
AddCSLuaFile( "sh_modules.lua" )
AddCSLuaFile( "sh_usergroups.lua" )

AddCSLuaFile( "chat/main.lua" )
AddCSLuaFile( "chat/cl_smilies.lua" )
AddCSLuaFile( "chat/cl_icons.lua" )

AddCSLuaFile( "cl_soundmanager.lua" )
AddCSLuaFile( "cl_notification.lua" )
AddCSLuaFile( "cl_fonts.lua" )

AddCSLuaFile( "inventory/cl_init.lua" )

AddCSLuaFile( "vgui/richtext_scrollbar.lua" )
AddCSLuaFile( "vgui/richtext.lua" )
AddCSLuaFile( "vgui/lobby_chatbox.lua" )
AddCSLuaFile( "vgui/lobby_frame.lua" )
AddCSLuaFile( "vgui/lobby_notification.lua" )
AddCSLuaFile( "vgui/lobby_skin.lua" )

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

function GM:Initialize()

	resource.AddWorkshop( "625054630" )
	resource.AddWorkshop( self.WorkshopID )

	self:Print( "Initializing ..." )
	self.Multiserver.Coms.AddLogin( "127.0.0.1", "Louisa" )
	self.Multiserver.Server.New( )
	self.Multiserver.GameServers.LoadGames( )
	
	self:InitializeMySQL()
	self.MySQL.InitializeTable( "gm_users" )
	self.MySQL.InitializeTable( "gm_bans" )
	self.MySQL.InitializeTable( "gm_maps" )
	
	
	self:SendResources( "materials" )
	self:SendResources( "resource" )

end

function GM:LobbyClientReady( Pl )

	self.Modules.SendToClient( Pl )
	--self.Inventory.ClientReady( Pl )

end
