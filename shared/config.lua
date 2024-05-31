Config = {}

Config.OpenUICommand = 'achievements'
Config.NotificationTimeout = 10 --in seconds

Config.Achievements = { --list in UI is sorted alphabtically by title not by code
    ['ACH001'] = { --must be a unique code. this is the code that is used with exports, events
        imgSrc = "first_kill.png",
        title = "First Kill",
        description = "Defeat your first zombie",
        group = 'zombiekills', --helps to increase multiple achievements of the same type such as (1 kill, 5 kills, 10 kills) USE ADDGROUPVALUE EXPORT to increase all these at once
        valueNeeded = 1,
    },
    ['ACH002'] = {
        imgSrc = "zombie_dead.png",
        title = "Z Slayer",
        description = "Kill 500 zombies",
        group = 'zombiekills',
        valueNeeded = 500,
    },
    ['ACH003'] = {
        imgSrc = "cooking.png",
        title = "Master Chef",
        description = "Cook 200 food/drink items",
        valueNeeded = 200,
    },
    ['ACH004'] = {
        imgSrc = "culinary.png",
        title = "Culinary Genius",
        description = "Cook every piece of food",
        valueNeeded = 20,
    },
    ['ACH005'] = {
        imgSrc = "scavenger.png",
        title = "Gatherer",
        description = "Gather 2000 resources",
        valueNeeded = 2000,
    },
    ['ACH006'] = {
        imgSrc = "base.png",
        title = "Rust Who?",
        description = "Place 250 base pieces",
        valueNeeded = 250,
    },
    ['ACH007'] = {
        imgSrc = "bandage.png",
        title = "Regular Old Dr Cox",
        description = "Use bandage 75 times",
        valueNeeded = 75,
    },
    ['ACH008'] = {
        imgSrc = "healthcare.png",
        title = "Friend In Need",
        description = "Revive a friend 25 times",
        valueNeeded = 25,
    },
    ['ACH009'] = {
        imgSrc = "zombie_boss.png",
        title = "Z Slayer BIG Leagues",
        description = "Kill 5 different special zombies",
        valueNeeded = 5,
    },
    ['ACH010'] = {
        imgSrc = "crafting.png",
        title = "Do You Even Bench, Bro?",
        description = "Craft 1000 items",
        valueNeeded = 1000,
    },
    ['ACH011'] = {
        imgSrc = "sunlight.png",
        title = "Whats The Sun Look Like?",
        description = "Play for 500 hours",
        valueNeeded = 500,
    },
    ['ACH0012'] = {
        imgSrc = "collect.png",
        title = "Collector",
        description = "Loot 500 items",
        valueNeeded = 500,
    },
    ['ACH0013'] = {
        imgSrc = "locksmith.png",
        title = "Locksmith",
        description = "Successfully lockpick 30 times",
        valueNeeded = 30,
    },
    ['ACH014'] = {
        imgSrc = "zombie_dead.png",
        title = "Ultimate Slasher",
        description = "Kill 5000 zombies",
        group = 'zombiekills',
        valueNeeded = 5000,   
    },
    ['ACH0015'] = {
        imgSrc = "collect.png",
        title = "Collector 2",
        description = "Loot 1000 items",
        valueNeeded = 1000,
    },
    ['ACH0016'] = {
        imgSrc = "collect.png",
        title = "Collector 3",
        description = "Loot 5000 items",
        valueNeeded = 5000,
    },
    ['ACH017'] = {
        imgSrc = "scavenger.png",
        title = "Minecraft?",
        description = "Gather 10000 resources",
        valueNeeded = 10000,
    },
}