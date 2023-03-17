-- okay yes this is literally just the code for the killaura but this one teleports you too, so it is way less legit looking than the other one
local roomFolder = game.Workspace.Room
local challengeFolder = game.Workspace.Challenge
local remote = game:GetService("ReplicatedStorage").Remote.Event.Fight["[C-S]TakeDamage"]
local killaurafarm = true

local function killaura()
    local localPlayer = game.Players.LocalPlayer
    local playerFound = false
    for _, folder in pairs(roomFolder:GetChildren()) do
        local playersFolder = folder:FindFirstChild("Players")
        if playersFolder then
            local playerValue = playersFolder:FindFirstChild(localPlayer.Name)
            if playerValue then
                playerFound = true
                local mobFolder = folder:FindFirstChild("Mob")
                if mobFolder then
                    for _, mob in pairs(mobFolder:GetChildren()) do
                        local ohInstance = mob.Humanoid
                        pcall(function()
                            localPlayer.Character.PrimaryPart.CFrame = ohInstance.Parent.PrimaryPart.CFrame
                            remote:FireServer(ohInstance)
                        end)
                    end
                end
            end
        end
    end
    if not playerFound then
        for _, challenge in pairs(challengeFolder:GetChildren()) do
            local playersFolder = challenge:FindFirstChild("Players")
            if playersFolder then
                local playerValue = playersFolder:FindFirstChild(localPlayer.Name)
                if playerValue then
                    playerFound = true
                    local mobFolder = challenge:FindFirstChild("Mob")
                    if mobFolder then
                        for _, mob in pairs(mobFolder:GetChildren()) do
                            local ohInstance = mob.Humanoid
                            pcall(function()
                                localPlayer.Character.PrimaryPart.CFrame = ohInstance.Parent.PrimaryPart.CFrame
                                remote:FireServer(ohInstance)
                            end)
                        end
                    end
                end
            end
        end
    end
end

while killaurafarm do
    pcall(function()
        killaura()
    end)
    wait()
end
