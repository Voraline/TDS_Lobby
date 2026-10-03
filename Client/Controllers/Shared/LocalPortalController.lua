-- Script path: ReplicatedStorage.Client.Controllers.Shared.LocalPortalController
-- Decompile time: 2.75 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local TweenService = game:GetService("TweenService")
;((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Scenes")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local LightingController = require(ReplicatedStorage.Client.Controllers.Shared.LightingController)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TagObserver = require(ReplicatedStorage.Shared.Modules.TagObserver)
local u59 = {_objects = {}}

function u59.PlayEffect() -- Line: 19 -- upvalues: Players (val), Create (val), TweenService (val)
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    local v1 = Create("Sound", {SoundId = "rbxassetid://114497121113501", PlayOnRemove = true, Volume = 1})
    local v2 = Create("Frame", {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 1,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(1, 1, 1),
    })
    local u28 = Create("ScreenGui", {
        DisplayOrder = 9000000000,
        IgnoreGuiInset = true,
        Parent = PlayerGui,
        v2,
        v1,
    })
    v1:Destroy()
    TweenService:Create(v2, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    task.delay(1, function() -- Line: 49 -- upvalues: u28 (val)
        u28:Destroy()
    end)
end

function u59.Teleport(a1, a2, a3) -- Line: 54
    -- upvalues: Players (val), u59 (val), Shaker (val)
    local v1 = a3 or {}
    local CurrentCamera = workspace.CurrentCamera
    local Character = Players.LocalPlayer.Character
    if CurrentCamera and Character then
        if v1.UseEffects ~= false then
            u59.PlayEffect()
            Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
        end
        if v1.ApplyRotation == false then
            Character:PivotTo(a2)
            return
        end
        local v2 = CurrentCamera.CFrame:ToObjectSpace((Character:GetPivot())):Inverse()
        Character:PivotTo(a2)
        CurrentCamera.CFrame = Character:GetPivot() * v2
        return
    end
end

function u59:Create() -- Line: 84
    -- upvalues: Maid (val), Players (val), LightingController (val), u59 (val)
    local v1 = Maid.new()
    local Attribute = self:GetAttribute("Lighting")
    local Attribute_2 = self:GetAttribute("Music")
    local Linked = self:WaitForChild("Linked")
    assert(Linked, (("Portal \"%*\" is not linked to anything!"):format((self:GetFullName()))))
    local u26 = {}
    v1:Mark((self.TouchEnded:Connect(function(a1) -- Line: 95
        -- upvalues: Linked (val), Players (upval), u26 (val), Attribute (val), LightingController (upval)
        -- upvalues: Attribute_2 (val), self (val), u59 (upval)
        local Parent = a1.Parent
        if Linked:GetAttribute("Disabled") then
            return
        end
        if (Players:GetPlayerFromCharacter(Parent)) == Players.LocalPlayer and not u26[Parent] then
            u26[Parent] = true
            if Attribute then
                LightingController.ApplyProfile(Attribute)
            end
            if Attribute_2 then
                workspace.Music.Value = Attribute_2
            end
            local Value = Linked.Value
            assert(Linked, (("Portal \"%*\" is not linked to anything!"):format((self:GetFullName()))))
            u59.Teleport(self.CFrame, Value.CFrame, self:GetAttributes())
            task.wait(2)
            u26[Parent] = false
            return
        end
    end)))
    return v1
end

function u59.init() -- Line: 135 -- upvalues: TagObserver (val), u59 (val)
    TagObserver("LOCAL_PORTAL", function(a1) -- Line: 136 -- upvalues: u59 (upval) -- types: a1: userdata
        local u4 = u59.Create(a1)
        u59._objects[a1] = u4
        return function() -- Line: 140 -- upvalues: u59 (upval), a1 (val), u4 (val)
            u59._objects[a1] = nil
            u4:Sweep()
        end
    end)
end

task.spawn(u59.init)
return u59