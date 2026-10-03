-- Script path: ReplicatedStorage.Packages.Iris.widgets.Image
-- Decompile time: 2.32 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    local v1 = {
        hasState = false,
        hasChildren = false,
        Args = {
            Image = 1,
            Size = 2,
            Rect = 3,
            ScaleType = 4,
            ResampleMode = 5,
            TileSize = 6,
            SliceCenter = 7,
            SliceScale = 8,
        },
        Discard = function(a1) -- Line: 17
            a1.Instance:Destroy()
        end,
    }
    a1.WidgetConstructor("Image", a2.extend(v1, {
        Events = {
            hovered = a2.EVENTS.hover(function(a1) -- Line: 25
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 29 -- upvalues: a1 (val), a2 (val)
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Iris_Image"
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.ImageColor3 = a1._config.ImageColor
            ImageLabel.ImageTransparency = a1._config.ImageTransparency
            ImageLabel.LayoutOrder = a1_2.ZIndex
            a2.applyFrameStyle(ImageLabel, true)
            return ImageLabel
        end,
        Update = function(a1) -- Line: 42 -- upvalues: a2 (val)
            local Instance = a1.Instance
            local Image = a1.arguments.Image or a2.ICONS.UNKNOWN_TEXTURE
            Instance.Image = Image
            Instance.Size = a1.arguments.Size
            if a1.arguments.ScaleType then
                Instance.ScaleType = a1.arguments.ScaleType
                if a1.arguments.ScaleType ~= Enum.ScaleType.Tile then
                    if a1.arguments.ScaleType == Enum.ScaleType.Slice then
                        if a1.arguments.SliceCenter then
                            Instance.SliceCenter = a1.arguments.SliceCenter
                        end
                        if a1.arguments.SliceScale then
                            Instance.SliceScale = a1.arguments.SliceScale
                        end
                    end
                elseif a1.arguments.TileSize then
                    Instance.TileSize = a1.arguments.TileSize
                elseif a1.arguments.ScaleType == Enum.ScaleType.Slice then
                    if a1.arguments.SliceCenter then
                        Instance.SliceCenter = a1.arguments.SliceCenter
                    end
                    if a1.arguments.SliceScale then
                        Instance.SliceScale = a1.arguments.SliceScale
                    end
                end
            end
            if a1.arguments.Rect then
                Instance.ImageRectOffset = a1.arguments.Rect.Min
                Instance.ImageRectSize = Vector2.new(a1.arguments.Rect.Width, a1.arguments.Rect.Height)
            end
            if a1.arguments.ResampleMode then
                Instance.ResampleMode = a1.arguments.ResampleMode
            end
        end,
    }))
    a1.WidgetConstructor("ImageButton", a2.extend(v1, {
        Events = {
            clicked = a2.EVENTS.click(function(a1) -- Line: 76
                return a1.Instance
            end),
            rightClicked = a2.EVENTS.rightClick(function(a1) -- Line: 79
                return a1.Instance
            end),
            doubleClicked = a2.EVENTS.doubleClick(function(a1) -- Line: 82
                return a1.Instance
            end),
            ctrlClicked = a2.EVENTS.ctrlClick(function(a1) -- Line: 85
                return a1.Instance
            end),
            hovered = a2.EVENTS.hover(function(a1) -- Line: 88
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 92 -- upvalues: a1 (val), a2 (val)
            local ImageButton = Instance.new("ImageButton")
            ImageButton.Name = "Iris_ImageButton"
            ImageButton.AutomaticSize = Enum.AutomaticSize.XY
            ImageButton.BackgroundColor3 = a1._config.FrameBgColor
            ImageButton.BackgroundTransparency = a1._config.FrameBgTransparency
            ImageButton.BorderSizePixel = 0
            ImageButton.Image = ""
            ImageButton.ImageTransparency = 1
            ImageButton.LayoutOrder = a1_2.ZIndex
            ImageButton.AutoButtonColor = false
            a2.applyFrameStyle(ImageButton, true)
            a2.UIPadding(ImageButton, Vector2.new(a1._config.ImageBorderSize, a1._config.ImageBorderSize))
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "ImageLabel"
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.ImageColor3 = a1._config.ImageColor
            ImageLabel.ImageTransparency = a1._config.ImageTransparency
            ImageLabel.Parent = ImageButton
            a2.applyInteractionHighlights("Background", ImageButton, ImageButton, {
                Color = a1._config.FrameBgColor,
                Transparency = a1._config.FrameBgTransparency,
                HoveredColor = a1._config.FrameBgHoveredColor,
                HoveredTransparency = a1._config.FrameBgHoveredTransparency,
                ActiveColor = a1._config.FrameBgActiveColor,
                ActiveTransparency = a1._config.FrameBgActiveTransparency,
            })
            return ImageButton
        end,
        Update = function(a1) -- Line: 126 -- upvalues: a2 (val)
            local ImageLabel = a1.Instance.ImageLabel
            local Image = a1.arguments.Image or a2.ICONS.UNKNOWN_TEXTURE
            ImageLabel.Image = Image
            ImageLabel.Size = a1.arguments.Size
            if a1.arguments.ScaleType then
                ImageLabel.ScaleType = a1.arguments.ScaleType
                if a1.arguments.ScaleType ~= Enum.ScaleType.Tile then
                    if a1.arguments.ScaleType == Enum.ScaleType.Slice then
                        if a1.arguments.SliceCenter then
                            ImageLabel.SliceCenter = a1.arguments.SliceCenter
                        end
                        if a1.arguments.SliceScale then
                            ImageLabel.SliceScale = a1.arguments.SliceScale
                        end
                    end
                elseif a1.arguments.TileSize then
                    ImageLabel.TileSize = a1.arguments.TileSize
                elseif a1.arguments.ScaleType == Enum.ScaleType.Slice then
                    if a1.arguments.SliceCenter then
                        ImageLabel.SliceCenter = a1.arguments.SliceCenter
                    end
                    if a1.arguments.SliceScale then
                        ImageLabel.SliceScale = a1.arguments.SliceScale
                    end
                end
            end
            if a1.arguments.Rect then
                ImageLabel.ImageRectOffset = a1.arguments.Rect.Min
                ImageLabel.ImageRectSize = Vector2.new(a1.arguments.Rect.Width, a1.arguments.Rect.Height)
            end
            if a1.arguments.ResampleMode then
                ImageLabel.ResampleMode = a1.arguments.ResampleMode
            end
        end,
    }))
end