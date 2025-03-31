Config = Config or {}

Config.CoreInfo = {
    Debug = false,
    UseDrillingMiniGame = true, -- Set to false to use a progresscircle / Set to true to use the required minigame [Described in the README] (When looting lock boxes)
    Cops = 0,
}

Config.ItemRequirements = {
    MainframeUpgrade = 'bankssecuritydevice',
    VaultHack = 'raspberrypi',
    LockerDrill = 'diamond_drill',
}

-- All banks start on Security Level 0 and utlise the [DefaultDurationInMinutes] until they are upgraded beyond that
-- You can add as many levels as you want to this list, just keep following the current format
Config.Security = {
    MaximumLevel = 5,
    DefaultDurationInMinutes = 15,
    DoorOpenDelayInSeconds = 1,
    Levels = {
        [1] = {
            doorOpenDurationInMinutes = 15,
        },
        [2] = {
            doorOpenDurationInMinutes = 13,
        },
        [3] = {
            doorOpenDurationInMinutes = 11,
        },
        [4] = {
            doorOpenDurationInMinutes = 9,
        },
        [5] = {
            doorOpenDurationInMinutes = 7,
        },
        [6] = {
            doorOpenDurationInMinutes = 5,
        },
        [7] = {
            doorOpenDurationInMinutes = 3,
        },
    },
}

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

-- A list of locations where Police can view cameras
Config.PoliceInformation = {
    PoliceJob = {
        JobNames = {
            'police',
            'sheriff',
        },
        JobType = 'leo',
    },
    MainFrames = {
        [1] = {
            ["coords"] = vector3(440.34, -975.73, 30.68),
        },
    },
    CameraList = {
        -- Add whatever ones you want here. By default, I've just copied over the locations from qb-policejob
        { name = 'Pacific Bank CAM#1', location = vector4(257.44, 210.07, 109.08, 0.0),},
        { name = 'Pacific Bank CAM#2', location = vector4(232.86, 221.46, 107.83, 0.0),},
        { name = 'Pacific Bank CAM#3', location = vector4(252.27, 225.52, 103.99, 0.0),},
        { name = 'Limited Ltd Grove St. CAM#1', location = vector4(-53.1433, -1746.714, 31.546, 0.0),},
        { name = "Rob's Liqour Prosperity St. CAM#1", location = vector4(-1482.9, -380.463, 42.363, 0.0),},
        { name = "Rob's Liqour San Andreas Ave. CAM#1", location = vector4(-1224.874, -911.094, 14.401, 0.0),},
        { name = 'Limited Ltd Ginger St. CAM#1', location = vector4(-718.153, -909.211, 21.49, 0.0),},
        { name = '24/7 Supermarkt Innocence Blvd. CAM#1', location = vector4(23.885, -1342.441, 31.672, 0.0),},
        { name = "Rob's Liqour El Rancho Blvd. CAM#1", location = vector4(1133.024, -978.712, 48.515, 0.0),},
        { name = 'Limited Ltd West Mirror Drive CAM#1', location = vector4(1151.93, -320.389, 71.33, 0.0),},
        { name = '24/7 Supermarkt Clinton Ave CAM#1', location = vector4(383.402, 328.915, 105.541, 0.0),},
        { name = 'Limited Ltd Banham Canyon Dr CAM#1', location = vector4(-1832.057, 789.389, 140.436, 0.0),},
        { name = "Rob's Liqour Great Ocean Hwy CAM#1", location = vector4(-2966.15, 387.067, 17.393, 0.0),},
        { name = '24/7 Supermarkt Ineseno Road CAM#1', location = vector4(-3046.749, 592.491, 9.808, 0.0),},
        { name = '24/7 Supermarkt Barbareno Rd. CAM#1', location = vector4(-3246.489, 1010.408, 14.705, 0.0),},
        { name = '24/7 Supermarkt Route 68 CAM#1', location = vector4(539.773, 2664.904, 44.056, 0.0),},
        { name = "Rob's Liqour Route 68 CAM#1", location = vector4(1169.855, 2711.493, 40.432, 0.0),},
        { name = '24/7 Supermarkt Senora Fwy CAM#1', location = vector4(2673.579, 3281.265, 57.541, 0.0),},
        { name = '24/7 Supermarkt Alhambra Dr. CAM#1', location = vector4(1966.24, 3749.545, 34.143, 0.0),},
        { name = '24/7 Supermarkt Senora Fwy CAM#2', location = vector4(1729.522, 6419.87, 37.262, 0.0),},
        { name = 'Fleeca Bank Hawick Ave CAM#1', location = vector4(309.341, -281.439, 55.88, 0.0),},
        { name = 'Fleeca Bank Legion Square CAM#1', location = vector4(144.871, -1043.044, 31.017, 0.0),},
        { name = 'Fleeca Bank Hawick Ave CAM#2', location = vector4(-355.7643, -52.506, 50.746, 0.0),},
        { name = 'Fleeca Bank Del Perro Blvd CAM#1', location = vector4(-1214.226, -335.86, 39.515, 0.0),},
        { name = 'Fleeca Bank Great Ocean Hwy CAM#1', location = vector4(-2958.885, 478.983, 17.406, 0.0),},
        { name = 'Paleto Bank CAM#1', location = vector4(-102.939, 6467.668, 33.424, 0.0),},
        { name = 'Del Vecchio Liquor Paleto Bay', location = vector4(-163.75, 6323.45, 33.424, 0.0),},
        { name = "Don's Country Store Paleto Bay CAM#1", location = vector4(166.42, 6634.4, 33.69, 0.0),},
        { name = "Don's Country Store Paleto Bay CAM#2", location = vector4(163.74, 6644.34, 33.69, 0.0),},
        { name = "Don's Country Store Paleto Bay CAM#3", location = vector4(169.54, 6640.89, 33.69, 0.0),},
        { name = 'Vangelico Jewelery CAM#1', location = vector4(-627.54, -239.74, 40.33, 0.0),},
        { name = 'Vangelico Jewelery CAM#2', location = vector4(-627.51, -229.51, 40.24, 0.0),},
        { name = 'Vangelico Jewelery CAM#3', location = vector4(-620.3, -224.31, 40.23, 0.0),},
        { name = 'Vangelico Jewelery CAM#4', location = vector4(-622.57, -236.3, 40.31, 0.0),},
    }
}

Config.Banks = {
    [1] = {
        ["label"] = "Alta Street Fleeca", -- Name of bank (Unique)
        ["vaultpanel"] = vector3(311.52, -284.57, 54.42), -- Location of vault keypad
        ["vaultGuard"] = {
            pedModel = "cs_casey", -- Ped model of ped that unlocks vault for police
            spawnLocation = vector3(309.62, -278.95, 54.16), -- Spawn location of ped model that unlocks vault for police
            hallwayCoords = vector3(307.56, -281.33, 54.16),
            vaultAccessDurationInMinutes = 1, -- How long the vault stays open for when requested by police
        },
        ["vaultDoorObject"] = `v_ilev_gb_vauldr`, -- Vault door (Don't change unless using different banks)
        ["heading"] = {
            closed = 250.0, -- Heading of door when closed
            open = 160.0 -- Heading of door when open
        },
        ["camId"] = 21, -- Camera ID of interior of vault - The event this triggers is in menus/mainframe.lua, by standard it's designed for qb-policejob
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(311.25, -285.75, 54.6), -- Location of locker target zone
                ["size"] = vec3(0.30, 0.5, 0.65), -- Size of locker target zone
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(3750, 6250)} -- Rewards for this unique locker
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
        ["vaultpanel"] = vector3(147.19, -1046.19, 29.61),
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(145.0, -1041.13, 29.36),
            hallwayCoords = vector3(143.1, -1043.15, 29.36),
            vaultAccessDurationInMinutes = 1,
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
        ["vaultpanel"] = vector3(-2956.56, 482.09, 15.94),
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(-2960.77, 478.65, 15.69),
            hallwayCoords = vector3(-2958.39, 477.62, 15.69),
            vaultAccessDurationInMinutes = 1,
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
        ["vaultpanel"] = vector3(-353.56, -55.50, 49.24),
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(-355.58, -50.44, 49.03),
            hallwayCoords = vector3(-357.65, -52.31, 49.03),
            vaultAccessDurationInMinutes = 1,
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
        ["vaultpanel"] = vector3(-1210.48, -336.42, 38.01),
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(-1215.46, -334.55, 37.77),
            hallwayCoords = vector3(-1215.26, -337.24, 37.78),
            vaultAccessDurationInMinutes = 1,
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
        ["vaultpanel"] = vector3(1175.69, 2712.88, 38.33),
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(1179.27, 2708.9, 38.08),
            hallwayCoords = vector3(1180.53, 2711.11, 38.08),
            vaultAccessDurationInMinutes = 1,
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