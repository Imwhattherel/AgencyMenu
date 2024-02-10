
A menu for scnp25 https://www.scncomms.app/


Support: https://discord.gg/96vePT5hwa


Thanks to Jeva for the "FiveM - Creating a menu with NativeUI Lua" tutorial





How to add more agencies


To add more agencies add the code listed below. replace the ______ with whatever you want. i used First - Third so you could use Forth and so on.  after you paste that code and configure it to your liking add the Item to the bottom. i have marked the spot with ---Exra slot here the item should be named ___Item(mainMenu) and replace the ____ with what you put for the function. (look at the lua for an example)
 

function ______Item(menu)
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




