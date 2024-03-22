-- Cheat Menu for N.O.V.A. Legacy
-- Game: N.O.V.A. Legacy
-- Version: 4.1.8
-- Author: GameGuardian

-- Display Cheat Menu
function main()
    GG.ClearResults()
    GG.Toast("Welcome to N.O.V.A. Legacy Cheat Menu")
    GG.Toast(GameName .. " " .. Version)
    GG.Toast("Made by " .. Author)
    GG.Toast("---------------------------------")
    GG.Toast("1. Unlimited Coins")
    GG.Toast("2. Unlimited Ammo")
    GG.Toast("---------------------------------")
    GG.Toast("Select a cheat and enter the value.")
    GG.Toast("Long press to go back.")
    GG.Spam(0x101, 0)
    GG.Sleep(1000)
    GG.ClearResults()
  end
  
  -- Unlimited Coins
  function coins(params)
    if #params ~= 2 then
      GG.Toast("Invalid input. Please enter the value.")
      return
    end
  
    local coins_address, coins_value = params[1], params[2]
  
    GG.ClearResults()
    GG.SearchNumber(coins_value, 0, 0, coins_address, 0x0, 0, 0)
    GG.SortResults("Value", false)
  
    if GG.GetResultsCount() == 0 then
      GG.Toast("No results found.")
      return
    end
  
    GG.EditMemory(0x0, 0x10, 0xFFFFFFFF, coins_address)
    GG.Notify("Coins set to max.")
    GG.Sleep(1000)
    GG.Toast("Value: " .. GG.GetResult(1, 0))
    GG.ClearResults()
  end
  
  -- Unlimited Ammo
  function ammo(params)
    if #params ~= 1 then
      GG.Toast("Invalid input. Please enter the value.")
      return
    end
  
    local ammo_address = params[1]
  
    GG.ClearResults()
    GG.SearchNumber("0?", 0, 0, ammo_address, 0x10, 0, 0)
    GG.SortResults("Value", false)
  
    if GG.GetResultsCount() == 0 then
      GG.Toast("No results found.")
      return
    end
  
    GG.EditMemory(0x0, 0x10, 0xFFFFFFFF, ammo_address)
    GG.Notify("Ammo set to max.")
    GG.Sleep(1000)
    GG.Toast("Value: " .. GG.GetResult(1, 0))
    GG.ClearResults()
  end