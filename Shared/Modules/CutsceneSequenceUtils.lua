-- Script path: ReplicatedStorage.Shared.Modules.CutsceneSequenceUtils
-- Decompile time: 6.85 ms

local v1 = {}

local function getCutsceneName(a1) -- Line: 19
    if type(a1) == "string" and a1 ~= "" then
        return a1
    end
    if type(a1) == "table" and type(a1.Name) == "string" and a1.Name ~= "" then
        return a1.Name
    end
    return nil
end

local function addItem(a1, a2, a3, a4) -- Line: 31 -- types: a1: table, a2: string, a3: string, a4: string
    table.insert(a1, {Label = a3, RawId = a2, PackageName = a2, Trigger = a4})
end

local function addWaveCutscene(a1, a2, a3, a4) -- Line: 40 -- types: a1: table, a2: number, a4: string
    local Name_2
    if not (if type(a3) ~= "string" then if type(a3) ~= "table" then nil else if type(a3.Name) ~= "string" then nil else if a3.Name == "" then nil else a3.Name else if a3 ~= "" then a3 else if type(a3) ~= "table" then nil else if type(a3.Name) ~= "string" then nil else if a3.Name == "" then nil else a3.Name) then
        return
    end
    table.insert(a1, {
        Label = ("Wave %* %*"):format(a2, (string.lower(a4))),
        RawId = Name_2,
        PackageName = Name_2,
        Trigger = ("Wave %* / %*"):format(a2, a4),
    })
end

function v1.FromWaveLayout(a1, a2, a3) -- Line: 59 -- types: a1: string, a2: string
    local Name_10
    if type(a3) ~= "table" then
        return nil
    end
    local v1 = {}
    local Waves = a3.Waves
    if type(Waves) == "table" then
        local CutScene, CutScene_2, Enemies, Name_2, Name_4, Name_6, Name_8, Timing, Unspecified, WaveTimeline, v2, v3
        for i, v in ipairs(Waves) do
            if type(i) == "number" and type(v) == "table" then
                CutScene = v.CutScene
                Timing = not (type(CutScene) ~= "table") and CutScene.Timing or nil
                if Timing == 1 then
                    Name_2 = if type(CutScene) ~= "string" then if type(CutScene) ~= "table" then nil else if type(CutScene.Name) ~= "string" then nil else if CutScene.Name == "" then nil else CutScene.Name else if CutScene ~= "" then CutScene else if type(CutScene) ~= "table" then nil else if type(CutScene.Name) ~= "string" then nil else if CutScene.Name == "" then nil else CutScene.Name
                    if Name_2 then
                        v2 = string.lower("Pre-wave")
                        table.insert(v1, {
                            Label = ("Wave %* %*"):format(i, v2),
                            RawId = Name_2,
                            PackageName = Name_2,
                            Trigger = ("Wave %* / Pre-wave"):format(i),
                        })
                    end
                end
                WaveTimeline = v.WaveTimeline
                Enemies = not (type(WaveTimeline) ~= "table") and WaveTimeline.Enemies or nil
                if type(Enemies) == "table" then
                    for i2, i3 in ipairs(Enemies) do
                        if type(i3) ~= "table" then
                            Name_4 = nil
                        else
                            CutScene_2 = i3.CutScene
                            Name_4 = (if type(CutScene_2) ~= "string" then if type(CutScene_2) ~= "table" then nil else if type(CutScene_2.Name) ~= "string" then nil else if CutScene_2.Name == "" then nil else CutScene_2.Name else if CutScene_2 ~= "" then CutScene_2 else if type(CutScene_2) ~= "table" then nil else if type(CutScene_2.Name) ~= "string" then nil else if CutScene_2.Name == "" then nil else CutScene_2.Name) or nil
                        end
                        if Name_4 then
                            table.insert(v1, {
                                Label = ("Wave %* enemy %*"):format(i, i2),
                                RawId = Name_4,
                                PackageName = Name_4,
                                Trigger = ("Wave %* / Enemy %*"):format(i, i2),
                            })
                        end
                    end
                end
                if Timing == 2 then
                    Name_6 = if type(CutScene) ~= "string" then if type(CutScene) ~= "table" then nil else if type(CutScene.Name) ~= "string" then nil else if CutScene.Name == "" then nil else CutScene.Name else if CutScene ~= "" then CutScene else if type(CutScene) ~= "table" then nil else if type(CutScene.Name) ~= "string" then nil else if CutScene.Name == "" then nil else CutScene.Name
                    if Name_6 then
                        v3 = string.lower("Post-wave")
                        table.insert(v1, {
                            Label = ("Wave %* %*"):format(i, v3),
                            RawId = Name_6,
                            PackageName = Name_6,
                            Trigger = ("Wave %* / Post-wave"):format(i),
                        })
                    end
                elseif CutScene and Timing ~= 1 then
                    Name_8 = if type(CutScene) ~= "string" then if type(CutScene) ~= "table" then nil else if type(CutScene.Name) ~= "string" then nil else if CutScene.Name == "" then nil else CutScene.Name else if CutScene ~= "" then CutScene else if type(CutScene) ~= "table" then nil else if type(CutScene.Name) ~= "string" then nil else if CutScene.Name == "" then nil else CutScene.Name
                    if Name_8 then
                        Unspecified = string.lower("Unspecified")
                        table.insert(v1, {
                            Label = ("Wave %* %*"):format(i, Unspecified),
                            RawId = Name_8,
                            PackageName = Name_8,
                            Trigger = ("Wave %* / Unspecified"):format(i),
                        })
                    end
                end
            end
        end
    end
    local ExtraOptions = a3.ExtraOptions
    if type(ExtraOptions) ~= "table" then
        Name_10 = nil
    else
        local WinCutScene = ExtraOptions.WinCutScene
        Name_10 = (if type(WinCutScene) ~= "string" then if type(WinCutScene) ~= "table" then nil else if type(WinCutScene.Name) ~= "string" then nil else if WinCutScene.Name == "" then nil else WinCutScene.Name else if WinCutScene ~= "" then WinCutScene else if type(WinCutScene) ~= "table" then nil else if type(WinCutScene.Name) ~= "string" then nil else if WinCutScene.Name == "" then nil else WinCutScene.Name) or nil
    end
    if Name_10 then
        table.insert(v1, {Label = "Win cutscene", Trigger = "Match / Win", RawId = Name_10, PackageName = Name_10})
    end
    if #v1 == 0 then
        return nil
    end
    return {Key = ("%*/%*"):format(a1, a2), DisplayName = ("%* / %*"):format(a1, a2), Items = v1}
end

function v1.FromStoryChapter(a1, a2) -- Line: 126 -- types: a1: string
    if type(a2) == "table" and type(a2.Cutscenes) == "table" then
        local AfterMission, BeforeMission, CutsceneName, Name_2, v1
        local v2 = {}
        local v3 = a1
        for i, v in ipairs(a2.Cutscenes) do
            if type(v) == "table" then
                CutsceneName = v.CutsceneName
                Name_2 = if type(CutsceneName) ~= "string" then if type(CutsceneName) ~= "table" then nil else if type(CutsceneName.Name) ~= "string" then nil else if CutsceneName.Name == "" then nil else CutsceneName.Name else if CutsceneName ~= "" then CutsceneName else if type(CutsceneName) ~= "table" then nil else if type(CutsceneName.Name) ~= "string" then nil else if CutsceneName.Name == "" then nil else CutsceneName.Name
                if Name_2 then
                    BeforeMission = v.BeforeMission
                    AfterMission = v.AfterMission
                    v1 = if type(BeforeMission) ~= "number" then if v.TutorialIntro ~= true then if type(AfterMission) ~= "number" then "Story sequence" else ("After Mission %*"):format(AfterMission) else "New player tutorial" else ("Before Mission %*"):format(BeforeMission)
                    table.insert(v2, {
                        Label = v.Title or ("Cutscene %*"):format(i),
                        RawId = Name_2,
                        PackageName = Name_2,
                        Trigger = v1,
                    })
                end
            end
        end
        if #v2 == 0 then
            return nil
        end
        return {
            Key = ("StoryMode/%*/Cinematics"):format(v3),
            DisplayName = ("StoryMode / %* Cinematics"):format(v3),
            Items = v2,
        }
    end
    return nil
end

function v1.ResolvePackageNames(a1, a2) -- Line: 168 -- types: a1: table, a2: function
    local RawId, v1, v2
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        v1 = nil
        v2 = nil
        for k, n in j.Items, v1, v2 do
            RawId = a2(n.RawId) or n.RawId
            n.PackageName = RawId
        end
    end
end

return v1