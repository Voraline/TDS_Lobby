-- Script path: ReplicatedStorage.Client.Controllers.Shared.AnnouncementController
-- Decompile time: 1.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local v1 = {}

local function getRGB(a1) -- Line: 8 -- types: a1: userdata
    return (("rgb(%*,%*,%*)"):format(math.floor(a1.R * 255), math.floor(a1.G * 255), (math.floor(a1.B * 255))))
end

function v1.init() -- Line: 16 -- upvalues: NewNetwork (val), TextChatService (val)
    (NewNetwork.Channel("Announcement")):onUnreliableEvent("DisplayAnnouncement", function(a1, a2, a3) -- Line: 19 -- upvalues: TextChatService (upval) -- types: a1: string, a2: userdata?, a3: boolean?
        local v1 = a2 or Color3.fromRGB(255, 0, 0)
        local TextChannels = TextChatService:FindFirstChild("TextChannels")
        local RBXSystem = TextChannels and TextChannels:FindFirstChild("RBXSystem")
        local v2 = Color3.fromRGB(255, 255, 255)
        RBXSystem:DisplaySystemMessage((("%*<font color=\"%*\">%*</font>"):format(
            if not a3 then ("<font color=\"%*\" face=\"Montserrat\" size=\"14\"><b>[Server]</b></font> "):format((("rgb(%*,%*,%*)"):format(math.floor(v1.R * 255), math.floor(v1.G * 255), (math.floor(v1.B * 255))))) else "",
            ("rgb(%*,%*,%*)"):format(math.floor(v2.R * 255), math.floor(v2.G * 255), (math.floor(v2.B * 255))),
            a1
        )))
    end)
end

task.spawn(v1.init)
return v1