-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.AdSlideshow
-- Decompile time: 16.38 ms

local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Elements = require(script.Parent.Elements)
local Rotation = require(Shared.UI.Rotation)
local ViewController = require(script.Parent.Parent.Parent.Controllers.ViewController)
local Fusion = require(Shared.UI.Fusion)
local Value = Fusion.Value
local ForPairs = Fusion.ForPairs
local ForPairs_2 = Fusion.ForPairs
local New = Fusion.New
local Hydrate = Fusion.Hydrate
local OnEvent = Fusion.OnEvent
local Tween = Fusion.Tween
local Spring = Fusion.Spring
local Computed = Fusion.Computed
local Children = Fusion.Children
local Cleanup = Fusion.Cleanup
local AdSlideshow = Elements.AdSlideshow
local Slideshow = Elements.Slideshow
local u70 = if not RunService:IsRunning() then Value({}) else Rotation("Slideshow")

local function PageNum(a1) -- Line: 35 -- upvalues: Value (val), New (val), Tween (val), Computed (val), Children (val)
    local Selected = a1.Selected
    if not Selected then
        Selected = Value(false)
    end
    local v1 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local Frame = New("Frame")
    local v2 = {
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(60, 10),
        BackgroundTransparency = Tween(Computed(function() -- Line: 44 -- upvalues: Selected (val)
            if Selected:get() then
                return 0
            end
            return 0.5
        end), v1),
        BackgroundColor3 = Tween(Computed(function() -- Line: 51 -- upvalues: Selected (val)
            return Selected:get() and Color3.fromRGB(85, 255, 127) or Color3.fromRGB(255, 255, 255)
        end), v1),
    }
    v2[Children] = {
        New("UIStroke")({
            Name = "UIStroke",
            Color = Color3.fromRGB(255, 255, 255),
            Thickness = Tween(Computed(function() -- Line: 63 -- upvalues: Selected (val)
                if Selected:get() then
                    return 2
                end
                return 0
            end), v1),
        }),
    }
    return Frame(v2)
end

return function(a1) -- Line: 73
    -- upvalues: AdSlideshow (val), Value (val), Hydrate (val), ForPairs (val), u70 (ref), Slideshow (val)
    -- upvalues: MarketplaceService (val), New (val), Cleanup (val), Children (val), OnEvent (val), Computed (val)
    -- upvalues: ViewController (val), LocalPlayer (val), ForPairs_2 (val), PageNum (val)
    local v1 = AdSlideshow:Clone()
    local u5 = true
    local u8 = Value(false)
    local u13 = Value(v1.Pages.UIPageLayout.CurrentPage)
    local Size = a1.IsLarge and UDim2.new(0.5, -8, 0, 180) or v1.Size
    local PageNum_2 = v1.PageNum
    local UIListLayout = PageNum_2.UIListLayout
    local u31 = Hydrate(v1.Pages.UIPageLayout)({})
    UIListLayout.Parent = nil
    PageNum_2:ClearAllChildren()
    for i, j in v1.Pages:GetChildren() do
        if j:IsA("ImageLabel") then
            j:Destroy()
        end
    end
    local u58 = (u31:GetPropertyChangedSignal("CurrentPage")):Connect(function() -- Line: 95 -- upvalues: u13 (val), u31 (val)
        u13:set(u31.CurrentPage)
    end)
    local v2 = ForPairs(u70, function(a1, a2) -- Line: 99 -- upvalues: Slideshow (upval), MarketplaceService (upval), Hydrate (upval)
        local v1 = Slideshow:FindFirstChild(a2)
        if not v1 then
            return a1, nil
        end
        local Attribute = v1:GetAttribute("GamePass")
        local v2 = v1:Clone()
        local Price = v2:FindFirstChild("Price")
        local v3 = nil
        if Attribute then
            local success, result = pcall(function() -- Line: 108 -- upvalues: MarketplaceService (upval), Attribute (val)
                return MarketplaceService:GetProductInfo(Attribute, Enum.InfoType.GamePass)
            end)
            if success then
                local PriceInRobux = result.PriceInRobux
                if PriceInRobux then
                    v3 = PriceInRobux
                end
            end
        end
        local Value = Price and Price:FindFirstChild("Value")
        if Value then
            local Text = if not v3 then Value.Text else v3 .. " Robux"
            Value.Text = Text
        end
        return a1, Hydrate(v2)({Visible = true})
    end, function(a1, a2) -- Line: 132
        a2:Destroy()
    end)
    local u64 = nil
    task.spawn(function() -- Line: 137 -- upvalues: u5 (ref), u64 (ref), u31 (val)
        local v1
        while u5 do
            v1 = tick()
            task.wait(10)
            if v1 == v1 then
                u31:Previous()
            end
        end
    end)
    local Frame = New("Frame")
    local v3 = {
        ZIndex = 10,
        BackgroundTransparency = 1,
        Background = a1.Background,
        Position = v1.Position,
        Size = Size,
    }

    v3[Cleanup] = function() -- Line: 157 -- upvalues: u58 (val), u5 (ref)
        u58:Disconnect()
        u5 = false
    end

    local v4 = Children
    local v5 = {}
    local v6 = Hydrate(v1)
    local v7 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local Activated = OnEvent("Activated")
    v7[Activated] = a1.Clicked
    local MouseEnter = OnEvent("MouseEnter")

    v7[MouseEnter] = function() -- Line: 169 -- upvalues: u8 (val)
        u8:set(true)
    end

    local MouseLeave = OnEvent("MouseLeave")

    v7[MouseLeave] = function() -- Line: 172 -- upvalues: u8 (val)
        u8:set(false)
    end

    local v8 = Children
    local v9 = {}
    local v10 = Hydrate(v1.Glow)({Visible = u8})
    local v11 = Hydrate(v1.DropShadow)({
        Visible = Computed(function() -- Line: 182 -- upvalues: u8 (val)
            return not u8:get()
        end),
    })
    local v12 = Hydrate(v1.Detector)
    local v13 = {}
    local Activated_2 = OnEvent("Activated")

    v13[Activated_2] = function() -- Line: 188 -- upvalues: u13 (val), ViewController (upval), MarketplaceService (upval), LocalPlayer (upval)
        local v1 = u13:get()
        if not v1 then
            return
        end
        local Attribute = v1:GetAttribute("Tower")
        local Attribute_2 = v1:GetAttribute("Crate")
        local Attribute_3 = v1:GetAttribute("GamePass")
        local Attribute_4 = v1:GetAttribute("Season")
        if not Attribute and not Attribute_2 then
            if Attribute_3 then
                MarketplaceService:PromptGamePassPurchase(LocalPlayer, Attribute_3)
                return
            end
            if Attribute_4 then
                ViewController:getEmitter("Season"):Emit("Select", Attribute_4)
            end
            return
        end
        local v2 = if not Attribute then "Crates" else "Towers"
        ViewController:getEmitter("Inventory"):Emit("Select", v2, Attribute or Attribute_2)
        ViewController:setView("Inventory")
    end

    v12 = v12(v13)
    v13 = Hydrate(v1.Back)
    local v14 = {}
    local Activated_3 = OnEvent("Activated")

    v14[Activated_3] = function() -- Line: 216 -- upvalues: u64 (ref), u31 (val)
        u64 = tick()
        u31:Previous()
    end

    v13 = v13(v14)
    v14 = Hydrate(v1.Next)
    local v15 = {}
    local Activated_4 = OnEvent("Activated")

    v15[Activated_4] = function() -- Line: 223 -- upvalues: u64 (ref), u31 (val)
        u64 = tick()
        u31:Next()
    end

    v14 = v14(v15)
    v15 = Hydrate(v1.PageNum)
    local v16 = {}
    v16[Children] = {
        Hydrate(UIListLayout)({}),
        (ForPairs_2(v2, function(a1) -- Line: 233 -- upvalues: PageNum (upval), Computed (upval), u13 (val)
            return PageNum({
                Selected = Computed(function() -- Line: 235 -- upvalues: a1 (val), u13 (upval)
                    return a1 == u13:get()
                end),
            })
        end, function(a1) -- Line: 239
            a1:Destroy()
        end)),
    }
    v15 = v15(v16)
    v16 = Hydrate(v1.Pages)
    v9[1] = v10
    v9[2] = v11
    v9[3] = v12
    v9[4] = v13
    v9[5] = v14
    v9[6] = v15
    v9[7] = v16({[Children] = {u31, v2}})
    v7[v8] = v9
    v5[1] = v6(v7)
    v3[v4] = v5
    return (Frame(v3))
end