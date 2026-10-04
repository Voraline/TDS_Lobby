-- Script path: ReplicatedStorage.Client.Modules.Dialogue
-- Decompile time: 6.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ContentProvider = game:GetService("ContentProvider")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Dialog = require(ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Dialog)
local Render = require(ReplicatedStorage.Shared.Modules.Render)
local SettingsController = require(game.ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
require(ReplicatedStorage.Shared.Modules.Thread)
require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local v1 = {
    init = function() -- Line: 17
        -- upvalues: SettingsController (val), ContentProvider (val), Sound (val), ReplicatedStorage (val), table (val)
        -- upvalues: Render (val), Asset (val), Dialog (val)
        local Sound_2
        local Game = SettingsController.Game
        local Folder = Instance.new("Folder")
        Folder.Name = "Dialogue"
        Folder.Parent = workspace.Trash
        for k, v in pairs({8205993275, 8205994112, 8205995648, 8205996251, 8205996909, 8205998012, 8205999648, 8239998643}) do
            Sound_2 = Instance.new("Sound")
            Sound_2.SoundId = "rbxassetid://" .. v
            Sound_2.Parent = Folder
        end
        task.spawn(function() -- Line: 40 -- upvalues: ContentProvider (upval), Folder (val)
            ContentProvider:PreloadAsync((Folder:GetChildren()))
        end)
        local v1 = {
            On = Sound("On", {Properties = {SoundId = 5498725634, Looped = false}}),
            Off = Sound("Off", {Properties = {SoundId = 5498725879, Looped = false}}),
            Blip = Sound("Blip", {Properties = {SoundId = 5903071392, Volume = 0.3, Looped = false}}),
            Static = Sound("Static", {Properties = {SoundId = 5498725335, Looped = true}}),
        }
        local u53 = {
            Commander = {
                Default = 5494488847,
                Scared = 5494489852,
                Aggressive = 5494490771,
                Sneaky = 5499598130,
                Thinking = 5494490317,
                Teach = 5499598515,
                Disappointed = 5499597756,
            },
            ["Giga AJ"] = {Default = 6782390382, Scared = 6782390112, Aggressive = 6782389815},
            ["Void Caster"] = {
                Default = 5666897699,
                Laugh = 5666897534,
                Aggressive = 5666897413,
                Challenge = 5666897090,
                Command = 5666897227,
                Depressed = 5666897326,
                Chant = 5666897830,
            },
            Narrator = {Default = 5886599151, Evil = 5886599496, Sinister = 5886599834},
            Jaxe = {Default = 7894201849, Aggressive = 7894201974, Scared = 7894201679, Taunt = 7894201438},
            ["Swamp Monster"] = {Default = 7894210791, Aggressive = 7894211007, Scared = 7894210628, Taunt = 7894210479},
            Penumbras = {Default = 7894218958, Aggressive = 7894219174, Scared = 7894218734, Taunt = 7894218357},
            ["The Umbra"] = {Default = 7894224041, Aggressive = 7894224207, Scared = 7894223845, Taunt = 7894223537},
        }
        local Dialogue = require(ReplicatedStorage.Shared.Modules.Network).Channel("Dialogue")
        local u107 = {}
        Dialogue:On("Enable", function(a1) -- Line: 142 -- upvalues: table (upval), u107 (val)
            for k, v in pairs(a1) do
                table.insert(u107, table.merge({Wait = 1}, v))
            end
        end)
        Render:Add("Dialogue", Enum.RenderPriority.Last, function() -- Line: 148
            -- upvalues: u107 (val), Asset (upval), Game (val), table (upval), Sound (upval), Dialog (upval), u53 (val)
            local v1 = u107[1]
            if v1 then
                local v2
                local Text = v1.Text
                local Wait = v1.Wait
                local Emotion = v1.Emotion
                local Speaker = v1.Speaker
                local v3 = Asset("Dialog", Speaker, true)
                if v1.Hidden ~= nil then
                    v2 = v1.Hidden == true
                elseif not v3 then
                    v2 = false
                else
                    v2 = true
                    if v3.Hidden ~= true then
                        v2 = false
                    end
                end
                local DisplayName = v1.DisplayName or v3 and v3.DisplayName or Speaker
                if v2 then
                    DisplayName = "???"
                end
                local Voice = v1.Voice
                if not v1.Time then
                    if not Game:Get("Dialog") then
                        table.remove(u107, 1)
                        return nil
                    end
                    v1.Time = tick()
                    if Voice then
                        Sound("Voice", {Tag = "Dialog", Properties = {Volume = 6, SoundId = Voice}}):Play()
                    end
                    Dialog:Appear(true)
                    local v4 = Dialog
                    local merge = table.merge
                    local v5 = {Text = Text, Author = DisplayName}
                    v5.Icon = "rbxassetid://" .. (u53[Speaker] and u53[Speaker][Emotion] or u53[DisplayName] and u53[DisplayName][Emotion] or 0)
                    v4:Write((merge(v5, v1, {Hidden = v2})))
                    return
                end
                if Wait < tick() - v1.Time then
                    table.remove(u107, 1)
                    if not u107[1] then
                        Dialog:Appear(false)
                    end
                end
            end
        end)
    end,
}
task.spawn(v1.init)
return v1