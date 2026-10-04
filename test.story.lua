-- Script path: ReplicatedStorage.test.story
-- Decompile time: 1.15 ms

return function() -- Line: 1
    local RunService = game:GetService("RunService")

    local function v1(...) -- Line: 5
        (game:GetService("TweenService")):Create(...):Play()
    end

    local Camera = game.Workspace.Camera
    local NumberValue = Instance.new("NumberValue")
    local NumberValue_2 = Instance.new("NumberValue")
    local NumberValue_3 = Instance.new("NumberValue")
    local NumberValue_4 = Instance.new("NumberValue")
    local NumberValue_5 = Instance.new("NumberValue")
    local NumberValue_6 = Instance.new("NumberValue")
    local NumberValue_7 = Instance.new("NumberValue")
    local NumberValue_8 = Instance.new("NumberValue")
    local NumberValue_9 = Instance.new("NumberValue")
    NumberValue.Value = 1
    NumberValue_5.Value = 1
    NumberValue_9.Value = 1
    local u45 = RunService.RenderStepped:Connect(function() -- Line: 26
        -- upvalues: Camera (val), NumberValue (val), NumberValue_2 (val), NumberValue_3 (val), NumberValue_4 (val)
        -- upvalues: NumberValue_5 (val), NumberValue_6 (val), NumberValue_7 (val), NumberValue_8 (val)
        -- upvalues: NumberValue_9 (val)
        Camera.CFrame = Camera.CFrame * CFrame.new(
            0,
            0,
            0,
            NumberValue.Value,
            NumberValue_2.Value,
            NumberValue_3.Value,
            NumberValue_4.Value,
            NumberValue_5.Value,
            NumberValue_6.Value,
            NumberValue_7.Value,
            NumberValue_8.Value,
            NumberValue_9.Value
        )
    end)
    v1(workspace.CurrentCamera, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {FieldOfView = 120})
    v1(NumberValue_2, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Value = 0.1})
    v1(NumberValue, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Value = 0})
    v1(NumberValue_5, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Value = 0.4})
    return function() -- Line: 44 -- upvalues: u45 (ref)
        workspace.CurrentCamera.FieldOfView = 70
        u45:Disconnect()
    end
end