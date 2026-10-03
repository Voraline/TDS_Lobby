-- Script path: ReplicatedStorage.Shared.Modules.GuiLib.Constructors.List
-- Decompile time: 2.05 ms

local Parent = script.Parent.Parent
require(Parent:WaitForChild("LazyLoader"))
local ListButton = Parent:WaitForChild("Defaults"):WaitForChild("ListButton")
local v1 = {SortOrder = Enum.SortOrder.LayoutOrder}

local function defaultButton(a1, a2) -- Line: 32 -- upvalues: ListButton (val)
    local v1 = ListButton:Clone()
    v1.Name = a2 .. "_button"
    v1.Label.Text = a2
    return v1
end

return {
    Create = function(a1, a2, a3, a4, a5) -- Line: 43 -- upvalues: defaultButton (val)
        local v1, v2, v3
        local v4 = a2 or (1 / 0)
        local v5 = a4 or UDim.new(0, 0)
        local v6 = a3 or Enum.FillDirection.Vertical
        local v7 = a5 or defaultButton
        local v8 = #a1
        local v9 = 1 / v8
        local v10 = v6 == Enum.FillDirection.Vertical
        local Frame = Instance.new("Frame")
        Frame.Name = "ListFrame"
        Frame.BorderSizePixel = 0
        local ScrollingFrame = Instance.new("ScrollingFrame")
        ScrollingFrame.Name = "ScrollFrame"
        ScrollingFrame.BackgroundTransparency = 1
        ScrollingFrame.BorderSizePixel = 0
        ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
        local v11 = (v8 - 1) / v8
        local v12 = v5.Scale * v11
        local v13 = v5.Offset * v11
        if not v10 then
            v1 = UDim2.new(v8 / v4, 0, 0, 0)
            v2 = UDim2.new(v9 - v12, -v13, 1, 0)
        else
            v1 = UDim2.new(0, 0, v8 / v4, 0)
            v2 = UDim2.new(1, 0, v9 - v12, -v13)
        end
        ScrollingFrame.CanvasSize = v1
        local v14 = {}
        for i, v in ipairs(a1) do
            v3 = v7(i, v)
            v3.LayoutOrder = i
            v3.Size = v2
            v3.Position = UDim2.new(0, 0, (i - 1) * v9, 0)
            if not v10 then
                v3.Position = v3.Position + UDim2.new(v5.Scale / v8 * (i - 1), v5.Offset / v8 * (i - 1), 0, 0)
            else
                v3.Position = v3.Position + UDim2.new(0, 0, v5.Scale / v8 * (i - 1), v5.Offset / v8 * (i - 1))
            end
            v14[i] = v3
            v3.Parent = ScrollingFrame
        end
        Frame.BackgroundTransparency = v14[1].BackgroundTransparency
        Frame.BackgroundColor3 = v14[1].BackgroundColor3
        ScrollingFrame.Parent = Frame
        return Frame
    end,
}