-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.79.0
-- Decompile time: 1.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "👻 NULL & VOID - NIGHT 3 🎃",
    ImageId = 80938705941296,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "👻 Null & Void Night 3 is LIVE! 👻",
                        HeaderSubject = "All paths meet at this crossroads, as the inevitable draws near. The final showdown between the Rift Walker, Children of EXO, and T.D.S shall commence. Commander, <font color=\"rgb(224,0,75)\">will you save THE META?</font>",
                        Points = {
                            "Defend against 30 waves or be erased from existence!",
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 80938705941296,
                                    Text = "Night 3 Hard and Easy are live!",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🏆 Event Achievements",
                        HeaderSubject = "Claim rewards by completing special Night challenges!",
                        Points = {
                            "<b>Defender</b> — Triumph on Night 1 Easy | 150 Coins / 1x <font color=\"rgb(80,200,255)\">Spin Ticket</font> / 1x <font color=\"rgb(80,255,200)\">Time Scale Ticket</font>",
                            "<b>Breached</b> — Triumph on Night 1 Hard | 300 Coins / 2x <font color=\"rgb(80,200,255)\">Spin Ticket</font> / 2x <font color=\"rgb(80,255,200)\">Time Scale Ticket</font> / 1x <font color=\"rgb(180,100,255)\">Unholy Storm</font>",
                            "<b>Interdimensional Explorer</b> — Triumph on Night 2 Easy | 250 Coins / 1x <font color=\"rgb(80,200,255)\">Spin Ticket</font> / 1x <font color=\"rgb(80,255,200)\">Time Scale Ticket</font>",
                            "<b>Cosmic Drifter</b> — Triumph on Night 2 Hard | 500 Coins / 2x <font color=\"rgb(80,200,255)\">Spin Ticket</font> / 2x <font color=\"rgb(80,255,200)\">Time Scale Ticket</font> / 2x <font color=\"rgb(180,100,255)\">Unholy Storm</font>",
                            "<b>Cult Destroyer</b> — Triumph on Night 3 Easy | 500 Coins / 1x <font color=\"rgb(80,200,255)\">Spin Ticket</font> / 1x <font color=\"rgb(80,255,200)\">Time Scale Ticket</font>",
                            "<b>Exo’s Nemesis</b> — Triumph on Night 3 Hard | 1000 Coins / 2x <font color=\"rgb(80,200,255)\">Spin Ticket</font> / 2x <font color=\"rgb(80,255,200)\">Time Scale Ticket</font> / 4x <font color=\"rgb(180,100,255)\">Unholy Storm</font>",
                            "<b>Evil Within</b> — Night 3 Hard using the Event Tower (Warlock) | 750 Coins / 2x <font color=\"rgb(80,200,255)\">Spin Ticket</font> / 2x <font color=\"rgb(80,255,200)\">Time Scale Ticket</font>",
                            "<b>Death Touched</b> — Any Night on Hard with the <b>“Death”</b> curse | 1000 Coins / 2x <font color=\"rgb(80,200,255)\">Spin Ticket</font> / 5x <font color=\"rgb(180,100,255)\">Unholy Storm</font> / 10x <font color=\"rgb(150,50,200)\">Necromancer’s Tome</font> / <font color=\"rgb(255,60,60)\">Banned Crate</font>",
                            "<b>Against the Odds!</b> — Night 3 Hard with <b>no Exclusive or Hardcore</b> towers | 800 Coins / 2x <font color=\"rgb(80,200,255)\">Spin Ticket</font> / 2x <font color=\"rgb(180,100,255)\">Unholy Storm</font> / 5x <font color=\"rgb(150,50,200)\">Necromancer’s Tome</font> / <font color=\"rgb(255,60,60)\">Banned Crate</font>",
                            "More achievements and badges coming soon!",
                            "Triumphs of All Nights very soon!",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Warlock on sale!",
                        HeaderSubject = "A hybrid melee and ranged tower that fights with eldritch magic. Capable of knocking back enemies and applying bleed.",
                        Points = {"You can also earn this by defeating all 3 nights on Hard mode!"},
                    },
                },
                {
                    Type = "Items",
                    Props = {
                        Items = {{Type = "tower", Name = "Warlock", Skin = "Default", Details = "Warlock"}},
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 1558344290}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔨 Major Optimizations Pt. 2",
                        HeaderSubject = "After all the challenges, <b>Roblox</b> has been a <i>huge</i> help in guiding us to improve performance even further! 💪 <b>Big thanks</b> to their team for the continued support, things are running smoother than ever! 🚀",
                        Points = {},
                    },
                },
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Warlock",
                        Points = {
                            "Tower Limit: 4",
                            "Lv. 2: Hidden Detection",
                            "Lv. 0 Cost: 4200",
                            "Lv. 1 Cost: 2500",
                            "Lv. 2 Cost: 6800",
                            "Lv. 3 Cost: 12000",
                            "Lv. 4 Cost: 18500",
                            "Lv. 5 Cost: 28000",
                            "Lv. 0 Ranged Damage: 25",
                            "Lv. 1 Ranged Damage: 40",
                            "Lv. 2 Ranged Damage: 60",
                            "Lv. 3 Ranged Damage: 115",
                            "Lv. 4 Ranged Damage: 200",
                            "Lv. 5 Ranged Damage: 260",
                            "Lv. 0 Ranged Cooldown: 1.1s",
                            "Lv. 1 Ranged Cooldown: 1.1s",
                            "Lv. 2 Ranged Cooldown: 0.8s",
                            "Lv. 3 Ranged Cooldown: 0.8s",
                            "Lv. 4 Ranged Cooldown: 0.75s",
                            "Lv. 5 Ranged Cooldown: 0.6s",
                            "Lv. 0 Projectile Range: 19",
                            "Lv. 1 Projectile Range: 20",
                            "Lv. 2 Projectile Range: 23",
                            "Lv. 3 Projectile Range: 23",
                            "Lv. 4 Projectile Range: 24",
                            "Lv. 5 Projectile Range: 26",
                            "Lv. 0 Melee Damage: 50",
                            "Lv. 1 Melee Damage: 85",
                            "Lv. 2 Melee Damage: 150",
                            "Lv. 3 Melee Damage: 250",
                            "Lv. 4 Melee Damage: 400",
                            "Lv. 5 Melee Damage: 750",
                            "Lv. 0 Melee Cooldown: 2s",
                            "Lv. 1 Melee Cooldown: 2s",
                            "Lv. 2 Melee Cooldown: 2s",
                            "Lv. 3 Melee Cooldown: 1.8s",
                            "Lv. 4 Melee Cooldown: 1.8s",
                            "Lv. 5 Melee Cooldown: 1.8s",
                            "Lv. 0 Melee Range: 7",
                            "Lv. 1 Melee Range: 7",
                            "Lv. 2 Melee Range: 7.5",
                            "Lv. 3 Melee Range: 7.5",
                            "Lv. 4 Melee Range: 8",
                            "Lv. 5 Melee Range: 9",
                            "Lv. 0 Melee Max Hits: 2",
                            "Lv. 1 Melee Max Hits: 2",
                            "Lv. 2 Melee Max Hits: 2",
                            "Lv. 3 Melee Max Hits: 2",
                            "Lv. 4 Melee Max Hits: 3",
                            "Lv. 5 Melee Max Hits: 3",
                            "Lv. 2 Knockback Force: 20",
                            "Lv. 3 Knockback Force: 22.5",
                            "Lv. 4 Knockback Force: 30",
                            "Lv. 5 Knockback Force: 37.5",
                            "Lv. 4 Melee Bleed Stacks: 3",
                            "Lv. 5 Melee Bleed Stacks: 6",
                        },
                    },
                },
            },
        },
    },
}