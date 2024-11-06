Config = {}

Config.Debug = false -- Setting true will enable visual of target zones
Config.Cops = 4 -- Amount of cops required to be allowed to hack a vault
Config.PoliceJob = "police" -- Name of police job
Config.SecurityMaxLevel = 5 -- How many times can a vault security level be upgrade (It starts at 0 per restart)
Config.DoorOpenDelayInSeconds = 25

Config.SecurityUpgradeItem = "bankssecuritydevice" -- Item needed to upgrade a vaults security level
Config.HackerItem = "raspberrypi" -- Item needed to hack a vault
Config.LockerItem = "diamond_drill" -- Item needed to break into lockers

------------------------
--Hacking Device Stuff--
------------------------

Config.HackingDevice = {
    HackLocations = { -- Locations where players can attempt to add/remove software from their [Config.HackerItem]
        vector3(-1053.07, -231.04, 43.92),
    },
    -- [hackName] needs to match whatever you have listed in the big dumb [banks:client:AttemptToUploadSoftwareToDevice] list of "elseif"s
    AvailableHackingSoftware = {
        {
            hackName = "circle_progress",
            menuIcon = "fa-solid fa-magnifying-glass", -- Icon displayed in menu (For pretty purposes)
        },
        {
            hackName = "normal_progress",
            menuIcon = "fa-solid fa-burst",
        },
        {
            hackName = "key_spam",
            menuIcon = "fa-solid fa-microchip",
        },
        {
            hackName = "key_circle",
            menuIcon = "fa-solid fa-hands-holding-child",
        },
        {
            hackName = "number_slide",
            menuIcon = "fa-solid fa-key",
        },
        {
            hackName = "rapid_lines",
            menuIcon = "fa-solid fa-tachograph-digital",
        },
        {
            hackName = "circle_shake",
            menuIcon = "fa-solid fa-vault",
        },
    },
}

Config.PoliceMainframe = { -- Location where police can view cameras and acquire the mainframe code, needed to upgrade the vault secuirty (Code changes per restart)
    [1] = {
        ["coords"] = vector3(440.59, -995.84, 35.09),
    }
}

Config.Banks = {
    [1] = {
        ["label"] = "Alta Street Fleeca", -- Name of bank (Unique)
        ["coords"] = vector3(311.52, -284.57, 54.42), -- Location of vault keypad
        ["security"] = {
            pedModel = "cs_casey", -- Ped model for armed guard
            spawnLocation = vector4(309.62, -278.95, 54.16, 64.86), -- Location where armed guard spawn
            hallwayCoords = vector3(307.56, -281.33, 54.16), -- Location for turning point in peds path to vault when opening door
            vaultAccessDuration = 1, -- How long the vault stays open for when requested by police (In minutes)
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey", -- Ped model of ped that unlocks vault for police
            spawnLocation = vector3(309.62, -278.95, 54.16), -- Spawn location of ped model that unlocks vault for police
        },
        ["object"] = `v_ilev_gb_vauldr`, -- Vault door (Don't change unless using different banks)
        ["heading"] = {
            closed = 250.0, -- Heading of door when closed
            open = 160.0 -- Heading of door when open
        },
        ["camId"] = 21, -- Camera ID of interior of vault
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(311.25, -285.75, 54.6), -- Location of locker target zone
                ["size"] = vec3(0.30, 0.5, 0.65), -- Size of locker target zone
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)} -- Rewards for this specific locker
                },
            },
            [2] = {
                ["coords"] = vector3(310.5, -287.8, 54.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [3] = {
                ["coords"] = vector3(310.95, -288.9, 54.5),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [4] = {
                ["coords"] = vector3(313.45, -289.7, 54.55),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [5] = {
                ["coords"] = vector3(314.8, -289.25, 54.5),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [6] = {
                ["coords"] = vector3(315.5, -287.5, 54.5),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [7] = {
                ["coords"] = vector3(315.55, -285.55, 54.55),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [8] = {
                ["coords"] = vector3(315.15, -283.3, 54.65),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [9] = {
                ["coords"] = vector3(313.5, -282.7, 54.7),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
        }
    },
    [2] = {
        ["label"] = "Legion Square Fleeca",
        ["coords"] = vector3(147.19, -1046.19, 29.61),
        ["security"] = {
            pedModel = "cs_casey",
            spawnLocation = vector4(145.0, -1041.13, 29.36, 65.19),
            hallwayCoords = vector3(143.1, -1043.15, 29.36),
            vaultAccessDuration = 1,
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(145.0, -1041.13, 29.36),
        },
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 250.0,
            open = 160.0
        },
        ["camId"] = 22,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(149.05, -1044.3, 30.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [2] = {
                ["coords"] = vector3(150.45, -1044.85, 29.85),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [3] = {
                ["coords"] = vector3(151.6, -1046.2, 30.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 335.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [4] = {
                ["coords"] = vector3(151.05, -1049.1, 29.9),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [5] = {
                ["coords"] = vector3(150.5, -1050.75, 30.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [6] = {
                ["coords"] = vector3(149.1, -1051.4, 29.9),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [7] = {
                ["coords"] = vector3(146.9, -1050.6, 30.1),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [8] = {
                ["coords"] = vector3(146.24, -1049.24, 29.9),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 335.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [9] = {
                ["coords"] = vector3(146.79, -1047.79, 29.8),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 335.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
        }
    },
    [3] = {
        ["label"] = "Great Ocean Highway Fleeca",
        ["coords"] = vector3(-2956.56, 482.09, 15.94),
        ["security"] = {
            pedModel = "cs_casey",
            spawnLocation = vector4(-2960.77, 478.65, 15.69, 177.21),
            hallwayCoords = vector3(-2958.39, 477.62, 15.69),
            vaultAccessDuration = 1,
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(-2960.77, 478.65, 15.69),
        },
        ["object"] = `hei_prop_heist_sec_door`,
        ["heading"] = {
            closed = 360.0,
            open = 270.0
        },
        ["camId"] = 25,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(-2958.9, 483.4, 16.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [2] = {
                ["coords"] = vector3(-2958.8, 484.9, 16.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [3] = {
                ["coords"] = vector3(-2957.35, 486.25, 16.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [4] = {
                ["coords"] = vector3(-2954.8, 486.7, 16.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [5] = {
                ["coords"] = vector3(-2953.1, 486.6, 16.15),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [6] = {
                ["coords"] = vector3(-2952.2, 485.4, 16.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [7] = {
                ["coords"] = vector3(-2952.3, 483.2, 16.3),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [8] = {
                ["coords"] = vector3(-2953.45, 482.1, 16.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [9] = {
                ["coords"] = vector3(-2955.0, 482.2, 16.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
        }
    },
    [4] = {
        ["label"] = "Hawick Drive Fleeca",
        ["coords"] = vector3(-353.56, -55.50, 49.24),
        ["security"] = {
            pedModel = "cs_casey",
            spawnLocation = vector4(-355.58, -50.44, 49.03, 98.7),
            hallwayCoords = vector3(-357.65, -52.31, 49.03),
            vaultAccessDuration = 1,
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(-355.58, -50.44, 49.03),
        },
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 250.0,
            open = 160.0
        },
        ["camId"] = 23,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(-351.7, -53.55, 49.5),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [2] = {
                ["coords"] = vector3(-350.2, -54.05, 49.35),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [3] = {
                ["coords"] = vector3(-349.3, -55.8, 49.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [4] = {
                ["coords"] = vector3(-349.55, -58.35, 49.3),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [5] = {
                ["coords"] = vector3(-350.1, -59.85, 49.3),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [6] = {
                ["coords"] = vector3(-351.4, -60.65, 49.35),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [7] = {
                ["coords"] = vector3(-353.5, -59.9, 49.3),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [8] = {
                ["coords"] = vector3(-354.45, -58.5, 49.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [9] = {
                ["coords"] = vector3(-353.85, -56.8, 49.25),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
        }
    },
    [5] = {
        ["label"] = "Del Perro Fleeca",
        ["coords"] = vector3(-1210.48, -336.42, 38.01),
        ["security"] = {
            pedModel = "cs_casey",
            spawnLocation = vector4(-1215.46, -334.55, 37.77, 98.7),
            hallwayCoords = vector3(-1215.26, -337.24, 37.78),
            vaultAccessDuration = 1,
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(-1215.46, -334.55, 37.77),
        },
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 300.0,
            open = 200.0
        },
        ["camId"] = 24,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(-1210.55, -333.75, 38.15),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [2] = {
                ["coords"] = vector3(-1209.1, -333.1, 38.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [3] = {
                ["coords"] = vector3(-1207.2, -333.7, 38.15),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [4] = {
                ["coords"] = vector3(-1205.5, -335.8, 38.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [5] = {
                ["coords"] = vector3(-1204.9, -337.0, 38.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [6] = {
                ["coords"] = vector3(-1205.5, -338.65, 38.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [7] = {
                ["coords"] = vector3(-1207.05, -339.45, 38.05),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [8] = {
                ["coords"] = vector3(-1209.0, -339.1, 38.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [9] = {
                ["coords"] = vector3(-1209.6, -337.8, 38.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
        }
    },
    [6] = {
        ["label"] = "Sandy Fleeca",
        ["coords"] = vector3(1175.69, 2712.88, 38.33),
        ["security"] = {
            pedModel = "cs_casey",
            spawnLocation = vector4(1179.27, 2708.9, 38.08, 241.55),
            hallwayCoords = vector3(1180.53, 2711.11, 38.08),
            vaultAccessDuration = 1,
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(1179.27, 2708.9, 38.08),
        },
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 90.0,
            open = 0.5
        },
        ["camId"] = 25,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(1174.4, 2710.5, 38.35),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [2] = {
                ["coords"] = vector3(1173.0, 2710.45, 38.35),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [3] = {
                ["coords"] = vector3(1171.55, 2711.85, 38.35),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [4] = {
                ["coords"] = vector3(1170.95, 2714.3, 38.45),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [5] = {
                ["coords"] = vector3(1170.95, 2715.9, 38.3),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [6] = {
                ["coords"] = vector3(1172.2, 2717.1, 38.15),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [7] = {
                ["coords"] = vector3(1174.2, 2717.1, 38.1),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [8] = {
                ["coords"] = vector3(1175.55, 2716.05, 38.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
            [9] = {
                ["coords"] = vector3(1175.5, 2714.3, 38.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)}
                }
            },
        }
    },
}