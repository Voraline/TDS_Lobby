-- Script path: ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.WorldCursor
-- Decompile time: 10.97 ms

local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Charm = require(ReplicatedStorage.Packages.Charm)
local FastSignal = require(ReplicatedStorage.Shared.Modules.FastSignal)
local ViewStateStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ViewStateStore)
local atom = Charm.atom
local subscribe = Charm.subscribe
local untracked = Charm.untracked
local CurrentCamera = workspace.CurrentCamera
return {
    WorldObjects = {},
    Atoms = {
        Enabled = atom(false),
        Object = atom(nil),
        SkillEnum = atom(nil),
        IsActive = atom(false),
        IsHovering = atom(false),
        IsHeldDown = atom(false),
        _heldDown = atom(false),
    },
    Events = {
        Activated = FastSignal.new(),
        MouseEnter = FastSignal.new(),
        MouseLeave = FastSignal.new(),
        MouseDown = FastSignal.new(),
        MouseUp = FastSignal.new(),
    },
    Input = {},
    Init = function(a1) -- Line: 79
        a1:_initSubscriptions()
    end,
    AddWorldObject = function(a1, a2) -- Line: 83 -- types: a1: table, a2: userdata
        table.insert(a1.WorldObjects, a2)
    end,
    Enable = function(a1) -- Line: 87 -- upvalues: UserInputService (val), untracked (val)
        a1.Atoms.Enabled(true)
        a1:ResumeInput()
        a1.Input.InputBegan = UserInputService.InputBegan:Connect(function(a1_2, a2) -- Line: 93 -- upvalues: untracked (upval), a1 (val) -- types: a1_2: userdata, a2: boolean
            if not untracked(a1.Atoms.IsActive) then
                return
            end
            if a1_2.KeyCode == Enum.KeyCode.ButtonA then
                a1.Atoms._heldDown(true)
                return
            end
            if a2 then
                return
            end
            if a1_2.UserInputType == Enum.UserInputType.MouseButton1
                or a1_2.UserInputType == Enum.UserInputType.Touch
                or a1_2.KeyCode == Enum.KeyCode.ButtonA then
                a1.Atoms._heldDown(true)
            end
        end)
        a1.Input.InputEnded = UserInputService.InputEnded:Connect(function(a1_2, a2) -- Line: 119 -- upvalues: untracked (upval), a1 (val) -- types: a1_2: userdata, a2: boolean
            if not untracked(a1.Atoms.IsActive) then
                return
            end
            if a1_2.KeyCode == Enum.KeyCode.ButtonA then
                a1.Atoms._heldDown(false)
                return
            end
            if a2 then
                return
            end
            if a1_2.UserInputType == Enum.UserInputType.MouseButton1
                or a1_2.UserInputType == Enum.UserInputType.Touch
                or a1_2.KeyCode == Enum.KeyCode.ButtonA then
                a1.Atoms._heldDown(false)
            end
        end)
    end,
    Disable = function(a1) -- Line: 144
        a1.Atoms.Enabled(false)
    end,
    PauseInput = function(a1, a2) -- Line: 148 -- types: a1: table, a2: boolean?
        a1.OverridenByUI = a2 or false
        a1.Atoms.IsActive(false)
    end,
    ResumeInput = function(self) -- Line: 153
        self.OverridenByUI = false
        self.Atoms.IsActive(true)
    end,
    IsHovering = function(a1) -- Line: 158 -- upvalues: untracked (val)
        return untracked(a1.Atoms.IsHovering)
    end,
    _initSubscriptions = function(self) -- Line: 162 -- upvalues: subscribe (val), untracked (val)
        subscribe(self.Atoms.Enabled, function(a1, a2) -- Line: 163 -- upvalues: self (val)
            if a1 then
                self:_setEnabled()
                return
            end
            self:_setDisabled()
        end)
        subscribe(self.Atoms.IsHeldDown, function(a1, a2) -- Line: 171 -- upvalues: untracked (upval), self (val)
            if not untracked(self.Atoms.IsActive) then
                return
            end
            if a1 then
                self.Events.MouseDown:Fire((untracked(self.Atoms.Object)))
                return
            end
            self.Events.MouseUp:Fire((untracked(self.Atoms.Object)))
            self.Events.Activated:Fire((untracked(self.Atoms.Object)))
        end)
        subscribe(self.Atoms.Object, function(a1, a2) -- Line: 184 -- upvalues: self (val), untracked (upval)
            if a2 then
                self.Events.MouseLeave:Fire(a2)
            end
            if a1 then
                self.Atoms.IsHovering(true)
                self.Atoms.SkillEnum(a1.Name)
                self.Events.MouseEnter:Fire((untracked(self.Atoms.Object)))
                return
            end
            self.Atoms.IsHovering(false)
            self.Atoms.SkillEnum(nil)
            self.Events.MouseLeave:Fire()
        end)
        subscribe(self.Atoms.IsActive, function(a1, a2) -- Line: 199 -- upvalues: self (val)
            if not a1 then
                self.Atoms._heldDown(false)
                self.Atoms.IsHovering(false)
                self.Atoms.IsHeldDown(false)
                self.Atoms.Object(nil)
            end
        end)
    end,
    _getRayResult = function(self, a2) -- Line: 209 -- upvalues: CurrentCamera (val) -- types: self: table, a2: userdata
        local v1 = CurrentCamera:ScreenPointToRay(a2.X, a2.Y)
        local v2 = RaycastParams.new()
        v2.FilterDescendantsInstances = self.WorldObjects
        v2.FilterType = Enum.RaycastFilterType.Include
        return workspace:Raycast(v1.Origin, v1.Direction * 1000, v2)
    end,
    _setEnabled = function(self) -- Line: 219
        -- upvalues: RunService (val), untracked (val), UserInputService (val), GuiService (val), ViewStateStore (val)
        self.RenderConnection = RunService.RenderStepped:Connect(function() -- Line: 220
            -- upvalues: untracked (upval), self (val), UserInputService (upval), GuiService (upval)
            -- upvalues: ViewStateStore (upval)
            if not untracked(self.Atoms.IsActive) then
                self.Atoms.Object(nil)
                self.Atoms.IsHovering(false)
                self.Atoms.IsHeldDown(false)
                return
            end
            local Position = nil
            if UserInputService:GetMouseDelta() then
                Position = (UserInputService:GetMouseLocation()) - GuiService:GetGuiInset()
            elseif UserInputService.TouchEnabled then
                local Touches = UserInputService:GetTouches()
                if #Touches > 0 then
                    Position = Touches[1].Position
                end
            end
            if not Position then
                return
            end
            local v1 = #ViewStateStore.getPrompts()
            local v2 = self:_getRayResult((Vector2.new(Position.X, Position.Y)))
            if not v2 or v1 ~= 0 then
                self.Atoms.Object(nil)
                self.Atoms.IsHovering(false)
            else
                self.Atoms.Object(v2.Instance)
                self.Atoms.IsHovering(true)
            end
            if untracked(self.Atoms._heldDown) then
                self.Atoms.IsHeldDown(true)
                return
            end
            self.Atoms.IsHeldDown(false)
        end)
    end,
    _setDisabled = function(self) -- Line: 263
        if self.RenderConnection then
            self.RenderConnection:Disconnect()
        end
        self.Atoms.Object(nil)
        self.RenderConnection = nil
    end,
}