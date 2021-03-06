--[[-----------------------------------------------------------

	██╗      ██████╗ ██████╗ ██████╗ ██╗   ██╗    ██████╗ 
	██║     ██╔═══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝    ╚════██╗
	██║     ██║   ██║██████╔╝██████╔╝ ╚████╔╝      █████╔╝
	██║     ██║   ██║██╔══██╗██╔══██╗  ╚██╔╝      ██╔═══╝ 
	███████╗╚██████╔╝██████╔╝██████╔╝   ██║       ███████╗
	╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝    ╚═╝       ╚══════╝

	
	Copyright (c) James Swift, 2015
	
-----------------------------------------------------------]]--

local ENT = { }

ENT.Type = "brush"
ENT.Base = "base_brush"

AccessorFunc( ENT, "m_LocationName", "Location", FORCE_STRING )

function ENT:Initialize( )

	self:SetTrigger( true )
	
	if ( not self:GetLocation() ) then
		self:SetLocation( "Bad Value" )
	end

end

function ENT:KeyValue( key, value )
	
	if ( string.lower( key ) == "location" ) then
		self:SetLocation( value )
	end
	
end

function ENT:PassesTriggerFilters( ent )
	
	return IsValid( ent ) and ent:IsPlayer( )
	
end

function ENT:StartTouch( ent )

	if ( IsValid( ent ) and ent:IsPlayer( ) and ent:GetLocation( ) ~= self:GetLocation( ) ) then
		
		local oldlocation = ent:GetLocation( )
		
		ent:SetNWString( "sLocation", self:GetLocation() )
		hook.Run( "OnPlayerLocationChange", ent, oldlocation, self:GetLocation(), self )
		
	end

end

scripted_ents.Register( ENT, "lobby_location" )