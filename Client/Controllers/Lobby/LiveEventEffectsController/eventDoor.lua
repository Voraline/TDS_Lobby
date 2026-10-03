-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LiveEventEffectsController.eventDoor
-- Decompile time: 13.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
local u20 = {}
local u21 = nil
local u22 = nil

local function ease(a1, a2, a3, a4) -- Line: 18 -- upvalues: TweenService (val)
    return TweenService:GetValue(math.clamp(a1 / a2, 0, 1), a3, a4)
end

function u20.cleanUp() -- Line: 23 -- upvalues: u21 (ref)
    if u21 then
        u21()
    end
end

function u20.close(a1) -- Line: 30 -- upvalues: u22 (ref) -- types: a1: number?
    if u22 then
        u22(a1)
    end
end

function u20.play() -- Line: 36
    -- upvalues: u20 (val), CatRom (val), u21 (ref), u22 (ref), RunService (val), TweenService (val)
    local cleanup, v1, v2
    u20.cleanUp()
    local Lobby = workspace:FindFirstChild("Lobby")
    local EventDoor = Lobby
    if EventDoor then
        EventDoor = Lobby:FindFirstChild("EventDoor")
    end
    assert(EventDoor and EventDoor:IsA("Model"), "eventDoor.play requires workspace.Lobby.EventDoor")
    local Key = EventDoor.Key
    local Highlight = Key.Highlight
    local GearKeyHole = EventDoor.GearKeyHole
    local Gear = GearKeyHole.Gear
    local DoorLeft = EventDoor.DoorLeft
    local DoorRight = EventDoor.DoorRight
    local DoorSounds = EventDoor:FindFirstChild("DoorSounds")
    local Open = DoorSounds
    if Open then
        Open = DoorSounds:FindFirstChild("Open")
    end
    local Close = DoorSounds
    if Close then
        Close = DoorSounds:FindFirstChild("Close")
    end
    if Open then
        Open:Stop()
    end
    if Close then
        Close:Stop()
    end
    local Pivot = DoorLeft:GetPivot()
    local Pivot_2 = DoorRight:GetPivot()
    local CFrame_2 = Gear.CFrame
    local u74 = {}
    local u75 = {}
    local u76 = {}
    local u77 = nil
    local u78 = {}
    local u79 = false
    local v3 = CFrame.fromMatrix(
        CFrame_2.Position - CFrame_2.RightVector * 4.18 + CFrame_2.UpVector * 0.07,
        CFrame_2.LookVector,
        CFrame_2.UpVector,
        CFrame_2.RightVector
    )
    local v4 = {
        (CFrame.new(0, 12, -5.7)) * CFrame.Angles(1.2217304763960306, 0, 1.5707963267948966),
        (CFrame.new(0, 6, -14)) * CFrame.Angles(1.2217304763960306, 0, 0),
        (CFrame.new(0, -2, -10)) * CFrame.Angles(-0.3490658503988659, 0, -3.141592653589793),
        (CFrame.new(0, -1, -4)) * CFrame.Angles(-0.3490658503988659, 0, 6.283185307179586),
        (CFrame.new(0, 0, 0.1)) * CFrame.Angles(0.03490658503988659, 0, 6.283185307179586),
        CFrame.new(0, 0, 2),
        CFrame.new(0, 0, 3.6),
        (CFrame.new(0, 0, 3.63)),
    }
    local v5 = {}
    for i, j in v4 do
        v1 = v3 * j * CFrame.Angles(0, 1.5707963267948966, 0)
        v5[i] = v1 * CFrame.Angles(-1.5707963267948966, 0, 0)
    end
    local u178 = CatRom.new(v5)
    local u180 = Random.new()
    local u181 = nil
    local u182 = nil
    ;(function() -- Line: 106 -- upvalues: u181 (ref), CFrame_2 (val), u180 (val), u182 (ref)
        u181 = -CFrame_2.RightVector * u180:NextNumber(14, 22) + CFrame_2.LookVector * u180:NextNumber(-7, 7) + CFrame_2.UpVector * u180:NextNumber(7, 12)
        u182 = Vector3.new(
            (u180:NextNumber(5, 12)) * (u180:NextInteger(0, 1) * 2 - 1),
            (u180:NextNumber(3, 9)) * (u180:NextInteger(0, 1) * 2 - 1),
            (u180:NextNumber(4, 10)) * ((u180:NextInteger(0, 1)) * 2 - 1)
        )
    end)()

    local function releaseDebris() -- Line: 120
        -- upvalues: u79 (ref), u77 (ref), Key (val), GearKeyHole (val), u78 (val), u181 (ref), u182 (ref)
        -- upvalues: CFrame_2 (val)
        local NoCollisionConstraint, WeldConstraint
        u79 = true
        local Model = Instance.new("Model")
        Model.Name = "EventDoorDebris"
        u77 = Model
        local v1 = Key:Clone()
        local v2 = GearKeyHole:Clone()
        local Gear = v2.Gear
        v1.Parent = Model
        v2.Parent = Model
        for i, j in Model:GetDescendants() do
            if j:IsA("BasePart") then
                u78[j] = j.Transparency
                j.Anchored = false
                j.CanCollide = true
                j.CanTouch = false
                j.CanQuery = false
                j.CollisionGroup = "Default"
                if j:IsDescendantOf(v2) then
                    if j ~= Gear then
                        WeldConstraint = Instance.new("WeldConstraint")
                        WeldConstraint.Part0 = Gear
                        WeldConstraint.Part1 = j
                        WeldConstraint.Parent = Gear
                    end
                    NoCollisionConstraint = Instance.new("NoCollisionConstraint")
                    NoCollisionConstraint.Part0 = v1
                    NoCollisionConstraint.Part1 = j
                    NoCollisionConstraint.Parent = v1
                end
            elseif j:IsA("Highlight") or j:IsA("ParticleEmitter") then
                j.Enabled = false
            end
        end
        Model.Parent = workspace
        v1.AssemblyLinearVelocity = u181
        v1.AssemblyAngularVelocity = Key.CFrame:VectorToWorldSpace(u182)
        Gear.AssemblyLinearVelocity = -CFrame_2.RightVector * 8 + Vector3.new(0, 6, 0)
        Gear.AssemblyAngularVelocity = CFrame_2.RightVector * 8
    end

    local u193 = {
        Enabled = Highlight.Enabled,
        FillTransparency = Highlight.FillTransparency,
        OutlineTransparency = Highlight.OutlineTransparency,
    }
    for k, n in EventDoor:GetDescendants() do
        if n:IsA("BasePart") then
            v2 = {
                CFrame = n.CFrame,
                Anchored = n.Anchored,
                CanCollide = n.CanCollide,
                Transparency = n.Transparency,
            }
            u74[n] = v2
            n.Anchored = true
            n.CanCollide = false
            if n:IsDescendantOf(GearKeyHole) then
                u75[n] = (CFrame_2:ToObjectSpace(n.CFrame))
            end
        elseif n:IsA("ParticleEmitter") then
            u76[n] = n.Enabled
            n.Enabled = false
        end
    end
    local u211 = nil
    local u212 = false

    function cleanup(a1) -- Line: 200
        -- upvalues: u212 (ref), Open (val), Close (val), u211 (ref), u77 (ref), u78 (val), DoorLeft (val), Pivot (val)
        -- upvalues: DoorRight (val), Pivot_2 (val), u74 (val), u76 (val), Highlight (val), u193 (val), u178 (val)
        -- upvalues: u21 (upval), cleanup (val), u22 (upval)
        if u212 then
            return
        end
        u212 = true
        if Open then
            Open:Stop()
        end
        if Close and not a1 then
            Close:Stop()
        end
        if u211 then
            u211:Disconnect()
        end
        if u77 then
            u77:Destroy()
            u77 = nil
        end
        table.clear(u78)
        if DoorLeft.Parent then
            DoorLeft:PivotTo(Pivot)
        end
        if DoorRight.Parent then
            DoorRight:PivotTo(Pivot_2)
        end
        local v1 = nil
        local v2 = nil
        for i, j in u74, v1, v2 do
            if i.Parent then
                for k, n in j do
                    i[k] = n
                end
            end
        end
        for m, i5 in u76 do
            if m.Parent then
                m:Clear()
                m.Enabled = i5
            end
        end
        if Highlight.Parent then
            for i6, i7 in u193 do
                Highlight[i6] = i7
            end
        end
        u178:Destroy()
        if u21 == cleanup then
            u21 = nil
            u22 = nil
        end
    end

    u21 = cleanup
    local u227 = false

    function u22(a1) -- Line: 262
        -- upvalues: u212 (ref), u227 (ref), cleanup (val), Open (val), Close (val), u211 (ref), DoorLeft (val)
        -- upvalues: DoorRight (val), RunService (upval), EventDoor (val), TweenService (upval), Pivot (val)
        -- upvalues: Pivot_2 (val)
        if not u212 and not u227 then
            local u3 = a1 or 1.5
            if u3 <= 0 then
                cleanup()
                return
            end
            u227 = true
            if Open then
                Open:Stop()
            end
            if Close then
                Close:Play()
            end
            if u211 then
                u211:Disconnect()
            end
            local Pivot_3 = DoorLeft:GetPivot()
            local Pivot_4 = DoorRight:GetPivot()
            local u31 = 0
            u211 = RunService.Heartbeat:Connect(function(a1) -- Line: 287
                -- upvalues: EventDoor (upval), DoorLeft (upval), DoorRight (upval), cleanup (upval), u31 (ref)
                -- upvalues: u3 (val), TweenService (upval), Pivot_3 (val), Pivot (upval), Pivot_4 (val)
                -- upvalues: Pivot_2 (upval)
                local v1 = EventDoor
                local v2 = workspace
                if v1:IsDescendantOf(v2) and DoorLeft.Parent and DoorRight.Parent then
                    u31 = u31 + a1
                    local v3 = u31
                    v2 = u3
                    local Sine = Enum.EasingStyle.Sine
                    local InOut = Enum.EasingDirection.InOut
                    v1 = TweenService:GetValue(math.clamp(v3 / v2, 0, 1), Sine, InOut)
                    DoorLeft:PivotTo((Pivot_3:Lerp(Pivot, v1)))
                    DoorRight:PivotTo((Pivot_4:Lerp(Pivot_2, v1)))
                    if u3 <= u31 then
                        cleanup(true)
                    end
                    return
                end
                cleanup()
            end)
            return
        end
    end

    local u230 = {}

    local function render(a1) -- Line: 307
        -- upvalues: TweenService (upval), DoorLeft (val), Pivot (val), DoorRight (val), Pivot_2 (val), CFrame_2 (val)
        -- upvalues: u178 (val), u79 (ref), u75 (val), Key (val), Open (val), releaseDebris (val), u78 (val), u77 (ref)
        -- upvalues: Highlight (val), u76 (val), u230 (val)
        local Attribute, Out_4, Quad_3, v1, v2, v3, v4, v5
        local v6 = 0
        if a1 >= 3.7 then
            v6 = 1
        elseif a1 >= 3.5 then
            local v7 = a1 - 3.5
            local Back = Enum.EasingStyle.Back
            local In = Enum.EasingDirection.In
            v6 = 0.9 + 0.1 * TweenService:GetValue(math.clamp(v7 / 0.2, 0, 1), Back, In)
        elseif a1 >= 3.1 then
            v4 = a1 - 3.1
            local Back_2 = Enum.EasingStyle.Back
            local In_2 = Enum.EasingDirection.In
            v6 = 0.93 - 0.03 * TweenService:GetValue(math.clamp(v4 / 0.4, 0, 1), Back_2, In_2)
        elseif a1 >= 1 then
            v3 = a1 - 1
            local Sine = Enum.EasingStyle.Sine
            local InOut = Enum.EasingDirection.InOut
            v6 = 0.93 * TweenService:GetValue(math.clamp(v3 / 2, 0, 1), Sine, InOut)
        end
        local v8 = 0
        if a1 >= 5 then
            v5 = a1 - 5
            local Back_3 = Enum.EasingStyle.Back
            local In_3 = Enum.EasingDirection.In
            v8 = 20 + 70 * TweenService:GetValue(math.clamp(v5 / 0.2, 0, 1), Back_3, In_3)
        elseif a1 >= 4 then
            v2 = math.min(math.floor((a1 - 4) / 0.1), 5)
            v8 = v4 + ((if v2 % 2 ~= 0 then 20 else 30) - (if v2 ~= 0 then if v2 % 2 ~= 0 then 30 else 20 else 0)) * math.clamp((a1 - 4 - v2 * 0.1) / 0.05, 0, 1)
        end
        v2 = a1 - 5.23
        local Elastic = Enum.EasingStyle.Elastic
        local Out = Enum.EasingDirection.Out
        v3 = 105 * TweenService:GetValue(math.clamp(v2 / 2, 0, 1), Elastic, Out)
        local v9 = v2 - 0.01
        local Elastic_2 = Enum.EasingStyle.Elastic
        local Out_2 = Enum.EasingDirection.Out
        v4 = 123 * TweenService:GetValue(math.clamp(v9 / 2.8, 0, 1), Elastic_2, Out_2)
        DoorLeft:PivotTo(Pivot * (CFrame.Angles(0, -math.rad(v3), 0)))
        DoorRight:PivotTo(Pivot_2 * (CFrame.Angles(0, math.rad(v4), 0)))
        v5 = CFrame_2 * CFrame.Angles(math.rad(v8), 0, 0)
        v9 = (u178:SolveRotCFrame((math.clamp(v6, 0, 1)))) * CFrame.Angles(-math.rad(v8), 0, 0)
        local v10 = v2 - 0.5
        local Quad = Enum.EasingStyle.Quad
        local InOut_2 = Enum.EasingDirection.InOut
        local v11 = TweenService:GetValue(math.clamp(v10 / 2, 0, 1), Quad, InOut_2)
        if not u79 then
            for i, j in u75 do
                i.CFrame = v5 * j
            end
            Key.CFrame = v9
            v10 = Key
            v1 = a1 - 1
            local Quad_2 = Enum.EasingStyle.Quad
            local Out_3 = Enum.EasingDirection.Out
            v10.Transparency = 1 - TweenService:GetValue(math.clamp(v1 / 0.85, 0, 1), Quad_2, Out_3)
            if v2 >= 0 then
                if Open then
                    Open:Play()
                end
                releaseDebris()
            end
        end
        if u79 then
            Key.Transparency = 1
            for k in u75 do
                k.Transparency = 1
            end
            for n, m in u78 do
                if n.Parent then
                    n.Transparency = m + (1 - m) * v11
                end
            end
            if v11 >= 1 and u77 then
                u77:Destroy()
                u77 = nil
                table.clear(u78)
            end
        end
        v10 = a1 - 3.63
        local v12 = false
        if v10 >= 0 then
            v12 = v10 < 0.48
        end
        Highlight.Enabled = v12
        if not (v10 < 0.06) then
            v1 = v10 - 0.06
            Quad_3 = Enum.EasingStyle.Quad
            Out_4 = Enum.EasingDirection.Out
            v12 = TweenService:GetValue(math.clamp(v1 / 0.42, 0, 1), Quad_3, Out_4)
        else
            v12 = 1 - math.clamp(v10 / 0.06, 0, 1)
            if not v12 then
                v1 = v10 - 0.06
                Quad_3 = Enum.EasingStyle.Quad
                Out_4 = Enum.EasingDirection.Out
                v12 = TweenService:GetValue(math.clamp(v1 / 0.42, 0, 1), Quad_3, Out_4)
            end
        end
        Highlight.FillTransparency = v12
        Highlight.OutlineTransparency = 1
        for i5 in u76 do
            if 3.63 + (i5:GetAttribute("EmitDelay") or 0) <= a1 and not u230[i5] then
                u230[i5] = true
                Attribute = i5:GetAttribute("EmitCount")
                i5:Emit(Attribute or 5)
            end
        end
    end

    render(0)
    local u240 = 0
    local v6 = RunService.Heartbeat:Connect(function(a1) -- Line: 408 -- upvalues: EventDoor (val), cleanup (val), u240 (ref), render (val), u211 (ref)
        if not EventDoor:IsDescendantOf(workspace) then
            cleanup()
            return
        end
        u240 = u240 + a1
        render((math.min(u240, 9)))
        if u240 >= 9 then
            u211:Disconnect()
        end
    end)
    return cleanup
end

return u20