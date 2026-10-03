-- Script path: ReplicatedStorage.Client.Interfaces.NPCViews.Components.ChromaticAberration
-- Decompile time: 3.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
local memo = React.memo
local useRef = React.useRef
local useEffect = React.useEffect
local u30 = {}
local v1 = Color3.fromRGB(0, 0, 255)
local v2 = Color3.fromRGB(255, 0, 0)
u30[1] = v1
u30[2] = v2
u30[3] = Color3.fromRGB(0, 255, 0)

local function viewportComponent(a1) -- Line: 28
    -- upvalues: useRef (val), React (val), useEffect (val), Maid (val), RunService (val), useTransparencyModifier (val)
    -- upvalues: createElement (val)
    local u3 = useRef(nil)
    local v1, u11 = React.useBinding(UDim2.fromScale(0.5, 0.5))
    local v2, u16 = React.useBinding(0)
    local v3 = useEffect
    local v4 = {a1.data}
    v3(function() -- Line: 33 -- upvalues: Maid (upval), a1 (val), RunService (upval), u16 (val), u11 (val)
        local u2 = Maid.new()
        if a1.data.enabled then
            local u6 = 1
            u2:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 39 -- upvalues: a1 (upval), u6 (ref), u16 (upval), u11 (upval)
                local v1 = os.clock() * (a1.data.frequency * a1.data.percent:getValue())
                local v2 = math.noise((v1 + a1.offset) * a1.data.amplitude)
                local v3 = math.noise((v1 + a1.offset + 1000) * a1.data.amplitude)
                v2 = v2 * a1.data.percent:getValue()
                v3 = v3 * a1.data.percent:getValue()
                u6 = math.lerp(u6, 1 - a1.data.percent:getValue(), a1_2 * 10)
                u16(u6)
                u11(UDim2.fromScale(0.5 + v2 * a1.data.mult, 0.5 + v3 * a1.data.mult))
            end)))
        end
        return function() -- Line: 62 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v4)
    v4 = {u3}
    useEffect(function() -- Line: 67 -- upvalues: Maid (upval), u3 (val), a1 (val), RunService (upval)
        local u2 = Maid.new()
        if u3.current then
            local AnimationController, v1, v2, v3
            local v4 = nil
            local v5 = nil
            for i, j in a1.data.objects, v4, v5 do
                AnimationController = j:FindFirstChild("AnimationController")
                if AnimationController then
                    v2 = {}
                    for k, n in (AnimationController.Animator:GetPlayingAnimationTracks()) do
                        if n.Name == a1.data.animationPlaying then
                            table.insert(v2, n)
                        end
                    end
                    v1 = v2
                    if #v1 == 0 then
                        return
                    end
                    v3 = j:Clone()
                    local u51 = v3.AnimationController.Animator:LoadAnimation(v1[1].Animation)
                    local u52 = v1[1]
                    u2:Mark((task.spawn(function() -- Line: 96 -- upvalues: u51 (val), u2 (val), RunService (upval), u3 (upval), u52 (val)
                        u51:Play(0)
                        u51:AdjustSpeed(0)
                        u2:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 100 -- upvalues: RunService (upval), u3 (upval), u51 (upval), u52 (upval)
                            if not RunService:IsRunning() then
                                u3.current.WorldModel:StepPhysics(a1)
                            end
                            u51.TimePosition = u52.TimePosition
                        end)))
                    end)))
                    v3.Parent = u3.current.WorldModel
                end
            end
        end
        return function() -- Line: 113 -- upvalues: u2 (val)
            warn("i cleaned up")
            u2:Sweep()
        end
    end, v4)
    return createElement("ViewportFrame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v1,
        CurrentCamera = a1.camera,
        LightColor = Color3.new(1, 1, 1),
        Ambient = Color3.new(1, 1, 1),
        ImageColor3 = a1.color,
        ref = u3,
        ZIndex = a1.zindex,
        ImageTransparency = useTransparencyModifier(v2)(0.56),
    }, {WorldModel = createElement("WorldModel", {}, {})})
end

return memo(function(a1) -- Line: 138 -- upvalues: u30 (val), createElement (val), viewportComponent (val) -- types: a1: table
    local v1, v2, v3
    local v4 = {}
    for i, j in u30 do
        v1 = createElement
        v2 = viewportComponent
        v3 = {
            camera = workspace.CurrentCamera,
            data = a1,
            color = j,
            offset = math.random() * 1000,
            zindex = 3 - i,
        }
        v4[i] = (v1(v2, v3))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }, v4)
end)