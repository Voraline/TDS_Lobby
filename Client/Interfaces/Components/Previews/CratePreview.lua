-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.CratePreview
-- Decompile time: 4.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local UI = ReplicatedStorage.Shared.UI
local Modules = ReplicatedStorage.Shared.Modules
require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewCrates)
require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local NewCrates = require(Modules.Asset.Handlers.NewCrates)
local React = require(UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Fragment = React.Fragment
local createElement = React.createElement
local useCallback = React.useCallback
local useBinding = React.useBinding
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
local memo = React.memo
local useBindings = ReactFlow.useBindings
local ImageLabel = require(Components.ImageLabel)
local u49 = {}
Color3.fromRGB(30, 30, 30)
local u57 = memo(function(a1) -- Line: 40
    -- upvalues: useState (val), useEffect (val), u49 (val), NewCrates (val), createElement (val), ImageLabel (val)
    -- upvalues: Fragment (val)
    local name = a1.name
    local v1, u5 = useState(true)
    local v2, u9 = useState(nil)
    local v3 = {name}
    useEffect(function() -- Line: 46 -- upvalues: u49 (upval), name (val), u5 (val), NewCrates (upval), u9 (val)
        local u2 = task.spawn(function() -- Line: 47 -- upvalues: u49 (upval), name (upval), u5 (upval), NewCrates (upval), u9 (upval)
            if not u49[name] then
                u5(true)
                u49[name] = true
            end
            local v1 = NewCrates(name)
            local Icon = v1.Preview and v1.Preview.Icon or v1.Icon
            if not Icon then
                return
            end
            local v2 = if typeof(Icon) ~= "number" then Icon else ("rbxassetid://%*"):format(Icon)
            u9(v2)
            u5(false)
        end)
        return function() -- Line: 67 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, v3)
    v3 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v3.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 0.5, 0)
    v3.Position = Position
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v3.Size = Size
    v3.ZIndex = a1.ZIndex or 1
    v3.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    v3.Visible = a1.Visible
    v3.Image = v2 or ""
    local ImageColor3 = a1.ImageColor3 or Color3.fromRGB(255, 255, 255)
    v3.ImageColor3 = ImageColor3
    v3.ImageTransparency = a1.ImageTransparency or 0
    v3.ClipsDescendants = a1.ClipsDescendants
    v3.imageLoading = v1 or v2 == nil
    v3.ScaleType = Enum.ScaleType.Fit
    return createElement(ImageLabel, v3, {children = createElement(Fragment, nil, a1.children or {})})
end)
return memo((memo(function(a1) -- Line: 91 -- upvalues: createElement (val), u57 (val)
    return createElement(u57, a1)
end)))