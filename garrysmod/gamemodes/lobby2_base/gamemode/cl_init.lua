--[[-----------------------------------------------------------

	██╗      ██████╗ ██████╗ ██████╗ ██╗   ██╗    ██████╗ 
	██║     ██╔═══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝    ╚════██╗
	██║     ██║   ██║██████╔╝██████╔╝ ╚████╔╝      █████╔╝
	██║     ██║   ██║██╔══██╗██╔══██╗  ╚██╔╝      ██╔═══╝ 
	███████╗╚██████╔╝██████╔╝██████╔╝   ██║       ███████╗
	╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝    ╚═╝       ╚══════╝

	
	Copyright (c) James Swift, 2015
	
-----------------------------------------------------------]]--

include( "extensions/utf8.lua" )

include( "sh_util.lua" )
include( "cl_notification.lua" )
include( "cl_fonts.lua" )
include( "sh_modules.lua" )
include( "chat/cl_smilies.lua" )
include( "shared.lua" )

include( "vgui/lobby_notification.lua" )

function GM:Initialize( )
	
	self:CreateFonts( )

end

function GM:Think( )

	self.Notification.Think( )

end

function GM:TestNotification( )

	local notification = vgui.Create( "lobby_notification" )
	notification:SetPos( 50, 50 )
	notification:SetSize( 200, 30 )
	--notification:SetColor( Color( 78, 155, 237 ) ) 
	notification:SetIcon( "vgui/notices/hint" )
	notification:SetDuration( 10 )
	notification:SetText( "Woof! It works!" )

end