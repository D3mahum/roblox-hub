--// My Custom Roblox Hub
--// Toggle menu: RightShift

-- Load UI Library (Kavo UI)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("My Custom Hub", "BloodTheme")

-- Main Tab
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Skills")

-- Auto Click / Auto Skill Toggle
getgenv().AutoClick = false
MainSection:NewToggle("Auto Attack Skil--// My Custom Roblox Hub
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

-- Auto Spacebar Press Every 5 Minutes
getgenv().AutoSpace = false
MainSection:NewToggle("Auto Spacebar (5 min)", "Presses spacebar automatically every 5 minutes", function(state)
    getgenv().AutoSpace = state
    task.spawn(function()
        while getgenv().AutoSpace do
            local player = game.Players.LocalPlayer
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.Jump = true
                end
            end
            task.wait(300) -- 300 seconds = 5 minutes
        end
    end)
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
l", "Automatically fires attack skill", function(state)
    getgenv().AutoClick = state
    while getgenv().AutoClick do
        local args = {
            [1] = {} -- You can add skill-specific arguments here
        }
        pcall(function()
            game:GetService("ReplicatedStorage")
                :WaitForChild("Remotes")
                :WaitForChild("PlayerClickAttackSkill")
                :FireServer(unpack(args))
        end)
        task.wait(0.1) -- Adjust for skill cooldown
    end
end)

-- Example for Adding a Second Skill
getgenv().AutoSkill2 = false
MainSection:NewToggle("Auto Skill 2", "Automatically uses second skill", function(state)
    getgenv().AutoSkill2 = state
    while getgenv().AutoSkill2 do
        local args = {
            [1] = {} -- Change arguments for Skill 2
        }
        pcall(function()
            game:GetService("ReplicatedStorage")
                :WaitForChild("Remotes")
                :WaitForChild("PlayerUseSkill2") -- Replace with actual remote name
                :FireServer(unpack(args))
        end)
        task.wait(0.5) -- Adjust cooldown for skill 2
    end
end)

print("✅ My Custom Hub Loaded - Skills Only")
