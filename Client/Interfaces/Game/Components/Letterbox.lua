-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Letterbox
-- Decompile time: 4.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1) -- Line: 5 -- upvalues: React (val)
    local visible = a1.visible
    local barColor = a1.barColor or Color3.new(0, 0, 0)
    local u10 = a1.aspectRatio or 2.3333333333333335
    local v1 = a1.zIndex or 999
    local v2, u17 = React.useState(0)
    local v3, u22 = React.useState(0)
    local v4, u28 = React.useState(visible)
    local v5 = {u10}
    React.useEffect(function() -- Line: 15 -- upvalues: u10 (val), u17 (val), u22 (val)
        local ViewportSize = workspace.CurrentCamera.ViewportSize
        local X = ViewportSize.X
        local Y = ViewportSize.Y
        local v1 = X / u10
        if not (Y <= v1) then
            local v2 = (Y - v1) / 2
            u17(v2)
            u22(v2)
        else
            u17(0)
            u22(0)
        end
        local u32 = (workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(function() -- Line: 16 -- upvalues: u10 (upval), u17 (upval), u22 (upval)
            local ViewportSize = workspace.CurrentCamera.ViewportSize
            local X = ViewportSize.X
            local Y = ViewportSize.Y
            local v1 = X / u10
            if Y <= v1 then
                u17(0)
                u22(0)
                return
            end
            local v2 = (Y - v1) / 2
            u17(v2)
            u22(v2)
        end)
        return function() -- Line: 42 -- upvalues: u32 (val)
            if u32 and u32.Connected then
                u32:Disconnect()
            end
        end
    end, v5)
    v5 = {visible}
    React.useEffect(function() -- Line: 49 -- upvalues: u28 (val), visible (val)
        u28(visible)
    end, v5)
    if not v4 then
        return nil
    end
    return React.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), ZIndex = v1}, {
        topBar = React.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.new(1, 0, 0, v2),
            BackgroundColor3 = barColor,
            ZIndex = v1,
        }),
        bottomBar = React.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            Position = UDim2.new(0, 0, 1, -v3),
            Size = UDim2.new(1, 0, 0, v3),
            BackgroundColor3 = barColor,
            ZIndex = v1,
        }),
    })
end