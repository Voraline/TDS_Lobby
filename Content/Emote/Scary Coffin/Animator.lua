-- Script path: ReplicatedStorage.Content.Emote.Scary Coffin.Animator
-- Decompile time: 1.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local ToolTipKeybindStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ToolTipKeybindStore)
local u22 = {}
u22.Attack = {ActionText = "Jumpscare", Layout = 1, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonR2}
local u25 = {}
u25.Attack = {
    ActionText = "Jumpscare",
    Layout = 1,
    ScaleMultiplier = 0.4,
    Icon = "LMB",
    IconSize = 1.35,
    Key = Enum.UserInputType.MouseButton1,
}
local ScaryCoffin = NewNetwork.Channel("ScaryCoffin")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 37
    -- upvalues: UserInputService (val), u22 (val), u25 (val), ToolTipKeybindStore (val), ScaryCoffin (val)
    if a1.Preview then
        return
    end
    a1._attacking = false
    if a1.Local then
        local function update() -- Line: 45
            -- upvalues: a1 (val), UserInputService (upval), u22 (upval), u25 (upval), ToolTipKeybindStore (upval)
            -- upvalues: ScaryCoffin (upval)
            local v1
            if a1._attacking then
                return
            end
            local v2 = if not UserInputService.GamepadEnabled then u25 else if (UserInputService:GetLastInputType()) ~= Enum.UserInputType.Gamepad1 then u25 else u22
            ToolTipKeybindStore.addBinds(v2)
            for i, j in v2 do
                v1 = v2[i]

                function v1.CallBack(a1_2) -- Line: 57
                    -- upvalues: a1 (upval), ToolTipKeybindStore (upval), ScaryCoffin (upval)
                    if a1_2 then
                        return
                    end
                    a1._attacking = true
                    ToolTipKeybindStore.reset()
                    ScaryCoffin:fireServer("scare")
                    a1:PlayTrack("rbxassetid://117003891176650", 0).Stopped:Wait()
                    a1:Stop()
                end
            end
        end

        update()
        a1.Maid:Mark((UserInputService.LastInputTypeChanged:Connect(update)))
        a1.Maid:Mark((UserInputService.GamepadConnected:Connect(update)))
        a1.Maid:Mark((UserInputService.GamepadDisconnected:Connect(update)))
    end
    a1.Maid:Mark((ScaryCoffin:onEvent("Effect", function() -- Line: 82 -- upvalues: a1 (val)
        if a1.Character.Instance:FindFirstChild("Coffin") then
            for i, j in a1.Character.Instance.Coffin:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    task.delay(j:GetAttribute("EmitDelay") or 0, function() -- Line: 86 -- upvalues: j (val)
                        j:Emit((j:GetAttribute("EmitCount")))
                    end)
                end
            end
        end
    end)))
    a1:PlayTrack("rbxassetid://83239922523391", 0)
end

function v1.update(a1, a2) end

function v1.Destroy(a1) -- Line: 99 -- upvalues: ToolTipKeybindStore (val)
    a1._attacking = false
    if a1.Local then
        ToolTipKeybindStore.reset()
    end
end

return v1