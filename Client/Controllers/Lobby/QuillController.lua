-- Script path: ReplicatedStorage.Client.Controllers.Lobby.QuillController
-- Decompile time: 0.68 ms

local Packages = game:GetService("ReplicatedStorage").Packages
local Quill = Packages.Quill
local v1 = require(Quill)
v1.init({
    sounds = {dialogBlip = "rbxassetid://123456789"},
    dependencies = {
        Charm = Packages.Charm,
        Promise = Packages.Promise,
        React = Packages.React,
        ReactFlow = Packages.ReactFlow,
        ReactRoblox = Packages.ReactRoblox,
    },
})
v1.start()
return nil