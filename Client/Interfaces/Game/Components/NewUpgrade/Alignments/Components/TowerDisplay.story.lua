-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerDisplay.story
-- Decompile time: 3.47 ms

local UI = game:GetService("ReplicatedStorage").Shared.UI
local TowerDisplay = require(script.Parent.TowerDisplay)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement
local useState = React.useState
local useBinding = React.useBinding

local function story() -- Line: 20
    -- upvalues: useState (val), createElement (val), TowerDisplay (val), useBinding (val)
    local u0 = {
        {Name = "Lead", Icon = 12270724694},
        {Name = "Hidden", Icon = 12270723919},
        {Name = "Flying", Icon = 12270724272},
    }
    local v1, u7 = useState(true)
    local v2, u11 = useState("First Enemy")
    local u17, u18 = useState({table.clone(u0[1])})
    return createElement(TowerDisplay, {
        CornerRadius = 8,
        TowerName = "Shotgunner",
        TowerDisplayName = "Display Shotgunner",
        Size = UDim2.fromOffset(260, 190),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Transparency = useBinding(0),
        CanEditTower = v1,
        TowerTarget = v2,
        TowerDetections = u17,
        OnTarget = function(a1) -- Line: 51 -- upvalues: u11 (val), u17 (val), u18 (val), u0 (val), u7 (val) -- types: a1: string
            u11(a1)
            if a1 == "First Enemy" then
                table.remove(u17, (math.random(1, #u17)))
                u18(u17)
                return
            end
            if a1 == "Strongest" then
                table.insert(u17, (table.clone(u0[(math.random(1, #u0))])))
                u18(u17)
                u7(false)
                task.delay(3, function() -- Line: 65 -- upvalues: u7 (upval)
                    u7(true)
                end)
            end
        end,
    })
end

return function(a1) -- Line: 73 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 77 -- upvalues: u4 (val)
        u4:unmount()
    end
end