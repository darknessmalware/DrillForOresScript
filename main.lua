local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Rayfield Example Window",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.
})

local DrillValue = false
local SellAllValue = false
local LocalPlayer = game:GetService("Players").LocalPlayer

local Main = Window:CreateTab("Main")
local Shop = Window:CreateTab("Shop")
local Rebirth = Window:CreateTab("Rebirth")
local Settings = Window:CreateTab("Settings")


local DrillToggle = Main:CreateToggle({
	Name = "Auto Drill",
	CurrentValue = false,
	Callback = function(Value)
		DrillValue = Value
		if Value then
			while DrillValue do 
				game:GetService("ReplicatedStorage").Packages.Knit.Services.OreService.RE.RequestRandomOre:FireServer()
				wait(0.005)
			end
		end
			
			--
			--wait(0.1)

	end,
})



local SellAllToggle = Shop:CreateToggle({
	Name = "Sell All",
	CurrentValue = false,
	Callback = function(Value)
		SellAllValue = Value
		if Value then
			while SellAllValue do
				LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Scripted.Sell.CFrame
				wait(1)
				game:GetService("ReplicatedStorage").Packages.Knit.Services.OreService.RE.SellAll:FireServer()
				wait(5)
			end
		end
	end,
})

--[[for loop = 1, 200 do

	


end ]]
