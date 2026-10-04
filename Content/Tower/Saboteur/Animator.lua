-- Script path: ReplicatedStorage.Content.Tower.Saboteur.Animator
-- Decompile time: 18.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CurrentCamera = workspace.CurrentCamera
local Cooldown = require(ReplicatedStorage.Client.Modules.Cooldown)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local Sounds = require(script.Parent.Sounds)
local VolumeMultiplier = Sounds.VolumeMultiplier

local function saboteurGrenadeStartWorldPosition(a1, a2) -- Line: 21 -- types: a1: userdata, a2: boolean?
    if not a2 then
        local v1 = a1:FindFirstChild("Left Arm")
        assert(v1, "Saboteur: Left Arm missing")
        local Throw_2 = v1:FindFirstChild("Throw")
        assert(Throw_2 and Throw_2:IsA("Attachment"), "Saboteur: Left Arm.Throw missing")
        return Throw_2.WorldPosition
    end
    local Weapon = a1:FindFirstChild("Weapon")
    assert(Weapon, "Saboteur: Weapon missing")
    local Configuration = Weapon:FindFirstChildWhichIsA("Configuration", true)
    assert(Configuration, "Saboteur: Weapon Configuration missing")
    local Throw = Configuration:FindFirstChild("Throw")
    assert(Throw and Throw.Value and Throw.Value:IsA("Attachment"), "Saboteur: Weapon Configuration.Throw missing or invalid")
    return Throw.Value.WorldPosition
end

local v1 = {}
v1.__index = v1

local function createRangeIndicator(a1, a2, a3, a4) -- Line: 48
    -- upvalues: 
    local Part = Instance.new("Part")
    Part.Name = "SaboteurThrowRangeRing"
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.CastShadow = false
    Part.Transparency = 1
    Part.Size = Vector3.new(a3 * 2, 0.001, a3 * 2)
    Part.CFrame = CFrame.new(a2.X, a4 + 0.2, a2.Z)
    local SurfaceGui = Instance.new("SurfaceGui")
    SurfaceGui.Name = "RangeGui"
    SurfaceGui.Face = Enum.NormalId.Top
    SurfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    SurfaceGui.PixelsPerStud = 32
    SurfaceGui.AlwaysOnTop = true
    SurfaceGui.ZOffset = 5
    SurfaceGui.Adornee = Part
    SurfaceGui.Parent = Part
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.fromScale(1, 1)
    Frame.BackgroundTransparency = 0.9
    Frame.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame.BorderSizePixel = 0
    Frame.Parent = SurfaceGui
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = Frame
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Thickness = 4
    UIStroke.Color = Color3.new(1, 1, 1)
    UIStroke.Transparency = 0.2
    UIStroke.Parent = Frame
    Part.Parent = a1
    return Part
end

local SaboteurCursor = ReplicatedStorage.Assets.Effects.Client.SaboteurCursor
local Effects = ReplicatedStorage.Assets.Effects
local u77 = CFrame.new()

local function getGrenadeProjectileName(a1) -- Line: 107 -- upvalues: Effects (val) -- types: a1: userdata
    local Weapon = a1:FindFirstChild("Weapon")
    if not Weapon then
        return "SaboteurGrenade"
    end
    local Configuration = Weapon:FindFirstChildWhichIsA("Configuration", true)
    if not Configuration then
        return "SaboteurGrenade"
    end
    local ProjectileName = Configuration:FindFirstChild("ProjectileName")
    if ProjectileName and ProjectileName:IsA("StringValue") then
        local Value = ProjectileName.Value
        if Value == "" then
            return "SaboteurGrenade"
        end
        if Effects.Projectile:FindFirstChild(Value) then
            return Value
        end
        return "SaboteurGrenade"
    end
    return "SaboteurGrenade"
end

local function getSaboteurGrenadeTemplate(a1) -- Line: 135
    -- upvalues: getGrenadeProjectileName (val), Effects (val)
    local v1 = getGrenadeProjectileName(a1)
    local v2 = Effects.Projectile:FindFirstChild(v1)
    assert(v2, (("Missing Assets.Effects.Projectile.%*"):format(v1)))
    return v2
end

local function placeSaboteurGrenadeCloneAt(a1, a2) -- Line: 142 -- types: a1: userdata, a2: vector
    if a1:IsA("BasePart") then
        a1.CanCollide = false
        a1.CanTouch = false
        a1.CanQuery = false
    end
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.CanCollide = false
            j.CanTouch = false
            j.CanQuery = false
        end
    end
    if a1:IsA("Model") then
        if not a1.PrimaryPart then
            local Handle = a1:FindFirstChild("Handle")
            if Handle and Handle:IsA("BasePart") then
                a1.PrimaryPart = Handle
            end
        end
        assert(a1.PrimaryPart, "SaboteurGrenade Model needs PrimaryPart or Handle (BasePart)")
        a1:PivotTo((CFrame.new(a2)))
    elseif not a1:IsA("BasePart") then
        error("SaboteurGrenade must be a BasePart or Model")
    else
        a1.Position = a2
    end
    a1.Parent = workspace
end

local function hideSaboteurGrenadeClone(a1) -- Line: 173 -- upvalues: TimescaleUtilities (val) -- types: a1: userdata
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            j.Enabled = false
        end
    end
    if a1:IsA("BasePart") then
        a1.Transparency = 1
    elseif a1:IsA("Model") then
        for k, n in a1:GetDescendants() do
            if n:IsA("BasePart") then
                n.Transparency = 1
            end
        end
    end
    TimescaleUtilities.CleanUp(a1, 0.5)
end

local u82 = nil
local u83 = nil
local u84 = {}
local u85 = {}
local u86 = nil
local u87 = nil

local function easeOutCubic(a1) -- Line: 209 -- types: a1: number
    local v1 = math.clamp(a1, 0, 1)
    return 1 - (1 - v1) * (1 - v1) * (1 - v1)
end

local function easeInQuad(a1) -- Line: 214 -- types: a1: number
    local v1 = math.clamp(a1, 0, 1)
    return v1 * v1
end

local function entranceT(a1, a2, a3) -- Line: 219 -- types: a1: number, a2: number, a3: number
    return (math.clamp((a1 - a2) / a3, 0, 1))
end

local function getCrosshairPivot(a1) -- Line: 223 -- types: a1: userdata
    if a1:IsA("Model") then
        return a1:GetPivot()
    end
    local Root = a1:FindFirstChild("Root")
    if Root and Root:IsA("BasePart") then
        return Root.CFrame
    end
    return nil
end

local function resolveNamedBasePart(a1, a2) -- Line: 234 -- types: a1: userdata, a2: string
    local v1 = a1:FindFirstChild(a2, true)
    if not v1 then
        return nil
    end
    if v1:IsA("BasePart") then
        return v1
    end
    if not v1:IsA("Model") and not v1:IsA("Folder") then
        return nil
    end
    if v1:IsA("Model") and v1.PrimaryPart then
        return v1.PrimaryPart
    end
    for i, j in v1:GetDescendants() do
        if j:IsA("BasePart") then
            return j
        end
    end
    return nil
end

local function prepareBillboardPart(a1, a2) -- Line: 255 -- types: a1: userdata, a2: userdata
    local v1 = a1
    for i, j in a2:GetDescendants() do
        if j:IsA("WeldConstraint") or j:IsA("Motor6D") then
            if j.Part0 == v1 or j.Part1 == v1 then
                j:Destroy()
            end
        end
    end
    v1.Anchored = true
    v1.CanCollide = false
end

local function getTowerSoundPack(a1) -- Line: 267 -- upvalues: Sounds (val)
    return Sounds[a1.Model.Name] or Sounds.Default
end

local function playTowerSound(a1, a2) -- Line: 271
    -- upvalues: Sounds (val), EasySound (val), VolumeMultiplier (val)
    local Default = Sounds[a1.Model.Name] or Sounds.Default
    local v1 = Default[a2]
    if type(v1) == "number" and v1 ~= 0 then
        local PrimaryPart = a1.Model.PrimaryPart
        if not PrimaryPart then
            return
        end
        local v2 = 1
        if a2 == "Shoot" then
            v2 = Random.new():NextNumber(0.9, 1.1)
        end
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = v1,
            parent = PrimaryPart,
            volume = VolumeMultiplier,
            playbackSpeed = v2,
        })
        return
    end
end

local function playTowerSoundFromMarker(a1, a2) -- Line: 296
    -- upvalues: Sounds (val), playTowerSound (val)
    if type(a2) == "string" and a2 ~= "" then
        local Default = Sounds[a1.Model.Name] or Sounds.Default
        if Default[a2] == nil then
            return
        end
        playTowerSound(a1, a2)
        return
    end
end

local function playTowerSoundAt(a1, a2, a3) -- Line: 307
    -- upvalues: Sounds (val), EasySound (val), VolumeMultiplier (val)
    local Default = Sounds[a1.Model.Name] or Sounds.Default
    local v1 = Default[a2]
    if type(v1) == "number" and v1 ~= 0 then
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = v1,
            position = a3,
            volume = VolumeMultiplier,
        })
        return
    end
end

local function finishAbilityCursorExit() -- Line: 322 -- upvalues: u86 (ref), u87 (ref), u84 (val), u85 (val)
    if u86 then
        u86:Disconnect()
        u86 = nil
    end
    if u87 then
        u87:Destroy()
        u87 = nil
    end
    table.clear(u84)
    table.clear(u85)
end

local function abortInFlightAbilityExit() -- Line: 335 -- upvalues: u86 (ref), u87 (ref)
    if u86 then
        u86:Disconnect()
        u86 = nil
    end
    if u87 then
        u87:Destroy()
        u87 = nil
    end
end

local function cleanUpAbility() -- Line: 346
    -- upvalues: u86 (ref), u87 (ref), RunService (val), PathPlacementCursorController (val), u82 (ref), u83 (ref)
    -- upvalues: u84 (val), u85 (val), GameState (val)
    if u86 then
        u86:Disconnect()
        u86 = nil
    end
    if u87 then
        u87:Destroy()
        u87 = nil
    end
    RunService:UnbindFromRenderStep("SaboteurAbilityCursorPivot")
    RunService:UnbindFromRenderStep("SaboteurAbilityCursorBillboard")
    PathPlacementCursorController:Stop()
    local u26 = u82
    u82 = nil
    if u83 then
        u83:Destroy()
        u83 = nil
    end
    if not u26 then
        return
    end
    local v1 = true
    if not (#u84 > 0) then
        v1 = #u85 > 0
    end
    if not v1 then
        u26:Destroy()
        return
    end
    u87 = u26
    local u49 = 0
    local Pivot = u26:GetPivot()
    u86 = RunService.RenderStepped:Connect(function(a1) -- Line: 376
        -- upvalues: u49 (ref), GameState (upval), u84 (upval), u85 (upval), u26 (val), Pivot (val), u86 (upval)
        -- upvalues: u87 (upval)
        local p, p_2, v1, v2, v3, v4
        local v5 = true
        u49 = u49 + a1 * GameState.TimeScale
        local v6 = nil
        local v7 = nil
        for i, j in u84, v6, v7 do
            v2 = (i - 1) * 0.02
            v3 = math.clamp((u49 - v2) / 0.35, 0, 1)
            if v3 < 1 then
                v5 = false
            end
            v1 = math.clamp(v3, 0, 1)
            v4 = v1 * v1
            p_2 = j.p
            if p_2.Parent then
                p_2.Size = j.size0 * math.lerp(1, 0.12, v4)
                p_2.Transparency = math.lerp(j.trans0, 1, v4)
            end
        end
        v6 = nil
        v7 = nil
        for k, n in u85, v6, v7 do
            v2 = (k - 1) * 0.02
            v3 = math.clamp((u49 - v2) / 0.35, 0, 1)
            if v3 < 1 then
                v5 = false
            end
            v1 = math.clamp(v3, 0, 1)
            v4 = v1 * v1
            p = n.p
            if p.Parent then
                p.Transparency = math.lerp(n.trans0, 1, v4)
            end
        end
        if u26.Parent then
            v7 = math.clamp(math.clamp(u49 / 0.35, 0, 1), 0, 1)
            u26:PivotTo(Pivot * (CFrame.new(0, v7 * v7 * 0.35, 0)))
        end
        if v5 then
            if u86 then
                u86:Disconnect()
                u86 = nil
            end
            if u87 then
                u87:Destroy()
                u87 = nil
            end
            table.clear(u84)
            table.clear(u85)
        end
    end)
end

function v1.Initialize(a1) -- Line: 420
    -- upvalues: Cooldown (val), saboteurGrenadeStartWorldPosition (val), getGrenadeProjectileName (val), Effects (val)
    -- upvalues: placeSaboteurGrenadeCloneAt (val), ItemDrop (val), hideSaboteurGrenadeClone (val)
    -- upvalues: playTowerSoundAt (val), EmitterManager (val), TypedPromise (val), PathPlacementCursorController (val)
    -- upvalues: Notification (val), cleanUpAbility (val), u84 (val), u85 (val), SaboteurCursor (val), u82 (ref)
    -- upvalues: resolveNamedBasePart (val), prepareBillboardPart (val), u83 (ref), createRangeIndicator (val)
    -- upvalues: RunService (val), GameState (val), CurrentCamera (val), u77 (val), Sounds (val), playTowerSound (val)
    a1._adsAnim = nil
    a1._unholsterAnim = nil
    a1._adsTimer = Cooldown.new(0, function() -- Line: 423 -- upvalues: a1 (val)
        if a1._adsAnim then
            a1._adsAnim:Stop()
            a1._adsAnim = nil
        end
        a1._unholsterAnim = a1:Animate("Unholster")
    end)
    a1.Maid:Mark(a1._adsTimer)
    a1.OnUpgrade:Connect(function() -- Line: 432 -- upvalues: a1 (val)
        if a1._adsTimer:isActive() then
            if a1._adsAnim then
                a1._adsAnim:Stop()
            end
            a1._adsAnim = a1:Animate("ADS")
        end
    end)
    a1.Executables = {
        Fire = function(a1_2, a2, a3) -- Line: 442 -- upvalues: a1 (val) -- types: a1_2: vector, a2: table, a3: table
            a1:_fire(a1_2, a2, a3)
        end,
        GrenadeProjectile = function(a1_2) -- Line: 449
            -- upvalues: a1 (val), saboteurGrenadeStartWorldPosition (upval), getGrenadeProjectileName (upval)
            -- upvalues: Effects (upval), placeSaboteurGrenadeCloneAt (upval), ItemDrop (upval)
            -- upvalues: hideSaboteurGrenadeClone (upval)
            a1:Delay(a1_2.throwDelay, function() -- Line: 450
                -- upvalues: a1 (upval), a1_2 (val), saboteurGrenadeStartWorldPosition (upval)
                -- upvalues: getGrenadeProjectileName (upval), Effects (upval), placeSaboteurGrenadeCloneAt (upval)
                -- upvalues: ItemDrop (upval), hideSaboteurGrenadeClone (upval)
                a1:Face(a1_2.endPosition, TweenInfo.new(0.3), true)
                local v1 = saboteurGrenadeStartWorldPosition(a1.Model, a1.FBXModel ~= nil)
                local Model_2 = a1.Model
                local v2 = getGrenadeProjectileName(Model_2)
                local v3 = Effects.Projectile:FindFirstChild(v2)
                assert(v3, (("Missing Assets.Effects.Projectile.%*"):format(v2)))
                local u43 = v3:Clone()
                placeSaboteurGrenadeCloneAt(u43, v1)
                ;(ItemDrop.Drop(v1, a1_2.endPosition, u43, a1_2.dtMultiplier, a1_2.gravity, a1_2.speed, function(a1, a2, a3) -- Line: 465
                    return (CFrame.new(a3, a2)).Rotation * CFrame.Angles(math.rad(a1 * 150), 0, 0)
                end)):andThen(function() -- Line: 469 -- upvalues: hideSaboteurGrenadeClone (upval), u43 (val)
                    hideSaboteurGrenadeClone(u43)
                end)
            end)
        end,
        GrenadeImpact = function(a1_2, a2) -- Line: 475
            -- upvalues: playTowerSoundAt (upval), a1 (val), EmitterManager (upval)
            playTowerSoundAt(a1, "GrenadeExplosion", a1_2)
            EmitterManager.Emit("SaboteurGrenadeExplosion", CFrame.new(a1_2), a2, nil, false)
        end,
    }

    local function getPlacement() -- Line: 487
        -- upvalues: TypedPromise (upval), PathPlacementCursorController (upval), a1 (val), Notification (upval)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 488 -- upvalues: PathPlacementCursorController (upval), a1 (upval), Notification (upval)
            local u4 = nil
            local u11 = PathPlacementCursorController.OnClicked:Once(function(a1_3, a2_2, a3) -- Line: 491
                -- upvalues: u4 (ref), a1 (upval), Notification (upval), PathPlacementCursorController (upval), a2 (val)
                -- upvalues: a1_2 (val)
                if u4 then
                    u4:Disconnect()
                end
                local Position = a1.Replicator:Get("Position")
                if typeof(Position) ~= "Vector3" then
                    Position = a1.Model.PrimaryPart.Position
                end
                local Magnitude = (a3 - Position).Magnitude
                if not (a1:GetRange() < Magnitude) then
                    PathPlacementCursorController:Stop()
                    a1_2(a3)
                    return
                end
                Notification.Create({Text = "Out of range!", Color = Color3.fromRGB(236, 0, 0)})
                PathPlacementCursorController:Stop()
                a2("Out of range")
            end)
            u4 = PathPlacementCursorController.Canceled:Once(function() -- Line: 515 -- upvalues: u11 (ref), a2 (val)
                if u11 then
                    u11:Disconnect()
                end
                a2("Canceled")
            end)
            PathPlacementCursorController:Start({constrainToPath = true, uiEnabled = false})
            a3(function() -- Line: 527 -- upvalues: u11 (ref), u4 (ref), PathPlacementCursorController (upval)
                if u11 then
                    u11:Disconnect()
                end
                if u4 then
                    u4:Disconnect()
                end
                PathPlacementCursorController:Stop()
            end)
        end)
    end

    a1.AbilityCallbacks = {
        ["Aggressive Toxins"] = function() -- Line: 540
            -- upvalues: cleanUpAbility (upval), u84 (upval), u85 (upval), SaboteurCursor (upval), u82 (upval)
            -- upvalues: resolveNamedBasePart (upval), prepareBillboardPart (upval), a1 (val), u83 (upval)
            -- upvalues: createRangeIndicator (upval), RunService (upval), GameState (upval), CurrentCamera (upval)
            -- upvalues: PathPlacementCursorController (upval), u77 (upval), TypedPromise (upval), Notification (upval)
            -- upvalues: Sounds (upval), playTowerSound (upval)
            local v1, v2, v3, v4
            cleanUpAbility()
            table.clear(u84)
            table.clear(u85)
            local v5 = SaboteurCursor:Clone()
            u82 = v5
            local Crosshair = v5:FindFirstChild("Crosshair", true)
            local Root = Crosshair
            if Root then
                Root = Crosshair:FindFirstChild("Root", true)
            end
            local u333 = {}
            local Pivot = Crosshair
            if Pivot then
                if not Crosshair:IsA("Model") then
                    local Root_2 = Crosshair:FindFirstChild("Root")
                    Pivot = if not Root_2 then nil else if not Root_2:IsA("BasePart") then nil else Root_2.CFrame
                else
                    Pivot = Crosshair:GetPivot()
                end
            end
            local CFrame = if not Root then Pivot else Root.CFrame
            if not Crosshair then
                warn("[Saboteur] Ability cursor: no Crosshair under SaboteurCursor")
            elseif not Pivot then
                warn("[Saboteur] Ability cursor: Crosshair has no pivot (Model or Root part)")
            elseif CFrame then
                local v6 = {"Arrow", "Skull"}
                v4 = nil
                local v7 = nil
                for i, j in v6, v4, v7 do
                    v2 = resolveNamedBasePart(Crosshair, j) or resolveNamedBasePart(v5, j)
                    if not v2 then
                        warn("[Saboteur] Ability cursor: no BasePart named", j)
                    else
                        v3 = CFrame:ToObjectSpace(v2.CFrame)
                        prepareBillboardPart(v2, v5)
                        table.insert(u333, {part = v2, offsetFromRef = v3})
                    end
                end
            else
                warn("[Saboteur] Ability cursor: Crosshair has no pivot (Model or Root part)")
            end
            local u116 = {}
            if Crosshair then
                v4 = {}
                for k, n in u333 do
                    v4[n.part] = true
                end
                for m, i5 in Crosshair:GetDescendants() do
                    if i5:IsA("BasePart") and not v4[i5] and i5 ~= Root then
                        table.insert(u116, {p = i5, size0 = i5.Size, trans0 = i5.Transparency})
                        i5.Size = i5.Size * 0.22
                        i5.Transparency = 1
                        i5.CanCollide = false
                        i5.CanQuery = false
                        i5.CanTouch = false
                    end
                end
            end
            local u175 = 0
            for i6, i7 in u116 do
                table.insert(u84, {p = i7.p, size0 = i7.size0, trans0 = i7.trans0})
            end
            for i8, i9 in u333 do
                table.insert(u85, {p = i9.part, trans0 = i9.part.Transparency})
            end
            v5.Parent = workspace.Terrain
            local Position = a1.Replicator:Get("Position")
            if typeof(Position) ~= "Vector3" then
                Position = a1.Model.PrimaryPart.Position
            end
            u83 = createRangeIndicator(workspace, Position, a1:GetRange(), a1.Model:GetPivot().Position.Y)
            local u230 = 0
            RunService:BindToRenderStep("SaboteurAbilityCursorPivot", Enum.RenderPriority.First.Value, function(a1) -- Line: 626
                -- upvalues: GameState (upval), u175 (ref), u82 (upval), CurrentCamera (upval)
                -- upvalues: PathPlacementCursorController (upval), u230 (ref), u116 (val)
                local v1 = a1 * GameState.TimeScale
                u175 = u175 + v1
                if u82 and CurrentCamera then
                    local p
                    local v2 = PathPlacementCursorController.CurrentPosition + Vector3.new(0, 0.550000011920929, 0)
                    u230 = (u230 + v1 * 2) % 6.283185307179586
                    local v3 = math.clamp(math.clamp((u175 - 0) / 0.34, 0, 1), 0, 1)
                    v3 = (1 - (1 - (1 - v3) * (1 - v3) * (1 - v3))) * 2.8
                    local v4 = v3 + 0.025
                    local v5 = (CFrame.new(v2 + Vector3.new(0, 1, 0) * v4)) * CFrame.Angles(0, u230, 0)
                    u82:PivotTo(v5)
                    local v6 = math.clamp(math.clamp((u175 - 0.04) / 0.2992, 0, 1), 0, 1)
                    v4 = 1 - (1 - v6) * (1 - v6) * (1 - v6)
                    v6 = v4 * 0.78 + 0.22
                    for i, j in u116 do
                        p = j.p
                        if p.Parent then
                            p.Size = j.size0 * v6
                            p.Transparency = math.lerp(1, j.trans0, v4)
                        end
                    end
                    return
                end
            end)
            RunService:BindToRenderStep("SaboteurAbilityCursorBillboard", Enum.RenderPriority.Last.Value, function(a1) -- Line: 664
                -- upvalues: u82 (upval), Crosshair (val), GameState (upval), u333 (val), Root (val), u175 (ref)
                -- upvalues: u77 (upval)
                if u82 and Crosshair and Crosshair.Parent then
                    local CFrame_2, part, v1, v2
                    local v3 = a1 * GameState.TimeScale
                    local CurrentCamera = workspace.CurrentCamera
                    if not CurrentCamera or #u333 == 0 then
                        return
                    end
                    if not Root or not Root.Parent then
                        local v4 = Crosshair
                        if not v4:IsA("Model") then
                            local Root_2 = v4:FindFirstChild("Root")
                            CFrame_2 = if not Root_2 then nil else if not Root_2:IsA("BasePart") then nil else Root_2.CFrame
                        else
                            CFrame_2 = v4:GetPivot()
                        end
                    else
                        CFrame_2 = Root.CFrame
                    end
                    if not CFrame_2 then
                        return
                    end
                    for i, j in u333 do
                        part = j.part
                        if part.Parent then
                            v1 = (i - 1) * 0.04
                            v2 = math.clamp(math.clamp((u175 - v1) / 0.34, 0, 1), 0, 1)
                            v2 = (1 - (1 - (1 - v2) * (1 - v2) * (1 - v2))) * 6.5
                            part.CFrame = part.CFrame:Lerp((CFrame.lookAt(
                                (CFrame_2 * j.offsetFromRef).Position + Vector3.new(0, 1, 0) * v2,
                                CurrentCamera.CFrame.Position,
                                (Vector3.new(0, 1, 0))
                            )) * u77, (math.clamp(v3 * 8, 0, 1)))
                        end
                    end
                    return
                end
            end)
            v1, v2 = TypedPromise.new(function(a1_2, a2, a3) -- Line: 488 -- upvalues: PathPlacementCursorController (upval), a1 (upval), Notification (upval)
                local u4 = nil
                local u11 = PathPlacementCursorController.OnClicked:Once(function(a1_3, a2_2, a3) -- Line: 491
                    -- upvalues: u4 (ref), a1 (upval), Notification (upval), PathPlacementCursorController (upval)
                    -- upvalues: a2 (val), a1_2 (val)
                    if u4 then
                        u4:Disconnect()
                    end
                    local Position = a1.Replicator:Get("Position")
                    if typeof(Position) ~= "Vector3" then
                        Position = a1.Model.PrimaryPart.Position
                    end
                    local Magnitude = (a3 - Position).Magnitude
                    if not (a1:GetRange() < Magnitude) then
                        PathPlacementCursorController:Stop()
                        a1_2(a3)
                        return
                    end
                    Notification.Create({Text = "Out of range!", Color = Color3.fromRGB(236, 0, 0)})
                    PathPlacementCursorController:Stop()
                    a2("Out of range")
                end)
                u4 = PathPlacementCursorController.Canceled:Once(function() -- Line: 515 -- upvalues: u11 (ref), a2 (val)
                    if u11 then
                        u11:Disconnect()
                    end
                    a2("Canceled")
                end)
                PathPlacementCursorController:Start({constrainToPath = true, uiEnabled = false})
                a3(function() -- Line: 527 -- upvalues: u11 (ref), u4 (ref), PathPlacementCursorController (upval)
                    if u11 then
                        u11:Disconnect()
                    end
                    if u4 then
                        u4:Disconnect()
                    end
                    PathPlacementCursorController:Stop()
                end)
            end):await()
            cleanUpAbility()
            if not v1 then
                return false
            end
            v3 = a1:Animate("Ability")
            if v3 and v3:IsA("AnimationTrack") then
                local u284 = (v3:GetMarkerReachedSignal("Sound")):Connect(function(a1_2) -- Line: 715 -- upvalues: a1 (upval), Sounds (upval), playTowerSound (upval) -- types: a1_2: string
                    local v1 = a1
                    if type(a1_2) == "string" then
                        if a1_2 == "" then
                            return
                        end
                        local Default = Sounds[v1.Model.Name] or Sounds.Default
                        if Default[a1_2] == nil then
                            return
                        end
                        playTowerSound(v1, a1_2)
                    end
                end)
                v3.Stopped:Once(function() -- Line: 718 -- upvalues: u284 (val)
                    u284:Disconnect()
                end)
                v3:Play()
            end
            Notification.Create({Text = "Toxic grenade armed!", Color = Color3.fromRGB(0, 255, 0)})
            return {position = v2}
        end,
    }
end

function v1:_face(a2) -- Line: 736 -- types: self: table, a2: vector
    local PrimaryPart = self.Model.PrimaryPart
    local v1 = CFrame.lookAt(PrimaryPart.Position, (Vector3.new(a2.X, PrimaryPart.Position.Y, a2.Z)))
    PrimaryPart.CFrame = v1
    return v1
end

function v1:_fire(a2, a3, a4) -- Line: 744
    -- upvalues: playTowerSound (val), EmitterManager (val), TimescaleUtilities (val)
    local Attribute, v1, v2
    local Weapon = self.Model.Weapon:FindFirstChild("Weapon")
    local Configuration = Weapon and Weapon:FindFirstChildWhichIsA("Configuration")
    local Handle = Weapon and Weapon:FindFirstChild("Handle")
    local Start = Configuration and Configuration:FindFirstChild("Start")
    local Value = if not Start then Handle and Handle:FindFirstChild("Start") else if not Start.Value then Handle and Handle:FindFirstChild("Start") else if not Start.Value:IsA("Attachment") then Handle and Handle:FindFirstChild("Start") else Start.Value
    self:_face(a2)
    self:Animate("Fire")
    playTowerSound(self, "Shoot")
    EmitterManager.manualEmit(Value)
    if not self._adsTimer:isActive() then
        if self._unholsterAnim then
            self._unholsterAnim:Stop()
        end
        self._adsAnim = self:Animate("ADS")
    end
    self._adsTimer:setTime(3)
    local v3 = nil
    local v4 = nil
    local v5, v6 = a4, self
    for i, j in a3, v3, v4 do
        v2 = {Start = Value.WorldPosition, End = j, Spread = 0, Speed = 90}
        Attribute = v6.Model:GetAttribute("BulletColor") or Color3.fromRGB(0, 255, 0)
        v2.Color = Attribute
        v6:Bullet(v2)
    end
    for k, n in v5 do
        v1 = v6.Model.PrimaryPart.HitVFX:Clone()
        v1.Parent = workspace.Terrain
        v1.WorldPosition = n
        EmitterManager.manualEmit(v1)
        TimescaleUtilities.CleanUp(v1, 1)
    end
end

return v1