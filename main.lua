local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Rayfield Example Window",
   Icon = 0,
   ShowText = "Rayfield",
   Theme = "DarkBlue",

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false
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