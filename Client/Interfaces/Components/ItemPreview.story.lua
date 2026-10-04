-- Script path: ReplicatedStorage.Client.Interfaces.Components.ItemPreview.story
-- Decompile time: 1.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local ItemPreview = require(script.Parent.ItemPreview)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
local v1 = {Type = "Crates", Item = "Golden"}
local u28 = {
    Flat = true,
    PauseAnimation = true,
    IgnoreAnimation = true,
    IgnoreShadow = true,
    HidePreviewText = true,
}
u28.CameraOffset = CFrame.new(0, 3.6, 40)
u28.Preview = v1
local v2 = {Dynamic = true, IsPreview = false, CameraOffset = CFrame.new(0, 0.2, 1), Preview = v1}

local function CreateFrame() -- Line: 38 -- upvalues: u28 (val), createElement (val), ItemPreview (val), table (val)
    return createElement("Frame", {Size = UDim2.fromOffset(200, 200), Position = UDim2.fromOffset(50, 50)}, {
        itemPreview = createElement(ItemPreview, table.merge(u28, {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(4, 4),
        })),
    })
end

return function(a1) -- Line: 57 -- upvalues: ReactRoblox (val), createElement (val), CreateFrame (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(CreateFrame)))
    return function() -- Line: 61 -- upvalues: u4 (val)
        u4:unmount()
    end
end