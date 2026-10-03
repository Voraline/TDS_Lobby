-- Script path: ReplicatedStorage.Content.NewEnemies.Void Caster.Stats
-- Decompile time: 0.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Before there was anything to call the Old World, the Void was already waiting in the dark. It cannot be considered a place or a creature, but something else entirely. It is a quiet hunger that lurks beneath the notice of every being, the presence that can be felt when nothing is around. The pale flora that blooms in a place where nothing exists is where it finds its peace. It is of one mind, though it wears a thousand faces. One could call it an incurable infection.\n\nThe brothers feared it, and even Lord Exo and Two X, who feared so little, understood that there was no killing a thing without a body. For the first and final time, they drove it deep down into the foundations of the world, into a dark so total its song could never be heard again. There were a handful of witnesses to this event, but all knew that the Void was only contained, not gone. They all knew the difference, and never spoke of it again.\n\nSomewhere in time within the Void, a flower grew, blossoming with a vibrant hue of purple. It was beautiful. From it grew a vessel, and soon, it grew a voice. The child opened her eyes to find nothing but darkness, and smiled the widest smile. Looking down, she picked up a fallen petal from where she grew and crushed it within her palm. The falling dust scattered through the empty wind, and suddenly flora began to grow. The child was not the Void. The child called it Mother. What she did know was that she was the Void Caster, the daughter of the Void.\n\nOnce Lord Exo learned of her existence, he saw an opportunity. He did not trust her so much as he used her. When the war between him and Two X began, he unearthed the Void and offered a deal to the Void Caster. She would walk beside him as his prized General, and in return the flora of the Void would take root in every realm and bloom. She still intends to keep that promise.\n\nWhen Lord Exo was sealed away, Two X turned his attention to the Void itself, hunting it throughout the Nil Zone. So the Void slunk back into the depths from which it was sealed, and the Void Caster went to the one place Two X would never follow. Straight into the heart of the Void itself. Even he would not set foot there. Even though a God cannot be killed, there are things worse than death that the Void was patiently waiting to do.\n\nThe Meta exists everywhere across the entire Nil Zone, but it was not until the Rift Walker fell and the realms began to destabilize that the seams gave. Holes formed that connected the two worlds, and through the thinnest of those tears the Void crept out once more. In the barrens of the Nil Zone, where there was once life, a single lone flower blossomed from the earth.\n\nTo kill the Void Caster is to misunderstand what she is. The body may no longer exist, and her song may go quiet for a while. But deep within the dark, it will begin again. At best, all one can do is send her home to Mother.",
    Health = 650000,
    Speed = 1.5,
    Reward = 1100000,
    RewardThreshold = 0.25,
    ReviveHealthPercent = 0.35,
    FinalReviveHealthPercent = 0.2,
    ReviveChargeTime = 12,
    GameModesDisplayOverride = {"Voidcore"},
    Rage = {HealthPercent = 0.4, Speed = 1, SummonCooldown = 10, ShieldCooldown = 14},
    ShieldAbility = {Cooldown = 45, Duration = 4, WaitDuration = 3, ShieldAmount = 40000},
    Summon = {
        Cooldown = 125,
        Duration = 16,
        BurstMin = 22,
        BurstMax = 22,
        PortalLifespanMin = 4,
        PortalLifespanMax = 4,
        Radius = 10,
        EndOfPathThreshold = 50,
        Spawns = {
            {
                Content = "Elite Void Rusher",
                Chance = 25,
                DelayMin = 0.03,
                DelayMax = 0.03,
                SpawnMax = 6,
            },
            {
                Content = "Unknown Small",
                Chance = 15,
                DelayMin = 0.15,
                DelayMax = 0.15,
                SpawnMax = 3,
            },
            {
                Content = "Blighted",
                Chance = 25,
                DelayMin = 0.15,
                DelayMax = 0.15,
                SpawnMax = 10,
            },
            {
                Content = "Slow King",
                Chance = 15,
                DelayMin = 0.3,
                DelayMax = 0.3,
                SpawnMax = 1,
            },
            {
                Content = "Mandragora",
                Chance = 20,
                DelayMin = 0.15,
                DelayMax = 0.15,
                SpawnMax = 2,
            },
        },
        Modifiers = {},
    },
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}