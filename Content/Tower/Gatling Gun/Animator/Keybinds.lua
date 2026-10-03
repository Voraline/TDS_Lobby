-- Script path: ReplicatedStorage.Content.Tower.Gatling Gun.Animator.Keybinds
-- Decompile time: 0.95 ms

local u0 = {}
u0.Mobile = {
    {
        ActionText = "FIRE",
        FireStick = true,
        Text = "FIRE",
        Icon = "",
        Size = 100,
        Position = UDim2.new(0.2, 0, 0.7, 0),
        CallBack = function(a1) end,
    },
    {
        Icon = "",
        ActionText = "RELOAD",
        FireStick = false,
        Text = "RELOAD",
        Size = 60,
        Position = UDim2.new(0.72, 0, 0.6, 0),
        CallBack = function(a1) end,
    },
    {
        Icon = "",
        ActionText = "EXIT",
        FireStick = false,
        Text = "EXIT",
        Size = 60,
        Position = UDim2.new(0.83, 0, 0.56, 0),
        CallBack = function(a1) end,
    },
}
u0.Console = {
    {
        ActionText = "RELOAD",
        Layout = 2,
        Key = Enum.KeyCode.ButtonX,
        CallBack = function(a1) end,
    },
    {
        ActionText = "EXIT",
        Layout = 3,
        Key = Enum.KeyCode.ButtonB,
        CallBack = function(a1) end,
    },
    {
        ActionText = "FIRE",
        Layout = 1,
        Key = Enum.KeyCode.ButtonR2,
        CallBack = function(a1) end,
    },
}
u0.PC = {
    {
        ActionText = "RELOAD",
        Layout = 2,
        Key = Enum.KeyCode.R,
        CallBack = function(a1) end,
    },
    {
        ActionText = "EXIT",
        Layout = 3,
        Key = Enum.KeyCode.X,
        CallBack = function(a1) end,
    },
    {
        ActionText = "FIRE",
        Layout = 1,
        Key = Enum.UserInputType.MouseButton1,
        CallBack = function(a1) end,
    },
}
return function(a1, a2) -- Line: 76 -- upvalues: u0 (val)
    local v1
    local PC = u0[a1] or u0.PC
    local v2 = {}
    for i, j in PC do
        v1 = table.clone(j)

        function v1.CallBack(a1) -- Line: 82 -- upvalues: a2 (val), j (val)
            if a2._inputCallbacks[j.ActionText] then
                a2._inputCallbacks[j.ActionText](a1)
            end
        end

        table.insert(v2, v1)
    end
    return v2
end