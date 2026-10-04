-- Script path: ReplicatedStorage.Content.Tower.Jester.Animator
-- Decompile time: 9.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local EmitterManager_2 = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1
local u51 = {
    [Enum_2.JesterBomb.Fire] = "Fire",
    [Enum_2.JesterBomb.Ice] = "Ice",
    [Enum_2.JesterBomb.Poison] = "Poison",
    [Enum_2.JesterBomb.Confusion] = "Confusion",
}
local u64 = {["The Flea"] = true, ["The Beast"] = true}
local u70 = TweenInfo.new(0.2, Enum.EasingStyle.Sine)
local PosionPuddles = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("PosionPuddles")

function v1.ToggleModel(a1, a2, a3) -- Line: 39
    for k, v in pairs(a2:GetChildren()) do
        if v:IsA("BasePart") then
            v.Transparency = if not a3 then 1 else 0
        end
    end
end

function v1:ApplyBombs(a2, a3) -- Line: 47 -- upvalues: EmitterManager (val), u51 (val)
    local v1
    local Level = self:GetLevel()

    local function v2(a1, a2) -- Line: 49 -- upvalues: self (val), EmitterManager (upval)
        local v1
        local v2 = self.bombs[a1].Model:Clone()
        v2.Parent = self.Model.Weapon
        if a2 == "Center" then
            v1 = "Bomb"
        elseif a2 ~= "Right" then
            v1 = false
            if a2 == "Left" then
                v1 = "BombLeft"
            end
        else
            v1 = "BombRight"
        end
        v2:PivotTo(self.Model.GunRig[v1].CFrame * (CFrame.Angles(0, -1.5707963267948966, 0)))
        for k, v in pairs(v2:GetChildren()) do
            if v:IsA("BasePart") then
                v.Anchored = false
            end
        end
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Parent = v2.PrimaryPart
        WeldConstraint.Part0 = v2.PrimaryPart
        WeldConstraint.Part1 = self.Model.GunRig[v1]
        EmitterManager.toggle(v2, true)
        return v2
    end

    if a2 ~= nil then
        if self.bomb1.model ~= nil then
            self.bomb1.model:Destroy()
        end
        self.bomb1.bomb = a2
        v1 = v2(a2, if not (Level >= 4) then "Center" else "Right")
        self.bomb1.model = v1
    end
    if a3 ~= nil then
        if self.bomb2.model ~= nil then
            self.bomb2.model:Destroy()
        end
        self.bomb2.bomb = a3
        v1 = v2(a3, "Left")
        self.bomb2.model = v1
    end
    if self.bomb1.model ~= nil then
        self:ToggleModel(self.bomb1.model, true)
    end
    if self.bomb2.model ~= nil then
        self:ToggleModel(self.bomb2.model, true)
    end
    if self.Model.Name == "Clown" then
        local v3
        local v4 = nil
        local v5 = nil
        for i, j in u51, v4, v5 do
            v3 = self.Model[j]
            v3.Transparency = 1
            if a2 == i or a3 == i then
                v3 = self.Model[j]
                v3.Transparency = 0
            end
        end
    end
end

function v1:UpdatePuddles(a2, a3) -- Line: 111
    -- upvalues: PosionPuddles (val), NewTween (val), u70 (val), TimescaleUtilities (val)
    local Magnitude, v1, v2, v3, v4
    local ServerTimeNow = workspace:GetServerTimeNow()
    local Puddles = self.Puddles
    local v5 = nil
    local v6 = nil
    local v7, v8, v9 = a2, self, a3
    for i, j in Puddles, v5, v6 do
        if not v7[i] then
            for k, n in j do
                n:Destroy()
            end
            v8.Puddles[i] = nil
        end
    end
    v5 = nil
    v6 = nil
    for m, i5 in v7, v5, v6 do
        if not v8.Puddles[m] then
            v4 = {}
            v1 = math.max(0, i5.Ends - ServerTimeNow)
            v2 = nil
            v3 = nil
            for i6, i7 in i5.Assets, v2, v3 do
                local u67 = PosionPuddles:WaitForChild((tostring(i7.Id))):Clone()
                Magnitude = (u67.Size * Vector3.new(1, 0, 1)).Magnitude
                local u76 = u67.Size * (i5.Radius / Magnitude)
                u67.Size = Vector3.new(0, 0, 0)
                u67.CFrame = i7.CFrame + Vector3.new(0, 0.05000000074505806, 0)
                u67.Parent = v8.PuddlesFolder
                if not v9 then
                    u67.Transparency = ServerTimeNow / i5.Ends
                    NewTween(u67, TweenInfo.new(v1), function(a1) -- Line: 164 -- upvalues: u67 (val)
                        u67.Transparency = 1 * a1
                    end)
                else
                    local Size = u67.Size
                    NewTween(u67, u70, function(a1) -- Line: 148 -- upvalues: u67 (val), Size (val), u76 (val)
                        u67.Size = Size:Lerp(u76, a1)
                    end)
                    TimescaleUtilities.Delay(u70.Time, function() -- Line: 152 -- upvalues: u67 (val), i5 (val), ServerTimeNow (val), NewTween (upval)
                        local v1 = u67
                        if v1:IsDescendantOf(workspace) then
                            v1 = math.max(0, i5.Ends - ServerTimeNow)
                            NewTween(u67, TweenInfo.new(v1), function(a1) -- Line: 156 -- upvalues: u67 (upval)
                                u67.Transparency = 1 * a1
                            end)
                        end
                    end)
                end
                TimescaleUtilities.Delay(v1, function() -- Line: 169 -- upvalues: u67 (val)
                    u67:Destroy()
                end)
                table.insert(v4, u67)
            end
            v8.Puddles[m] = v4
        end
    end
end

function v1.Initialize(a1) -- Line: 180
    -- upvalues: Enum_2 (val), u51 (val), u64 (val), SharedControllerFunctions (val), TimescaleUtilities (val)
    -- upvalues: GameState (val), EmitterManager (val), EasySound (val), ItemDrop (val), EmitterManager_2 (val)
    a1._repositionToken = 0
    if a1.Replicator and a1.Replicator.GetStateChangedSignal then
        (a1.Replicator:GetStateChangedSignal("Position")):Connect(function() -- Line: 184 -- upvalues: a1 (val)
            local v1 = a1
            v1._repositionToken = v1._repositionToken + 1
        end)
    end
    a1.Puddles = {}
    a1.PuddlesFolder = Instance.new("Folder")
    a1.PuddlesFolder.Parent = a1.Model
    a1.PuddlesFolder.Name = "Puddles"
    local Bombs = a1.Model:WaitForChild("Bombs")
    a1.bomb1 = {
        bomb = Enum_2.JesterBomb.Fire,
        model = (a1.Model:WaitForChild("Weapon")):WaitForChild("Fire"),
    }
    a1.bomb2 = {}
    local v1 = {}
    v1[Enum_2.JesterBomb.Fire] = {Emitter = "FireExplosion", Model = Bombs:WaitForChild("Fire")}
    v1[Enum_2.JesterBomb.Ice] = {Emitter = "IceExplosion", Model = Bombs:WaitForChild("Ice")}
    v1[Enum_2.JesterBomb.Poison] = {Emitter = "BileExplosion", Model = Bombs:WaitForChild("Poison")}
    v1[Enum_2.JesterBomb.Confusion] = {Emitter = "ConfuseExplosion", Model = Bombs:WaitForChild("Confusion")}
    a1.bombs = v1
    a1.right = true
    if a1.Model.Name == "Clown" then
        v1 = a1.Model[u51[Enum_2.JesterBomb.Fire]]
        v1.Transparency = 0
    end
    if not u64[a1.Model.Name] then
        SharedControllerFunctions.RegisterJoints(a1, {
            a1.Model.Torso["Left Shoulder"],
            a1.Model.Torso["Right Shoulder"],
            a1.Model.PrimaryPart.Bomb,
            a1.Model.PrimaryPart.BombLeft,
            a1.Model.PrimaryPart.BombRight,
        })
    end

    function a1.AimAt(a1_2, a2) -- Line: 230 -- upvalues: a1 (val), u64 (upval), SharedControllerFunctions (upval)
        local Position = a1.Model.PrimaryPart.Position
        local v1 = (Position - a1_2).Magnitude / (a2 * 3)
        local v2 = (Position:lerp(a1_2, 0.5)) + Vector3.new(0, -v1, 0)
        a1:Face(a1_2)
        if not u64[a1.Model.Name] then
            SharedControllerFunctions.AimArmsAt(a1, v2)
            SharedControllerFunctions.AimHeadAt(a1, v2)
        end
    end

    a1:UpdatePuddles(a1.Replicator:Get("PosionPuddles") or {}, false)
    ;(a1.Replicator:GetStateChangedSignal("PosionPuddles")):Connect(function(a1_2) -- Line: 245 -- upvalues: a1 (val)
        a1:UpdatePuddles(a1_2, true)
    end)
    a1.Executables = {
        ThrowBomb = function(a1_2, a2, a3, a4) -- Line: 250
            -- upvalues: a1 (val), TimescaleUtilities (upval), GameState (upval), EmitterManager (upval)
            -- upvalues: EasySound (upval), ItemDrop (upval), EmitterManager_2 (upval)
            local bomb1
            local _repositionToken = a1._repositionToken
            local Level = a1:GetLevel()
            if not a4 then
                bomb1 = a1.bomb2
            else
                bomb1 = a1.bomb1
                if not bomb1 then
                    bomb1 = a1.bomb2
                end
            end
            local u20 = workspace:GetServerTimeNow() - a3
            local u28 = a1.State.Cooldown * a1.Stats.Attributes.AimTime
            local v1 = if not (Level >= 4) then 0 else 4
            local v2 = if not (Level < 4) then if not a4 then "Left" else "Right" else "Fire"
            local u47 = a1:Animate(v2)
            local v3 = u47.Length or 1
            local v4 = 1
            if v3 then
                v4 = 1 / (u28 / (v3 * a1.Stats.Attributes.AnimTimes[tostring(v1)][v2]))
            end
            u47:AdjustSpeed(v4)
            a1.AimAt(a2.goal, a2.gravity)
            task.spawn(function() -- Line: 273
                -- upvalues: TimescaleUtilities (upval), u28 (val), u20 (val), _repositionToken (val), a1 (upval)
                -- upvalues: u47 (val), GameState (upval), a1_2 (val), EmitterManager (upval), bomb1 (val)
                -- upvalues: EasySound (upval), ItemDrop (upval), a2 (val), EmitterManager_2 (upval)
                TimescaleUtilities.Wait((math.clamp(u28 - u20, 0, (1 / 0))))
                if _repositionToken == a1._repositionToken and a1:IsAlive() then
                    u47:AdjustSpeed(1 * GameState.TimeScale)
                    local u32 = a1.bombs[a1_2].Model:Clone()
                    u32.Parent = workspace.CurrentCamera
                    a1:ToggleModel(u32, true)
                    EmitterManager.toggle(u32, true)
                    bomb1.visible = false
                    a1:ToggleModel(bomb1.model, false)
                    local Handle = bomb1.model.Handle
                    EmitterManager.toggle(Handle, false)
                    local Fire = Handle:FindFirstChild("Fire")
                    if Fire then
                        EasySound.Play({
                            audioGroup = "Towers",
                            destroyOnEnd = true,
                            id = Fire.SoundId,
                            parent = Handle,
                            playbackSpeed = (Random.new()):NextNumber(Fire.PlaybackSpeed * 0.9, Fire.PlaybackSpeed * 1.2),
                            volume = Fire.Volume or 1,
                        })
                    end
                    local u87 = Random.new():NextNumber()
                    ;(ItemDrop.Drop(a2.start, a2.goal, u32, a2.dtMultiplier, a2.gravity, a2.velocity, function(a1, a2, a3) -- Line: 315 -- upvalues: u87 (val)
                        local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(u87 + a1, 0, 0)
                        return v1 - v1.Position
                    end)):andThen(function(a1_3) -- Line: 321 -- upvalues: u32 (val), EmitterManager_2 (upval), a1 (upval), a1_2 (upval), a2 (upval)
                        u32:Destroy()
                        local v1 = a1_2
                        EmitterManager_2.Emit(a1.bombs[v1].Emitter, CFrame.new(a2.goal), a2.radius, nil, true, "Towers")
                    end)
                    return
                end
            end)
        end,
        EquipBomb = function(a1_2, a2) -- Line: 335 -- upvalues: a1 (val)
            local Level = a1:GetLevel()
            local Cooldown = a1.State.Cooldown
            local v1 = Cooldown * a1.Stats.Attributes.EquipTime
            local AnimTimes = a1.Stats.Attributes.AnimTimes
            local v2 = v1 * AnimTimes[if not (Level < 4) then "4" else "0"].Equip
            local v3 = a1:Animate("Equip")
            local v4 = v3.Length or 1
            local v5 = 1
            if v4 then
                v5 = 1 / (Cooldown / v4)
            end
            v3:AdjustSpeed(v5)
            a1:Delay(v2)
            a1:ApplyBombs(a1_2, a2)
            a1:Delay(v1 - v2)
        end,
        UpdateBombs = function(a1_2, a2) -- Line: 357 -- upvalues: a1 (val)
            a1:ApplyBombs(a1_2, a2)
        end,
    }
end

return v1