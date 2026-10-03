-- Script path: ReplicatedStorage.Packages.Iris.widgets.Root
-- Decompile time: 1.58 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    local u2 = 0
    a1.WidgetConstructor("Root", {
        hasState = false,
        hasChildren = true,
        Args = {},
        Events = {},
        Generate = function(a1_2) -- Line: 12 -- upvalues: a1 (val), a2 (val)
            local v1, v2
            local Folder = Instance.new("Folder")
            Folder.Name = "Iris_Root"
            if not a1._config.UseScreenGUIs then
                v1 = Instance.new("Frame")
                v1.AnchorPoint = Vector2.new(0.5, 0.5)
                v1.Position = UDim2.new(0.5, 0, 0.5, 0)
                v1.Size = UDim2.new(1, 0, 1, 0)
                v1.BackgroundTransparency = 1
                v1.ZIndex = a1._config.DisplayOrderOffset
            else
                v1 = Instance.new("ScreenGui")
                v1.ResetOnSpawn = false
                v1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                v1.DisplayOrder = a1._config.DisplayOrderOffset
                v1.IgnoreGuiInset = a1._config.IgnoreGuiInset
            end
            v1.Name = "PseudoWindowScreenGui"
            v1.Parent = Folder
            if not a1._config.UseScreenGUIs then
                v2 = Instance.new("Frame")
                v2.AnchorPoint = Vector2.new(0.5, 0.5)
                v2.Position = UDim2.new(0.5, 0, 0.5, 0)
                v2.Size = UDim2.new(1, 0, 1, 0)
                v2.BackgroundTransparency = 1
                v2.ZIndex = a1._config.DisplayOrderOffset + 1024
            else
                v2 = Instance.new("ScreenGui")
                v2.ResetOnSpawn = false
                v2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                v2.DisplayOrder = a1._config.DisplayOrderOffset + 1024
                v2.IgnoreGuiInset = a1._config.IgnoreGuiInset
            end
            v2.Name = "PopupScreenGui"
            v2.Parent = Folder
            local Frame = Instance.new("Frame")
            Frame.Name = "TooltipContainer"
            Frame.AutomaticSize = Enum.AutomaticSize.XY
            Frame.Size = UDim2.fromOffset(0, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, a1._config.PopupBorderSize))
            Frame.Parent = v2
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "MenuBarContainer"
            Frame_2.AutomaticSize = Enum.AutomaticSize.Y
            Frame_2.Size = UDim2.fromScale(1, 0)
            Frame_2.BackgroundTransparency = 1
            Frame_2.BorderSizePixel = 0
            Frame_2.Parent = v2
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "PseudoWindow"
            Frame_3.Size = UDim2.new(0, 0, 0, 0)
            Frame_3.Position = UDim2.fromOffset(0, 22)
            Frame_3.AutomaticSize = Enum.AutomaticSize.XY
            Frame_3.BackgroundTransparency = a1._config.WindowBgTransparency
            Frame_3.BackgroundColor3 = a1._config.WindowBgColor
            Frame_3.BorderSizePixel = a1._config.WindowBorderSize
            Frame_3.BorderColor3 = a1._config.BorderColor
            Frame_3.Selectable = false
            Frame_3.SelectionGroup = true
            Frame_3.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
            Frame_3.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
            Frame_3.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
            Frame_3.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
            Frame_3.Visible = false
            a2.UIPadding(Frame_3, a1._config.WindowPadding)
            a2.UIListLayout(Frame_3, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemSpacing.Y))
            Frame_3.Parent = v1
            return Folder
        end,
        Update = function(a1) -- Line: 98 -- upvalues: u2 (ref)
            if u2 > 0 then
                a1.Instance.PseudoWindowScreenGui.PseudoWindow.Visible = true
            end
        end,
        Discard = function(a1) -- Line: 106 -- upvalues: u2 (ref)
            u2 = 0
            a1.Instance:Destroy()
        end,
        ChildAdded = function(a1, a2) -- Line: 110 -- upvalues: u2 (ref)
            local Instance = a1.Instance
            if a2.type == "Window" then
                return a1.Instance
            end
            if a2.type == "Tooltip" then
                return Instance.PopupScreenGui.TooltipContainer
            end
            if a2.type == "MenuBar" then
                return Instance.PopupScreenGui.MenuBarContainer
            end
            local PseudoWindow = Instance.PseudoWindowScreenGui.PseudoWindow
            u2 = u2 + 1
            PseudoWindow.Visible = true
            return PseudoWindow
        end,
        ChildDiscarded = function(a1, a2) -- Line: 129 -- upvalues: u2 (ref)
            if a2.type ~= "Window" and a2.type ~= "Tooltip" and a2.type ~= "MenuBar" then
                u2 = u2 - 1
                if u2 == 0 then
                    a1.Instance.PseudoWindowScreenGui.PseudoWindow.Visible = false
                end
            end
        end,
    })
end