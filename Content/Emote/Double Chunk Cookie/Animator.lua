-- Script path: ReplicatedStorage.Content.Emote.Double Chunk Cookie.Animator
-- Decompile time: 2.72 ms

local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local ToolTipKeybindStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ToolTipKeybindStore)
local u27 = {
    Equip = "rbxassetid://74339336653791",
    Idle1 = "rbxassetid://74345818336217",
    Idle2 = "rbxassetid://75709290651502",
    Idle3 = "rbxassetid://138461045303576",
    Bite1 = "rbxassetid://108008057637454",
    Bite2 = "rbxassetid://97546413060588",
    Bite3 = "rbxassetid://133091448212956",
    Bite4 = "rbxassetid://75654353584855",
}
local u36 = {}
u36.Eat = {ActionText = "Eat", Layout = 1, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonR2}
local u39 = {}
u39.Eat = {
    ActionText = "Eat",
    Layout = 1,
    ScaleMultiplier = 0.4,
    Icon = "LMB",
    IconSize = 1.35,
    Key = Enum.UserInputType.MouseButton1,
}
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 42
    -- upvalues: u27 (val), ToolTipKeybindStore (val), UserInputService (val), u36 (val), u39 (val)
    -- upvalues: ContextActionService (val), EasySound (val)
    if a1.Local and not a1.Preview then
        a1._loadedAnimations = {}
        for i, j in u27 do
            a1._loadedAnimations[i] = (a1:PreloadTrack(j))
        end
        a1._loadedAnimations.Equip:Play()
        a1._eating = false
        a1._on = 0
        ToolTipKeybindStore.addBinds(if not UserInputService.GamepadEnabled then u39 else if (UserInputService:GetLastInputType()) ~= Enum.UserInputType.Gamepad1 then u39 else u36)
        local v1 = ContextActionService
        local Value = Enum.ContextActionPriority.Low.Value
        local ButtonR2 = Enum.KeyCode.ButtonR2
        local MouseButton1 = Enum.UserInputType.MouseButton1
        local Touch = Enum.UserInputType.Touch
        v1:BindActionAtPriority("Eat", function(a1_2, a2) -- Line: 63 -- upvalues: a1 (val)
            if a2 ~= Enum.UserInputState.Begin or a1._eating then
                return
            end
            a1._eating = true
            local v1 = a1
            v1._on = v1._on + 1
            if a1._idle then
                a1._idle:Stop(0)
            end
            v1 = a1._loadedAnimations[("Bite%*"):format(a1._on)]
            if a1._loadedAnimations[("Idle%*"):format(a1._on)] then
                a1._idle = a1._loadedAnimations[("Idle%*"):format(a1._on)]
            end
            task.delay(0.5, function() -- Line: 83 -- upvalues: a1 (upval)
                a1:ReplicateAction("Eat")
            end)
            a1._idle:Play()
            v1:Play()
            v1.Stopped:Wait()
            a1._eating = false
            if 4 <= a1._on then
                a1:Stop()
            end
            return Enum.ContextActionResult.Pass
        end, false, Value, ButtonR2, MouseButton1, Touch)
    end
    if not a1.Preview then
        local Replicator = a1:GetReplicator()
        local Cookie = a1.Character.Instance:FindFirstChild("Cookie")
        EasySound.Play({
            id = 134157663418834,
            volume = 0.8,
            soundGroupName = "Emotes",
            parent = a1.Character.Instance.HumanoidRootPart,
        })
        ;(Replicator:GetStateChangedSignal("Eaten")):Connect(function(a1_2) -- Line: 117 -- upvalues: EasySound (upval), a1 (val), Cookie (val)
            EasySound.Play({
                id = 133507272627456,
                volume = 0.5,
                soundGroupName = "Emotes",
                parent = a1.Character.Instance.HumanoidRootPart,
                playbackSpeed = Random.new():NextNumber(0.9, 1.1),
            })
            local v1 = Cookie
            if v1:FindFirstChild((("Cookie%*"):format(a1_2))) then
                v1 = Cookie[("Cookie%*"):format(a1_2)]
                v1.LocalTransparencyModifier = 1
            end
        end)
    end
end

function v1.update(a1, a2) end

function v1.Destroy(a1) -- Line: 135 -- upvalues: ToolTipKeybindStore (val), ContextActionService (val)
    ToolTipKeybindStore.reset()
    ContextActionService:UnbindAction("Eat")
end

return v1