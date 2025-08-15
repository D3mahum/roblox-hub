--// My Custom Roblox Hub
--// Toggle menu: RightShift

-- Load UI Library (Kavo UI)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("My Custom Hub", "BloodTheme")

-- Main Tab
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Main Features")

-- Auto Click Toggle
getgenv().AutoClick = false
MainSection:NewToggle("Auto Click", "Automatically fires attack skill", function(state)
    getgenv().AutoClick = state
    while getgenv().AutoClick do
        local args = {
            [1] = {}
        }
        pcall(function()
            game:GetService("ReplicatedStorage")
                :WaitForChild("Remotes")
                :WaitForChild("PlayerClickAttackSkill")
                :FireServer(unpack(args))
        end)
        task.wait(0.1)
    end
end)

-- Auto Farm Example
getgenv().AutoFarm = false
MainSection:NewToggle("Auto Farm (Example)", "Teleports to a set location repeatedly", function(state)
    getgenv().AutoFarm = state
    while getgenv().AutoFarm do
        local player = game.Players.LocalPlayer
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(0, 5, 0) -- change to desired location
        end
        task.wait(2)
    end
end)

-- Teleports Tab
local TeleportTab = Window:NewTab("Teleports")
local TeleportSection = TeleportTab:NewSection("Teleport Options")
TeleportSection:NewButton("Spawn", "Teleport to spawn", function()
    local player = game.Players.LocalPlayer
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(0, 5, 0) -- change coords for spawn
    end
end)

print("✅ My Custom Hub Loaded")
