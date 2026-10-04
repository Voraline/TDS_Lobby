-- Script path: ReplicatedStorage.Shared.UI.Components.Confetti
-- Decompile time: 3.06 ms

local RunService = game:GetService("RunService")
local u5 = {}
local u7 = Random.new()

local function createParticleFrame(a1, a2, a3, a4, a5, a6) -- Line: 32
    -- upvalues: u7 (val)
    local v1 = a4 * 0.66
    local v2 = (a3.Unit + (Vector2.new(u7:NextNumber(-a6, a6), (u7:NextNumber(-a6, a6))))).Unit * (a4 + u7:NextNumber(-v1, v1))
    local v3 = u7:NextNumber(10, 20)
    local v4 = v3 * u7:NextNumber(0.4, 0.6)
    local Frame = Instance.new("Frame")
    Frame.Name = "Confetti"
    Frame.Size = UDim2.fromOffset(v3, v4)
    Frame.Position = UDim2.fromOffset(a2.X, a2.Y)
    Frame.Rotation = u7:NextInteger(0, 360)
    Frame.BackgroundColor3 = Color3.fromHSV(u7:NextNumber(), 0.5, 1)
    Frame.BorderSizePixel = 0
    Frame.Parent = a1
    return {
        frame = Frame,
        x = a2.X,
        y = a2.Y,
        rotation = Frame.Rotation,
        life = a5 + u7:NextNumber(0, 1),
        velocityX = v2.X,
        velocityY = v2.Y,
    }
end

local function createContainer(a1, a2, a3) -- Line: 68
    -- upvalues: u5 (val)
    local Frame = Instance.new("Frame")
    Frame.Name = "ConfettiStage"
    Frame.Size = UDim2.fromScale(1, 1)
    Frame.BackgroundTransparency = 1
    Frame.ClipsDescendants = true
    Frame.ZIndex = a1
    Frame.Parent = a3
    u5[Frame] = a2
    Frame.Destroying:Connect(function() -- Line: 79 -- upvalues: u5 (upval), Frame (val)
        u5[Frame] = nil
    end)
    return Frame
end

local function createConfetti(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 86
    -- upvalues: createParticleFrame (val)
    local v1 = (a8 or 0.4) / 2
    for i = 1, a3 do
        table.insert(a2, (createParticleFrame(a1, a4, a5, a6, a7, v1)))
    end
end

RunService:UnbindFromRenderStep("UPDATE_CONFETTI")
RunService:BindToRenderStep("UPDATE_CONFETTI", Enum.RenderPriority.First.Value, function(a1) -- Line: 107 -- upvalues: u5 (val)
    local v1, v2
    for k, v in pairs(u5) do
        if k.Parent then
            for i = #v, 1, -1 do
                v2 = v[i]
                v1 = v2.life - a1
                if not (v1 <= 0) then
                    v2.life = v1
                    v2.x = v2.x + v2.velocityX
                    v2.y = v2.y + v2.velocityY
                    v2.velocityX = v2.velocityX * 0.95
                    v2.velocityY = v2.velocityY * 0.95
                    v2.velocityY = v2.velocityY + 0.2
                    v2.rotation = v2.rotation + 1
                    v2.frame.Position = UDim2.fromOffset(v2.x, v2.y)
                    v2.frame.Rotation = v2.rotation
                    v2.frame.BackgroundTransparency = 1 - math.clamp(v1, 0, 1)
                else
                    v2.frame:Destroy()
                    table.remove(v, i)
                end
            end
            if #v < 1 then
                k:Destroy()
                u5[k] = nil
            end
        else
            u5[k] = nil
        end
    end
end)

local function getSignal(a1) -- Line: 144
    if typeof(a1) == "RBXScriptSignal" then
        return a1
    end
    return a1 and a1.Event
end

return function(a1) -- Line: 152 -- upvalues: createContainer (val), u5 (val), createConfetti (val)
    local Frame = Instance.new("Frame")
    local u6 = if not a1.AlwaysOnTop then -1000 else 1000
    local Emitters = a1.Emitters
    if not Emitters then
        Emitters = {}
        Emitters[1] = {Amount = 20, Direction = Vector2.new(1, -1)}
    end
    local Event = a1.Event
    for i, j in a1 do
        if i ~= "Event" and i ~= "AlwaysOnTop" and i ~= "Emitters" and i ~= "Radius" then
            Frame[i] = j
        end
    end
    local Size = a1.Size or UDim2.fromScale(1, 1)
    Frame.Size = Size
    local Position = a1.Position or UDim2.fromScale(0, 0)
    Frame.Position = Position
    Frame.BackgroundTransparency = 1
    local Event_2 = if typeof(Event) ~= "RBXScriptSignal" then Event and Event.Event else Event
    if Event_2 then
        local u69 = Event_2:Connect(function() -- Line: 185
            -- upvalues: Frame (val), createContainer (upval), u6 (val), u5 (upval), Emitters (val)
            -- upvalues: createConfetti (upval)
            if not Frame.Parent then
                return
            end
            local v1 = Frame.AbsolutePosition + Frame.AbsoluteSize / 2
            local Parent = Frame:FindFirstAncestorOfClass("ScreenGui") or Frame.Parent
            if not Parent then
                return
            end
            local v2 = createContainer(u6, {}, Parent)
            local v3 = u5[v2]
            for i, j in Emitters do
                createConfetti(v2, v3, j.Amount, v1, j.Direction, j.Force or 30, j.Lifetime or 5, j.Radius)
            end
        end)
        Frame.Destroying:Connect(function() -- Line: 217 -- upvalues: u69 (ref)
            u69:Disconnect()
        end)
    end
    return Frame
end