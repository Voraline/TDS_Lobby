-- Script path: ReplicatedStorage.Shared.Modules.KeyCode
-- Decompile time: 0.65 ms

local UserInputService = game:GetService("UserInputService")
local u5 = {
    [Enum.KeyCode.LeftAlt] = "LAlt",
    [Enum.KeyCode.RightAlt] = "RAlt",
    [Enum.KeyCode.LeftControl] = "LCtrl",
    [Enum.KeyCode.RightControl] = "RCtrl",
    [Enum.KeyCode.LeftShift] = "LSft",
    [Enum.KeyCode.RightShift] = "RSft",
    [Enum.KeyCode.LeftSuper] = "LWin",
    [Enum.KeyCode.RightSuper] = "RWin",
    [Enum.KeyCode.Insert] = "Ins",
    [Enum.KeyCode.Delete] = "Del",
    [Enum.KeyCode.Home] = "Hm",
    [Enum.KeyCode.PageUp] = "PU",
    [Enum.KeyCode.PageDown] = "PD",
    [Enum.KeyCode.Print] = "PS",
    [Enum.KeyCode.ScrollLock] = "SL",
    [Enum.KeyCode.Pause] = "PB",
    [Enum.KeyCode.NumLock] = "NL",
    [Enum.KeyCode.Escape] = "Esc",
    [Enum.KeyCode.CapsLock] = "Caps",
    [Enum.KeyCode.Return] = "Ent",
    [Enum.KeyCode.Backspace] = "Bksp",
    [Enum.KeyCode.Space] = "Spc",
    [Enum.KeyCode.KeypadDivide] = "N/",
    [Enum.KeyCode.KeypadMultiply] = "N*",
    [Enum.KeyCode.KeypadMinus] = "N-",
    [Enum.KeyCode.KeypadPlus] = "N+",
    [Enum.KeyCode.KeypadPeriod] = "N.",
    [Enum.KeyCode.KeypadEquals] = "N=",
    [Enum.KeyCode.KeypadZero] = "N0",
    [Enum.KeyCode.KeypadOne] = "N1",
    [Enum.KeyCode.KeypadTwo] = "N2",
    [Enum.KeyCode.KeypadThree] = "N3",
    [Enum.KeyCode.KeypadFour] = "N4",
    [Enum.KeyCode.KeypadFive] = "N5",
    [Enum.KeyCode.KeypadSix] = "N6",
    [Enum.KeyCode.KeypadSeven] = "N7",
    [Enum.KeyCode.KeypadEight] = "N8",
    [Enum.KeyCode.KeypadNine] = "N9",
    [Enum.KeyCode.KeypadEnter] = "NEnt",
    [Enum.KeyCode.One] = "1",
    [Enum.KeyCode.Two] = "2",
    [Enum.KeyCode.Three] = "3",
    [Enum.KeyCode.Four] = "4",
    [Enum.KeyCode.Five] = "5",
    [Enum.KeyCode.Six] = "6",
    [Enum.KeyCode.Seven] = "7",
    [Enum.KeyCode.Eight] = "8",
    [Enum.KeyCode.Nine] = "9",
    [Enum.KeyCode.Zero] = "0",
}
return function(a1) -- Line: 55 -- upvalues: u5 (val), UserInputService (val)
    local Name
    if typeof(a1) == "string" then
        a1 = Enum.KeyCode[a1]
    end
    if u5[a1] then
        return u5[a1]
    end
    local StringForKeyCode = UserInputService:GetStringForKeyCode(a1)
    if (if StringForKeyCode == "" then a1.Name else StringForKeyCode) == "Unknown" then
        return "???"
    end
    return Name
end