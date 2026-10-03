-- Script path: ReplicatedStorage.Shared.UI.Components.RichText
-- Decompile time: 8.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local TextService = game:GetService("TextService")
local Container = require(script:WaitForChild("Container"))
local Create = require(ReplicatedStorage:WaitForChild("Shared").Modules.Standalone.Create)
local Effects = require(script:WaitForChild("Effects"))
local Parser = require(script:WaitForChild("Parser"))
local Particles = require(script:WaitForChild("Particles"))
local u52 = {}
u52.__index = u52

local function getGraphemes(a1) -- Line: 16 -- types: a1: string
    local v1 = {}
    for i, j in utf8.graphemes(a1) do
        table.insert(v1, (a1:sub(i, j)))
    end
    return v1
end

function u52.new(...) -- Line: 28 -- upvalues: u52 (val)
    local v1 = setmetatable({}, u52)
    v1:init(...)
    return v1
end

function u52:init(a2) -- Line: 38 -- upvalues: Container (val), Create (val)
    self._enabled = a2.enabled or true
    self._rendered = false
    self._particles = nil
    self._centered = a2.centered ~= false
    self._topAligned = a2.topAligned == true
    self._use2DParticles = a2.use2DParticles ~= false
    self._particleScale = a2.particleScale or 1
    self._animate = a2.animate ~= false
    self._text = a2.text or ""
    self._textScale = a2.textScale or 1
    local textSettings = a2.textSettings or {}
    self._textSettings = textSettings
    self._adornee = a2.adornee or nil
    self._onSize = a2.onSize or nil
    self._maxSize = Container(0)
    self._maxGraphemes = a2.MaxVisibleGraphemes or -1
    self._renderables = {}
    self._appliedEffects = {}
    local v1 = {Name = "RichText", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    local v2 = self._centered and UDim2.fromScale(0.5, 0) or UDim2.fromOffset(0, 0)
    v1.Position = v2
    v1.AnchorPoint = self._centered and Vector2.new(0.5, 0) or Vector2.zero
    v1.Parent = a2.Parent
    self._container = Create("Frame", v1)
    self:_render()
end

function u52.ClearParticles(a1) -- Line: 75
    if a1._particles then
        a1._particles:Clear()
    end
end

function u52:_render() -- Line: 82
    -- upvalues: Parser (val), Container (val), Effects (val), Create (val), getGraphemes (val), Particles (val)
    local Ignore2DParticles, TextColor3, Word, v1, v2, v3, v4, v5, v6, v7
    local v8 = self:_clear()
    local v9 = Parser.parseEffects(self._text)
    local v10 = self._textSettings.Font or "GothamBold"
    local v11 = 0
    local Particle = nil
    local v12 = nil
    local v13 = self
    for i, v in ipairs(v9) do
        v1 = {}
        v2 = {v.word}
        v3 = Container(v13._container)
        Word = Container("Word")
        for k, i2 in pairs(v.effects) do
            v4 = Effects[k]
            if v4 then
                v6 = {
                    props = i2,
                    type = Word,
                    labels = Container(v1),
                    adornee = v13._adornee,
                    maxSize = v13._maxSize,
                    container = v3,
                    root = v13._container,
                }
                v7 = {__index = v4}
                v5 = setmetatable(v6, v7)
                Ignore2DParticles = v5.Ignore2DParticles and not v13._adornee
                if v5.Particle and not Ignore2DParticles then
                    Particle = v5.Particle
                    v12 = Container(v1)
                end
                if Word:Get() ~= "Letter" and v5.DesiredType == "Letter" then
                    v7 = Create("Frame", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 1),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Parent = v13._container,
                    })
                    if v5.Particle then
                        v12 = Container({v7})
                    end
                    Word:Set("Letter")
                    v3:Set(v7)
                end
                v.effects[k] = v5
                v13._appliedEffects[v5] = true
            else
                warn("WARNING: RichText Effect " .. k .. " does not exist!")
            end
        end
        if Word:Get() == "Letter" then
            v2 = getGraphemes(v.word)
        end
        for i3, j in ipairs(v2) do
            v11 = v11 + 1
            v6 = {
                RichText = false,
                TextScaled = false,
                TextWrapped = false,
                BackgroundTransparency = 1,
                ZIndex = 999,
                Name = v11,
                Text = j,
                Font = v10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
            }
            TextColor3 = v13._textSettings.TextColor3 or Color3.new(0, 0, 0)
            v6.TextColor3 = TextColor3
            v6.TextTransparency = v13._textSettings.TextTransparency or 0
            v6.Size = UDim2.fromScale(1, 1)
            v6.Parent = v3:Get()
            v4 = Create("TextLabel", v6)
            v4:SetAttribute("BaseText", j)
            table.insert(v1, v4)
        end
        v.render = v1
        table.insert(v8, v)
    end
    local _container = if v12 then v12:Get()[1] else v13._container
    if Particle then
        local _adornee = v13._adornee
        if not _adornee and v13._use2DParticles then
            _adornee = _container
        end
        if _adornee then
            v13._particles = Particles(_adornee, Particle, v13._animate, v13._particleScale)
        end
    end
    v13:_updateRenderPosition()
    v13._rendered = true
    v13:Step(0)
end

function u52:_clear() -- Line: 204
    local _renderables = self._renderables
    if self._particles then
        self._particles:Destroy()
        self._particles = nil
    end
    local v1 = self
    for i, v in ipairs(_renderables) do
        if v.render then
            for i2, i3 in ipairs(v.render) do
                i3:Destroy()
            end
            table.clear(v.render)
        end
    end
    for j in v1._appliedEffects do
        if j.cleanUp then
            j:cleanUp()
        end
    end
    table.clear(v1._appliedEffects)
    table.clear(_renderables)
    return _renderables
end

function u52:_updateRenderPosition() -- Line: 237 -- upvalues: TextService (val), getGraphemes (val)
    local Parent, label, new_2, position, render, result, size, success, v1, v2, v3, v4
    local _centered = self._centered
    local AbsoluteSize = self._container.AbsoluteSize
    local FontSize = self._textSettings.FontSize or AbsoluteSize.Y * self._textScale
    local v5 = 0
    local v6 = 0
    local _maxGraphemes = self._maxGraphemes
    local v7 = _maxGraphemes > -1
    local v8 = {}
    local v9 = {}
    local v10 = math.clamp(FontSize, 4, 100)
    local v11 = self
    for i, v in ipairs(self._renderables) do
        v1 = ipairs
        render = v.render or {}
        for i2, i3 in v1(render) do
            local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
            GetTextBoundsParams.Text = i3.Text
            GetTextBoundsParams.Font = i3.FontFace
            GetTextBoundsParams.Size = v10
            GetTextBoundsParams.Width = AbsoluteSize.X
            success, result = pcall(function() -- Line: 259 -- upvalues: TextService (upval), GetTextBoundsParams (val)
                return TextService:GetTextBoundsAsync(GetTextBoundsParams)
            end)
            if success then
                table.insert(v8, {label = i3, size = result, position = v5})
                v5 = v5 + (result.X + 0)
                GetTextBoundsParams:Destroy()
            end
        end
    end
    for i4, j in ipairs(v8) do
        label = j.label
        position = j.position
        size = j.size
        v2 = v6
        v6 = v6 + #getGraphemes(label.Text)
        label.TextSize = v10
        label.Size = UDim2.fromOffset(size.X, size.Y)
        label.AnchorPoint = Vector2.new(0, if not v11._topAligned then 0.5 else 0)
        new_2 = UDim2.new
        v4 = if not v11._topAligned then 0.5 else 0
        label.Position = new_2(if not _centered then 0 else 0.5, _centered and position - v5 / 2 or position, v4, 0)
        if label.Parent == v11._container then
            if not v7 or v6 < _maxGraphemes then
                label.MaxVisibleGraphemes = -1
            elseif not (v2 < _maxGraphemes) then
                label.MaxVisibleGraphemes = 0
            else
                label.MaxVisibleGraphemes = _maxGraphemes - v2
            end
            label:SetAttribute("BaseSize", label.Size)
            label:SetAttribute("BaseTextSize", label.TextSize)
            label:SetAttribute("BasePosition", label.Position)
        else
            Parent = label.Parent
            if Parent then
                if not v9[Parent] then
                    v9[Parent] = true
                    Parent.Position = label.Position
                end
                v3 = label.Position - Parent.Position
                Parent.Size = UDim2.new(0, v3.X.Offset + size.X, 1, 0)
                label.Position = UDim2.new(0, v3.X.Offset, if not v11._topAligned then 0.5 else 0, 0)
                label.AnchorPoint = Vector2.new(0, if not v11._topAligned then 0.5 else 0)
                if not v7 or v6 < _maxGraphemes then
                    label.MaxVisibleGraphemes = -1
                elseif not (v2 < _maxGraphemes) then
                    label.MaxVisibleGraphemes = 0
                else
                    label.MaxVisibleGraphemes = _maxGraphemes - v2
                end
                label:SetAttribute("BaseSize", label.Size)
                label:SetAttribute("BaseTextSize", label.TextSize)
                label:SetAttribute("BasePosition", label.Position)
            end
        end
    end
    v11._maxSize:Set(v5)
    if v11._onSize then
        v11._onSize(v5, AbsoluteSize.Y)
    end
end

function u52:Destroy() -- Line: 344
    self:_clear()
    self._container:Destroy()
    if self._particles then
        self._particles:Destroy()
        self._particles = nil
    end
    table.clear(self)
    setmetatable(self, nil)
end

function u52.SetText(a1, a2) -- Line: 358
    a1._text = a2
    a1:_render()
    return a1
end

function u52.SetMaxVisibleGraphemes(a1, a2) -- Line: 364 -- types: a1: table, a2: number
    a1._maxGraphemes = math.max(-1, a2)
    a1:_updateRenderPosition()
    return a1
end

function u52.SetTextScale(a1, a2) -- Line: 371
    a1._textScale = a2
    a1:_render()
    return a1
end

function u52.SetEnabled(a1, a2) -- Line: 378 -- types: a1: table, a2: boolean
    if a1._enabled == a2 then
        return
    end
    local _container = a1._container
    local _particles = a1._particles
    local _billboard = a1._billboard
    if _container then
        _container.Visible = a2
    end
    if _billboard then
        _billboard.Enabled = a2
    end
    if _particles then
        if not a2 then
            _particles:Disable()
        else
            _particles:Enable()
        end
    end
    a1._enabled = a2
end

function u52:Step(a2) -- Line: 407 -- types: self: table, a2: number
    if self._enabled and self._rendered then
        local effects
        local v1, v2 = self, a2
        for k, v in pairs(self._renderables) do
            effects = v.effects
            if effects and next(effects) then
                for k2, i in pairs(effects) do
                    if not i.render or i:render(v2) == true or not v1._animate then
                        effects[k2] = nil
                    end
                end
            end
        end
        if v1._particles then
            v1._particles:Update(v2)
        end
        if v1._lastSize == v1._container.AbsoluteSize then
            return
        end
        v1:_updateRenderPosition()
        v1._lastSize = v1._container.AbsoluteSize
        return v1:Step(0)
    end
    return nil
end

return function(...) -- Line: 443 -- upvalues: u52 (val)
    return u52.new(...)
end