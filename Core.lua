--
-- $Date$ $Revision$
--

-- module setup

TFE = LibStub("AceAddon-3.0"):NewAddon(
  "TrinketsFollowEquipment",
  "AceConsole-3.0",
  "AceEvent-3.0"
)

function TFE:OnEnable()
  if TrinketMenuQueue and TrinketMenuQueue.Profiles then
    self:RegisterEvent("EQUIPMENT_SWAP_FINISHED")
    self:Print("Trinketmenu installed, TrinketsFollowEquipment watching for equipment set swaps")
  else
    self:Print("TrinketMenu not installed, TrinketsFollowEquipment not activating")
  end
end

function TFE:OnDisable()
  self:UnregisterAllEvents()
end

function TFE:EQUIPMENT_SWAP_FINISHED(event, success, setname)
  if success then
    if TrinketMenu.GetProfileID(setname) then
      TrinketMenu.SetQueue(0, "SORT", setname)
      TrinketMenu.SetQueue(1, "SORT", setname)
      self:Print("Equipment Swap detected, changed TrinketMenu profile to " .. setname)
    end
  end
end
