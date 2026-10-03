-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.SoftShutdown
-- Decompile time: 1.24 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Components = ReplicatedStorage.Client.Interfaces.Universal.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local useAttribute = require(Hooks.useAttribute)
local SoftShutdown = require(Components.SoftShutdown)
local useEffect = React.useEffect
local createElement = React.createElement
local u40 = {Enum.CoreGuiType.Chat}
return function(a1) -- Line: 28
    -- upvalues: useAttribute (val), useEffect (val), Lighting (val), u40 (val), StarterGui (val), Players (val)
    -- upvalues: createElement (val), SoftShutdown (val)
    local u5 = useAttribute(workspace, "SoftShutdown", false)
    local v1 = {u5}
    useEffect(function() -- Line: 31 -- upvalues: u5 (val), Lighting (upval), u40 (upval), StarterGui (upval), Players (upval)
        if not u5 then
            return
        end
        local u1 = {}
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Size = 56
        BlurEffect.Parent = Lighting
        for i, j in u40 do
            StarterGui:SetCoreGuiEnabled(j, false)
        end
        for k, n in Players.LocalPlayer.PlayerGui:GetChildren() do
            if not n.Name:find("SoftShutdown") and n:IsA("ScreenGui") then
                u1[n] = n.Enabled
                n.Enabled = false
            end
        end
        return function() -- Line: 55 -- upvalues: u40 (upval), StarterGui (upval), u1 (val), BlurEffect (val)
            for i, j in u40 do
                StarterGui:SetCoreGuiEnabled(j, true)
            end
            for k, n in u1 do
                k.Enabled = n
            end
            BlurEffect:Destroy()
        end
    end, v1)
    return createElement(SoftShutdown, {Visible = u5})
end