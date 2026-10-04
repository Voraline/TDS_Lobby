-- Script path: ReplicatedStorage.Client.Interfaces.Components.Player
-- Decompile time: 7.33 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Client.Interfaces.Hooks.useDispatchTracker)
RunService:IsRunning()
local v1 = {19004289, 49601674, 16983447, 11643}
local v2 = v1[math.random(1, #v1)]
local createElement = React.createElement
local useRef = React.useRef
local useEffect = React.useEffect
local useMemo = React.useMemo
local useState = React.useState
local u55 = {}
Players.PlayerRemoving:Connect(function(a1) -- Line: 32 -- upvalues: u55 (val)
    u55[a1.UserId] = nil
end)
return function(a1) -- Line: 36
    -- upvalues: useRef (val), Players (val), useState (val), useEffect (val), u55 (val), Create (val), RunService (val)
    -- upvalues: HttpService (val), createElement (val), React (val)
    local u3 = useRef(nil)
    local userId = a1.userId
    if not userId then
        userId = Players.LocalPlayer.UserId
    end
    local onPlayerCharacter = a1.onPlayerCharacter
    local origin = a1.origin
    local animationId = a1.animationId
    local u14 = a1.useWorldModel ~= false
    local u17, u18 = useState(nil)
    if userId then
        userId = math.max(1, userId)
    end
    local v1 = {userId}
    useEffect(function() -- Line: 56
        -- upvalues: u55 (upval), userId (ref), Players (upval), Create (upval), u18 (val), onPlayerCharacter (val)
        local u0 = nil
        local u1 = true
        task.spawn(function() -- Line: 60
            -- upvalues: u55 (upval), userId (upval), Players (upval), Create (upval), u1 (ref), u0 (ref), u18 (upval)
            -- upvalues: onPlayerCharacter (upval)
            local v1
            if not u55[userId] then
                v1 = Players:CreateHumanoidModelFromUserId(userId)
                v1.HumanoidRootPart.Anchored = true
                Create("ObjectValue", {Name = "PlayingTrack", Parent = v1})
                if v1:FindFirstChild("Animate") then
                    v1.Animate:Destroy()
                end
                if v1:FindFirstChild("Health") then
                    v1.Health:Destroy()
                end
                u55[userId] = v1
            end
            if not u1 then
                return
            end
            v1 = u55[userId]:Clone()
            u0 = v1
            u18(v1)
            if onPlayerCharacter then
                onPlayerCharacter(v1)
            end
        end)
        return function() -- Line: 96 -- upvalues: u1 (ref), u0 (ref)
            u1 = false
            if u0 then
                u0:Destroy()
            end
        end
    end, v1)
    v1 = {u17}
    useEffect(function() -- Line: 105 -- upvalues: RunService (upval), HttpService (upval), u17 (val)
        if RunService:IsRunning() then
            return
        end
        local u12 = ("UPDATE_CHARACTERS_%*"):format((HttpService:GenerateGUID(false)))
        RunService:BindToRenderStep(u12, Enum.RenderPriority.First.Value, function(a1) -- Line: 112 -- upvalues: u17 (upval) -- types: a1: number
            if u17 and u17:FindFirstChild("Humanoid") then
                u17.Humanoid.Animator:StepAnimations(a1)
                return
            end
        end)
        return function() -- Line: 120 -- upvalues: RunService (upval), u12 (val)
            RunService:UnbindFromRenderStep(u12)
        end
    end, v1)
    v1 = {u17, u14, origin}
    useEffect(function() -- Line: 125 -- upvalues: u17 (val), origin (val), u14 (val)
        if u17 and origin then
            if u14 then
                u17.HumanoidRootPart.CFrame = origin
                return
            end
            u17:PivotTo(origin)
        end
    end, v1)
    v1 = {u17, u14, u3}
    useEffect(function() -- Line: 135 -- upvalues: u3 (val), u17 (val)
        if u3.current and u17 then
            u17.Parent = u3.current
            return
        end
    end, v1)
    v1 = {u17, animationId}
    useEffect(function() -- Line: 143 -- upvalues: animationId (val), u17 (val), Create (upval)
        if animationId and u17 then
            local u30 = nil
            local u11 = Create("Animation", {AnimationId = ("rbxassetid://%*"):format(animationId)})

            local function updateAnimation() -- Line: 153 -- upvalues: u17 (upval), u30 (ref), u11 (val)
                if u17:IsDescendantOf(game) and not u30 then
                    u30 = u17.Humanoid:LoadAnimation(u11)
                    u30:Play()
                    u17.PlayingTrack.Value = u30
                    return
                end
            end

            local u18 = u17.AncestryChanged:Connect(function() -- Line: 164 -- upvalues: u17 (upval), u30 (ref), u11 (val)
                if u17:IsDescendantOf(game) then
                    if u30 then
                        return
                    end
                    u30 = u17.Humanoid:LoadAnimation(u11)
                    u30:Play()
                    u17.PlayingTrack.Value = u30
                end
            end)
            if u17:IsDescendantOf(game) and not u30 then
                u30 = u17.Humanoid:LoadAnimation(u11)
                u30:Play()
                u17.PlayingTrack.Value = u30
            end
            return function() -- Line: 170 -- upvalues: u18 (val), u11 (val), u30 (ref)
                if u18.Connected then
                    u18:Disconnect()
                end
                u11:Destroy()
                if u30 then
                    u30:Stop()
                end
            end
        end
    end, v1)
    return (createElement(if not u14 then "Model" else "WorldModel", {ref = u3}, {children = createElement(React.Fragment, {}, a1.children or {})}))
end