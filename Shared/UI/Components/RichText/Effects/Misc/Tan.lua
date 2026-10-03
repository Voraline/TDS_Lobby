-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Tan
-- Decompile time: 3.61 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local TextService = game:GetService("TextService")
local PVPIconBeams = require(ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.PVPIconBeams)
local v1 = {
    DesiredType = "Word",
    getColor = function(a1) -- Line: 12
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 245, 205)),
            ColorSequenceKeypoint.new(0.377, Color3.fromRGB(248, 236, 174)),
            ColorSequenceKeypoint.new(0.838, Color3.fromRGB(128, 84, 56)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(127, 80, 53))),
        })
    end,
}

local function computeStudSize(a1, a2) -- Line: 21 -- types: a1: userdata, a2: number
    local X = a1.X
    local Y = a1.Y
    if X == 0 and Y == 0 then
        return (Vector3.new(10, 0.699999988079071, 0.4000000059604645))
    end
    return (Vector3.new(X / a2, Y / a2, 0.4))
end

function v1:onCreate() -- Line: 34 -- upvalues: PVPIconBeams (val), Players (val), TextService (val)
    local adornee = self.adornee
    if not adornee then
        return
    end

    local function checkRankIcon() -- Line: 40
        -- upvalues: PVPIconBeams (upval), Players (upval), adornee (val), self (val), TextService (upval)
        local v1 = PVPIconBeams(Players.LocalPlayer, adornee)
        if not v1 then
            return
        end
        v1.Parent = adornee
        self.rankAttachment = v1
        local Beam = v1.Beam
        local Up = v1.Up
        for i, v in ipairs(adornee:GetDescendants()) do
            if v:IsA("Beam") then
                v.Attachment0 = Beam
                v.Attachment1 = Up
            end
        end
        local v2 = adornee:FindFirstChild("1", true)
        if v1 and v2 and v2:IsA("TextLabel") then
            local new_2
            local TextSize_2 = TextService:GetTextSize(adornee.Name, v2.TextSize, v2.Font, v2.AbsoluteSize)
            local PixelsPerStud = adornee.Display.PixelsPerStud
            local X = TextSize_2.X
            local Y = TextSize_2.Y
            for i2, i3 in ipairs(v1:GetChildren()) do
                if i3:IsA("Attachment") then
                    new_2 = CFrame.new
                    i3.CFrame = new_2((Vector3.new(0, i3.Position.Y, i3.Position.Z)))
                end
            end
            v1.CFrame = CFrame.new((Vector3.new(
                -((if X ~= 0 or Y ~= 0 then Vector3.new(X / PixelsPerStud, Y / PixelsPerStud, 0.4) else Vector3.new(10, 0.699999988079071, 0.4000000059604645)).X / 2) - 0.7,
                v1.Position.Y,
                v1.Position.Z
            )))
        end
    end

    local Rank = Players.LocalPlayer:FindFirstChild("Rank")
    if Rank and Rank:IsA("IntValue") then
        self.rankChangedConnection = (Rank:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 82 -- upvalues: checkRankIcon (val)
            checkRankIcon()
        end)
    end
    checkRankIcon()
end

function v1.cleanUp(a1) -- Line: 89
    if a1.rankChangedConnection then
        a1.rankChangedConnection:Disconnect()
        a1.rankChangedConnection = nil
    end
    if a1.rankAttachment then
        a1.rankAttachment:Destroy()
        a1.rankAttachment = nil
    end
end

function v1.render(a1) -- Line: 100 -- upvalues: Create (val), Children (val)
    local v1 = a1.container:Get()
    local v2 = v1:FindFirstAncestorWhichIsA("SurfaceGui")
    if v2 then
        v2.ZIndexBehavior = Enum.ZIndexBehavior.Global
    end
    if v1 == a1.root then
        v1 = a1.labels:Get()[1]
    end
    for i, v in ipairs(a1.labels:Get()) do
        v.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
    Create("UIGradient", {Rotation = 90, Color = a1:getColor(), Offset = Vector2.new(0, 0.2), Parent = v1})
    local v3 = {Thickness = 3, Parent = v1}
    Create("UIStroke", v3)
    if v2 then
        local v4 = Create
        v3 = {
            Name = "Frame",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Position = UDim2.new(0, -10, -0.1, 0),
            Size = UDim2.new(1, 20, 1.2, 0),
            Parent = v1,
        }
        v3[Children] = {
            Create("ImageLabel", {
                Name = "ImageLabel",
                Image = "rbxassetid://134406894237449",
                BorderSizePixel = 0,
                ZIndex = -1,
                ResampleMode = Enum.ResamplerMode.Pixelated,
                ScaleType = Enum.ScaleType.Tile,
                TileSize = UDim2.fromOffset(250, 250),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(-0.145, -0.145),
                Size = UDim2.fromScale(4, 4),
            }),
        }
        v4("Frame", v3)
        Create("ImageLabel", {
            Name = "ImageLabel",
            Image = "rbxassetid://87956742353970",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromOffset(-10, -10),
            Size = UDim2.new(1, 20, 1, 20),
            Parent = v1,
        })
    end
    if not a1.created then
        task.defer(function() -- Line: 171 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        a1.created = true
    end
    return true
end

return v1