-- Script path: ReplicatedStorage.Client.Interfaces.Components.ImageButton
-- Decompile time: 1.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UI = ReplicatedStorage.Shared.UI
local React = require(UI.React)
local Event = React.Event
local Fragment = React.Fragment
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useRef = React.useRef
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
return function(a1) -- Line: 30
    -- upvalues: useState (val), useRef (val), useEffect (val), createElement (val), Event (val), Loader (val)
    -- upvalues: Fragment (val)
    local Image = a1.Image
    local v1 = a1.disableSpinner == true
    local u16, u8 = useState(false)
    local u10 = useRef()
    if a1.imageLoading == true then
        u16 = u16 or a1.imageLoading
    end
    local v2 = {u10, Image}
    useEffect(function() -- Line: 40 -- upvalues: u10 (val), u16 (ref), u8 (val)
        local current = u10.current
        if not current then
            return
        end
        local u8_2 = nil
        local u3 = true
        if u16 then
            u8_2 = task.spawn(function() -- Line: 50 -- upvalues: u3 (ref), current (val), u8 (upval), u8_2 (ref)
                while u3 do
                    if current.IsLoaded then
                        break
                    end
                    task.wait(0.1)
                end
                u8(false)
                u8_2 = nil
            end)
        end
        u8(u16)
        return function() -- Line: 62 -- upvalues: u3 (ref), u8_2 (ref)
            u3 = false
            if u8_2 then
                pcall(task.cancel, u8_2)
            end
        end
    end, v2)
    v2 = {
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
        Rotation = a1.Rotation,
        Image = Image,
        ImageColor3 = a1.ImageColor3,
        ImageRectOffset = a1.ImageRectOffset,
        ImageRectSize = a1.ImageRectSize,
        ImageTransparency = a1.ImageTransparency,
        ScaleType = a1.ScaleType,
        SliceCenter = a1.SliceCenter,
        SliceScale = a1.SliceScale,
        TileSize = a1.TileSize,
        ResampleMode = a1.ResampleMode,
        ClipsDescendants = a1.ClipsDescendants,
        Visible = a1.Visible,
        ref = u10,
    }
    v2[Event.MouseButton1Down] = a1[Event.MouseButton1Down]
    v2[Event.MouseButton1Up] = a1[Event.MouseButton1Down]
    v2[Event.MouseEnter] = a1[Event.MouseEnter]
    v2[Event.MouseLeave] = a1[Event.MouseLeave]
    return (createElement("ImageButton", v2, {
        loader = if v1 or not u16 then nil else createElement(Loader, {
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.5, 0.5),
            Visible = if a1.Visible == nil then true else a1.Visible,
        }),
        children = createElement(Fragment, {}, a1.children or {}),
    }))
end