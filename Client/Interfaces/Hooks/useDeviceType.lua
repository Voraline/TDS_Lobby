-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useDeviceType
-- Decompile time: 1.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local useScreenSize = require(script.Parent.useScreenSize)
local useEffect = React.useEffect
local useState = React.useState

local function getPlatform(a1) -- Line: 10 -- upvalues: UserInputService (val)
    local v1 = "PC"
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        return "Mobile"
    end
    if (UserInputService:GetLastInputType()) == Enum.UserInputType.Gamepad1 and UserInputService.GamepadEnabled then
        v1 = "Console"
    end
    return v1
end

return function() -- Line: 27
    -- upvalues: useState (val), useScreenSize (val), useEffect (val), Maid (val), UserInputService (val)
    local PC_2, PC = useState("PC")
    local u5 = useScreenSize()
    local v1 = {u5}
    useEffect(function() -- Line: 31 -- upvalues: Maid (upval), PC (val), UserInputService (upval), u5 (val)
        local u2 = Maid.new()
        local v1 = PC
        local v2 = "PC"
        if not UserInputService.TouchEnabled then
            if (UserInputService:GetLastInputType()) == Enum.UserInputType.Gamepad1
                and UserInputService.GamepadEnabled then
                v2 = "Console"
            end
        elseif not UserInputService.KeyboardEnabled then
            v2 = "Mobile"
        elseif (UserInputService:GetLastInputType()) == Enum.UserInputType.Gamepad1
            and UserInputService.GamepadEnabled then
            v2 = "Console"
        end
        v1(v2)

        local function update() -- Line: 36 -- upvalues: PC (upval), u5 (upval), UserInputService (upval)
            local v1 = PC
            local v2 = "PC"
            if not UserInputService.TouchEnabled then
                if (UserInputService:GetLastInputType()) == Enum.UserInputType.Gamepad1
                    and UserInputService.GamepadEnabled then
                    v2 = "Console"
                end
            elseif not UserInputService.KeyboardEnabled then
                v2 = "Mobile"
            elseif (UserInputService:GetLastInputType()) == Enum.UserInputType.Gamepad1
                and UserInputService.GamepadEnabled then
                v2 = "Console"
            end
            v1(v2)
        end

        u2:Mark((UserInputService.TouchStarted:Connect(update)))
        u2:Mark((UserInputService.GamepadConnected:Connect(update)))
        u2:Mark((UserInputService.GamepadDisconnected:Connect(update)))
        u2:Mark((UserInputService.LastInputTypeChanged:Connect(update)))
        u2:Mark((UserInputService.GamepadConnected:Connect(update)))
        u2:Mark((UserInputService.GamepadDisconnected:Connect(update)))
        return function() -- Line: 48 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v1)
    return PC_2
end