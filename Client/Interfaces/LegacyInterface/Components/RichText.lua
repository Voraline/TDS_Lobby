-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.RichText
-- Decompile time: 4.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local RichText = require(Shared.UI.Components.RichText)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local u24 = {}
Scheduler.add("AnimatedRichText", RunService.Heartbeat, function(a1) -- Line: 11 -- upvalues: u24 (val)
    for i in u24 do
        i:Step(a1)
    end
end)

local function readText(a1) -- Line: 17
    if typeof(a1) == "string" then
        return a1
    end
    return "RichText"
end

local function setIfPresent(a1, a2, a3) -- Line: 25 -- types: a1: userdata, a2: string
    if a3 ~= nil then
        a1[a2] = a3
    end
end

return function(a1) -- Line: 31 -- upvalues: RichText (val), u24 (val)
    local v1 = a1.Animated ~= false
    local u57 = nil
    local Frame = Instance.new("Frame")
    Frame.BackgroundTransparency = 1
    Frame.Name = "RichTextContainer"
    local Size = a1.Size
    if Size ~= nil then
        Frame.Size = Size
    end
    local AnchorPoint = a1.AnchorPoint
    if AnchorPoint ~= nil then
        Frame.AnchorPoint = AnchorPoint
    end
    local Position = a1.Position
    if Position ~= nil then
        Frame.Position = Position
    end
    local ZIndex = a1.ZIndex
    if ZIndex ~= nil then
        Frame.ZIndex = ZIndex
    end
    local v2 = {textScale = 1, textSettings = {Font = a1.Font or "GothamBold"}, animate = v1}
    local Text = a1.Text
    v2.text = if typeof(Text) ~= "string" then "RichText" else Text
    v2.Parent = Frame
    local u45 = RichText(v2)
    if not v1 then
        u57 = (Frame:GetPropertyChangedSignal("AbsoluteSize")):Connect(function() -- Line: 59 -- upvalues: u45 (ref)
            if u45 then
                u45:Step(0)
            end
        end)
    else
        u24[u45] = true
    end
    Frame.Destroying:Once(function() -- Line: 66 -- upvalues: u45 (ref), u24 (upval), u57 (ref)
        if u45 then
            u24[u45] = nil
            u45:Destroy()
            u45 = nil
        end
        if u57 then
            u57:Disconnect()
            u57 = nil
        end
    end)
    return Frame
end