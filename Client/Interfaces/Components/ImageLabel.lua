-- Script path: ReplicatedStorage.Client.Interfaces.Components.ImageLabel
-- Decompile time: 1.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UI = ReplicatedStorage.Shared.UI
local React = require(UI.React)
local Change = React.Change
local Fragment = React.Fragment
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useRef = React.useRef
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
return function(a1) -- Line: 27
    -- upvalues: useState (val), useRef (val), useEffect (val), createElement (val), Loader (val), Fragment (val)
    local Image_3 = typeof(a1.Image) == "number" and ("rbxassetid://%*"):format(a1.Image) or a1.Image
    local u14 = a1.disableSpinner == true
    local v1, u18 = useState(false)
    local u20 = useRef()
    local v2 = {u20, Image_3, u14}
    useEffect(function() -- Line: 33 -- upvalues: u20 (val), u14 (val), u18 (val)
        local current = u20.current
        if current and not u14 then
            local u3 = true
            local u4 = nil
            u4 = task.spawn(function() -- Line: 42 -- upvalues: current (val), u18 (upval), u3 (ref), u4 (ref)
                if current.IsLoaded then
                    return
                end
                u18(true)
                while u3 do
                    if current.IsLoaded then
                        break
                    end
                    task.wait()
                end
                u18(false)
                u4 = nil
            end)
            return function() -- Line: 57 -- upvalues: u3 (ref), u4 (ref)
                u3 = false
                if u4 then
                    pcall(task.cancel, u4)
                end
            end
        end
    end, v2)
    return createElement("ImageLabel", {
        AnchorPoint = a1.AnchorPoint,
        Position = a1.Position,
        Size = a1.Size,
        SizeConstraint = a1.SizeConstraint,
        BackgroundColor3 = a1.BackgroundColor3,
        BackgroundTransparency = a1.BackgroundTransparency,
        BorderSizePixel = a1.BorderSizePixel,
        BorderColor3 = a1.BorderColor3,
        Active = a1.Active,
        LayoutOrder = a1.LayoutOrder,
        ZIndex = a1.ZIndex,
        Image = Image_3,
        ImageColor3 = a1.ImageColor3,
        ImageRectOffset = a1.ImageRectOffset,
        ImageRectSize = a1.ImageRectSize,
        ImageTransparency = a1.ImageTransparency,
        Rotation = a1.Rotation,
        ScaleType = a1.ScaleType,
        SliceCenter = a1.SliceCenter,
        SliceScale = a1.SliceScale,
        TileSize = a1.TileSize,
        ResampleMode = a1.ResampleMode,
        ClipsDescendants = a1.ClipsDescendants,
        Visible = a1.Visible,
        ref = u20,
    }, {
        loader = if u14 or not v1 then nil else createElement(Loader, {
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.5, 0.5),
            Visible = if a1.Visible == nil then true else a1.Visible,
        }),
        children = createElement(Fragment, {}, a1.children or {}),
    })
end