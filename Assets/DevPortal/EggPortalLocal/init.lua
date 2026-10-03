-- Script path: ReplicatedStorage.Assets.DevPortal.EggPortalLocal
-- Decompile time: 1.28 ms

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local Remotes = script.Parent:WaitForChild("Remotes")
local UI = script.Parent:WaitForChild("UI")
local u22 = nil

local function closeGui() -- Line: 12 -- upvalues: u22 (ref)
    u22:Destroy()
    u22 = nil
end

local function showTeleportError(a1) -- Line: 17 -- upvalues: u22 (ref) -- types: a1: string
    u22.JoinHub.Visible = false
    local TeleportError = u22.TeleportError
    local AcceptButton = TeleportError:FindFirstChild("AcceptButton", true)
    local DeclineButton = TeleportError:FindFirstChild("DeclineButton", true)
    TeleportError.Titlebar.Content.Caption.Text = tostring(a1)

    local function closeGui() -- Line: 26 -- upvalues: u22 (upval)
        u22:Destroy()
    end

    AcceptButton.Activated:Connect(function() -- Line: 30 -- upvalues: u22 (upval)
        u22:Destroy()
    end)
    DeclineButton.Activated:Connect(function() -- Line: 34 -- upvalues: u22 (upval)
        u22:Destroy()
    end)
    TeleportError.Visible = true
end

local function showUI() -- Line: 41 -- upvalues: u22 (ref), UI (val), Players (val), TeleportService (val)
    u22 = UI:WaitForChild("EggPortalGui"):Clone()
    u22.Parent = Players.LocalPlayer.PlayerGui
    local JoinHub = u22.JoinHub
    local AcceptButton = JoinHub:FindFirstChild("AcceptButton", true)
    local DeclineButton = JoinHub:FindFirstChild("DeclineButton", true)
    require(script.Translations).translateUI(JoinHub)
    AcceptButton.Activated:Connect(function() -- Line: 52 -- upvalues: TeleportService (upval), Players (upval), u22 (upval)
        local success, result = pcall(function() -- Line: 53 -- upvalues: TeleportService (upval), Players (upval)
            TeleportService:Teleport(98209635344835, Players.LocalPlayer, {Origin = "Portal"})
        end)
        warn(success, result)
        if not success then
            u22:Destroy()
            u22 = nil
            return
        end
        u22:Destroy()
        u22 = nil
    end)
    DeclineButton.Activated:Connect(function() -- Line: 67 -- upvalues: u22 (upval)
        u22:Destroy()
        u22 = nil
    end)
    return u22
end

;(Remotes:WaitForChild("DisplayPortalUI")).OnClientEvent:Connect(function() -- Line: 74 -- upvalues: u22 (ref), showUI (val)
    if u22 then
        return
    end
    showUI()
end)