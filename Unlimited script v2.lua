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
MainSection:NewToggle("Auto Attack Skill", "Automatically fires attack skill", function(state)
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
