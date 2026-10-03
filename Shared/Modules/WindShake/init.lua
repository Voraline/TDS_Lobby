-- Script path: ReplicatedStorage.Shared.Modules.WindShake
-- Decompile time: 6.99 ms

local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local Settings = require(script.Settings)
local VectorMap = require(script.VectorMap)
local BindableEvent = Instance.new("BindableEvent")
local BindableEvent_2 = Instance.new("BindableEvent")
local BindableEvent_3 = Instance.new("BindableEvent")
local BindableEvent_4 = Instance.new("BindableEvent")
local BindableEvent_5 = Instance.new("BindableEvent")
return {
    RenderDistance = 150,
    MaxRefreshRate = 0.016666666666666666,
    Handled = 0,
    Active = 0,
    SharedSettings = Settings.new(script),
    ObjectMetadata = {},
    VectorMap = VectorMap.new(),
    _partList = table.create(500),
    _cframeList = table.create(500),
    ObjectShakeAdded = BindableEvent.Event,
    ObjectShakeRemoved = BindableEvent_2.Event,
    ObjectShakeUpdated = BindableEvent_3.Event,
    Paused = BindableEvent_4.Event,
    Resumed = BindableEvent_5.Event,
    Connect = function(self, a2, a3) -- Line: 64 -- types: self: table, a2: string, a3: userdata
        local u3 = self[a2]
        local v1 = "Unknown function: " .. a2
        assert(typeof(u3) == "function", v1)
        return a3:Connect(function(...) -- Line: 68 -- upvalues: u3 (val), self (val)
            return u3(self, ...)
        end)
    end,
    AddObjectShake = function(self, a2, a3) -- Line: 73
        -- upvalues: Settings (val), BindableEvent (val)
        if typeof(a2) ~= "Instance" then
            return
        end
        if not a2:IsA("BasePart") and not a2:IsA("Bone") then
            return
        end
        local ObjectMetadata = self.ObjectMetadata
        if ObjectMetadata[a2] then
            return
        end
        self.Handled = self.Handled + 1
        local v1 = {
            ChunkKey = self.VectorMap:AddObject(if not a2:IsA("Bone") then a2.Position else a2.WorldPosition, a2),
            Settings = Settings.new(a2),
            Seed = math.random(5000) * 0.32,
        }
        local WorldCFrame = if not a2:IsA("Bone") then a2.CFrame else a2.WorldCFrame
        v1.Origin = WorldCFrame
        v1.LastUpdate = os.clock()
        ObjectMetadata[a2] = v1
        if a3 then
            self:UpdateObjectSettings(a2, a3)
        end
        BindableEvent:Fire(a2)
    end,
    RemoveObjectShake = function(a1, a2) -- Line: 109 -- upvalues: BindableEvent_2 (val) -- types: a1: table, a2: userdata
        if typeof(a2) ~= "Instance" then
            return
        end
        local ObjectMetadata = a1.ObjectMetadata
        local v1 = ObjectMetadata[a2]
        if v1 then
            a1.Handled = a1.Handled - 1
            ObjectMetadata[a2] = nil
            v1.Settings:Destroy()
            a1.VectorMap:RemoveObject(v1.ChunkKey, a2)
            if a2:IsA("BasePart") then
                a2.CFrame = v1.Origin
            elseif a2:IsA("Bone") then
                a2.WorldCFrame = v1.Origin
            end
        end
        BindableEvent_2:Fire(a2)
    end,
    Update = function(a1, a2) -- Line: 133 -- types: a1: table, a2: number
        debug.profilebegin("WindShake")
        local u5 = 0
        debug.profilebegin("Update")
        local u10 = os.clock()
        local u11 = a2 * 3
        local u15 = math.min(1, a2 * 5)
        local u16 = 0
        local _partList = a1._partList
        local _cframeList = a1._cframeList
        table.clear(_partList)
        table.clear(_cframeList)
        local ObjectMetadata = a1.ObjectMetadata
        local CurrentCamera = workspace.CurrentCamera
        local Position = CurrentCamera.CFrame.Position
        local RenderDistance = a1.RenderDistance
        local MaxRefreshRate = a1.MaxRefreshRate
        local SharedSettings = a1.SharedSettings
        local WindPower = SharedSettings.WindPower
        local WindSpeed = SharedSettings.WindSpeed
        local WindDirection = SharedSettings.WindDirection
        a1.VectorMap:ForEachObjectInView(CurrentCamera, RenderDistance, function(a1, a2) -- Line: 166
            -- upvalues: ObjectMetadata (val), Position (val), RenderDistance (val), u11 (val), MaxRefreshRate (val)
            -- upvalues: u10 (val), u5 (ref), WindDirection (val), WindPower (val), WindSpeed (val), u15 (val)
            -- upvalues: u16 (ref), _partList (val), _cframeList (val)
            local v1
            local v2 = ObjectMetadata[a2]
            local v3 = v2.LastUpdate or 0
            local WorldCFrame = if not (a1 == "Bone") then a2.CFrame else a2.WorldCFrame
            local v4 = (Position - WorldCFrame.Position).Magnitude / RenderDistance
            local v5 = v4 * v4
            local v6 = 1 / math.random(60, 120)
            local v7 = u11 * v5 + MaxRefreshRate
            if u10 - v3 + v6 <= v7 then
                return
            end
            v2.LastUpdate = u10
            u5 = u5 + 1
            local Settings = v2.Settings
            local WindDirection_2 = Settings.WindDirection or WindDirection
            if WindDirection_2.Magnitude < 1e-05 then
                return
            end
            local WindPower_2 = Settings.WindPower or WindPower
            local v8 = WindPower_2 * 0.2
            if v8 < 1e-05 then
                return
            end
            local WindSpeed_2 = Settings.WindSpeed or WindSpeed
            local v9 = u10 * (WindSpeed_2 * 0.08)
            if v9 < 1e-05 then
                return
            end
            local Seed = v2.Seed
            local v10 = (math.noise(v9, 0, Seed) + 0.4) * v8
            local v11 = math.clamp(u15 + v5, 0.1, 0.5)
            local v12 = v8 / 3
            local Origin = v2.Origin
            local PivotOffset = Settings.PivotOffset or CFrame.identity
            local v13 = Origin * PivotOffset
            local v14 = v13:VectorToObjectSpace(WindDirection_2)
            if v1 then
                a2.Transform = a2.Transform:Lerp(
                    (CFrame.fromAxisAngle(v14:Cross((Vector3.new(0, 1, 0))), -v10)) * CFrame.Angles(math.noise(Seed, 0, v9) * v12, math.noise(Seed, v9, 0) * v12, math.noise(v9, Seed, 0) * v12) + v14 * v10 * v8,
                    v11
                )
                return
            end
            u16 = u16 + 1
            _partList[u16] = a2
            local v15 = u16
            _cframeList[v15] = (WorldCFrame:Lerp(
                v13 * CFrame.fromAxisAngle(v14:Cross((Vector3.new(0, 1, 0))), -v10) * CFrame.Angles(math.noise(Seed, 0, v9) * v12, math.noise(Seed, v9, 0) * v12, math.noise(v9, Seed, 0) * v12) * (Settings.PivotOffsetInverse or CFrame.identity) + WindDirection_2 * v10 * (v8 * 2),
                v11
            ))
        end)
        a1.Active = u5
        debug.profileend()
        workspace:BulkMoveTo(_partList, _cframeList, Enum.BulkMoveMode.FireCFrameChanged)
        debug.profileend()
    end,
    Pause = function(self) -- Line: 253 -- upvalues: BindableEvent_4 (val)
        if self.UpdateConnection then
            self.UpdateConnection:Disconnect()
            self.UpdateConnection = nil
        end
        self.Active = 0
        self.Running = false
        BindableEvent_4:Fire()
    end,
    Resume = function(self) -- Line: 265 -- upvalues: RunService (val), BindableEvent_5 (val)
        if self.Running then
            return
        end
        self.Running = true
        self.UpdateConnection = self:Connect("Update", RunService.Heartbeat)
        BindableEvent_5:Fire()
    end,
    Init = function(a1, a2) -- Line: 278 -- upvalues: CollectionService (val) -- types: a1: table, a2: table
        if a1.Initialized then
            return
        end
        local Attribute = script:GetAttribute("WindPower")
        local Attribute_2 = script:GetAttribute("WindSpeed")
        local Attribute_3 = script:GetAttribute("WindDirection")
        if typeof(Attribute) ~= "number" then
            script:SetAttribute("WindPower", 0.5)
        end
        if typeof(Attribute_2) ~= "number" then
            script:SetAttribute("WindSpeed", 20)
        end
        if typeof(Attribute_3) ~= "Vector3" then
            script:SetAttribute("WindDirection", (Vector3.new(0.5, 0, 0.5)))
        end
        a1:Cleanup()
        a1.Initialized = true
        a1.AddedConnection = a1:Connect("AddObjectShake", (CollectionService:GetInstanceAddedSignal("WindShake")))
        a1.RemovedConnection = a1:Connect("RemoveObjectShake", (CollectionService:GetInstanceRemovedSignal("WindShake")))
        for i, j in CollectionService:GetTagged("WindShake") do
            a1:AddObjectShake(j)
        end
        if a2 and a2.MatchWorkspaceWind then
            a1:MatchWorkspaceWind()
            a1.WorkspaceWindConnection = (workspace:GetPropertyChangedSignal("GlobalWind")):Connect(function() -- Line: 320 -- upvalues: a1 (val)
                a1:MatchWorkspaceWind()
            end)
        end
        a1:Resume()
    end,
    Cleanup = function(self) -- Line: 329
        if not self.Initialized then
            return
        end
        self:Pause()
        if self.AddedConnection then
            self.AddedConnection:Disconnect()
            self.AddedConnection = nil
        end
        if self.RemovedConnection then
            self.RemovedConnection:Disconnect()
            self.RemovedConnection = nil
        end
        if self.WorkspaceWindConnection then
            self.WorkspaceWindConnection:Disconnect()
            self.WorkspaceWindConnection = nil
        end
        table.clear(self.ObjectMetadata)
        self.VectorMap:ClearAll()
        self.Handled = 0
        self.Active = 0
        self.Initialized = false
    end,
    UpdateObjectSettings = function(self, a2, a3) -- Line: 359 -- upvalues: BindableEvent_3 (val) -- types: self: table, a2: userdata, a3: table
        if typeof(a2) ~= "Instance" or typeof(a3) ~= "table" then
            return
        end
        if not self.ObjectMetadata[a2] and a2 ~= script then
            return
        end
        for i, j in a3 do
            a2:SetAttribute(i, j)
        end
        BindableEvent_3:Fire(a2)
    end,
    UpdateAllObjectSettings = function(a1, a2) -- Line: 379 -- upvalues: BindableEvent_3 (val) -- types: a1: table, a2: table
        if typeof(a2) ~= "table" then
            return
        end
        local v1 = nil
        local v2 = nil
        for i, j in a1.ObjectMetadata, v1, v2 do
            for k, n in a2 do
                i:SetAttribute(k, n)
            end
            BindableEvent_3:Fire(i)
        end
    end,
    SetDefaultSettings = function(self, a2) -- Line: 392 -- types: self: table, a2: table
        self:UpdateObjectSettings(script, a2)
    end,
    MatchWorkspaceWind = function(self) -- Line: 396
        local GlobalWind = workspace.GlobalWind
        local Unit = GlobalWind.Unit
        local v1 = 0
        local v2 = 0
        local Magnitude = GlobalWind.Magnitude
        if Magnitude > 0 then
            v2 = if not (Magnitude > 1) then 0.3 else math.log10(Magnitude) + 0.2
            v1 = if not (Magnitude < 100) then 125 else Magnitude * 1.2 + 5
        end
        self:SetDefaultSettings({WindDirection = Unit, WindSpeed = v1, WindPower = v2})
    end,
}