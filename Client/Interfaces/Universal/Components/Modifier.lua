-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Modifier
-- Decompile time: 9.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RuntimeLib = require(((game:GetService("ReplicatedStorage")):WaitForChild("rbxts")):WaitForChild("RuntimeLib"))
local React = require(ReplicatedStorage.Shared.UI.React)
local useBinding = React.useBinding
local u37 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Hooks", "useReactBindings")
local u49 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Hooks", "useSpring")
local u61 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Components", "Tooltip")
local u73 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Hooks", "useScale")
local u77 = UDim2.fromScale(1, 1)

local function v1(a1, a2) -- Line: 41
    if type(a1) == "table" then
        return a1:map(function(a1) -- Line: 44 -- upvalues: a2 (val)
            return a2(a1)
        end)
    end
    return a2(a1)
end

return {
    Modifier = function(a1) -- Line: 51
        -- upvalues: useBinding (val), u49 (val), u73 (val), u37 (val), u77 (val), React (val), u61 (val)
        local v1, v2
        local Visible = useBinding(true)
        if a1.Visible ~= nil then
            Visible = a1.Visible
        end
        local v3, u9 = useBinding(false)
        local v4, u16 = u49(1, 1, 20, true)
        local v5 = math.clamp(14 * u73(1.3), 8, 14)
        local v6 = {Visible, v3}
        u37(function(a1, a2) -- Line: 59 -- upvalues: u16 (val)
            u16(if not a1 then 0 else if not a2 then 1 else 1.2)
        end, v6)
        local v7 = {
            BackgroundTransparency = 1,
            key = a1.key,
            Size = u77,
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            LayoutOrder = a1.LayoutOrder,
            Position = a1.Position,
            AnchorPoint = a1.AnchorPoint,
        }
        local v8 = {}
        v6 = #v8
        local v9 = {Text = ""}
        local BackgroundColor3 = a1.BackgroundColor3

        local function u46(a1) -- Line: 75
            return a1 or Color3.fromRGB(39, 39, 39)
        end

        local v10 = if type(BackgroundColor3) ~= "table" then BackgroundColor3 or Color3.fromRGB(39, 39, 39) else BackgroundColor3:map(function(a1) -- Line: 44 -- upvalues: u46 (val)
            return u46(a1)
        end)
        v9.BackgroundColor3 = v10
        local BackgroundTransparency = a1.BackgroundTransparency

        local function u66(a1) -- Line: 78
            local v1 = a1
            if v1 == nil then
                v1 = 0
            end
            return 0.5 + 0.5 * v1
        end

        if type(BackgroundTransparency) ~= "table" then
            v1 = BackgroundTransparency
            if v1 == nil then
                v1 = 0
            end
            v10 = 0.5 + 0.5 * v1
        else
            v10 = BackgroundTransparency:map(function(a1) -- Line: 44 -- upvalues: u66 (val)
                return u66(a1)
            end)
        end
        v9.BackgroundTransparency = v10
        v9.Size = UDim2.fromScale(1, 1)
        v9.Position = UDim2.fromScale(0.5, 0.5)
        v9.AnchorPoint = Vector2.new(0.5, 0.5)
        v9.AutoButtonColor = false

        v9[React.Event.MouseEnter] = function() -- Line: 89 -- upvalues: u9 (val)
            return u9(true)
        end

        v9[React.Event.MouseLeave] = function() -- Line: 92 -- upvalues: u9 (val)
            return u9(false)
        end

        v10 = {}
        local v11 = React.createElement("UIScale", {key = "UIScale", Scale = v4})
        local createElement_2 = React.createElement
        local v12 = {BackgroundTransparency = 1, ImageTransparency = 0, key = "Icon"}
        local Icon = a1.Icon

        local function u125(a1) -- Line: 102
            if a1 ~= nil then
                return "rbxassetid://" .. tostring(a1)
            end
            return ""
        end

        v12.Image = if type(Icon) ~= "table" then if Icon == nil then "" else "rbxassetid://" .. tostring(Icon) else Icon:map(function(a1) -- Line: 44 -- upvalues: u125 (val)
            return u125(a1)
        end)
        v12.AnchorPoint = Vector2.new(0.5, 0.5)
        v12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v12.Position = UDim2.fromScale(0.5, 0.5)
        v12.Size = UDim2.new(1, -16, 1, -16)
        v12.ScaleType = Enum.ScaleType.Fit
        v10[1] = v11
        v10[2] = createElement_2("ImageLabel", v12)
        v11 = #v10
        local v13 = if a1.AdditionalText == nil then nil else React.createElement("TextLabel", {
            TextTransparency = 0,
            BackgroundTransparency = 1,
            key = "Title",
            Text = a1.AdditionalText,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = v5,
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.fromScale(1, 1),
            Size = UDim2.new(1, 0, 0, 20),
            TextXAlignment = Enum.TextXAlignment.Center,
        }, {
            React.createElement("UIStroke", {Thickness = 1, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0)}),
        })
        if v13 then
            v10[v11 + 1] = v13
        end
        v11 = #v10
        v1 = v11 + 1
        v10[v1] = (React.createElement("UICorner", {key = "UICorner", CornerRadius = UDim.new(1, 0)}))
        v1 = v11 + 2
        local createElement_6 = React.createElement
        local v14 = {
            Image = "rbxassetid://9073106548",
            SliceScale = 1.25,
            BackgroundTransparency = 1,
            ZIndex = -1,
            key = "DropShadow",
        }
        local BackgroundTransparency_2 = a1.BackgroundTransparency

        local function u241(a1) -- Line: 151
            local v1 = a1
            if v1 == nil then
                v1 = 0
            end
            return 0.2 + 0.8 * v1
        end

        if type(BackgroundTransparency_2) ~= "table" then
            local v15 = BackgroundTransparency_2
            if v15 == nil then
                v15 = 0
            end
            v2 = 0.2 + 0.8 * v15
        else
            v2 = BackgroundTransparency_2:map(function(a1) -- Line: 44 -- upvalues: u241 (val)
                return u241(a1)
            end)
        end
        v14.ImageTransparency = v2
        v14.ScaleType = Enum.ScaleType.Slice
        v14.SliceCenter = Rect.new(39, 39, 39, 39)
        v14.AnchorPoint = Vector2.new(0.5, 0.5)
        v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v14.Position = UDim2.fromScale(0.5, 0.5)
        v14.Size = UDim2.new(1, 8, 1, 8)
        v10[v1] = (createElement_6("ImageLabel", v14))
        v1 = v11 + 3
        local createElement_7 = React.createElement
        v14 = {
            key = "ModifierTooltip",
            Name = "Modifier:" .. a1.Name,
            Header = a1.Title,
            Subject = a1.Subject,
        }
        local TooltipContent = a1.TooltipContent or {{Text = a1.Description}}
        v14.Content = TooltipContent
        v10[v1] = (createElement_7(u61, v14))
        v8[v6 + 1] = (React.createElement("TextButton", v9, v10))
        return React.createElement("Frame", v7, v8)
    end,
}