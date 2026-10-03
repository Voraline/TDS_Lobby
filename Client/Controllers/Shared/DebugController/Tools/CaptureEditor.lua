-- Script path: ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.CaptureEditor
-- Decompile time: 1.64 ms

local Players = game:GetService("Players")
require(script.Parent.Types)
local u10 = nil
local u11 = {Name = "Capture Editor"}

function u11.canRun() -- Line: 10
    return workspace:FindFirstChild("Type").Value == "Game"
end

function u11.createWindows() -- Line: 14 -- upvalues: u10 (ref), u11 (val), Players (val)
    u10.Window({[u10.Args.Window.Title] = "Capture Editor"}, {
        size = u10.State(Vector2.new(400, 200)),
        position = u10.State(Vector2.new(600, 450)),
    })
    u10.SameLine()
    if u10.Button({"Toggle Players"}).clicked() then
        local v1
        u11.togglePlayers:set(not (u11.togglePlayers:get()))
        for i, j in Players:GetPlayers() do
            if j.Character then
                for k, n in j.Character:GetDescendants() do
                    if n:IsA("BasePart") or n:IsA("Decal") or n:IsA("ParticleEmitter") then
                        v1 = if not u11.togglePlayers:get() then 0 else 1
                        n.LocalTransparencyModifier = v1
                    end
                end
            end
        end
    end
    if u10.Button({"Toggle Season Currency"}).clicked() then
        print("TODO: hide season currency")
    end
    if u10.Button({"Toggle Cash UI"}).clicked() then
        u11.toggleCashUI:set(not (u11.toggleCashUI:get()))
    end
    u10.End()
    u10.SameLine()
    if u10.Button({"Toggle Highlights"}).clicked() then
        u11.toggleHighlights:set(not (u11.toggleHighlights:get()))
    end
    u10.End()
    u10.End()
end

function u11.init() -- Line: 66 -- upvalues: u10 (ref), u11 (val)
    u10 = u11.Iris
    u11.togglePlayers = u10.State(false)
    u11.toggleCashUI = u10.State(false)
    u11.toggleHighlights = u10.State(false)
end

return u11