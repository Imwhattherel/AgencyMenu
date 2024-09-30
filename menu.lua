_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Agency Menu", "~h~Set your radio agency", 720, 100)
_menuPool:Add(mainMenu)

-- Disable unnecessary controls globally for the pool
_menuPool:MouseControlsEnabled(false)
_menuPool:MouseEdgeEnabled(false)
_menuPool:ControlDisablingEnabled(false)

-- Helper function to set up agency items
function addAgencyItem(submenuTitle, agencyName, agencyColor)
    local submenu = _menuPool:AddSubMenu(mainMenu, agencyColor .. "~h~" .. submenuTitle, "", 720, 100)

    local rdioItem = NativeUI.CreateItem("Set Agency", "Set agency to " .. agencyColor .. agencyName)
    rdioItem.Activated = function(sender, item)
        if item == rdioItem then
            TriggerEvent("radioExternal:setCodeplug", agencyName:lower())
            notify("Agency set to " .. agencyColor .. agencyName)
        end
    end

    submenu:AddItem(rdioItem)
end

-- Add LEO, Fire, and DOT items
addAgencyItem("LEO", "LEO", "~b~")
addAgencyItem("Fire", "Fire", "~r~")
addAgencyItem("DOT", "DOT", "~o~")

-- Credits item
function addCreditsItem()
    local submenu = _menuPool:AddSubMenu(mainMenu, "~h~Credits", "WhatTheReL", 720, 100)

    local contactItem = NativeUI.CreateItem("Contact", "Contact Me via discord @ whattherel", 720, 100)
    contactItem.Activated = function(sender, item)
        -- Action when the "Contact" item is clicked, add functionality if needed
    end

    submenu:AddItem(contactItem)
end

-- Add credits item
addCreditsItem()

-- Refresh menu index to show changes
_menuPool:RefreshIndex()

-- Citizen thread to handle menu visibility toggle (F9 key)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()

        if IsControlJustPressed(1, 56) then -- F9 key
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)

-- Notification function
function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end
