-- Script path: ReplicatedStorage.Shared.Modules.Tween
-- Decompile time: 9.96 ms

local RunService = game:GetService("RunService")
local Easing = require(script:WaitForChild("Easing"))
local new = Rect.new
local new_2 = UDim.new
local new_3 = Region3.new
local new_4 = Vector3.new
local new_5 = NumberRange.new
local new_6 = ColorSequence.new
local new_7 = NumberSequence.new
local new_8 = PhysicalProperties.new
local new_9 = NumberSequenceKeypoint.new
local Lerp = Color3.new().Lerp

local function sortByTime(a1, a2) -- Line: 29
    return a1.Time < a2.Time
end

local insert = table.insert
local sort = table.sort
local u49 = {
    number = function(a1, a2, a3) -- Line: 23
        return a1 + a3 * (a2 - a1)
    end,
    Color3 = Lerp,
    UDim2 = UDim2.new().Lerp,
    CFrame = CFrame.new().Lerp,
    Vector2 = Vector2.new().Lerp,
    Vector3 = new_4().Lerp,
    UDim = function(a1, a2, a3) -- Line: 44 -- upvalues: new_2 (val)
        local v1 = new_2
        local Scale = a1.Scale
        local v2 = Scale + a3 * (a2.Scale - Scale)
        local Offset = a1.Offset
        return v1(v2, Offset + a3 * (a2.Offset - Offset))
    end,
    Rect = function(a1, a2, a3) -- Line: 51 -- upvalues: new (val)
        local v1 = new
        local X = a1.Min.X
        local v2 = X + a3 * (a2.Min.X - X)
        local Y = a1.Min.Y
        local v3 = Y + a3 * (a2.Min.Y - Y)
        local X_2 = a1.Max.X
        local v4 = X_2 + a3 * (a2.Max.X - X_2)
        local Y_2 = a1.Max.Y
        return v1(v2, v3, v4, Y_2 + a3 * (a2.Max.Y - Y_2))
    end,
    PhysicalProperties = function(a1, a2, a3) -- Line: 60 -- upvalues: new_8 (val)
        local v1 = new_8
        local Density = a1.Density
        local v2 = Density + a3 * (a2.Density - Density)
        local Friction = a1.Friction
        local v3 = Friction + a3 * (a2.Friction - Friction)
        local Elasticity = a1.Elasticity
        local v4 = Elasticity + a3 * (a2.Elasticity - Elasticity)
        local FrictionWeight = a1.FrictionWeight
        local v5 = FrictionWeight + a3 * (a2.FrictionWeight - FrictionWeight)
        local ElasticityWeight = a1.ElasticityWeight
        return v1(v2, v3, v4, v5, ElasticityWeight + a3 * (a2.ElasticityWeight - ElasticityWeight))
    end,
    NumberRange = function(a1, a2, a3) -- Line: 70 -- upvalues: new_5 (val)
        local v1 = new_5
        local Min = a1.Min
        local v2 = Min + a3 * (a2.Min - Min)
        local Max = a1.Max
        return v1(v2, Max + a3 * (a2.Max - Max))
    end,
    ColorSequence = function(a1, a2, a3) -- Line: 77 -- upvalues: new_6 (val), Lerp (val)
        return new_6(Lerp(a1[1], a2[1], a3), Lerp(a1[2], a2[2], a3))
    end,
    Region3 = function(a1, a2, a3) -- Line: 84 -- upvalues: new_3 (val), new_4 (val)
        local v1 = a1.CFrame * (-a1.Size * 0.5)
        local v2 = v1 + a3 * (a2.CFrame * (-a2.Size * 0.5) - v1)
        local v3 = a1.CFrame * (a1.Size * 0.5)
        v1 = v3 + a3 * (a2.CFrame * (a2.Size * 0.5) - v3)
        local x = v2.x
        local x_2 = v1.x
        local y = v2.y
        local y_2 = v1.y
        local z_2 = v2.z
        local z = v1.z
        return new_3(
            new_4(x < x_2 and x or x_2, y < y_2 and y or y_2, z_2 < z and z_2 or z),
            (new_4(x_2 < x and x or x_2, y_2 < y and y or y_2, z < z_2 and z_2 or z))
        )
    end,
    NumberSequence = function(a1, a2, a3) -- Line: 114 -- upvalues: new_9 (val), insert (val), sort (val), sortByTime (val), new_7 (val)
        local Envelope, Envelope_2, Time_2, Time_4, Value, Value_2, v1, v2, v3, v4, v5
        local v6 = {}
        local v7 = {}
        local v8 = next
        local Keypoints = a1.Keypoints
        local v9 = nil
        local v10, v11, v12 = a2, a1, a3
        for k, v in v8, Keypoints, v9 do
            v1 = nil
            v2 = nil
            v3 = next
            v4 = nil
            for k2, i in v3, v10.Keypoints, v4 do
                if i.Time == v.Time then
                    v1 = i
                    v2 = i
                    break
                end
                if not (i.Time < v.Time) then
                    Time_4 = i.Time
                    if v.Time < Time_4 then
                        if v1 == nil or i.Time < v1.Time then
                            v1 = i
                        end
                    end
                elseif v2 == nil then
                    v2 = i
                elseif not (v2.Time < i.Time) then
                    Time_4 = i.Time
                    if v.Time < Time_4 then
                        if v1 == nil or i.Time < v1.Time then
                            v1 = i
                        end
                    end
                else
                    v2 = i
                end
            end
            if v1 ~= v2 then
                v4 = (v.Time - v2.Time) / (v1.Time - v2.Time)
                Value_2 = (v1.Value - v2.Value) * v4 + v2.Value
                Envelope_2 = (v1.Envelope - v2.Envelope) * v4 + v2.Envelope
            else
                Value_2 = v1.Value
                Envelope_2 = v1.Envelope
            end
            v4 = (Value_2 - v.Value) * v12 + v.Value
            v5 = (Envelope_2 - v.Envelope) * v12 + v.Envelope
            insert(v6, (new_9(v.Time, v4, v5)))
            v7[v.Time] = true
        end
        v8 = next
        v9 = nil
        for k3, j in v8, v10.Keypoints, v9 do
            if not v7[j.Time] then
                v1 = nil
                v2 = nil
                v3 = next
                v4 = nil
                for k4, k5 in v3, v11.Keypoints, v4 do
                    if k5.Time == j.Time then
                        v1 = k5
                        v2 = k5
                        break
                    end
                    if not (k5.Time < j.Time) then
                        Time_2 = k5.Time
                        if j.Time < Time_2 then
                            if v1 == nil or k5.Time < v1.Time then
                                v1 = k5
                            end
                        end
                    elseif v2 == nil then
                        v2 = k5
                    elseif not (v2.Time < k5.Time) then
                        Time_2 = k5.Time
                        if j.Time < Time_2 then
                            if v1 == nil or k5.Time < v1.Time then
                                v1 = k5
                            end
                        end
                    else
                        v2 = k5
                    end
                end
                if v1 ~= v2 then
                    v4 = (j.Time - v2.Time) / (v1.Time - v2.Time)
                    Value = (v1.Value - v2.Value) * v4 + v2.Value
                    Envelope = (v1.Envelope - v2.Envelope) * v4 + v2.Envelope
                else
                    Value = v1.Value
                    Envelope = v1.Envelope
                end
                v4 = (j.Value - Value) * v12 + Value
                v5 = (j.Envelope - Envelope) * v12 + Envelope
                insert(v6, (new_9(j.Time, v4, v5)))
            end
        end
        sort(v6, sortByTime)
        return new_7(v6)
    end,
}
local Heartbeat = RunService.Heartbeat
local Completed = Enum.TweenStatus.Completed
local Canceled = Enum.TweenStatus.Canceled

local function ResumeTween(a1) -- Line: 229 -- upvalues: Heartbeat (val)
    if a1.Running then
        return
    end
    a1.Connection = Heartbeat:Connect(a1.Interpolator)
    a1.Running = true
    local ObjectTable = a1.ObjectTable
    if ObjectTable then
        ObjectTable[a1.Property] = a1
    end
    return a1
end

local u57 = {Running = false}

function u57:Wait() -- Line: 245 -- upvalues: Heartbeat (val)
    while self.Running do
        if not Heartbeat:Wait() then
            break
        end
    end
    return self
end

function u57.Stop(a1, a2) -- Line: 213 -- upvalues: Completed (val), Canceled (val)
    if a1.Running then
        a1.Connection:Disconnect()
        a1.Running = false
        local ObjectTable = a1.ObjectTable
        if ObjectTable then
            ObjectTable[a1.Property] = nil
        end
    end
    local Callback = a1.Callback
    if Callback then
        Callback(a2 and Completed or Canceled)
    end
    return a1
end

u57.Resume = ResumeTween

function u57.Restart(a1) -- Line: 241 -- upvalues: ResumeTween (val)
    return ResumeTween(a1:ResetElapsedTime())
end

u57.__index = u57
local u58 = {}
local v1 = {
    OpenTweens = u58,
    EasingFunctions = Easing,
    __call = function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) -- Line: 266
        -- upvalues: Easing (val), u49 (ref), u57 (val), u58 (val), Canceled (val), Completed (val), ResumeTween (val)
        local v1, v2, v3
        local u68 = a7 or 1
        local v4 = typeof(a5)
        if typeof(a6) == "EnumItem" then
            a6 = a6.Name
        end
        local Name_2 = if v4 ~= "EnumItem" then a5 else a5.Name
        local u40 = if v4 ~= "function" then Easing[Name_2 and Name_2 .. a6 or a6] or Easing[a6] else Name_2
        if type(a6) ~= "number" then
            v3, v2, v1 = a10, a9, a8
        else
            local v5 = u68
            v3 = a9
            u68 = a6
            v1 = v5
            v2 = a8
        end
        local u188 = a2[a3]
        local v6 = u49
        local u190 = v6[v3 or typeof(a4)]
        local u192 = 0
        local v7 = {Callback = v2, Property = a3}
        local u194 = setmetatable(v7, u57)
        v7 = u58[a2]
        if not v7 then
            v7 = {}
            u58[a2] = v7

            function u194.ResetElapsedTime(a1) -- Line: 326 -- upvalues: u192 (ref)
                u192 = 0
                return a1
            end

            function u194.Interpolator(a1) -- Line: 331
                -- upvalues: u192 (ref), u68 (ref), a2 (val), a3 (val), u190 (val), u188 (val), a4 (val), u40 (ref)
                -- upvalues: u194 (val), Completed (upval), Canceled (upval)
                u192 = u192 + a1
                if u192 < u68 then
                    a2[a3] = (u190(u188, a4, u40(u192, 0, 1, u68)))
                    return
                end
                local v1 = u194
                if v1.Running then
                    v1.Connection:Disconnect()
                    v1.Running = false
                    local ObjectTable = v1.ObjectTable
                    if ObjectTable then
                        ObjectTable[v1.Property] = nil
                    end
                end
                local Callback = v1.Callback
                if Callback then
                    Callback(Completed or Canceled)
                end
                a2[a3] = a4
            end

            v7[a3] = u194
            u194.ObjectTable = v7
            return (ResumeTween(u194))
        end
        local v8 = v7[a3]
        if v8 then
            if not v1 then
                if u194.Running then
                    u194.Connection:Disconnect()
                    u194.Running = false
                    local ObjectTable_2 = u194.ObjectTable
                    if ObjectTable_2 then
                        ObjectTable_2[u194.Property] = nil
                    end
                end
                local Callback_2 = u194.Callback
                if Callback_2 then
                    Callback_2(Canceled)
                end
                return u194
            else
                if v8.Running then
                    v8.Connection:Disconnect()
                    v8.Running = false
                    local ObjectTable = v8.ObjectTable
                    if ObjectTable then
                        ObjectTable[v8.Property] = nil
                    end
                end
                local Callback = v8.Callback
                if Callback then
                    Callback(Canceled)
                end
            end
        end

        function u194.ResetElapsedTime(a1) -- Line: 326 -- upvalues: u192 (ref)
            u192 = 0
            return a1
        end

        function u194.Interpolator(a1) -- Line: 331
            -- upvalues: u192 (ref), u68 (ref), a2 (val), a3 (val), u190 (val), u188 (val), a4 (val), u40 (ref)
            -- upvalues: u194 (val), Completed (upval), Canceled (upval)
            u192 = u192 + a1
            if u192 < u68 then
                a2[a3] = (u190(u188, a4, u40(u192, 0, 1, u68)))
                return
            end
            local v1 = u194
            if v1.Running then
                v1.Connection:Disconnect()
                v1.Running = false
                local ObjectTable = v1.ObjectTable
                if ObjectTable then
                    ObjectTable[v1.Property] = nil
                end
            end
            local Callback = v1.Callback
            if Callback then
                Callback(Completed or Canceled)
            end
            a2[a3] = a4
        end

        v7[a3] = u194
        u194.ObjectTable = v7
        return (ResumeTween(u194))
    end,
    new = function(a1, a2, a3) -- Line: 348 -- upvalues: Easing (val), u57 (val), Canceled (val), ResumeTween (val)
        local u3 = a1 or 1
        local v1 = a2
        if type(v1) == "string" then
            a2 = Easing[a2]
        end
        local u9 = 0
        local u13 = setmetatable({}, u57)

        function u13.ResetElapsedTime(a1) -- Line: 358 -- upvalues: u9 (ref)
            u9 = 0
            return a1
        end

        function u13.Interpolator(a1) -- Line: 363
            -- upvalues: u9 (ref), u3 (ref), a3 (val), a2 (ref), u13 (val), Canceled (upval)
            u9 = u9 + a1
            if u9 < u3 then
                a3(a2(u9, 0, 1, u3))
                return
            end
            a3(1)
            local v1 = u13
            if v1.Running then
                v1.Connection:Disconnect()
                v1.Running = false
                local ObjectTable = v1.ObjectTable
                if ObjectTable then
                    ObjectTable[v1.Property] = nil
                end
            end
            local Callback = v1.Callback
            if Callback then
                Callback(Canceled)
            end
        end

        return (ResumeTween(u13))
    end,
}
return (setmetatable(v1, v1))