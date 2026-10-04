-- Script path: ReplicatedStorage.Content.Emote.Gift.Animator
-- Decompile time: 3.05 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local v1 = {}
local u17 = Random.new()
local u19 = {Cake = 15680003718, Candy = 15680008333, Coal = 15680005690, Cookie = 15680008333}

local function flingLid(a1, a2) -- Line: 46 -- upvalues: ItemDrop (val) -- types: a1: userdata, a2: userdata
    local v1
    local Top = a2:FindFirstChild("Top")
    a2.GiftRoot.Sound:Play()
    for k, v in pairs(a2.GiftRoot.Attachment:GetChildren()) do
        if v:IsA("ParticleEmitter") then
            v1 = v:GetAttribute("EmitCount") or 1
            if v1 then
                v:Emit(v1)
            end
        end
    end
    if Top then
        local u100 = a1.PrimaryPart.CFrame * CFrame.Angles(0, Random.new():NextNumber(0, 6.283185307179586), 0) * CFrame.new(0, 0, Random.new():NextNumber(2, 3.5))
        local u101 = Top:Clone()
        u101.Anchored = true
        u101.Parent = workspace.CurrentCamera
        u101.Transparency = 0
        for k2, i in pairs(u101:GetChildren()) do
            if i:IsA("Weld") or i:IsA("WeldConstraint") or i:IsA("Motor6D") then
                i:Destroy()
            end
        end
        Top.Transparency = 1
        task.spawn(function() -- Line: 77 -- upvalues: ItemDrop (upval), Top (val), u100 (val), u101 (val)
            local u4 = Random.new():NextNumber()
            ;(ItemDrop.Drop(Top.Position, u100.Position, u101, 6, -1.5, 3, function(a1, a2, a3) -- Line: 87 -- upvalues: u4 (val)
                local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(u4 + a1, u4 + a1, 0)
                return v1 - v1.Position
            end)):andThen(function(a1) -- Line: 93 -- upvalues: u101 (upval)
                u101:Destroy()
            end)
        end)
    end
end

function v1.GetState() -- Line: 100 -- upvalues: u17 (val), Players (val)
    local v1 = {"Cake", "Candy", "Coal", "Cookie"}
    return {Gifter = Players.LocalPlayer.UserId, Gift = v1[u17:NextInteger(1, #v1)]}
end

function v1.Initialize(a1) -- Line: 111 -- upvalues: flingLid (val), Players (val), u19 (val)
    local ClientState = a1.ClientState or {}
    local v1 = ClientState.Gifter or 0
    local u7 = ClientState.Gift or "Coal"
    local Player = a1.Player
    local Instance = a1.Character.Instance
    local Humanoid = Instance:WaitForChild("Humanoid")
    local Gift = Instance:WaitForChild("Gift")
    local Item = Instance:WaitForChild("Item")
    local v2 = Item:FindFirstChild(u7)
    a1:OnTrackPlayed("rbxassetid://" .. 15679996486, function(a1) -- Line: 125 -- upvalues: flingLid (upval), Instance (val), Gift (val) -- types: a1: userdata
        local u8 = (a1:GetMarkerReachedSignal("Unbox")):Connect(function(a1) -- Line: 126 -- upvalues: flingLid (upval), Instance (upval), Gift (upval)
            flingLid(Instance, Gift)
        end)
        a1.Stopped:Once(function() -- Line: 130 -- upvalues: u8 (val)
            u8:Disconnect()
        end)
    end)
    if v1 ~= Player.UserId then
        Gift:Destroy()
        if v2 then
            v2.Transparency = 0
        end
    else
        Item:Destroy()
    end
    if not a1.Local then
        return
    end
    if v1 ~= Player.UserId then
        local WalkSpeed = Humanoid.WalkSpeed
        Instance:PivotTo((Players:GetPlayerByUserId(v1).Character:GetPivot()) * CFrame.new(0, 0, -4) * (CFrame.Angles(0, -3.141592653589793, 0)))
        Humanoid.WalkSpeed = 0
        a1.thread = task.spawn(function() -- Line: 172 -- upvalues: a1 (val), u7 (val), Item (val), u19 (upval), Humanoid (val), WalkSpeed (val)
            a1:PlayTrack("rbxassetid://15680001328").Stopped:Wait()
            if u7 ~= "Coal" then
                if Item.ItemRoot:FindFirstChild("Happy") then
                    Item.ItemRoot.Happy:Play()
                end
            elseif Item.ItemRoot:FindFirstChild("Sad") then
                Item.ItemRoot.Sad:Play()
            end
            a1:PlayTrack((("rbxassetid://%*"):format(u19[u7]))).Stopped:Wait()
            a1.thread = nil
            Humanoid.WalkSpeed = WalkSpeed
            a1:Stop()
        end)
    else
        a1.thread = task.spawn(function() -- Line: 149 -- upvalues: a1 (val), Humanoid (val)
            a1.TargetUpdated:Wait()
            local WalkSpeed = Humanoid.WalkSpeed
            Humanoid.WalkSpeed = 0
            a1:PlayTrack("rbxassetid://" .. 15679996486).Stopped:Wait()
            a1:PlayTrack("rbxassetid://" .. 15679988537).Stopped:Wait()
            a1.thread = nil
            Humanoid.WalkSpeed = WalkSpeed
            a1:Stop()
        end)
    end
    a1:PlayTrack("rbxassetid://" .. 15679985630)
end

function v1:Destroy() -- Line: 198
    if self.thread then
        task.cancel(self.thread)
        self.thread = nil
    end
end

return v1