-- Script path: ReplicatedStorage.Client.Controllers.Shared.JordanController
-- Decompile time: 2.87 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local u20 = {100457703011972, 106376811496122, 118971755772020, 87853938151417}

u20[5] = function() -- Line: 13
    local v1 = Random.new():NextNumber()
    if v1 > 0.7 then
        return "rbxthumb://type=Avatar&id=143766181&w=420&h=420"
    end
    if v1 > 0.4 then
        return "rbxthumb://type=AvatarBust&id=143766181&w=420&h=420"
    end
    return "rbxthumb://type=AvatarHeadShot&id=143766181&w=420&h=420"
end

local function playEffect() -- Line: 25 -- upvalues: u20 (val), Players (val), TweenService (val)
    local v1 = u20[math.random(1, #u20)]
    if typeof(v1) == "function" then
        v1 = v1()
    end
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Effect"
    ScreenGui.DisplayOrder = 90000000000
    ScreenGui.Parent = Players.LocalPlayer.PlayerGui
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Image = if typeof(v1) ~= "number" then v1 else ("rbxassetid://%*"):format(v1)
    ImageLabel.Size = UDim2.fromScale(1.5, 1.5)
    ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
    ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.ScaleType = Enum.ScaleType.Stretch
    ImageLabel.Parent = ScreenGui
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://6308606116"
    Sound.TimePosition = 0.2
    Sound.Volume = 2
    Sound.Parent = ImageLabel
    Sound:Play()
    local u61 = Random.new()
    task.spawn(function() -- Line: 54 -- upvalues: ScreenGui (val), ImageLabel (val), u61 (val)
        while task.wait() do
            if not ScreenGui.Parent then
                break
            end
            ImageLabel.Rotation = u61:NextNumber(-5, 5)
            ImageLabel.Size = UDim2.fromScale(u61:NextNumber(0.95, 1.1), u61:NextNumber(0.95, 1.1))
        end
    end)
    task.wait(1)
    TweenService:Create(ImageLabel, TweenInfo.new(2, Enum.EasingStyle.Cubic), {ImageTransparency = 1}):Play()
    TweenService:Create(Sound, TweenInfo.new(2), {Volume = 0}):Play()
    task.delay(2, function() -- Line: 70 -- upvalues: ScreenGui (val)
        ScreenGui:Destroy()
    end)
end

;(NewNetwork.Channel("JordanEffect")):onEvent("Play", function() -- Line: 75 -- upvalues: playEffect (val)
    playEffect()
end)
return {playEffect = playEffect}