--[[
-===========================================-
A great admin tool to help admins view player money, distance, names, and other fun stuff.

  .--.  .----..-.   .-..-..-. .-..----..-..---..-. .-.  .--.  .-.  .-..----.
 / {} \ | {}  \  `.'  || ||  `| || {}  } /  ___} |/ /  / {} \  \ \/ / | {_  
/  /\  \|     / |\ /| || || |\  || .--'| \     } |\ \ /  /\  \ / /\ \ | {__ 
`-'  `-'`----'`-' ` `-'`-'`-' `-'`-'   `-'`---'`-' `-'`-'  `-'`-'  `-'`----'

          A Garry's Mod script.
		   Created by TerrorErrorIst
-===========================================-
]]--

/******************************
Name: Notify/Prints
Function: Create Notify/Prints
******************************/
function Print ( msg )
	print ("[AdminPickaxe]: "..msg)
end

function ChatPrint ( msg, color )
	chat.AddText ( color, "[AdminPickaxe] "..msg )
end

function Notify ( msg, time )
	GAMEMODE:AddNotify ( msg, NOTIFY_GENERIC, time )
end


/*****************************
Name: Tables
Function: Tables
*****************************/
--== Player ==--
ply												= LocalPlayer()

--== Colors ==--
local blue                                       = ( Color(255,0,0,255) )
local lightred                                  = ( Color(255,100,100,255) )
local black                                     = ( Color(0,0,0,255) )
local green                                     = ( Color(0,255,0,255) )
local darkgreen                                 = ( Color(0,200,0,255) )
local white                                     = ( Color(255,255,255,255) )
local blue                                      = ( Color(0,0,255,255) )
local gold                                      = ( Color(255,228,0,255) )
local lightblue                                 = ( Color(116,187,251,255) )

--Transparent--
local tred                                      = ( Color(150,0,0,125) )
local tblack                                    = ( Color(0,0,0,225) )
local tgreen                                    = ( Color(0,150,0,125) )
local tblue                                     = ( Color(0,0,150,125) )
local trans                                     = ( Color(0,0,0,0) )

--Special--
local ttblue                                    = ( Color(0,0,175,150) )


local volume									= 0.60
ply:ConCommand("volume 0.6")


--== Spam Words ==--
words = { }
words[1] = "hax"
words[2] = "freeman"
words[3] = "figures"
words[4] = "cheese"
words[5] = "cp"
words[6] = "help"
words[7] = "dejavu"
words[8] = "run"
words[9] = "follow"
words[10] = "over here"
words[11] = "hi"
words[12] = "he's dead"
words[13] = "yes"
words[14] = "get in"
words[15] = "omg"
words[16] = "lets go"

--== Tabs ==--

--HUD--
local LogoTabCol 									= blue
local LogoTabGet								 	= "Off"

local CITabCol 										= blue
local CITabGet 										= "Off"
---------------------------------------------------------
local AdminsTabCol 								   	= blue
local AdminsTabGet 									= "Off"
local hudadminlength								= 150

local FriendsTabCol									= blue
local FriendsTabGet									= "Off"
local hudfriendslength								= 150

local HUDSpectator 									= { }
local SpecHUDTabGet 								= "Off"
local SpecHUDTabCol 								= blue

local drawingcrosshairTabCol 						= blue
local drawingcrosshairTabGet 						= "Off"

--========================================================--

--ESP--
local WallhackTabGet 								= "Off"
local WallhackTabCol 								= blue

local ESPInfoTabCol								 	= blue
local ESPInfoTabGet 								= "Off"

local specialonlyTabCol 							= green
local specialonlyTabGet 							= "On"

local showfriendsTabCol 							= blue
local showfriendsTabGet 							= "Off"

local showdistanceTabCol 							= blue
local showdistanceTabGet 							= "Off"

local showmoneyTabCol 								= blue
local showmoneyTabGet 								= "Off"

local showgroupsTabCol 								= blue
local showgroupsTabGet 								= "Off"

local ESPEntitysTabCol 								= blue
local ESPEntitysTabGet 								= "Off"

local beamsTabCol 									= blue
local beamsTabGet 									= "Off"

local ESPGroups										= {
"superadmin",
"admin",
"moderator",
"mod",
"admindonator",
"donatoradmin",
"donatormod",
"operator"
}

--========================================================--

--Logger--

JoinedAdmins 									= { }
JoinedFriends									= { }
JoinedMods										= { }
Spectators 										= { }

--========================================================--

--Misc--
local flashspammingTabCol 							= blue
local flashspammingTabGet 							= "Off"

local bunnyhopTabCol 								= blue
local bunnyhopTabGet 								= "Off"

local namechangingTabCol 							= blue
local namechangingTabGet 							= "Off"	

local followingTabCol 								= blue
local followingTabGet 								= "Off"

local keypadloggingTabGet 							= "Off"
local keypadloggingTabCol 							= blue

local derpingTabCol 								= blue
local derpingTabGet 								= "Off"

local animatingTabCol 								= blue
local animatingTabGet 								= "Off"	

local derpingTabCol 								= blue
local derpingTabGet 								= "Off"

local godmodeTabGet 								= "Off"
local godmodeTabCol 								= blue

local spammingTabGet 								= "Off"
local spammingTabCol 								= blue

local brightTabCol 									= blue
local brightTabGet 									= "Off"

local spectatingTabGet 								= "X"
local spectatingTabCol 								= white

local xrayTabGet 									= "Off"
local xrayTabCol 									= blue

local mousespammingTabCol 							= blue
local mousespammingTabGet 							= "Off"

local drawingTabCol									= blue
local drawingTabGet									= "Off"
--========================================================--

local idloggingTabCol 								= blue
local idloggingTabGet 								= "Off"	

--Material--
local Matinfo = {
["$basetexture"] = "models/debug/debugwhite",
["$model"]       = 1,
["$nocull"]      = 1,
["$ignorez"]     = 1
}

mat1 = (CreateMaterial( "chams", "VertexLitGeneric", Matinfo )) 
mat2 = (CreateMaterial( "wireframe", "Wireframe", Matinfo ))


--Keypad Logger--
local X = -50
local Y = -100
 
local KeyPos =  {      
        {X+5, Y+100, 25, 25, -2.2, 3.45, 1.3, -0},
        {X+37.5, Y+100, 25, 25, -0.6, 1.85, 1.3, -0},
        {X+70, Y+100, 25, 25, 1.0, 0.25, 1.3, -0},
 
        {X+5, Y+132.5, 25, 25, -2.2, 3.45, 2.9, -1.6},
        {X+37.5, Y+132.5, 25, 25, -0.6, 1.85, 2.9, -1.6},
        {X+70, Y+132.5, 25, 25, 1.0, 0.25, 2.9, -1.6},
 
        {X+5, Y+165, 25, 25, -2.2, 3.45, 4.55, -3.3},
        {X+37.5, Y+165, 25, 25, -0.6, 1.85, 4.55, -3.3},
        {X+70, Y+165, 25, 25, 1.0, 0.25, 4.55, -3.3},
 
        {X+5, Y+67.5, 50, 25, -2.2, 4.7, -0.3, 1.6},
        {X+60, Y+67.5, 35, 25, 0.3, 1.65, -0.3, 1.6}
}

////////////////////////////////////////////////////////////////////////////////////////////////
Print ("Tables Loaded")

--== Fonts ==--
surface.CreateFont("Menu",{font = "Arial", size = 17, weight = 200, antialias = 0})
surface.CreateFont("Get",{font = "Fixedsys", size = 17, weight = 200, antialias = 0})
surface.CreateFont("Small",{font = "Arial", size = 12, weight = 200, antialias = 0})
surface.CreateFont("ESP",{font = "Fixedsys", size = 12, weight = 200, antialias = 0})
surface.CreateFont("Logo",{font = "Tahoma", size = 20, weight = 100000, antialias = 0})
surface.CreateFont("Playlist",{font = "Tahoma", size = 15, weight = 100000, antialias = 0})
surface.CreateFont("HUDLogo",{font = "Ravie", size = 40, weight = 100000, antialias = 0})
surface.CreateFont("Infotab",{font = "Ravie", size = 75, weight = 100000, antialias = 0})

////////////////////////////////////////////////////////////////////////////////////////////////
Print ( "Fonts Created" )

/******************************
Name: Folders/Files
Function: Create Files and Folders
******************************/
if (not file.IsDir("AdminPickaxe", "Data"))
then file.CreateDir("AdminPickaxe")
end

if (not file.IsDir("AdminPickaxe/Logger", "Data"))
then file.CreateDir("AdminPickaxe/Logger")
end

if (not file.IsDir("AdminPickaxe/ESP", "Data"))
then file.CreateDir("AdminPickaxe/ESP")
end

if (not file.IsDir("AdminPickaxe/Detection", "Data"))
then file.CreateDir("AdminPickaxe/Detection")
end

if (not file.IsDir("AdminPickaxe/Playlist", "Data"))
then file.CreateDir("AdminPickaxe/Playlist")
end

if (not file.Exists("AdminPickaxe/Detection/toggle.txt", "Data"))
then file.Write("AdminPickaxe/Detection/toggle.txt", "true") 
end

if (not file.Exists("AdminPickaxe/ESP/Entitys.txt", "Data"))
then file.Write("AdminPickaxe/ESP/Entitys.txt", "")
end
if (not file.Exists("AdminPickaxe/ESP/Finder.txt", "Data"))
then file.Write("AdminPickaxe/ESP/Finder.txt", "")
end

if (not file.Exists("AdminPickaxe/ESP/Printers.txt", "Data"))
then file.Write("AdminPickaxe/ESP/Printers.txt", "")
end

if (not file.Exists("AdminPickaxe/Logger/ID.txt", "Data"))
then file.Write("AdminPickaxe/Logger/ID.txt", "")
end

if (not file.Exists("AdminPickaxe/Logger/Models.txt", "Data"))
then file.Write("AdminPickaxe/Logger/Models.txt", "")
end

if (not file.Exists("AdminPickaxe/Playlist/URL.txt", "Data"))
then file.Write("AdminPickaxe/Playlist/URL.txt", "")
end

if (not file.Exists("AdminPickaxe/Playlist/Name.txt", "Data"))
then file.Write("AdminPickaxe/Playlist/Name.txt", "")
end

local Printers										= string.Explode(" ",(file.Read("AdminPickaxe/ESP/printers.txt")))

local EEntitys										= string.Explode(" ",(file.Read("AdminPickaxe/ESP/entitys.txt")))

local FEntitys										= string.Explode(" ",(file.Read("AdminPickaxe/ESP/finder.txt")))

local detection										= file.Read("AdminPickaxe/Detection/toggle.txt")

local PlaylistURL									= string.Explode("%",(file.Read("AdminPickaxe/Playlist/URL.txt")))

local PlaylistName									= string.Explode("%",(file.Read("AdminPickaxe/Playlist/Name.txt")))

if file.Read("AdminPickaxe/Detection/toggle.txt")=="true" then
	detectionTabGet = "Off"
	detectionTabCol = blue
elseif file.Read("AdminPickaxe/Detection/toggle.txt")=="false" then
	detectionTabGet = "On"
	detectionTabCol = green
end		

function ServerEntNumber( class )
	serverentcounter = 0
	for k,v in pairs(ents.GetAll()) do
		if v:GetClass()==class then
			serverentcounter = serverentcounter + 1
		end
	end
	return serverentcounter
end

/******************************
Name: FrameTime shit
Function: timer frametime shit
******************************/
function dotimer (func)
	timer.Create(" "..math.Rand(math.Rand(1000000,5000),math.Rand(1000000,5000)).." ", 0.1, 1, func)
end

/******************************
Name: Commands/ConVars
Function: Everything Commands/ConVars
******************************/
function NewCom ( command, funct )
	concommand.Add ( command, funct )
	Print ( "Command "..command.." Created!" )
end

function RemoveCom ( command )
	concommand.Remove ( command )
	Print ( "Command "..command.." Removed!" )	
end

function NewCV ( CV, default, save )
	CreateClientConVar ( CV, default, save, false )
	Print ( "ConVar "..CV.. " Created!" )
end
Print ( "Command Functions Created" )
Print ( "ConVar Functions Created" )



/******************************
Name: Hook
Function: Everything Hooks
******************************/
function NewHook ( Type, Name, funct )
	hook.Add ( Type, Name, funct )
	Print ( "Hook "..Name.." Created!" )
end

function RemoveHook ( Type, Name )
	hook.Remove ( Type, Name )
	Print ( "Hook "..Name.." Removed!" )	
end

Print ( "Hook Functions Created" )
/******************************
Name: Draw/Surface
Function Everything with Draw/Surface
******************************/
function DrawRoundedBoxEx ( bordersize, x, y, sX, sY, color, Topl, Topr, Botl, Botr )
	draw.RoundedBoxEx ( bordersize, x, y, sX, sY, color, Topl, Topr, Botl, Botr )
end

function DrawRoundedBox ( bordersize, x, y, sX, sY, color )
	draw.RoundedBox ( bordersize, x, y, sX, sY, color )
end

function DrawOutlinedText ( title, font, x, y, color, OUTsize, OUTcolor )
	draw.SimpleTextOutlined ( title, font, x, y, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, OUTsize, OUTcolor )
end

function DrawOutlinedText2 ( title, font, x, y, color, OUTsize, OUTcolor )
	draw.SimpleTextOutlined ( title, font, x, y, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, OUTsize, OUTcolor )
end

function DrawOutlinedText3 ( title, font, x, y, color, OUTsize, OUTcolor )
	draw.SimpleTextOutlined ( title, font, x, y, color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, OUTsize, OUTcolor )
end

function DrawOutlinedRect (color, bx, by, ex, ey )
	surface.SetDrawColor (color)
	surface.DrawOutlinedRect ( bx, by, ex, ey )
end

function DrawLine ( bX, bY, eX, eY )
	surface.DrawLine ( bX, bY, eX, eY )
end

function DrawText ( text, x, y, color )
	draw.SimpleText ( text, "Get", x, y, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

Print ( "Draw/Surface Functions Created" )

/*****************************
Name: Derma
Function: Create Derma shit
*****************************/

function CreateButton ( title, Parent, tcolor, bcolor, visible, x, y, sX, sY, tip, doclick )
local button = vgui.Create( "DButton" )
button:SetParent( Parent ) 
button:SetText( " " )
button:SetPos( x, y )
button:SetSize( sX, sY )
button:SetVisible( visible )
button:SetColor( tcolor )
button:SetTooltip( tip or " " )
button.Paint = function ()
DrawRoundedBoxEx ( 10, 0, 0, button:GetWide(), button:GetTall(), bcolor, false, false, false, false )
DrawOutlinedText ( title, "Menu", button:GetWide()/2, button:GetTall()-10, white, 1, black )
DrawOutlinedRect (blue, 0, 0, button:GetWide(), button:GetTall() )
end
button.DoClick = doclick
end


function CreateCheckBox ( title, convar, parent, x, y, tip )
local checkbox = vgui.Create( "DCheckBoxLabel", parent )
checkbox:SetPos( x, y )
checkbox:SetText( title )
checkbox:SetConVar( convar )
checkbox:SetTextColor(white)
checkbox:SetTooltip( tip or " " )
checkbox:SizeToContents()  
end

/*****************************
Name: Visible
Function: Is the player visible?
*****************************/
function Visible( ply )
        if (!IsValid( ply )) then return false end
       
        local vecPos, _ = ply:GetBonePosition( ply:LookupBone( "ValveBiped.Bip01_Head1" ) or 12 );
        local trace = { start = LocalPlayer():EyePos(), endpos = vecPos, filter = LocalPlayer(), mask = MASK_SHOT };
        local traceRes = util.TraceLine( trace );
       
        TraceRes = traceRes;
       
        if (traceRes.HitWorld || traceRes.Entity != ply) then return false end;
       
        return true;
end
/*****************************
Name: Main
Function: Create Main Functions
*****************************/

function Unload ()
--Coms--
RemoveCom ( "AdminPickaxe_Menu" )
RemoveCom ( "AdminPickaxe_Boost1" )
RemoveCom ( "AdminPickaxe_Boost2" )
RemoveCom ( "AdminPickaxe_Boost3" )
RemoveCom ( "AdminPickaxe_Derp" )
RemoveCom ( "AdminPickaxe_Follow" )
RemoveCom ( "AdminPickaxe_GetDClasses" )
RemoveCom ( "AdminPickaxe_GetClass" )
RemoveCom ( "AdminPickaxe_GetModel" )
RemoveCom ( "AdminPickaxe_GetMaterial" )
RemoveCom ( "AdminPickaxe_SetATarget" )
RemoveCom ( "AdminPickaxe_Xray" )

--Hooks--
RemoveHook("HUDPaint", "Logo")
RemoveHook("HUDPaint", "CI")
RemoveHook("HUDPaint", "admins")
RemoveHook("HUDPaint", "friends")
RemoveHook("HUDPaint", "spectating")
RemoveHook("HUDPaint", "Crosshair")
RemoveHook("HUDPaint", "wallhack")
RemoveHook("HUDPaint", "ESPEntitys")
RemoveHook("HUDPaint", "findents")
RemoveHook("HUDPaint", "ESPInfo")
RemoveHook("HUDPaint", "beams1")
RemoveHook("HUDPaint", "beams2")
RemoveHook("Think", "idlog")
RemoveHook("Think", "flashspam")
RemoveHook("Think", "bhop")
RemoveHook("HUDPaint", "KeypadShow")
RemoveHook("Think", "KeypadLog")
RemoveHook("Think", "follow")
RemoveHook("Think", "derp")
RemoveHook("CalcView", "Derpview")
RemoveHook("ShouldDrawLocalPlayer", "derpdraw")
RemoveHook("Think", "spam")
RemoveHook("Think", "EFullbright")
RemoveHook("Think", "godmode")
RemoveHook("Think", "mousespam")

--timers--
timer.Destroy("namechange")
timer.Destroy("animating")


Close ()
Print	  ( "Unloaded" )
ChatPrint ( "Unloaded", blue )
end

function Load ()
NewCom ( "AdminPickaxe_Menu", Menu )

NewCom ( "AdminPickaxe_Boost1", boost1 )
NewCom ( "AdminPickaxe_Boost2", boost2 )
NewCom ( "AdminPickaxe_Boost3", boost3 )

NewCom ( "AdminPickaxe_GetClass", GetClass )
NewCom ( "AdminPickaxe_GetModel", GetModel )
NewCom ( "AdminPickaxe_GetMaterial", GetMaterial )
NewCom ( "AdminPickaxe_GetDClasses", GetDClasses )

NewCom ( "AdminPickaxe_Follow", Follow )
NewCom ( "AdminPickaxe_Derp", Derp )

NewCom ( "AdminPickaxe_SetATarget", SetbyView )

Loaddefaultscripts ()
Print	  ( "Loaded" )
ChatPrint ( "Loaded", blue )
end

function Reload()
Unload()
Load()
Close ()
end

/*****************************
Name: Not Done
Function: inpacient players clicking undone functions.
*****************************/

function NotDone ()
	ChatPrint("This Function Isn't done yet.", blue)
end

/*****************************
Name: HUD
Function: Create HUD Functions
*****************************/
function HUDLogo ()
	if !logo then
		logo = "On1"
		LogoTabCol = green
		LogoTabGet = "  On [1]"
		hook.Add("HUDPaint", "Logo", function ()
			DrawOutlinedRect (blue, ScrW()/2-130, -5, 264, 50 )
			DrawRoundedBoxEx ( 0, ScrW()/2-130, 0, 264, 45, tblue, false, false, false, false )
			DrawOutlinedText ( "AdminPickaxe", "HUDLogo", ScrW()/2, ScrH()/35, blue, 3, black )
		end)
	elseif logo=="On1" then
		logo = "On2"
		LogoTabCol = green
		LogoTabGet = "  On [2]"
		hook.Remove("HUDPaint", "Logo")
		hook.Add("HUDPaint", "Logo", function ()
			DrawOutlinedRect (blue, ScrW()/2-130, -5, 264, 50 )
			DrawOutlinedText ( "AdminPickaxe", "HUDLogo", ScrW()/2, ScrH()/35, blue, 3, black )
		end)
	elseif logo=="On2" then
		logo = "On3"
		LogoTabCol = green
		LogoTabGet = "  On [3]"
		hook.Remove("HUDPaint", "Logo")
		hook.Add("HUDPaint", "Logo", function ()
			DrawOutlinedText ( "AdminPickaxe", "HUDLogo", ScrW()/2, ScrH()/35, blue, 3, black )
		end)
	else
		LogoTabCol = blue
		logo = false
		LogoTabGet = "Off"
		hook.Remove("HUDPaint", "Logo")
	end
end


function HUDCI ()
	if !CI then
		CI = "On1"
		CITabCol = green
		CITabGet = "  On [1]"
		hook.Add("HUDPaint", "CI", function ()
		DrawRoundedBoxEx ( 0, ScrW()/2-100, 45, 200, 25, tblack, false, false, false, false )
		DrawOutlinedText ( "Fps: ", "Menu", ScrW()/2-75, 55, blue, 1, black )
		DrawOutlinedText ( math.Round( 1/FrameTime()), "Menu", ScrW()/2-50, 55, blue, 1, black )	
		DrawOutlinedText ( "Ping: ", "Menu", ScrW()/2+60, 55, blue, 1, black )
		DrawOutlinedText ( LocalPlayer():Ping(), "Menu", ScrW()/2+85, 55, blue, 1, black )			
		end)
	elseif CI=="On1" then
		CI = "On2"
		CITabCol = green
		CITabGet = "  On [2]"
		hook.Remove("HUDPaint", "CI")
		hook.Add("HUDPaint", "CI", function ()
		DrawOutlinedText ( "Fps: ", "Menu", ScrW()/2-75, 55, blue, 1, black )
		DrawOutlinedText ( math.Round( 1/FrameTime()), "Menu", ScrW()/2-50, 55, blue, 1, black )	
		DrawOutlinedText ( "Ping: ", "Menu", ScrW()/2+60, 55, blue, 1, black )
		DrawOutlinedText ( LocalPlayer():Ping(), "Menu", ScrW()/2+85, 55, blue, 1, black )			
		end)
	elseif CI=="On2" then
		CI = "On3"
		CITabCol = green
		CITabGet = "  On [3]"
		hook.Remove("HUDPaint", "CI")
		hook.Add("HUDPaint", "CI", function ()
		DrawOutlinedText ( "Fps: ", "Menu", ScrW()/2-145, 5, blue, 1, black )
		DrawOutlinedText ( math.Round( 1/FrameTime()), "Menu", ScrW()/2-120, 5, blue, 1, black )	
		DrawOutlinedText ( "Ping: ", "Menu", ScrW()/2+130, 5, blue, 1, black )
		DrawOutlinedText ( LocalPlayer():Ping(), "Menu", ScrW()/2+155, 5, blue, 1, black )			
		end)
	else
		CITabCol = blue
		CI = false
		CITabGet = "Off"
		hook.Remove("HUDPaint", "CI")
	end
end

function HUDAdmins ()
	if !admins then
		admins = "Right"
		AdminsTabCol = green
		AdminsTabGet = "Right"
		hook.Add("HUDPaint", "admins", function ()
			DrawOutlinedRect (blue, ScrW()-201, -5, 200, hudadminlength+25 )
			DrawOutlinedRect (blue, ScrW()-200, -5, 200, 25 )
			DrawRoundedBoxEx ( 0, ScrW()-200, 20, 200, hudadminlength, tblack, false, false, false, false )
			DrawRoundedBoxEx ( 0, ScrW()-200, 0, 200, 20, tblue, false, false, false, false )
			DrawOutlinedText ( "Admins", "Menu", ScrW()-100, 10, blue, 1, black )	
			admincount = 0
			hudcount = 0
			for k,v in pairs(player.GetAll()) do
				if v:IsAdmin() or v:IsSuperAdmin() then
					DrawOutlinedText ( v:GetName(), "Menu", ScrW()-100, 30+admincount, blue, 1, black )
					admincount = admincount+17.5
					hudcount = hudcount+1
				end
			end
			if admincount==0 then
				DrawOutlinedText ( "No Admins on this server", "Menu", ScrW()-100, 30, blue, 1, black )
			end	
		end)
	elseif admins=="Right" then
		admins = "Left"
		AdminsTabCol = green
		AdminsTabGet = "Left"
		hook.Remove("HUDPaint", "admins")
		hook.Add("HUDPaint", "admins", function ()
			DrawOutlinedRect (blue, 0, -5, 200, hudadminlength+25 )
			DrawOutlinedRect (blue, 0, -5, 200, 25 )
			DrawRoundedBoxEx ( 0, 0, 20, 200, hudadminlength, tblack, false, false, false, false )
			DrawRoundedBoxEx ( 0, 0, 0, 200, 20, tblue, false, false, false, false )
			DrawOutlinedText ( "Admins", "Menu", 0+100, 10, blue, 1, black )	
			admincount = 0
			for k,v in pairs(player.GetAll()) do
				if v:IsAdmin() or v:IsSuperAdmin() then
					DrawOutlinedText ( v:GetName(), "Menu", 100, 30+admincount, blue, 1, black )
					admincount = admincount+17.5
				end
			end	
			if admincount==0 then
				DrawOutlinedText ( "No Admins on this server", "Menu", 100, 30, blue, 1, black )
			end			
		end)		
	elseif admins then
		AdminsTabCol = blue
		admins = false
		AdminsTabGet = "Off"
		hook.Remove("HUDPaint", "admins")
	end
end

function HUDFriends ()
	if !friends then
		friends = "Left"
		FriendsTabCol = green
		FriendsTabGet = "Left"
		hook.Add("HUDPaint", "friends", function ()
			DrawOutlinedRect (blue, 0, -5, 201, hudfriendslength+25 )
			DrawOutlinedRect (blue, 0, -5, 201, 25 )
			DrawRoundedBoxEx ( 0, 0, 20, 200, hudfriendslength, tblack, false, false, false, false )
			DrawRoundedBoxEx ( 0, 0, 0, 200, 20, tblue, false, false, false, false )
			DrawOutlinedText ( "Friends", "Menu", 0+100, 10, blue, 1, black )
			friendcount = 0
			for k,v in pairs(player.GetAll()) do
				if v != ply and v:GetFriendStatus()=="friend" then
					DrawOutlinedText ( v:GetName(), "Menu", 100, 30+friendcount, blue, 1, black )
					friendcount = friendcount+17.5
				end
			end
			if friendcount==0 then
				DrawOutlinedText ( "No friends on this server", "Menu", 100, 30, blue, 1, black )
			end
		end)
	elseif friends == "Left" then
		friends = "Right"
		FriendsTabCol = green
		FriendsTabGet = "Right"
		hook.Remove("HUDPaint", "friends")
		hook.Add("HUDPaint", "friends", function ()
			DrawOutlinedRect (blue, ScrW()-200, -5, 200, hudfriendslength+25 )
			DrawOutlinedRect (blue, ScrW()-200, -5, 200, 25 )
			DrawRoundedBoxEx ( 0, ScrW()-200, 20, 200, hudfriendslength, tblack, false, false, false, false )
			DrawRoundedBoxEx ( 0, ScrW()-200, 0, 200, 20, tblue, false, false, false, false )
			DrawOutlinedText ( "Friends", "Menu", ScrW()-100, 10, blue, 1, black )
			friendcount = 0
			for k,v in pairs(player.GetAll()) do
				if v != ply and v:GetFriendStatus()=="friend" then
					DrawOutlinedText ( v:GetName(), "Menu", ScrW()-100, 30+friendcount, blue, 1, black )
					friendcount = friendcount+17.5
				end
			end
			if friendcount==0 then
				DrawOutlinedText ( "No friends on this server", "Menu", 100, 30, blue, 1, black )
			end		
		end)
	else 
		FriendsTabCol = blue
		friends = false
		FriendsTabGet = "Off"
		hook.Remove("HUDPaint", "friends")
	end
end

function HUDSpectate ()
	if !Spectateshit then
		Spectateshit = true
		SpecHUDTabGet = "On"
		SpecHUDTabCol  = green
		hook.Add("HUDPaint", "spectating", function()
			for k,v in pairs(player.GetAll()) do
				if (IsValid(v:GetObserverTarget())) and v:GetObserverTarget()==ply then
					DrawOutlinedText ( v:GetName().." Is Watching you.", "Menu", ScrW()/2, ScrH()/14, blue, 1, black )
				end
			end
		end)
	elseif Spectateshit then
		Spectateshit = false
		SpecHUDTabGet = "Off"
		SpecHUDTabCol  = blue
		hook.Remove("HUDPaint", "spectating")
	end
end

function HUDCrosshair ()
	if !drawingcrosshair then
		drawingcrosshair = "1"
		drawingcrosshairTabCol = green
		drawingcrosshairTabGet = "  On [1]"
		hook.Add("HUDPaint", "Crosshair", function()
			surface.SetDrawColor( 255, 0, 0, 255 )
			surface.DrawLine( ScrW()/2 - 20, ScrH()/2, ScrW()/2 - 5, ScrH()/2 )
			surface.DrawLine( ScrW()/2 + 20, ScrH()/2, ScrW()/2 + 5, ScrH()/2 )
			surface.DrawLine( ScrW()/2, ScrH()/2 - 20, ScrW()/2, ScrH()/2 - 5 )
			surface.DrawLine( ScrW()/2, ScrH()/2 + 20, ScrW()/2, ScrH()/2 + 5 )		
			surface.DrawLine( ScrW()/2, ScrH()/2 , ScrW()/2, ScrH()/2+1  )	
		end)
	elseif drawingcrosshair=="1" then
		drawingcrosshair = "2"
		drawingcrosshairTabCol = green
		drawingcrosshairTabGet = "  On [2]"
		hook.Remove("HUDPaint", "Crosshair")
		hook.Add("HUDPaint", "Crosshair", function()
			surface.SetDrawColor( 255, 0, 0, 255 )
			surface.DrawLine( ScrW()/2 - 10, ScrH()/2-10, ScrW()/2 , ScrH()/2 )
			surface.DrawLine( ScrW()/2 + 10, ScrH()/2+10, ScrW()/2 , ScrH()/2 )		
			surface.DrawLine( ScrW()/2 + 10, ScrH()/2-10, ScrW()/2 , ScrH()/2 )
			surface.DrawLine( ScrW()/2 - 10, ScrH()/2+10, ScrW()/2 , ScrH()/2 )			
		end)		
	elseif drawingcrosshair=="2" then
		drawingcrosshair = "3"
		drawingcrosshairTabCol = green
		drawingcrosshairTabGet = "  On [3]"
		hook.Remove("HUDPaint", "Crosshair")
		hook.Add("HUDPaint", "Crosshair", function()
			local center = Vector( ScrW() / 2, ScrH() / 2, 0 )
			local scale = Vector( 10, 10, 0 )
			local segmentdist = 360 / ( 2 * math.pi * math.max( scale.x, scale.y ) / 2 )
			surface.SetDrawColor( 255, 0, 0, 255 )
	
			for a = 0, 360 - segmentdist, segmentdist do
				surface.DrawLine( center.x + math.cos( math.rad( a ) ) * scale.x, center.y - math.sin( math.rad( a ) ) * scale.y, center.x + math.cos( math.rad( a + segmentdist ) ) * scale.x, center.y - math.sin( math.rad( a + segmentdist ) ) * scale.y )
			end	
		end)		
	elseif drawingcrosshair=="3" then
		drawingcrosshair = false
		drawingcrosshairTabCol = blue
		drawingcrosshairTabGet = "Off"
		hook.Remove("HUDPaint", "Crosshair")
	end
end



function HUDToggleON1 ()
logo = false
HUDLogo ()

CI = false
HUDCI ()

admins = false
HUDAdmins ()

friends = false
HUDFriends ()

Spectateshit = false
HUDSpectate ()

drawingcrosshair = false
HUDCrosshair ()
end

function HUDToggleON2 ()
logo = "On2"
HUDLogo ()

CI = "On2"
HUDCI ()

admins = "Left"
HUDAdmins ()

friends = "Right"
HUDFriends ()

Spectateshit = false
HUDSpectate ()

drawingcrosshair = false
HUDCrosshair ()
end


function HUDToggleOFF ()
logo = "On3"
HUDLogo ()

CI = "On3"
HUDCI ()

admins = "Left"
HUDAdmins ()

friends = "Right"
HUDFriends ()

Spectateshit = true
HUDSpectate ()

drawingcrosshair = "3"
HUDCrosshair ()
end



/////////////////////////////////////////////////////////////////////////////////////////

/*****************************
Name: ESP
Function: Create ESP Functions
*****************************/
function Wallhack ()
	if !wallhacking then
		wallhacking = "chams"
		WallhackTabGet = " Chams"
		WallhackTabCol = green
		hook.Add("HUDPaint", "wallhack", function()
			for k,v in pairs(player.GetAll()) do
				if !Visible(v) and v:IsPlayer() and v:Alive() and v != ply then
					if specialonly then
						if v:IsAdmin() or v:IsSuperAdmin() or table.HasValue(ESPGroups, group) or v:GetFriendStatus()=="friend" then
							local TCol = team.GetColor(v:Team())
							cam.Start3D(EyePos(),EyeAngles())
							render.SuppressEngineLighting( true )
							render.MaterialOverride( mat1 )
							render.SetColorModulation( ( TCol.r * ( 5 / 255 ) ), ( TCol.g * ( 1 / 255 ) ), ( TCol.b * ( 1 / 255 ) ) )
							v:DrawModel()
								if (IsValid(v:GetActiveWeapon())) then
									v:GetActiveWeapon():DrawModel()
								end
							render.SuppressEngineLighting( false )
							render.MaterialOverride( )
							cam.End3D()
						end
					elseif !specialonly then
						local TCol = team.GetColor(v:Team())
						cam.Start3D(EyePos(),EyeAngles())
						render.SuppressEngineLighting( true )
						render.MaterialOverride( mat1 )
						render.SetColorModulation( ( TCol.r * ( 5 / 255 ) ), ( TCol.g * ( 1 / 255 ) ), ( TCol.b * ( 1 / 255 ) ) )
						v:DrawModel()
							if (IsValid(v:GetActiveWeapon())) then
								v:GetActiveWeapon():DrawModel()
							end
						render.SuppressEngineLighting( false )
						render.MaterialOverride( )
						cam.End3D()
					end
				end
			end
		end)
	elseif wallhacking == "chams" then
		wallhacking = "wireframe"
		WallhackTabGet = "     WireFrame"
		WallhackTabCol = green
		hook.Remove("HUDPaint", "wallhack")
		hook.Add("HUDPaint", "wallhack", function()
			for k,v in pairs(player.GetAll()) do
				if !Visible(v) and v:IsPlayer() and v:Alive() and v != ply and v:Team()!= TEAM_SPECTATOR then
					local TCol = team.GetColor(v:Team())
					cam.Start3D(EyePos(),EyeAngles())
					render.SuppressEngineLighting( true )
					render.MaterialOverride( mat2 )
					render.SetColorModulation( ( TCol.r * ( 5 / 255 ) ), ( TCol.g * ( 1 / 255 ) ), ( TCol.b * ( 1 / 255 ) ) )
					v:DrawModel()
						if (IsValid(v:GetActiveWeapon())) then
							v:GetActiveWeapon():DrawModel()
						end
					render.SuppressEngineLighting( false )
					render.MaterialOverride( )
					cam.End3D()
				end
			end
		end)	
	else
		wallhacking = false
		WallhackTabGet = "Off"
		WallhackTabCol = blue
		hook.Remove("HUDPaint", "wallhack")
	end
end

function Entitys ()
	if !ESPEntitys then
		ESPEntitys = true
		ESPEntitysTabCol = green
		ESPEntitysTabGet = "On"
		hook.Add("HUDPaint", "ESPEntitys", function()
			for k,v in pairs(ents.GetAll()) do
				if table.HasValue(EEntitys,v:GetClass()) then
					cam.Start3D(EyePos(),EyeAngles())
					render.SuppressEngineLighting( true )
					render.MaterialOverride( mat )
					render.SetColorModulation( 0,255,0 )
					render.SetBlend(0.3)
					v:DrawModel()
					render.SetBlend(1)
					render.SuppressEngineLighting( false )
					render.MaterialOverride( )
					cam.End3D()
				elseif table.HasValue(Printers,v:GetClass()) then
					cam.Start3D(EyePos(),EyeAngles())
					render.SuppressEngineLighting( true )
					render.MaterialOverride( mat )
					render.SetColorModulation( 255,0,0 )
					render.SetBlend(0.3)
					v:DrawModel()
					render.SetBlend(1)
					render.SuppressEngineLighting( false )
					render.MaterialOverride( )
					cam.End3D()				
				end
			end	
		end)


		
	elseif ESPEntitys then
		ESPEntitys = false
		ESPEntitysTabCol = blue
		ESPEntitysTabGet = "Off"
		hook.Remove("HUDPaint", "ESPEntitys")
	end
end

function Info ()
		if !ESPInfo then
			ESPInfo = true
			ESPInfoTabCol = green
			ESPInfoTabGet = "On"
			hook.Add("HUDPaint", "ESPInfo", function()
				for k,v in pairs(player.GetAll()) do	
				local playermoney = (v.DarkRPVars and v.DarkRPVars.money) or 0
					group = ("["..v:GetUserGroup().."]") or "[user]"
					if group=="[user]" then group=" "
					end
					
					
					groupcol = lightblue
						if table.HasValue(ESPGroups, group) then
							groupcol = blue
						elseif v:IsAdmin() or v:IsSuperAdmin() then
							groupcol = blue
						end
						
					local Position 	= (v:GetPos()+Vector(0,0,80)):ToScreen()
					if v:IsPlayer() and v:Alive() and v != ply and v:Team()!= TEAM_SPECTATOR then
						if showfriends and v:GetFriendStatus()=="friend" then
							DrawOutlinedText ( "[Friend]", "ESP", Position.x, Position.y-15, green, 0.5, black )
						end
						if specialonly then
							if v:IsAdmin() or v:IsSuperAdmin() or v:GetFriendStatus()=="friend" then
								DrawOutlinedText ( v:GetName(), "ESP", Position.x, Position.y-50, white, 0.5, black )
								if showdistance then
									DrawOutlinedText ( "Dis: "..math.Round(ply:GetPos():Distance(v:GetPos())), "ESP", Position.x, Position.y-40, white, 0.5, black )
									if showmoney then
										DrawOutlinedText ( "$"..playermoney, "ESP", Position.x, Position.y-40, white, 0.5, black )
											if showgroups then
												DrawOutlinedText ( group, "ESP", Position.x, Position.y-65, groupcol, 0.5, black )
											end
									else
										if showgroups then
											DrawOutlinedText ( group, "ESP", Position.x, Position.y-65, groupcol, 0.5, black )
										end
									end
								else	
									if showmoney then
										DrawOutlinedText ( "$"..playermoney, "ESP", Position.x, Position.y-40, white, 0.5, black )
											if showgroups then
												DrawOutlinedText ( group, "ESP", Position.x, Position.y-65, groupcol, 0.5, black )
											end
									else
										if showgroups then
											DrawOutlinedText ( group, "ESP", Position.x, Position.y-65, groupcol, 0.5, black )
										end
									end
								end	
							end
						else
							DrawOutlinedText ( v:GetName(), "ESP", Position.x, Position.y-50, white, 0.5, black )
								if showdistance then
									DrawOutlinedText ( "Dis: "..math.Round(ply:GetPos():Distance(v:GetPos())), "ESP", Position.x, Position.y-40, white, 0.5, black )
										if showmoney then
											DrawOutlinedText ( "$"..playermoney, "ESP", Position.x, Position.y-30, white, 0.5, black )
												if showgroups then
													DrawOutlinedText ( group, "ESP", Position.x, Position.y-65, groupcol, 0.5, black )
												end
										else
											if showgroups then
												DrawOutlinedText ( group, "ESP", Position.x, Position.y-65, groupcol, 0.5, black )
											end
										end
								else
									
									if showmoney then
										DrawOutlinedText ( "$"..playermoney, "ESP", Position.x, Position.y-40, white, 0.5, black )
											if showgroups then
												DrawOutlinedText ( group, "ESP", Position.x, Position.y-65, groupcol, 0.5, black )
											end
									else
										if showgroups then
											DrawOutlinedText ( group, "ESP", Position.x, Position.y-65, groupcol, 0.5, black )
										end
									end
								end	
							end
						end
					end
			end)
		elseif ESPInfo then
			ESPInfo = false
			ESPInfoTabCol = blue
			ESPInfoTabGet = "Off"
			hook.Remove("HUDPaint", "ESPInfo")
		end
end

function Finder ()
	if !finding then
		finding = true
		hook.Add("HUDPaint", "findents", function ()
			for k,v in pairs(ents.GetAll()) do
				if table.HasValue(FEntitys, v:GetClass()) then
					local Position 	= (v:GetPos()+Vector(0,0,5)):ToScreen()
					DrawOutlinedText ( "["..v:GetClass().."]", "ESP", Position.x, Position.y-65, blue, 0.5, black )
				end
			end
		end)
	elseif finding then
		finding = false
		hook.Remove("HUDPaint", "findents")
	end
end

function AddEnt() 
	local trace = util.GetPlayerTrace( ply ) 
	local traceRes = util.TraceLine( trace ) 
	if traceRes.HitNonWorld then 
		local target = traceRes.Entity 
		file.Append("AdminPickaxe/ESP/Entitys.txt"," "..target:GetClass())
		ChatPrint("Entity: "..target:GetClass().." has been added to Entity ESP!", blue)
	else
		ChatPrint("You need to be looking at a Entity to add it!", blue)
	end
	EEntitys = string.Explode(" ",(file.Read("AdminPickaxe/ESP/entitys.txt")))
end

function GetEntAmount ()
	local trace = util.GetPlayerTrace( ply ) 
	local traceRes = util.TraceLine( trace ) 
	if traceRes.HitNonWorld then 
		local target = traceRes.Entity 
		ChatPrint(ServerEntNumber( target:GetClass() ).." Entitys has been found with class ["..target:GetClass().."]", blue)
	else
		ChatPrint("You need to be looking at a Entity to see the amount!", blue)
	end
end


function AddPrinter() 
	local trace = util.GetPlayerTrace( ply ) 
	local traceRes = util.TraceLine( trace ) 
	if traceRes.HitNonWorld then 
		local target = traceRes.Entity 
		file.Append("AdminPickaxe/ESP/Printers.txt"," "..target:GetClass())
		ChatPrint("Entity: "..target:GetClass().." has been added to Printer ESP!", blue)
	else
		ChatPrint("You need to be looking at a Entity(Printer) to add it!", blue)
	end
	Printers = string.Explode(" ",(file.Read("AdminPickaxe/ESP/printers.txt")))
end

function FindEnt ()
	local trace = util.GetPlayerTrace( ply ) 
	local traceRes = util.TraceLine( trace ) 
	if traceRes.HitNonWorld then 
		local target = traceRes.Entity 
		file.Append("AdminPickaxe/ESP/Finder.txt"," "..target:GetClass())
		ChatPrint(ServerEntNumber( target:GetClass() ).." Entitys has been found and added to finder ["..target:GetClass().."]", blue)
	else
		ChatPrint("You need to be looking at a Entity to add it!", blue)
	end
	FEntitys = string.Explode(" ",(file.Read("AdminPickaxe/ESP/Finder.txt")))
end

function ClearEntitys()
	file.Write("AdminPickaxe/ESP/Entitys.txt", "")
	EEntitys = string.Explode(" ",(file.Read("AdminPickaxe/ESP/entitys.txt")))
	ChatPrint("All Entity's have been removed", blue)
end

function ClearPrinters()
	file.Write("AdminPickaxe/ESP/Printers.txt", "")
	Printers = string.Explode(" ",(file.Read("AdminPickaxe/ESP/printers.txt")))
	ChatPrint("All Printer's have been removed", blue)
end

function ClearFinder()
	file.Write("AdminPickaxe/ESP/Finder.txt", "")
	FEntitys = string.Explode(" ",(file.Read("AdminPickaxe/ESP/Finder.txt")))
	ChatPrint("All Entity's have been removed from Finder", blue)
end


function SpecialOnly()
	if !specialonly then
		specialonly = true
		specialonlyTabCol = green
		specialonlyTabGet = "On"
	elseif specialonly then
		specialonly = false
		specialonlyTabCol = blue
		specialonlyTabGet = "Off"
	end
end

function ShowFriends()
	if !showfriends then
		showfriends = true
		showfriendsTabCol = green
		showfriendsTabGet = "On"
	elseif showfriends then
		showfriends = false
		showfriendsTabCol = blue
		showfriendsTabGet = "Off"
	end
end

function ShowDistance ()
	if !showdistance then
		showdistance = true
		showdistanceTabCol = green
		showdistanceTabGet = "On"
	elseif showdistance then
		showdistance = false
		showdistanceTabCol = blue
		showdistanceTabGet = "Off"
	end
end

function ShowMoney ()
	if !showmoney then
		showmoney = true
		showmoneyTabCol = green
		showmoneyTabGet = "On"
	elseif showmoney then
		showmoney = false
		showmoneyTabCol = blue
		showmoneyTabGet = "Off"
	end
end		

function ShowGroups ()
	if !showgroups then
		showgroups = true
		showgroupsTabCol = green
		showgroupsTabGet = "On"
	elseif showgroups then
		showgroups = false
		showgroupsTabCol = blue
		showgroupsTabGet = "Off"
	end
end	

function Beams()
	if !beams then
		beams = "admin"
		beamsTabCol = green
		beamsTabGet = "Admin"
		hook.Add("HUDPaint", "beams1", function()
			for k,v in pairs (player.GetAll()) do
				if v != LocalPlayer() and Visible(v) and (v:IsAdmin() or v:IsSuperAdmin()) or table.HasValue(ESPGroups, group) then
					cam.Start3D(EyePos(),EyeAngles())
					render.SetMaterial( Material("cable/bluelaser"))
					render.SetColorModulation(0,255,0)	
					render.DrawBeam(LocalPlayer():LocalToWorld(v:OBBCenter()+Vector(30,0,0)),v:LocalToWorld(v:OBBCenter()),0.7,0.7,0.7)
					cam.End3D()
				end
			end	
		end)
	elseif beams == "admin" then
		beams = "all"
		beamsTabCol = green
		beamsTabGet = "All"
		hook.Add("HUDPaint", "beams2", function()
			for k,v in pairs (player.GetAll()) do
				if v != LocalPlayer() and Visible(v) and !v:IsAdmin() and !v:IsSuperAdmin() then
					cam.Start3D(EyePos(),EyeAngles())
					render.SetMaterial( Material("models/wireframe"))
					render.SetColorModulation(0,255,0)	
					render.DrawBeam(LocalPlayer():LocalToWorld(v:OBBCenter()+Vector(30,0,0)),v:LocalToWorld(v:OBBCenter()),0.1,0.1,0.1)
					cam.End3D()
				end
			end	
		end)
	elseif beams == "all" then
		beams = false
		beamsTabCol = blue
		beamsTabGet = "Off"
		hook.Remove("HUDPaint", "beams1")
		hook.Remove("HUDPaint", "beams2")
	end
end


function ESPOn()
		espon = true
		wallhacking = false
		Wallhack()
		ESPInfo = false
		Info()
		ESPEntitys = false
		Entitys()
		showfriends = false
		ShowFriends()
		showdistance = false
		ShowDistance()
		showmoney = false
		ShowMoney()
		showgroups = false
		ShowGroups()
		beams = false
		Beams()
		finding = false
		Finder ()
end

function ESPOff()
		espon = false
		wallhacking = "wireframe"
		Wallhack()
		ESPInfo = true
		Info()
		ESPEntitys = true
		Entitys()		
		showfriends = true
		ShowFriends()
		showdistance = true
		ShowDistance()
		showmoney = true
		ShowMoney()
		showgroups = true
		ShowGroups()
		specialonly = true
		SpecialOnly()
		beams = "all"
		Beams()		
		finding = true
		Finder ()
end

/////////////////////////////////////////////////////////////////////////////////////////

/*****************************
Name: Log
Function: Create Log functions
*****************************/
function LogID ()
	logged = {}
	if !idlogging then
		idlogging = true
		idloggingTabCol = green
		idloggingTabGet = "On"
		hook.Add("Think", "idlog", function()
			for k,v in pairs(player.GetAll()) do
				if v != ply and (not table.HasValue(logged,v)) then
					table.insert(logged,v)
					file.Append("AdminPickaxe/Logger/ID.txt", tostring( os.date() ).."          "..v:GetName().."          "..v:SteamID().."\n")
					Print (v:GetName().." ID logged")
				end
			end
		end)
	elseif idlogging then
		idlogging = false
		idloggingTabCol = blue
		idloggingTabGet = "Off"	
		hook.Remove("Think", "idlog")
	end
end

function Log ()
	idlogging = false
	LogID ()
end


--Spectators--
function CheckSpectators()
		for k, v in pairs(player.GetAll()) do
                if IsValid(v:GetObserverTarget()) and v:GetObserverTarget():IsPlayer() then
				    if(not table.HasValue(Spectators, v)) then
                        table.insert(Spectators, v);
					surface.PlaySound("buttons/blip1.wav")
					Notify(v:GetName().." is now spectating: "..v:GetObserverTarget():GetName())
					print ( v:GetName().." is now spectating: "..v:GetObserverTarget():GetName())
				end
			end
		end
		
      for k, v in pairs(Spectators) do
                if (not IsValid(v) or not IsValid(v:GetObserverTarget()) or not v:GetObserverTarget():IsPlayer() ) then
                        table.remove(Spectators, k);
							Notify(v:GetName().." is not spectating anymore!")
							print ( v:GetName().." is not spectating anymore!")
				end
		end
end

--Detection--

function AdminDetect()

end

function ModDetect()

end

function FriendsDetect()

end

function ToggleDetect ()
	if file.Read("AdminPickaxe/Detection/toggle.txt")=="true" then
		file.Write("AdminPickaxe/Detection/toggle.txt", "false")
		local detection										= file.Read("AdminPickaxe/Detection/toggle.txt")
		if file.Read("AdminPickaxe/Detection/toggle.txt")=="true" then
			detectionTabGet = "Off"
			detectionTabCol = blue
		elseif file.Read("AdminPickaxe/Detection/toggle.txt")=="false" then
			detectionTabGet = "On"
			detectionTabCol = green
		end		
		ChatPrint("Detection Switched On!", blue)
	elseif file.Read("AdminPickaxe/Detection/toggle.txt")=="false" then
		file.Write("AdminPickaxe/Detection/toggle.txt", "true")	
		local detection										= file.Read("AdminPickaxe/Detection/toggle.txt")
		if file.Read("AdminPickaxe/Detection/toggle.txt")=="true" then
			detectionTabGet = "Off"
			detectionTabCol = blue
		elseif file.Read("AdminPickaxe/Detection/toggle.txt")=="false" then
			detectionTabGet = "On"
			detectionTabCol = green
		end		
		ChatPrint("Detection Switched Off!", blue)		
	end
end

/*****************************
Name: Misc
Function: Create Misc Functions
*****************************/
function FlashlightSpam ()
	if !flashspamming then 
		flashspamming = true
		flashspammingTabCol = green
		flashspammingTabGet = "On"
		hook.Add("Think", "flashspam", function()
			if input.IsKeyDown(KEY_L) then
				ply:ConCommand("impulse 100")
			end
		end)
		
	elseif flashspamming then
		flashspamming = false
		flashspammingTabCol = blue
		flashspammingTabGet = "Off"
		hook.Remove("Think", "flashspam")
	end
end

function Bunnyhop ()
	if !bunnyhopping then
		bunnyhopping = true
		bunnyhopTabCol = green
		bunnyhopTabGet = "On"	
		hook.Add("Think", "bhop", function()
			if input.IsKeyDown(KEY_SPACE) then
				if ply:GetVelocity():Length()>5 then
					if !jumping then
						ply:ConCommand("+jump")
						jumping = true
					elseif jumping then
						ply:ConCommand("-jump")
						jumping = false
					end

				end
			end
		end)


	elseif bunnyhopping then
		bunnyhopping = false
		bunnyhopTabCol = blue
		bunnyhopTabGet = "Off"	
		hook.Remove("Think", "bhop")
		ply:ConCommand("-jump")
	end
end

function pick(Table)
return Table[math.random(0,table.getn(Table))]
end

function NameChanger ()
	playernames={}
	a = 0
	for k,v in pairs(player.GetAll()) do
		if v:IsPlayer() and v!=LocalPlayer() then
			playernames[a]=v:Nick()
				a=a+1
		end
	end
	
	if !namechanging then
		namechanging = true
		namechangingTabCol = green
		namechangingTabGet = "On"
		timer.Create("namechange", 6, 0, function() ply:ConCommand("say /rpname "..pick(playernames).."   ") end)
	elseif namechanging then
		namechanging = false
		namechangingTabCol = blue
		namechangingTabGet = "Off"		
		timer.Destroy("namechange")
	end
end

function Follow ()
	if !following then
		following = true
		followingTabCol = green
		followingTabGet = "On"
		trace = util.GetPlayerTrace( ply ) 
		traceRes = util.TraceLine( trace ) 
		if traceRes.HitNonWorld then 
			target = traceRes.Entity 
				if target:IsPlayer() then 
					ID = target:SteamID()
						hook.Add("Think", "follow", function()
							for k,v in pairs(player.GetAll()) do
								if v:SteamID()==ID then
									local head = v:LookupBone("ValveBiped.Bip01_Head1")
									local headpos,headang = v:GetBonePosition(head)
									LocalPlayer():SetEyeAngles((headpos - LocalPlayer():GetShootPos()):Angle())
									if !saidname then
										ChatPrint("Following player: "..v:GetName(), blue)
										ply:ConCommand("say Target: '"..v:GetName().."' set, Following target!")
										saidname = true
									end
								end
							end
						end)
					ply:ConCommand("+forward")
					ply:ConCommand("+speed")
				end
		else
			ChatPrint("Look at a player to follow!", blue)
			following = false
			followingTabCol = blue
			followingTabGet = "Off"
		end
	elseif following then
		following = false
		followingTabCol = blue
		followingTabGet = "Off"
		hook.Remove("Think", "follow")
		ply:ConCommand("-forward")
		ply:ConCommand("-speed")
		ply:ConCommand("say Stopped Following Target!")
		saidname = false
	end
end

function Derp()
	local currentangle = ply:EyeAngles()
	if !derping then
		derping = true
		derpingTabCol = green
		derpingTabGet = "On"
		hook.Add("Think", "derp", function()
			Rnumber = math.random(0,1000) 
			ply:SetEyeAngles(Angle(currentangle.pitch + Rnumber ,currentangle.yaw + Rnumber , currentangle.roll + Rnumber ) )
			ply:ConCommand("impulse 100")
		end)
		hook.Add("CalcView", "Derpview", Derpview)
		hook.Add("ShouldDrawLocalPlayer", "derpdraw", function(ply) return true end)
	elseif derping then
		derping = false
		derpingTabCol = blue
		derpingTabGet = "Off"
		ply:SetEyeAngles(Angle(currentangle.pitch, currentangle.yaw, 0))
		hook.Remove("Think", "derp")
		hook.Remove("CalcView", "Derpview")
		hook.Remove("ShouldDrawLocalPlayer", "derpdraw")
	end
end

function Animation()
	if !animating then
		animating = "flex"
		animatingTabCol = green
		animatingTabGet = "flex"
		timer.Create("animating", 2, 0, function() RunConsoleCommand("_DarkRP_DoAnimation", "1616") end)
	elseif animating=="flex" then
		animating = "muscle"
		animatingTabCol = green
		animatingTabGet = "muscle"
		timer.Destroy("animating")
		timer.Create("animating", 2, 0, function() RunConsoleCommand("_DarkRP_DoAnimation", "1617") end)
	elseif animating=="muscle" then
		animating = false
		animatingTabCol = blue
		animatingTabGet = "Off"	
		timer.Destroy("animating")
	end
end

function Spam ()
	if !spamming and !cspamming then
		spamming = true
		spammingTabGet = "On"
		spammingTabCol = green
		hook.Add("Think", "spam", function()
		ply:ConCommand("say "..words[math.random(1,16)])
		end)
	elseif !spamming and cspamming then
		cspamming = false
		spamming = false
		spammingTabGet = "Off"
		spammingTabCol = blue
		hook.Remove("Think", "spam")
		hook.Remove("Think", "cspam")
	elseif spamming then
		cspamming = false
		spamming = false
		spammingTabGet = "Off"
		spammingTabCol = blue
		hook.Remove("Think", "spam")
		hook.Remove("Think", "cspam")
	end
end



function Fullbright ()
	if !bright then
		bright = true
		brightTabCol = green
		brightTabGet = "On"
		hook.Add("Think", "EFullbright", function()
			render.SuppressEngineLighting( true )
		end)
	elseif bright then
		bright = false
		brightTabCol = blue
		brightTabGet = "Off"
		hook.Remove("Think", "EFullbright")
	end
end

function FindDisplayText(ent)
        if ent.GetDisplayText then
                return ent:GetDisplayText()
        else
                return ent.Entity:GetNetworkedInt("keypad_num")
        end
end
 
function FindStatus(ent)
        if ent.GetStatus then
                return ent:GetStatus()
        elseif ent.Entity:GetNetworkedBool("keypad_access") and ent.Entity:GetNetworkedBool("keypad_showaccess") then
                return 1
        elseif not ent.Entity:GetNetworkedBool("keypad_access") and ent.Entity:GetNetworkedBool("keypad_showaccess") then
                return 2
        else
                return 0
        end
end

function keypadlog ()
	if !keypadlogging then
		keypadlogging = true
		keypadloggingTabGet = "On"
		keypadloggingTabCol = green
	hook.Add("Think", "KeypadLog", function()
			for k,v in pairs(player.GetAll()) do
					local kp = v:GetEyeTrace().Entity
					if IsValid(kp) and (string.find(kp:GetClass(), "keypad") and not(string.find(v:GetClass(), "cracker") or string.find(v:GetClass(), "checker"))) and v:EyePos():Distance(kp:GetPos()) <= 70 then
							kp.tempCode = kp.tempCode or ""
							kp.tempText = kp.tempText or ""
							kp.tempStatus = kp.tempStatus or 0
                       
                        if (FindDisplayText(kp) != kp.tempText) or (FindStatus(kp) != kp.tempStatus) then
                                kp.tempText = FindDisplayText(kp)
                                kp.tempStatus = FindStatus(kp)
                               
                                local tr = util.TraceLine({
                                        start = v:EyePos(),
                                        endpos = v:GetAimVector() * 32 + v:EyePos(),
                                        filter = v
                                })
                               
                                local pos = kp:WorldToLocal(tr.HitPos)
                               
									for i,p in pairs(KeyPos) do
											local x = (pos.y - p[5]) / (p[5] + p[6])
											local y = 1 - (pos.z + p[7]) / (p[7] + p[8])
											if (x >= 0 and y >= 0 and x <= 1 and y <= 1) then
													if i == 11 then
															if kp.tempStatus == 1 then
																	kp.code = kp.tempCode
																	kp.tempCode = ""
															elseif kp.tempStatus == 2 then
																	kp.tempCode = ""
															end
													elseif i == 10 then
															kp.tempCode = ""
													elseif i > 0 then
															kp.tempCode = kp.tempCode..i
													end
											end
									end
							end
					end
			end
	end)
		hook.Add( "HUDPaint", "KeypadShow", function()
       			for k,v in pairs(ents.GetAll()) do
					if IsValid(v) then
							if string.find(v:GetClass(), "keypad") and not(string.find(v:GetClass(), "cracker") or string.find(v:GetClass(), "checker")) then
									local pos = v:GetPos():ToScreen()
									if IsValid(v) and v.code and ply:GetPos():Distance(v:GetPos())<500 then
											local ctext = v.code or "Unkown"
											draw.WordBox( 8, pos.x-25, pos.y-25, ctext, "Get", Color(50,50,75,100), Color(255,0,0,255) )
									elseif IsValid(v) and v.code then
										draw.RoundedBox( 5, pos.x-5, pos.y-5, 10, 10, Color( 0, 255, 0, 150 ) )
									else
										draw.RoundedBox( 5, pos.x-5, pos.y-5, 10, 10, Color( 255, 0, 0, 150 ) )
									end
							end
					end
			end
		end)
	elseif keypadlogging then
		keypadlogging = false
		keypadloggingTabGet = "Off"
		keypadloggingTabCol = blue
		hook.Remove("HUDPaint", "KeypadShow")
		hook.Remove("Think", "KeypadLog")
	end
	
end

function RPGodmode() 
	if !godmode then
		godmode = true
		godmodeTabGet = "On"
		godmodeTabCol = green
		hook.Add("Think", "godmode", function()
			if ply:Health()<100 then
				ply:ConCommand("say /buyhealth")
			end
		end)
	elseif godmode then
		godmode = false
		godmodeTabGet = "Off"
		godmodeTabCol = blue
		hook.Remove("Think", "godmode")
	end
end


function Spectate ()
	if !spectating then
		spectating = true
		spectatingTabGet = "On"
		spectatingTabCol = green
		
	elseif spectating then
		spectating = false
		spectatingTabGet = "Off"
		spectatingTabCol = blue
	end
end


function Xray ()
	if !xray then
		xray = true
		xrayTabGet = "On"
		xrayTabCol = green
		hook.Add("HUDPaint", "xxrayz", function() 
			for k,v in pairs(ents.GetAll()) do
				local position = (v:GetPos()+Vector(0,0,80)):ToScreen()
				if v:GetClass()== "prop_physics" and position.x<ScrW() and position.x>0 and position.y<ScrH() and position.y>0  then
					cam.Start3D(EyePos(),EyeAngles())
					render.SuppressEngineLighting( true )
					render.MaterialOverride( mat )
					render.SetColorModulation( 255,0,0 )
					render.SetBlend(0.3)
					v:DrawModel()
					render.SetBlend(1)
					render.SuppressEngineLighting( false )
					render.MaterialOverride( )
					cam.End3D()				
				elseif v:GetClass()==("prop_door_rotating") or v:GetClass()==("func_door_rotating") then	
					v:SetMaterial("models/wireframe")
					v:SetColor(trans)
				end
			end
		end)
	elseif xray then
		xray = false
		xrayTabGet = "Off"
		xrayTabCol = blue
		for k,v in pairs(ents.GetAll()) do
			if v:GetClass()==("prop_door_rotating") or v:GetClass()==("func_door_rotating") then
				v:SetMaterial("")
				v:SetColor(white)
			end
		end
		hook.Remove("HUDPaint", "xxrayz")
	end
end

function MouseSpam ()
	if !mousespamming then
		mousespamming = "1"
		mousespammingTabCol = green
		mousespammingTabGet = " Left"
		hook.Add("Think", "mousespam", function ()
			if input.IsKeyDown(KEY_F) then
				if !clicking then
					clicking = true
					ply:ConCommand("+attack")
				elseif clicking then
					clicking = false
					ply:ConCommand("-attack")
				end
			elseif !input.IsKeyDown(KEY_F) and clicking then
				clicking = false
				ply:ConCommand("-attack")
			end
		end)
	elseif mousespamming == "1" then
		mousespamming = "2"
		mousespammingTabCol = green
		mousespammingTabGet = " Right"
		hook.Remove("Think", "mousespam")
		hook.Add("Think", "mousespam", function ()
			if input.IsKeyDown(KEY_F) then
				if !clicking then
					clicking = true
					ply:ConCommand("+attack2")
				elseif clicking then
					clicking = false
					ply:ConCommand("-attack2")
				end
			elseif !input.IsKeyDown(KEY_F) and clicking then
				clicking = false
				ply:ConCommand("-attack2")
					leftclick ()
			end
		end)	
		
	elseif mousespamming == "2" then
		mousespamming = false
		mousespammingTabCol = blue
		mousespammingTabGet = "Off"
		hook.Remove("Think", "mousespam")
	end
end

function leftclick ()
	if !lclicking then
		lclicking = true
		timer.Create("shitfuck", 0.1, 1, function ()
			ply:ConCommand("+attack")
			timer.Create("shitfuck2", 0.1, 1, function ()
				ply:ConCommand("-attack")
			end)
		end)
	elseif lclicking then 
		lclicking = false
		timer.Create("shitfuck3", 0.1, 1, function ()
			ply:ConCommand("-attack")
		end)
	end
end

function Drawlogo ()
drawingTabGet = "   Drawing"
drawingTabCol = green
local currentangle = ply:EyeAngles()
ply:SetEyeAngles(Angle(currentangle.pitch - 5 ,currentangle.yaw + 15 , 0 ) )
ply:ConCommand("+attack")
dotimer(function ()
	local currentangle = ply:EyeAngles()
	ply:SetEyeAngles(Angle(currentangle.pitch + 6.25 ,currentangle.yaw + 2.5 , 0 ) )
	ply:ConCommand("-attack")
	dotimer(function ()
		ply:ConCommand("+attack")
		dotimer(function ()
			ply:ConCommand("-attack")
			dotimer(function ()
				local currentangle = ply:EyeAngles()
				ply:SetEyeAngles(Angle(currentangle.pitch - 6.25 ,currentangle.yaw - 2.5 , 0 ) )
				dotimer(function ()
					ply:ConCommand("+attack")
					dotimer(function ()
						local currentangle = ply:EyeAngles()
						ply:SetEyeAngles(Angle(currentangle.pitch + 6.25 ,currentangle.yaw - 2.5 , 0 ) )
						ply:ConCommand("-attack")
						dotimer(function ()
							ply:ConCommand("+attack")
							dotimer(function ()
								ply:ConCommand("-attack")
								dotimer(function ()
									local currentangle = ply:EyeAngles()
									ply:SetEyeAngles(Angle(currentangle.pitch - 3.125 ,currentangle.yaw + 1.25 , 0 ) )
									dotimer(function ()
										ply:ConCommand("+attack")
										dotimer(function ()
											ply:ConCommand("-attack")
											local currentangle = ply:EyeAngles()
											ply:SetEyeAngles(Angle(currentangle.pitch - 0 ,currentangle.yaw + 2.5 , 0 ) )
											dotimer(function ()
												ply:ConCommand("+attack")
												dotimer(function ()
													ply:ConCommand("-attack")
													dotimer(function ()
														local currentangle = ply:EyeAngles()
														ply:SetEyeAngles(Angle(currentangle.pitch - 0 ,currentangle.yaw - 5 , 0 ) )
														dotimer(function ()
															ply:ConCommand("+attack")
															dotimer(function ()
																ply:ConCommand("-attack")
																local currentangle = ply:EyeAngles()
																ply:SetEyeAngles(Angle(currentangle.pitch + 3 ,currentangle.yaw - 0 , 0 ) )
																dotimer(function ()
																	ply:ConCommand("+attack")
																	dotimer(function ()
																		ply:ConCommand("-attack")
																		local currentangle = ply:EyeAngles()
																		ply:SetEyeAngles(Angle(currentangle.pitch - 3 ,currentangle.yaw - 0 , 0 ) )
																		dotimer(function ()
																			ply:ConCommand("+attack")
																			dotimer(function ()
																				ply:ConCommand("-attack")
																				local currentangle = ply:EyeAngles()
																				ply:SetEyeAngles(Angle(currentangle.pitch + 3 ,currentangle.yaw - 2 , 0 ) )
																				dotimer(function ()
																					ply:ConCommand("+attack")
																					dotimer(function ()
																						ply:ConCommand("-attack")
																						dotimer(function ()
																							ply:ConCommand("+attack")
																							dotimer(function ()
																								ply:ConCommand("-attack")
																								local currentangle = ply:EyeAngles()
																								ply:SetEyeAngles(Angle(currentangle.pitch - 3 ,currentangle.yaw - 0 , 0 ) )
																								dotimer(function ()
																									ply:ConCommand("+attack")
																									dotimer(function ()
																										ply:ConCommand("-attack")
																										local currentangle = ply:EyeAngles()
																										ply:SetEyeAngles(Angle(currentangle.pitch + 3 ,currentangle.yaw - 2 , 0 ) )
																										dotimer(function ()
																											ply:ConCommand("+attack")
																											dotimer(function ()
																												ply:ConCommand("-attack")
																												local currentangle = ply:EyeAngles()
																												ply:SetEyeAngles(Angle(currentangle.pitch - 5 ,currentangle.yaw - 3 , 0 ) )
																												dotimer(function()
																													ply:ConCommand("+attack")
																													dotimer(function()
																														ply:ConCommand("-attack")
																														local currentangle = ply:EyeAngles()
																														ply:SetEyeAngles(Angle(currentangle.pitch - 0 ,currentangle.yaw + 3 , 0 ) )
																														dotimer(function()
																															ply:ConCommand("+attack")
																															dotimer(function()
																																ply:ConCommand("-attack")
																																local currentangle = ply:EyeAngles()
																																ply:SetEyeAngles(Angle(currentangle.pitch + 5 ,currentangle.yaw - 3 , 0 ) )
																																dotimer(function()
																																	ply:ConCommand("+attack")
																																	dotimer(function()
																																		ply:ConCommand("-attack")
																																		local currentangle = ply:EyeAngles()
																																		ply:SetEyeAngles(Angle(currentangle.pitch - 0 ,currentangle.yaw - 2 , 0 ) )
																																		dotimer(function()
																																			ply:ConCommand("+attack")
																																			dotimer(function()
																																				ply:ConCommand("-attack")
																																				local currentangle = ply:EyeAngles()
																																				ply:SetEyeAngles(Angle(currentangle.pitch - 3 ,currentangle.yaw - 0 , 0 ) )
																																				dotimer(function()
																																					ply:ConCommand("+attack")
																																					dotimer(function()
																																						ply:ConCommand("-attack")
																																						local currentangle = ply:EyeAngles()
																																						ply:SetEyeAngles(Angle(currentangle.pitch - 0 ,currentangle.yaw - 2 , 0 ) )
																																						dotimer(function()
																																							ply:ConCommand("+attack")
																																							dotimer(function()
																																								ply:ConCommand("-attack")
																																								local currentangle = ply:EyeAngles()
																																								ply:SetEyeAngles(Angle(currentangle.pitch - 0 ,currentangle.yaw - 3 , 0 ) )
																																								dotimer(function()
																																									ply:ConCommand("+attack")
																																									dotimer(function()
																																										ply:ConCommand("-attack")
																																										local currentangle = ply:EyeAngles()
																																										ply:SetEyeAngles(Angle(currentangle.pitch - 0 ,currentangle.yaw + 1.5 , 0 ) )
																																										dotimer(function()
																																											ply:ConCommand("+attack")
																																											dotimer(function()
																																												ply:ConCommand("-attack")
																																												local currentangle = ply:EyeAngles()
																																												ply:SetEyeAngles(Angle(currentangle.pitch + 3 ,currentangle.yaw - 0 , 0 ) )
																																												dotimer(function()
																																													ply:ConCommand("+attack")
																																													dotimer(function()
																																														ply:ConCommand("-attack")
																																														local currentangle = ply:EyeAngles()
																																														ply:SetEyeAngles(Angle(currentangle.pitch - 3 ,currentangle.yaw - 3 , 0 ) )
																																														dotimer(function()
																																															ply:ConCommand("+attack")
																																															dotimer(function()
																																																ply:ConCommand("-attack")
																																																local currentangle = ply:EyeAngles()
																																																ply:SetEyeAngles(Angle(currentangle.pitch + 3 ,currentangle.yaw - 0 , 0 ) )
																																																dotimer(function()
																																																	ply:ConCommand("+attack")
																																																	dotimer(function()
																																																		ply:ConCommand("-attack")
																																																		local currentangle = ply:EyeAngles()
																																																		ply:SetEyeAngles(Angle(currentangle.pitch + 0 ,currentangle.yaw - 3 , 0 ) )
																																																		dotimer(function()
																																																			ply:ConCommand("+attack")
																																																			dotimer(function()
																																																				ply:ConCommand("-attack")
																																																				local currentangle = ply:EyeAngles()
																																																				ply:SetEyeAngles(Angle(currentangle.pitch - 3 ,currentangle.yaw - 0 , 0 ) )
																																																				dotimer(function()
																																																					ply:ConCommand("+attack")
																																																					dotimer(function()
																																																						ply:ConCommand("-attack")
																																																						dotimer(function()
																																																							ply:ConCommand("+attack")
																																																							dotimer(function()
																																																								ply:ConCommand("-attack")
																																																								local currentangle = ply:EyeAngles()
																																																								ply:SetEyeAngles(Angle(currentangle.pitch + 0 ,currentangle.yaw - 3 , 0 ) )
																																																								dotimer(function()
																																																									ply:ConCommand("+attack")
																																																									dotimer(function()
																																																										ply:ConCommand("-attack")
																																																										dotimer(function()
																																																											ply:ConCommand("+attack")
																																																											dotimer(function()
																																																												ply:ConCommand("-attack")
																																																												local currentangle = ply:EyeAngles()
																																																												ply:SetEyeAngles(Angle(currentangle.pitch + 3 ,currentangle.yaw - 0 , 0 ) )
																																																												dotimer(function()
																																																													ply:ConCommand("+attack")
																																																													dotimer(function()
																																																														ply:ConCommand("-attack")
																																																														dotimer(function()
																																																															ply:ConCommand("+attack")
																																																															dotimer(function()
																																																																ply:ConCommand("-attack")
																																																																local currentangle = ply:EyeAngles()
																																																																ply:SetEyeAngles(Angle(currentangle.pitch + 0 ,currentangle.yaw + 3 , 0 ) )
																																																																dotimer(function()
																																																																	ply:ConCommand("+attack")
																																																																	dotimer(function()
																																																																		ply:ConCommand("-attack")
																																																																		local currentangle = ply:EyeAngles()
																																																																		ply:SetEyeAngles(Angle(currentangle.pitch + 0 ,currentangle.yaw - 5 , 0 ) )
																																																																		dotimer(function()
																																																																			ply:ConCommand("+attack")
																																																																			dotimer(function()
																																																																				ply:ConCommand("-attack")
																																																																				local currentangle = ply:EyeAngles()
																																																																				ply:SetEyeAngles(Angle(currentangle.pitch - 3 ,currentangle.yaw - 0 , 0 ) )
																																																																				dotimer(function()
																																																																					ply:ConCommand("+attack")
																																																																					dotimer(function()
																																																																						ply:ConCommand("-attack")
																																																																						dotimer(function()
																																																																							ply:ConCommand("+attack")
																																																																							dotimer(function()
																																																																								ply:ConCommand("-attack")
																																																																								local currentangle = ply:EyeAngles()
																																																																								ply:SetEyeAngles(Angle(currentangle.pitch + 3 ,currentangle.yaw - 3 , 0 ) )
																																																																								dotimer(function()
																																																																									ply:ConCommand("+attack")
																																																																									dotimer(function()
																																																																										ply:ConCommand("-attack")
																																																																										dotimer(function()
																																																																											ply:ConCommand("+attack")
																																																																											dotimer(function()
																																																																												ply:ConCommand("-attack")
																																																																												local currentangle = ply:EyeAngles()
																																																																												ply:SetEyeAngles(Angle(currentangle.pitch - 3 ,currentangle.yaw - 0 , 0 ) )
																																																																												dotimer(function()
																																																																													ply:ConCommand("+attack")
																																																																													dotimer(function()
																																																																														ply:ConCommand("-attack")
																																																																														drawingTabGet = "Off"
																																																																														drawingTabCol = blue
																																																																													end)
																																																																												end)
																																																																											end)
																																																																										end)
																																																																									end)
																																																																								end)
																																																																							end)
																																																																						end)
																																																																					end)
																																																																				end)
																																																																			end)
																																																																		end)
																																																																	end)
																																																																end)
																																																															end)
																																																														end)
																																																													end)
																																																												end)
																																																											end)
																																																										end)
																																																									end)
																																																								end)
																																																							end)
																																																						end)
																																																					end)
																																																				end)
																																																			end)
																																																		end)
																																																	end)
																																																end)
																																															end)
																																														end)
																																													end)
																																												end)
																																											end)
																																										end)
																																									end)
																																								end)
																																							end)
																																						end)
																																					end)
																																				end)
																																			end)
																																		end)
																																	end)
																																end)
																															end)
																														end)
																													end)
																												end)
																											end)
																										end)
																									end)
																								end)
																							end)
																						end)
																					end)
																				end)
																			end)
																		end)
																	end)
																end)
															end)
														end)
													end)
												end)
											end)																																																																																					
										end)
									end)
								end)
							end)
						end)
					end)																																																													
				end)
			end)
		end)
	end)
end)
end

function runmisc()
	keypadlogging = false
	keypadlog()
	
end


/////////////////////////////////////////////////////////////////////////////////////////

/*****************************
Name: View functions
Function: Create view functions
*****************************/

function Derpview(ply, pos, angles, fov)
    local view = {}
    view.origin = pos-(Vector(75,0,0))
    view.angles = Angle(0,0,0)
    view.fov = fov
 
    return view
end


/////////////////////////////////////////////////////////////////////////////////////////

/*****************************
Name: Console Functions
Function: Create Console Functions
*****************************/
function ToggleVoice ()
	if !voicechatting then
		voicechatting = true
		ply:ConCommand("+voicerecord")

		
	elseif voicechatting then
		voicechatting = false
		ply:ConCommand("-voicerecord")

	end
end

function ToggleVolumeUp()
	if volume <1 then
		volume = volume + 0.1
		ply:ConCommand("volume "..volume)
		if volume<1 and volume>0 then
			ChatPrint(volume, blue)
		end
	else
		volume = 1
		ply:ConCommand("volume "..volume)
		if volume<1 and volume>0 then
			ChatPrint(volume, blue)
		end
	end
end

function ToggleVolumeDown()
	if volume >0 then
		volume = volume - 0.1
		ply:ConCommand("volume "..volume)
		if volume<1 and volume>0 then
			ChatPrint(volume, blue)
		end
	else
		volume = 0
		ply:ConCommand("volume "..volume)
		if volume<1 and volume>0 then
			ChatPrint(volume, blue)
		end
	end
end

function GetClass ()
	local trace = util.GetPlayerTrace( ply )
	local traceRes = util.TraceLine( trace )
	if traceRes.HitNonWorld then 
		local target = traceRes.Entity 
		ChatPrint("Entity Class: "..target:GetClass(),blue)
	else
	ChatPrint("You need to be looking at a Entity to get it's Class!", blue)
	end
end

function GetModel()
	local trace = util.GetPlayerTrace( ply )
	local traceRes = util.TraceLine( trace )
	if traceRes.HitNonWorld then 
		local target = traceRes.Entity 
		ChatPrint("Entity Model: "..target:GetModel(),blue)
			file.Append("AdminPickaxe/Logger/Models.txt", target:GetModel().."          "..tostring( os.date() ).."\n")
	else
	ChatPrint("You need to be looking at a Entity to get it's Model!", blue)
	end
end

function SetButtonModel()
	local trace = util.GetPlayerTrace( ply )
	local traceRes = util.TraceLine( trace )
	if traceRes.HitNonWorld then 
		local target = traceRes.Entity 
		ChatPrint("Button Model set to: "..target:GetModel(),blue)
			ply:ConCommand("button_model "..target:GetModel())

	else
	ChatPrint("You need to be looking at a Entity to set button Model!", blue)
	end
end

function GetMaterial ()
	local trace = util.GetPlayerTrace( ply )
	local traceRes = util.TraceLine( trace )
	if traceRes.HitNonWorld then 
		local target = traceRes.Entity 
		ChatPrint("Entity Material: "..target:GetMaterial(),blue)
	else
	ChatPrint("You need to be looking at a Entity to get it's Material!", blue)
	end
end

function GetDClasses ()
	foundclasses = 0
	for k,v in pairs(ents.GetAll()) do
		if ply:GetPos():Distance(v:GetPos())<500 then
			foundclasses = foundclasses + 1
			Print("Class found: "..v:GetClass())
		end
	end
	ChatPrint(foundclasses.." Classes Printed in console.",blue)
end

function PrintPlayers ()
	for k,v in pairs(player.GetAll()) do
		Print(v:GetName().."          "..v:SteamID())
	end
end


/////////////////////////////////////////////////////////////////////////////////////////
/******************************
Name: Load
Function: Runs scripts on load
******************************/
function Loaddefaultscripts()
HUDToggleON1 ()
ESPOn ()
Log ()
runmisc()

end
/******************************
Name: Menu upvalues
Function: stupid upvalue error
******************************/
function HUDpaint ()

DrawText ( LogoTabGet, 120, 145, LogoTabCol )
DrawText ( CITabGet, 120, 180, CITabCol )  

DrawText ( AdminsTabGet, 295, 145, AdminsTabCol )
DrawText ( FriendsTabGet, 295, 180, FriendsTabCol )

DrawText ( SpecHUDTabGet, 470, 145, SpecHUDTabCol )
DrawText ( drawingcrosshairTabGet, 470, 180, drawingcrosshairTabCol )

end

function ESPpaint ()

DrawText ( WallhackTabGet, 120, 145, WallhackTabCol )
DrawText ( ESPEntitysTabGet, 120, 180, ESPEntitysTabCol )  
DrawText ( ESPInfoTabGet, 120, 215, ESPInfoTabCol ) 

DrawText ( showdistanceTabGet, 295, 145, showdistanceTabCol )
DrawText ( showmoneyTabGet, 295, 180, showmoneyTabCol )
DrawText ( showgroupsTabGet, 295, 215, showgroupsTabCol )

DrawText ( beamsTabGet, 470, 145, beamsTabCol )
DrawText ( specialonlyTabGet, 470, 180, specialonlyTabCol )
DrawText ( showfriendsTabGet, 470, 215, showfriendsTabCol )

end

function Miscpaint ()

DrawText ( flashspammingTabGet, 120, 110, flashspammingTabCol )
DrawText ( bunnyhopTabGet, 120, 140, bunnyhopTabCol )
DrawText ( namechangingTabGet, 120, 170, namechangingTabCol )
DrawText ( brightTabGet, 120, 200, brightTabCol ) 
DrawText ( mousespammingTabGet, 120, 230, mousespammingTabCol ) 

DrawText ( followingTabGet, 295, 110, followingTabCol ) 
DrawText ( keypadloggingTabGet, 295, 140, keypadloggingTabCol ) 
DrawText ( derpingTabGet, 295, 170, derpingTabCol ) 
DrawText ( godmodeTabGet, 295, 200, godmodeTabCol ) 
DrawText ( drawingTabGet, 295, 230, drawingTabCol ) 

DrawText ( animatingTabGet, 470, 110, animatingTabCol ) 
DrawText ( spectatingTabGet , 470, 140, spectatingTabCol ) 
DrawText ( xrayTabGet, 470, 170, xrayTabCol ) 
DrawText ( spammingTabGet, 470, 200, spammingTabCol ) 
DrawText ( detectionTabGet, 470, 230, detectionTabCol ) 

end

function ShowInfo ()
Close ()
local InfoFrame = vgui.Create( "DFrame" ) 
InfoFrame:SetPos( 50, 50 ) 
InfoFrame:SetSize( ScrW()-100,ScrH()-100 ) 
InfoFrame:SetTitle( " " )
InfoFrame:SetVisible( true )
InfoFrame:SetDraggable( true ) 
InfoFrame:ShowCloseButton( false ) 
InfoFrame.Paint = function ()
DrawRoundedBox ( 0, 0, 0, InfoFrame:GetWide(), InfoFrame:GetTall(), tblack )
DrawOutlinedText ( "AdminPickaxe", "Infotab", InfoFrame:GetWide()/2, 35, blue, 2, black )
DrawRoundedBoxEx ( 0, 0, 75, InfoFrame:GetWide(), 25, tblue, true, true, true, true )
DrawLine ( 675, 250, 675, 600 )
DrawOutlinedText ( "A script coded by TerrorErrorIst and Pope Faggotini I", "Logo", InfoFrame:GetWide()/2, 85, blue, 1, black )
DrawOutlinedText ( "----Cblueits to Pope Faggotini I for the idea----", "Menu", InfoFrame:GetWide()/2, InfoFrame:GetTall()-25, blue, 1, black )
DrawOutlinedText ( "About", "Logo", InfoFrame:GetWide()/2, 125, blue, 1, black )
DrawOutlinedText ( "This script was made by LemonParty", "Menu", InfoFrame:GetWide()/2, 150, blue, 1, black )
DrawOutlinedText ( "A Garry's Mod Coding Team", "Menu", InfoFrame:GetWide()/2, 170, blue, 1, black )
DrawOutlinedText ( "Commands", "Logo", InfoFrame:GetWide()/2, 230, blue, 1, black )
DrawOutlinedText ( "AdminPickaxe_Boost1  ", "Menu", InfoFrame:GetWide()/2, 260, blue, 1, black )
DrawOutlinedText ( "AdminPickaxe_Boost2  ", "Menu", InfoFrame:GetWide()/2, 280, blue, 1, black )
DrawOutlinedText ( "AdminPickaxe_Boost3  ", "Menu", InfoFrame:GetWide()/2, 300, blue, 1, black )

DrawOutlinedText ( "Members:", "Menu", InfoFrame:GetWide()/2, 340, blue, 1, black )
DrawOutlinedText ( "TerrorErrorIst", "Menu", InfoFrame:GetWide()/2, 360, blue, 1, black )
DrawOutlinedText ( "Pope Faggotini I", "Menu", InfoFrame:GetWide()/2, 380, blue, 1, black )
DrawOutlinedText ( "A penis", "Menu", InfoFrame:GetWide()/2, 400, blue, 1, black )

DrawOutlinedText ( "", "Menu", InfoFrame:GetWide()/2, 440, blue, 1, black )
DrawOutlinedText ( "", "Menu", InfoFrame:GetWide()/2, 460, blue, 1, black )
DrawOutlinedText ( "", "Menu", InfoFrame:GetWide()/2, 480, blue, 1, black )
DrawOutlinedText ( "", "Menu", InfoFrame:GetWide()/2, 500, blue, 1, black )

DrawOutlinedText2 ( "Boosts you forward", "Menu", InfoFrame:GetWide()/2+100, 260, blue, 1, black )
DrawOutlinedText2 ( "Boosts you up", "Menu", InfoFrame:GetWide()/2+100, 280, blue, 1, black )
DrawOutlinedText2 ( "Bounce, use when boosting to keep flying.", "Menu", InfoFrame:GetWide()/2+100, 300, blue, 1, black )



InfoFrame:MakePopup()
end
CreateButton 	( "X", InfoFrame, black, tblack, true, InfoFrame:GetWide()-50, -30, 50, 50, "Close", function () InfoFrame:Close() end )
end

/******************************
Name: Playlist
Function: Create playlist shit
******************************/

function MusicPlaylist ()
Close ()
local Playlist = vgui.Create( "DFrame" ) 
Playlist:SetPos( ScrW()/2-ScrW()/4, ScrH()/2-ScrH()/4 ) 
Playlist:SetSize( ScrW()/2,ScrH()/2 ) 
Playlist:SetTitle( " " )
Playlist:SetVisible( true )
Playlist:SetDraggable( true ) 
Playlist:ShowCloseButton( false ) 
Playlist.Paint = function ()
DrawRoundedBox ( 0, 0, 0, Playlist:GetWide(), Playlist:GetTall(), tblack )
DrawRoundedBoxEx ( 0, 0, 0, Playlist:GetWide()-50, 20, tblue, true, true, true, true )
DrawOutlinedText ( "AdminPickaxe Custom Playlist", "Logo", Playlist:GetWide()/2, 10, blue, 1, black )


namelisting = 0
for k,v in pairs(PlaylistName) do
	DrawOutlinedText3 ( v, "Playlist", Playlist:GetWide()/2-75, 110+namelisting, blue, 1, black )
	namelisting = namelisting+30
end


Playlist:MakePopup()
end
CreateButton 	( "X", Playlist, black, tblack, true, Playlist:GetWide()-50, -30, 50, 50, "Close", function () Playlist:Close() end )

urllisting = 0
for k,v in pairs(PlaylistURL) do
	CreateButton 	( "play", Playlist, black, tblack, true, Playlist:GetWide()/2-60, 100+urllisting, 120, 20, "play", function () playsong(v) end )
	urllisting = urllisting+30
end

function CloseMusicFrame ()
	Playlist:Close()
end

local Playlistfix = vgui.Create( "DFrame" ) 
Playlistfix:SetParent( Playlist )
Playlistfix:SetPos( 250, 20 ) 
Playlistfix:SetSize( 140,100 ) 
Playlistfix:SetTitle( " " )
Playlistfix:SetVisible( true )
Playlistfix:ShowCloseButton(false)
Playlistfix.Paint = function ()
DrawRoundedBox ( 0, 0, 0, Playlistfix:GetWide(), Playlistfix:GetTall(), black )
end

CreateButton 	( "Add Song", Playlist, black, tblack, true, Playlist:GetWide()/2-60, 40, 120, 20, "Add a song", function () AddSong() end )
CreateButton 	( "Stop", Playlist, black, tblack, true, Playlist:GetWide()/2-60, 80, 120, 20, "Stops playing music", function () stopsong() end )

end



function AddSong ()
CloseMusicFrame ()
local addsongframe = vgui.Create( "DFrame" ) 
addsongframe:SetPos( ScrW()/2-150, ScrH()/2-50 ) 
addsongframe:SetSize( 300,100 ) 
addsongframe:SetTitle( " " )
addsongframe:SetVisible( true )
addsongframe:SetDraggable( true ) 
addsongframe:ShowCloseButton( false ) 
addsongframe.Paint = function ()
DrawRoundedBox ( 0, 0, 0, addsongframe:GetWide(), addsongframe:GetTall(), tblack )
DrawRoundedBoxEx ( 0, 0, 0, addsongframe:GetWide()-50, 20, tblue, true, true, true, true )
DrawOutlinedText ( "AdminPickaxe Adder", "Logo", addsongframe:GetWide()/2, 10, blue, 1, black )

DrawOutlinedText ( "URL", "Logo", addsongframe:GetWide()/8, 35, blue, 1, black )
DrawOutlinedText ( "Name", "Logo", addsongframe:GetWide()/8, 60, blue, 1, black )
addsongframe:MakePopup()
end
CreateButton 	( "X", addsongframe, black, tblack, true, addsongframe:GetWide()-50, -30, 50, 50, "Close", function () addsongframe:Close() end )
CreateButton 	( "Add", addsongframe, black, tblack, true, addsongframe:GetWide()/2-60, 75, 120, 20, "Add the song", function () AddCustomSong () end )


local URLBox = vgui.Create( "DTextEntry", addsongframe )
URLBox:SetPos( addsongframe:GetWide()/4,25 )
URLBox:SetTall( 20 )
URLBox:SetWide( 200 )
URLBox:SetEnterAllowed( true )

local NameBox = vgui.Create( "DTextEntry", addsongframe )
NameBox:SetPos( addsongframe:GetWide()/4,50 )
NameBox:SetTall( 20 )
NameBox:SetWide( 200 )
NameBox:SetEnterAllowed( true )

function AddCustomSong ()
	if (not table.HasValue(PlaylistURL, URLBox:GetValue())) then
		file.Append("AdminPickaxe/Playlist/URL.txt","%"..URLBox:GetValue())
		PlaylistURL = string.Explode("%",(file.Read("AdminPickaxe/Playlist/URL.txt")))
		file.Append("AdminPickaxe/Playlist/Name.txt","%"..NameBox:GetValue())
		PlaylistName = string.Explode("%",(file.Read("AdminPickaxe/Playlist/Name.txt")))		
		ChatPrint (NameBox:GetValue().." Has been added to the playlist!", blue)
	else
		ChatPrint ("This song has already been added!", blue)
	end
end


end

function stopsong()
	return true
end

function playsong (url)

	stopsong()

	local playpanel = vgui.Create( "DFrame" ) 
	playpanel:SetPos( ScrW()*2,ScrH()*2 ) 
	playpanel:SetSize( 1, 1 ) 
	playpanel:SetVisible( false )
	
	function stopsong ()
		playpanel:Close()
		function stopsong ()
			return true
		end
	end

	local HTMLPanel = vgui.Create("HTML")
	HTMLPanel:SetParent(playpanel)
	HTMLPanel:SetPos(1 ,1)
	HTMLPanel:SetSize(1, 1)
	HTMLPanel:OpenURL(url)
	ChatPrint( "Song is now playing!", blue)
	
end





/******************************
Name: Menu
Function: Create Menu
******************************/
function Menu ()
local Frame = vgui.Create( "DFrame" ) 
Frame:SetPos( ScrW()/5, ScrH()/5 ) 
Frame:SetSize( 500,300 ) 
Frame:SetTitle( " " )
Frame:SetVisible( true )
Frame:SetDraggable( true ) 
Frame:ShowCloseButton( false ) 
Frame.Paint = function ()
DrawRoundedBoxEx ( 0, 0, 40, Frame:GetWide(), 10, ttblue, false, false, false, false )
DrawRoundedBox ( 0, 0, 0, Frame:GetWide(), Frame:GetTall(), tblack )
DrawRoundedBox ( 0, 0, 0, 450, 20, tblue )
DrawOutlinedRect (blue, 0, 0, Frame:GetWide(), Frame:GetTall() )
DrawOutlinedText ( "AdminPickaxe v1.1", "Logo", Frame:GetWide()/2, 10, blue, 1.5, black )
end
Frame:MakePopup()
CreateButton 	( "X", Frame, black, tblack, true, 450, -30, 50, 50, "Close", function () Frame:Close() end )


--== Tabs ==--
local Maintab = vgui.Create("DLabel")
Maintab:SetParent( Frame )
Maintab:SetPos( 0 , 20 )
Maintab:SetSize( Frame:GetWide(), Frame:GetTall()-20 )
Maintab:SetText("")
Maintab:SetVisible( true )
Maintab.Paint = function()
DrawRoundedBoxEx ( 0, 0, 0, 100, 20, ttblue, false, false, false, false )
DrawOutlinedText ( "Unload Script", "Logo", Frame:GetWide()/2, 50, blue, 1.5, black )
DrawOutlinedText ( "Reload Script", "Logo", Frame:GetWide()/2, 110, blue, 1.5, black )
DrawOutlinedText ( "Information", "Logo", Frame:GetWide()/2, 170, blue, 1.5, black )
DrawOutlinedText ( "Music", "Logo", Frame:GetWide()/2, 225, blue, 1.5, black )
DrawOutlinedText ( "Coded by TerrorErrorIst idea by Pope Faggotini I", "Small", Frame:GetWide()-106, Frame:GetTall()-27, blue, 1, black )
end

local HUDtab = vgui.Create("DLabel")
HUDtab:SetParent( Frame )
HUDtab:SetPos( 0 , 20 )
HUDtab:SetSize( Frame:GetWide(), Frame:GetTall()-20 )
HUDtab:SetText("")
HUDtab:SetVisible( false )
HUDtab.Paint = function()
DrawRoundedBoxEx ( 0, 100, 0, 100, 20, ttblue, false, false, false, false )

HUDpaint ()

DrawOutlinedText ( "Coded by TerrorErrorIst idea by Pope Faggotini I", "Small", Frame:GetWide()-106, Frame:GetTall()-27, blue, 1, black )
end

local ESPtab = vgui.Create("DLabel")
ESPtab:SetParent( Frame )
ESPtab:SetPos( 0 , 20 )
ESPtab:SetSize( Frame:GetWide(), Frame:GetTall()-20 )
ESPtab:SetText("")
ESPtab:SetVisible( false )
ESPtab.Paint = function()
DrawRoundedBoxEx ( 0, 200, 0, 100, 20, ttblue, false, false, false, false )

ESPpaint ()

DrawOutlinedText ( "Coded by TerrorErrorIst idea by Pope Faggotini I", "Small", Frame:GetWide()-106, Frame:GetTall()-27, blue, 1, black )
end

local MISCtab = vgui.Create("DLabel")
MISCtab:SetParent( Frame )
MISCtab:SetPos( 0 , 20 )
MISCtab:SetSize( Frame:GetWide(), Frame:GetTall()-20 )
MISCtab:SetText("")
MISCtab:SetVisible( false )
MISCtab.Paint = function()
DrawRoundedBoxEx ( 0, 300, 0, 100, 20, ttblue, false, false, false, false )

Miscpaint ()

DrawOutlinedText ( "Coded by TerrorErrorIst idea by Pope Faggotini I", "Small", Frame:GetWide()-106, Frame:GetTall()-27, blue, 1, black )
end

--== ChangeTab ==--
function ChangeTab (tab)
Maintab:SetVisible(false)
HUDtab:SetVisible(false)
ESPtab:SetVisible(false)
MISCtab:SetVisible(false)
tab:SetVisible(true)
end

CreateButton 	( "Main", Frame, black, tblack, true, 0, 20, 100, 20, "Main Tab", function () ChangeTab(Maintab)   end )
CreateButton 	( "HUD", Frame, black, tblack, true, 100, 20, 100, 20, "HUD Options", function () ChangeTab(HUDtab)  end )
CreateButton 	( "ESP", Frame, black, tblack, true, 200, 20, 100, 20, "ESP Options", function () ChangeTab(ESPtab)  end )
CreateButton 	( "Misc", Frame, black, tblack, true, 300, 20, 100, 20, "Misc Options", function () ChangeTab(MISCtab)  end )


--== Adding Tab buttons ==--

--MainTab--
CreateButton 	( "Unload", Maintab, black, tblack, true, Frame:GetWide()/2-60, 70, 120, 20, "Unload AdminPickaxe script", function () Unload ()  end )
CreateButton 	( "Reload", Maintab, black, tblack, true, Frame:GetWide()/2-60, 130, 120, 20, "Reload AdminPickaxe script", function () Reload ()  end )
CreateButton 	( "About", Maintab, black, tblack, true, Frame:GetWide()/2-60, 185, 120, 20, "Information about AdminPickaxe", function () ShowInfo ()  end )
CreateButton 	( "Music", Maintab, black, tblack, true, Frame:GetWide()/2-60, 240, 120, 20, "Open Customizable Playlist", function () MusicPlaylist () end )

--HUDTab--
CreateButton 	( "Layout 1", HUDtab, black, tblack, true, 5, 50, 95, 20, "Toggle HUD layout 1", function () HUDToggleON1 ()  end )
CreateButton 	( "Layout 2", HUDtab, black, tblack, true, 105, 50, 95, 20, "Toggle HUD layout 2", function () HUDToggleON2 ()  end )
CreateButton 	( "Off", HUDtab, black, tblack, true, 205, 50, 95, 20, "Toggle HUD Off", function () HUDToggleOFF ()  end )

CreateButton 	( "Logo", HUDtab, black, tblack, true, 5, 135, 95, 20, "Toggle HUD Logo", function () HUDLogo ()  end )
CreateButton 	( "Client Info", HUDtab, black, tblack, true, 5, 170, 95, 20, "Toggle HUD Client Info", function () HUDCI ()  end )

CreateButton 	( "Admins", HUDtab, black, tblack, true, 180, 135, 95, 20, "Toggle HUD Showing Admins", function () HUDAdmins ()  end )
CreateButton 	( "Friends", HUDtab, black, tblack, true, 180, 170, 95, 20, "Toggle HUD Showing Friends", function () HUDFriends ()  end )

CreateButton 	( "Spectating", HUDtab, black, tblack, true, 355, 135, 95, 20, "Toggle HUD Showing if you are being spectated", function () HUDSpectate ()  end )
CreateButton 	( "Crosshair", HUDtab, black, tblack, true, 355, 170, 95, 20, "Toggle HUD Drawing Crosshair", function () HUDCrosshair ()  end )

--ESPTab--
CreateButton 	( "Add Entity", ESPtab, black, tblack, true, 5, 50, 95, 20, "Add the Entity you are looking at to the Entity ESP", function () AddEnt()   end )
CreateButton 	( "Add Printer", ESPtab, black, tblack, true, 105, 50, 95, 20, "Add the Printer you are looking at to the Entity ESP", function () AddPrinter()  end )
CreateButton 	( "Find", ESPtab, black, tblack, true, 205, 50, 95, 20, "Trace the class of the entity you are looking at to see if there are more on the server.", function () FindEnt () end )

CreateButton 	( "Clear Entitys", ESPtab, black, tblack, true, 5, 75, 95, 20, "Reset all the saved Entitys", function () ClearEntitys()  end )
CreateButton 	( "Clear Printers", ESPtab, black, tblack, true, 105, 75, 95, 20, "Reset all the saved Printers", function () ClearPrinters()  end )
CreateButton 	( "Clear Finder", ESPtab, black, tblack, true, 205, 75, 95, 20, "Clears finder", function () ClearFinder () end )



CreateButton 	( "On", ESPtab, black, tblack, true, 405, 50, 95, 20, "Toggle ESP Off", function () ESPOn()  end )
CreateButton 	( "Off", ESPtab, black, tblack, true, 405, 75, 95, 20, "Toggle ESP Off", function () ESPOff()  end )

CreateButton 	( "Wallhack", ESPtab, black, tblack, true, 5, 135, 95, 20, "Toggle Wallhack between chams/wireframe", function () Wallhack ()  end )
CreateButton 	( "Entitys", ESPtab, black, tblack, true, 5, 170, 95, 20, "Toggle Entity ESP", function () Entitys ()  end )
CreateButton 	( "Info", ESPtab, black, tblack, true, 5, 205, 95, 20, "Toggle ESP to show player/entity info", function () Info ()  end )

CreateButton 	( "Distance", ESPtab, black, tblack, true, 180, 135, 95, 20, "Toggle ESP info showing distance", function () ShowDistance ()  end )
CreateButton 	( "Money", ESPtab, black, tblack, true, 180, 170, 95, 20, "Toggle ESP info showing money", function () ShowMoney ()  end )
CreateButton 	( "UserGroups", ESPtab, black, tblack, true, 180, 205, 95, 20, "Toggle ESP to show usergroups", function () ShowGroups ()  end )

CreateButton 	( "Beams", ESPtab, black, tblack, true, 355, 135, 95, 20, "Toggle ESP to draw beams", function () Beams ()  end )
CreateButton 	( "Special Only", ESPtab, black, tblack, true, 355, 170, 95, 20, "Toggle ESP to only target Admins/friends", function () SpecialOnly ()  end )
CreateButton 	( "Friends", ESPtab, black, tblack, true, 355, 205, 95, 20, "Toggle Crosshair", function () ShowFriends ()  end )

--MiscTab--
CreateButton 	( "Flash Spam", MISCtab, black, tblack, true, 5, 100, 95, 20, "Toggle Flashlight Spammer", function () FlashlightSpam ()  end )
CreateButton 	( "BunnyHop", MISCtab, black, tblack, true, 5, 130, 95, 20, "Toggle Bunnyhop", function () Bunnyhop ()  end )
CreateButton 	( "NameChanger", MISCtab, black, tblack, true, 5, 160, 95, 20, "Toggle NameChanger", function () NameChanger () end )
CreateButton 	( "Fullbright", MISCtab, black, tblack, true, 5, 190, 95, 20, "Toggle Entity Fullbright", function () Fullbright () end )
CreateButton 	( "Auto Clicker", MISCtab, black, tblack, true, 5, 220, 95, 20, "Switch Auto Clicker between Mouse button 1 and mouse button 2", function () MouseSpam () end )

CreateButton 	( "Follow", MISCtab, black, tblack, true, 180, 100, 95, 20, "Follow player", function () Follow ()  end )
CreateButton 	( "Keypad", MISCtab, black, tblack, true, 180, 130, 95, 20, "Toggle Keypad logger to log and show keypad codes", function () keypadlog()  end )
CreateButton 	( "Derp", MISCtab, black, tblack, true, 180, 160, 95, 20, "Toggle Derping", function () Derp () end )
CreateButton 	( "RP Godmode", MISCtab, black, tblack, true, 180, 190, 95, 20, "buyhealth when your health is under 100 (DOESN'T WORK WITHOUT /BUYHEALTH ENABLED)", function () RPGodmode() end )
CreateButton 	( "DrawLogo", MISCtab, black, tblack, true, 180, 220, 95, 20, "Use with rope tool to draw AdminPickaxe on something.", function () Drawlogo () end )

CreateButton 	( "Animation", MISCtab, black, tblack, true, 355, 100, 95, 20, "Toggle doing animations (switch between flex and muscle)", function () Animation ()  end )
CreateButton 	( "Spectate", MISCtab, black, tblack, true, 355, 130, 95, 20, "Toggle spectate mode", function () NotDone () end )
CreateButton 	( "Xray", MISCtab, black, tblack, true, 355, 160, 95, 20, "Toggle Xray", function () Xray () end )
CreateButton 	( "Spam", MISCtab, black, tblack, true, 355, 190, 95, 20, "Spam random words", function () Spam() end )
CreateButton 	( "Detection", MISCtab, black, tblack, true, 355, 220, 95, 20, "Toggle Join/Leave, Spectate detection. This toggle will be saved.", function () NotDone () end )




function Close ()
Frame:Close()
end
end
Print ( "Menu Created" )

--== Boosting ==--
function boost1()
local Ply = LocalPlayer()
local Angles = LocalPlayer():EyeAngles()
LocalPlayer():SetEyeAngles(Angle(30, Angles.yaw + 180, Angles.roll))
timer.Create("spawn", 0.1, 1, function()
LocalPlayer():ConCommand("gm_spawn models/props_c17/gravestone001a.mdl")
end)
timer.Create("attack", 0.1, 1, function()
LocalPlayer():ConCommand("+attack")
end)
timer.Create("turnback", 0.2, 1, function()   
LocalPlayer():SetEyeAngles(Angle(0, Angles.yaw, Angles.roll))
end)
timer.Create("undo, Release", 0.3, 1, function()
LocalPlayer():ConCommand("undo")
end)
timer.Create("Release", 0.5, 1, function()
LocalPlayer():ConCommand("-attack")
end)
end


function boost2()
local Ply = LocalPlayer()
local Angles = LocalPlayer():EyeAngles()
LocalPlayer():SetEyeAngles(Angle(90, Angles.yaw + 180, Angles.roll))
timer.Create("spawn", 0.1, 1, function()
LocalPlayer():ConCommand("gm_spawn models/props_junk/garbage_carboard002a.mdl")
end)
timer.Create("attack", 0.1, 1, function()
LocalPlayer():ConCommand("+attack")
end)
timer.Create("turnback", 0.2, 1, function()   
LocalPlayer():SetEyeAngles(Angle(0, Angles.yaw, Angles.roll))
end)
timer.Create("undo, Release", 0.5, 1, function()
LocalPlayer():ConCommand("undo")
LocalPlayer():ConCommand("-attack")
LocalPlayer():SetEyeAngles(Angle(0, Angles.yaw, Angles.roll))
end)
end

function boost3()
local Ply = LocalPlayer()
local Angles = LocalPlayer():EyeAngles()
LocalPlayer():SetEyeAngles(Angle(50, Angles.yaw + 0, Angles.roll))
timer.Create("spawn", 0.1, 1, function()
LocalPlayer():ConCommand("gm_spawn models/XQM/CoasterTrack/slope_225_2.mdl")
end)
timer.Create("turnback", 0.2, 1, function()   
LocalPlayer():SetEyeAngles(Angle(0, Angles.yaw, Angles.roll))
end)
timer.Create("undo ", 0.5, 1, function()
LocalPlayer():ConCommand("undo")
end)
end

--== Command/CV/hook list ==--
NewCom ( "AdminPickaxe_Menu", Menu )

NewCom ( "AdminPickaxe_Boost1", boost1 )
NewCom ( "AdminPickaxe_Boost2", boost2 )
NewCom ( "AdminPickaxe_Boost3", boost3 )

NewCom ( "AdminPickaxe_GetClass", GetClass )
NewCom ( "AdminPickaxe_GetModel", GetModel )
NewCom ( "AdminPickaxe_GetMaterial", GetMaterial )
NewCom ( "AdminPickaxe_GetDClasses", GetDClasses )
NewCom ( "AdminPickaxe_SetButtonModel", SetButtonModel)

NewCom ( "AdminPickaxe_Follow", Follow )
NewCom ( "AdminPickaxe_Derp", Derp )

NewCom ( "AdminPickaxe_SetATarget", SetbyView )
NewCom ( "AdminPickaxe_Xray", Xray )
NewCom ( "AdminPickaxe_DrawLogo", Drawlogo )
NewCom ( "AdminPickaxe_GetEntAmount", GetEntAmount )
NewCom ( "AdminPickaxe_GetPlayers", PrintPlayers )
NewCom ( "AdminPickaxe_Voicetoggle", ToggleVoice )
NewCom ( "AdminPickaxe_VolumeUp", ToggleVolumeUp )
NewCom ( "AdminPickaxe_VolumeDown", ToggleVolumeDown )

NewHook("Think", "checkadmins", AdminDetect)
NewHook("Think", "checkmods", ModDetect)
NewHook("Think", "checkfriends", FriendsDetect)



--== Load default scripts ==--
Loaddefaultscripts()


Print ( "Succesfully loaded!" )
ChatPrint ( "Loaded", blue )

/**************************************
Name: Rotater DONT ADD TO MENU
Purpose: Does 180 and shit
**************************************/

local function Rotate180()
	ap_NOAUTOPICKUP = true
	timer.Simple(0.5, function() ap_NOAUTOPICKUP = false end)

	if hook.GetTable().CreateMove and hook.GetTable().CreateMove.PickupEnt then
		hook.Remove("CreateMove", "PickupEnt")
		hook.Remove("CalcView", "Ididntseeit")
		timer.Simple(0.05, function()
			local a = LocalPlayer():EyeAngles() LocalPlayer():SetEyeAngles(Angle(a.p, a.y-180, a.r))
		end)
		return
	end
	local a = LocalPlayer():EyeAngles() LocalPlayer():SetEyeAngles(Angle(a.p, a.y-180, a.r))
end
concommand.Add("ap_180", Rotate180)

/**************************************
Name: De Lagger
Purpose: Removes useless shit that garrys added to raise FPS
**************************************/

local removes = {"env_steam",
"func_illusionary",
"beam",
"class C_BaseEntity",
"env_sprite",
"class C_ShadowControl",
"class C_ClientRagdoll",
"func_illusionary",
"class C_PhysPropClientside",
}

local nolag = true

local function StopLag()
	nolag = true
	RunConsoleCommand("r_3dsky", 0)
	RunConsoleCommand("r_WaterDrawReflection", 0)
	RunConsoleCommand("r_waterforcereflectentities", 0)
	RunConsoleCommand("r_teeth", 0)
	RunConsoleCommand("r_shadows", 0)
	RunConsoleCommand("r_ropetranslucent", 0)
	RunConsoleCommand("r_maxmodeldecal", 0) --50
	RunConsoleCommand("r_maxdlights", 0)--32
	RunConsoleCommand("r_decals", 0)--2048
	RunConsoleCommand("r_drawmodeldecals", 0)
	RunConsoleCommand("r_drawdetailprops", 0)
	RunConsoleCommand("r_worldlights", 0)
	RunConsoleCommand("r_flashlightrender", 0)
	RunConsoleCommand("cl_forcepreload", 1)
	RunConsoleCommand("r_threaded_renderables", 1)
	RunConsoleCommand("r_threaded_client_shadow_manager", 1)
	RunConsoleCommand("snd_mix_async", 1)
	RunConsoleCommand("cl_ejectbrass", 0)
	RunConsoleCommand("cl_detaildist", 0)
	RunConsoleCommand("cl_show_splashes", 0)
	--RunConsoleCommand("mat_fastnobump", 1)
	RunConsoleCommand("mat_filterlightmaps", 0)
	--RunConsoleCommand("mat_filtertextures", 0)
	RunConsoleCommand("r_drawflecks", 0)
	RunConsoleCommand("r_dynamic", 0)
	RunConsoleCommand("r_WaterDrawRefraction", 0)
	--RunConsoleCommand("mat_showlowresimage", 1)

	for k,v in pairs(removes) do
		for a,b in pairs(ents.FindByClass(v)) do
			b:SetNoDraw(true)
		end
	end

end
concommand.Add("ap_stoplag", StopLag)

local function Reset()
	nolag = true
	RunConsoleCommand("r_3dsky", 1)
	RunConsoleCommand("r_WaterDrawReflection", 1)
	RunConsoleCommand("r_waterforcereflectentities", 1)
	RunConsoleCommand("r_teeth", 1)
	RunConsoleCommand("r_shadows", 1)
	RunConsoleCommand("r_ropetranslucent", 1)
	RunConsoleCommand("r_maxmodeldecal", 50) --50
	RunConsoleCommand("r_maxdlights", 32)--32
	RunConsoleCommand("r_decals", 2048)--2048
	RunConsoleCommand("r_drawmodeldecals", 1)
	RunConsoleCommand("r_drawdetailprops", 1)
	RunConsoleCommand("r_decal_cullsize", 1000)
	RunConsoleCommand("r_worldlights", 1)
	RunConsoleCommand("r_flashlightrender", 1)
	RunConsoleCommand("cl_forcepreload", 0)
	RunConsoleCommand("cl_ejectbrass", 1)
	RunConsoleCommand("cl_show_splashes", 1)
	RunConsoleCommand("cl_detaildist", 1200)
	--RunConsoleCommand("mat_fastnobump", 0)
	RunConsoleCommand("mat_filterlightmaps", 1)
	RunConsoleCommand("r_threaded_renderables", 0)
	RunConsoleCommand("r_threaded_client_shadow_manager", 0)
	--RunConsoleCommand("mat_filtertextures", 1)
	RunConsoleCommand("r_drawflecks", 1)
	RunConsoleCommand("r_WaterDrawRefraction", 0)
	--RunConsoleCommand("mat_showlowresimage", 0)
	RunConsoleCommand("r_dynamic", 1)
	for k,v in pairs(removes) do
		for a,b in pairs(ents.FindByClass(v)) do
			b:SetNoDraw(false)
		end
	end
end
concommand.Add("ap_resetlag", Reset)

-- Crosshair

 CreateClientConVar("ap_advcrosshair", 1, true, false)
CreateClientConVar("ap_advcrosshair_hitmarker", 1, true, false)
CreateClientConVar("ap_advcrosshair_info", 1, true, false)


function advcrosshair()
	if GetConVarNumber("ap_advcrosshair") == 1 then
		local x = ScrW()*.5
		local y = ScrH()*.5
			target = LocalPlayer():GetEyeTrace().Entity
		if LocalPlayer():Alive() and LocalPlayer():GetActiveWeapon():IsValid() and (target:IsPlayer() or target:IsNPC()) then
			crosscolor = Color(220,60,90, 150)
			surface.SetDrawColor(crosscolor)
			if GetConVarNumber("ap_advcrosshair_info") == 1 then
				draw.DrawText("Heath: "..target:Health(), "Trebuchet18", x, y +25, Color(255,255,255, 150), 1)

			end
			if GetConVarNumber("ap_advcrosshair_hitmarker") == 1 then
				if LocalPlayer():KeyDown(IN_ATTACK) and LocalPlayer():GetActiveWeapon():Clip1() > 0 then
					surface.SetDrawColor(255,255,255)
					surface.DrawLine(x+15, y+15, x+8, y+8)
					surface.DrawLine(x-15, y-15, x-8, y-8)
					surface.DrawLine(x-15, y+15, x-8, y+8)
					surface.DrawLine(x+15, y-15, x+8, y-8)
				end
			end

		else
			crosscolor = Color(255,255,255, 150)
		end

		/*for _, v in pairs(player.GetAll()) do
			vtarget = v:GetEyeTrace().Entity
			if vtarget:IsPlayer() then
				if LocalPlayer():Alive() and v:GetActiveWeapon():Clip1() > 0 then
					if vtarget:Name() == LocalPlayer():Name() then
						draw.DrawText(vtarget:Name().." is aiming a weapon at you", "Trebuchet18", x, y +35, Color(255,255,255, 150), 1)
					end
				end
			end
		end*/



		surface.SetDrawColor(crosscolor)
		local gap = 15
		local length = gap + 10
		surface.DrawLine( x - length, y, x - gap, y )
		surface.DrawLine( x + length, y, x + gap, y )
		surface.DrawLine( x, y - length, x, y - gap )
		surface.DrawLine( x, y + length, x, y + gap )
		surface.SetDrawColor(0, 255, 0)
		surface.DrawLine( x +2 , y, x -2, y)
		surface.DrawLine( x , y +2, x , y-2)
	end
end
hook.Add("HUDPaint", "advcrosshair", advcrosshair)

local ap = { Menu = { t = {}; b = {}; c = 0;}; Alive = {}; Spectators = {};}
local snoweps = "weapon_physgun"
// Laser Sight \\
function ap.Barrel( )
if GetConVarNumber( "ap_removelaser" ) >= 1 then return end
local ViewModel = LocalPlayer():GetViewModel()
local Attach = ViewModel:LookupAttachment( '1' )
if( !LocalPlayer():Alive() || LocalPlayer():GetActiveWeapon() == NULL ) then return; end
if ( Attach == 0 ) then Attach = ViewModel:LookupAttachment( 'muzzle' ) end
if LocalPlayer():GetActiveWeapon():GetClass() == snoweps then
-- //if( !table.HasValue( LaserSightAllowed, LocalPlayer():GetActiveWeapon():GetClass() ) ) then return; end
cam.Start3D( EyePos(), EyeAngles() )
render.SetMaterial(Material("sprites/physbeam"))
render.DrawBeam( ViewModel:GetAttachment( Attach ).Pos, LocalPlayer():GetEyeTrace().HitPos, 5, 0, 0, Color(50, 255, 50, 255) )
local Size = math.random() * 1.35
render.SetMaterial(Material("sprites/redglow1"))
render.DrawQuadEasy(LocalPlayer():GetEyeTrace().HitPos, (EyePos() -  LocalPlayer():GetEyeTrace().HitPos):GetNormal(), 30, 30, Color(235,80,80,235) )
cam.End3D()
else

end
end
hook.Add( 'HUDPaint', '\2\3', ap.Barrel )
 
CreateClientConVar( "ap_removelaser", 0, true, false )