-- TODO: 
--	Auto Equip The Drill (DrillToggle)
--	Auto Rebirth
-- 	Local Player Settings (WalkSpeed, JumpHeight, etc)


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Drill for Ore Script by darkness",
   Icon = 0,
   ShowText = "",
   Theme = "DarkBlue",

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false
})

local Drills = {}
local HandDrills = {}
local DrillToBuy = ""
local HandDrillToBuy = ""

function GetHandDrills()
		for _, item in ipairs(game:GetService("ReplicatedStorage").HandDrills:GetChildren()) do 
		table.insert(HandDrills, 1, item.Name)
		print(item.Name)
	end
	return HandDrills
	
end

function GetDrills()
	for _, item in ipairs(game:GetService("ReplicatedStorage").Drills:GetChildren()) do 
		table.insert(Drills, 1, item.Name)
		print(item.Name)
	end
	return Drills
end

local DrillValue = false
local SellAllValue = false
local CollectAllValue = false
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
	end,
})

local SellAllToggle = Main:CreateToggle({
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

local CollectAllToggle = Main:CreateToggle({
	Name = "Collect All",
	CurrentValue = false,
	Callback = function(Value)
		CollectAllValue = Value
		if Value then
			while CollectAllValue do
				for _, v in pairs(workspace.Plots:GetDescendants()) do
					if v.Name:lower():find("vault") then
						game:GetService("ReplicatedStorage").Packages.Knit.Services.PlotService.RE.CollectDrill:FireServer(v)
					end
				end
				wait(10)
			end
		end
	end,
})

local Drills = GetDrills()
local HandDrills = GetHandDrills()

local HandDrillsDropdown = Shop:CreateDropdown({
   Name = "Hand Drills",
   Options = HandDrills,
   CurrentOption = HandDrills[1],
   MultipleOptions = false,
   Callback = function(Option)
		HandDrillToBuy = Option[1]
   end,
})

local BuyDrillButton = Shop:CreateButton({
	Name = "Buy Hand Drill",
	Callback = function ()
		game:GetService("ReplicatedStorage").Packages.Knit.Services.OreService.RE.BuyDrill:FireServer(HandDrillToBuy)
	end,
})

local DrillsDropdown = Shop:CreateDropdown({
   Name = "Drills",
   Options = Drills,
   CurrentOption = Drills[1],
   MultipleOptions = false,
   Callback = function(Option)
		DrillToBuy = Option[1]
   end,
})

local BuyDrillButton = Shop:CreateButton({
	Name = "Buy Drill",
	Callback = function ()
		game:GetService("ReplicatedStorage").Packages.Knit.Services.OreService.RE.BuyDrill:FireServer(DrillToBuy)
	end,
})