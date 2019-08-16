-- into acore_world

SET @TEXT_ID := 601083;
DELETE FROM `npc_text` WHERE `ID` IN  (@TEXT_ID,@TEXT_ID+1);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(@TEXT_ID, 'Transmogrification allows you to change how your items look like without changing the stats of the items.\r\nItems used in transmogrification are no longer refundable, tradeable and are bound to you.\r\nUpdating a menu updates the view and prices.\r\n\r\nNot everything can be transmogrified with eachother.\r\nRestrictions include but are not limited to:\r\nOnly armor and weapons can be transmogrified\r\nGuns, bows and crossbows can be transmogrified with eachother\r\nFishing poles can not be transmogrified\r\nYou must be able to equip both items used in the process.\r\n\r\nTransmogrifications stay on your items as long as you own them.\r\nIf you try to put the item in guild bank or mail it to someone else, the transmogrification is stripped.\r\n\r\nYou can also remove transmogrifications for free at the transmogrifier.'),
(@TEXT_ID+1, 'You can save your own transmogrification sets.\r\n\r\nTo save, first you must transmogrify your equipped items.\r\nThen when you go to the set management menu and go to save set menu,\r\nall items you have transmogrified are displayed so you see what you are saving.\r\nIf you think the set is fine, you can click to save the set and name it as you wish.\r\n\r\nTo use a set you can click the saved set in the set management menu and then select use set.\r\nIf the set has a transmogrification for an item that is already transmogrified, the old transmogrification is lost.\r\nNote that same transmogrification restrictions apply when trying to use a set as in normal transmogrification.\r\n\r\nTo delete a set you can go to the set\'s menu and select delete set.');

SET @STRING_ENTRY := 11100;
DELETE FROM `trinity_string` WHERE `entry` IN  (@STRING_ENTRY+0,@STRING_ENTRY+1,@STRING_ENTRY+2,@STRING_ENTRY+3,@STRING_ENTRY+4,@STRING_ENTRY+5,@STRING_ENTRY+6,@STRING_ENTRY+7,@STRING_ENTRY+8,@STRING_ENTRY+9,@STRING_ENTRY+10);
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(@STRING_ENTRY+0, 'Item transmogrified'),
(@STRING_ENTRY+1, 'Equipment slot is empty'),
(@STRING_ENTRY+2, 'Invalid source item selected'),
(@STRING_ENTRY+3, 'Source item does not exist'),
(@STRING_ENTRY+4, 'Destination item does not exist'),
(@STRING_ENTRY+5, 'Selected items are invalid'),
(@STRING_ENTRY+6, 'Not enough money'),
(@STRING_ENTRY+7, 'You don\'t have enough tokens'),
(@STRING_ENTRY+8, 'Transmogrifications removed'),
(@STRING_ENTRY+9, 'There are no transmogrifications'),
(@STRING_ENTRY+10, 'Invalid name inserted');
SET
@Entry = 190010,
@Name = "Warpweaver";
DELETE FROM `creature_template` WHERE `entry` = 190010;

INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(@Entry, 19646, 0, @Name, "Transmogrifier", NULL, 0, 80, 80, 2, 35, 1, 1, 0, 0, 2000, 0, 1, 0, 7, 138936390, 0, 0, 0, '', 0, 3, 1, 0, 0, 1, 0, 0, 'npc_transmogrifier');
SET
@Entry      := 92000,
@Model      := 16804, -- Elven Jeweler
@Name       := "Talamortis",
@Title      := "Code exchange",
@Icon       := "Buy",
@GossipMenu := 0,
@MinLevel   := 80,
@MaxLevel   := 80,
@Faction    := 35,
@NPCFlag    := 1,
@Scale      := 1.0,
@Rank       := 0,
@Type       := 7,
@TypeFlags  := 138936390,
@FlagsExtra := 2,
@AIName     := "SmartAI",
@Script     := "reward_shop";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC Text
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Greetings $N. Do you have a code to redeem?');
DELETE FROM `creature_template` WHERE `entry` = 55002;
Set @NpcName = "Services NPC",
    @NpcSubname = "AzerothCore",
    @NpcEntry = 55002,
    @NpcDisplayID = 31833,
    @NpcLevel = 80;

INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `subname`, `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@NpcEntry, @NpcDisplayID, @NpcName, @NpcSubname, @NpcLevel, @NpcLevel, 35, 1, 1, 1.14286, 1, 1, 0, 2000, 2000, 2, 0, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 50, 50, 1, 0, 0, 1, 0, 0, 'Npc_Services', 12340);
-- --------------------------------------------------------------------------------------
--  GAMBLER - 601020
-- --------------------------------------------------------------------------------------
SET
@Entry      := 601020,
@Model      := 7337, -- Goblin Banker
@Name       := "Skinny",
@Title      := "Gambler",
@Icon       := "LootAll",
@GossipMenu := 0,
@MinLevel   := 80,
@MaxLevel   := 80,
@Faction    := 35,
@NPCFlag    := 1,
@Scale      := 1.0,
@Rank       := 0,
@Type       := 7,
@TypeFlags  := 0,
@FlagsExtra := 2,
@AIName     := "SmartAI",
@Script     := "gamble_npc";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hey there, the name\'s Skinny. You feelin\' lucky?');

-- ######################################################--
--  ENCHANTER - 601015
-- ######################################################--
SET
@Entry      := 601015,
@Model      := 9353, -- Undead Necromancer
@Name       := "Beauregard Boneglitter",
@Title      := "Enchantments",
@Icon       := "Speak",
@GossipMenu := 0,
@MinLevel   := 80,
@MaxLevel   := 80,
@Faction    := 35,
@NPCFlag    := 1,
@Scale      := 1.0,
@Rank       := 0,
@Type       := 7,
@TypeFlags  := 0,
@FlagsExtra := 2,
@AIName     := "SmartAI",
@Script     := "npc_enchantment";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 11343, 0, 0, 18019); -- Black/Purple Staff, None

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Good day $N. Beauregard Boneglitter at your service. I offer a vast array of gear enchantments for the aspiring adventurer.');

-- ######################################################--
--  BUFFER NPC - 601016
-- ######################################################--
SET
@Entry      := 601016,
-- @Model       := 4309, -- Human Male Tuxedo
-- @Name        := "Bruce Buffer",
-- @Title       := "Ph.D.",
@Model      := 14612, -- Tauren Warmaster
@Name       := "Sergeant Hasselhoof",
@Title      := "",
@Icon       := "Speak",
@GossipMenu := 4110,
@MinLevel   := 80,
@MaxLevel   := 80,
@Faction    := 35,
@NPCFlag    := 81,
@Scale      := 1.0,
@Rank       := 0,
@Type       := 7,
@TypeFlags  := 0,
@FlagsExtra := 2,
@AIName     := "SmartAI",
@Script     := "buff_npc";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 1906, 0, 0, 18019); -- War Axe(14824), Torch
-- ######################################################--
-- BEASTMASTER - 601026
-- ######################################################--
SET
@Entry      := 601026,
@Model      := 26314, -- Northrend Worgen White
@Name       := "White Fang",
@Title      := "BeastMaster",
@Icon       := "Speak",
@GossipMenu := 0,
@MinLevel   := 80,
@MaxLevel   := 80,
@Faction    := 35,
@NPCFlag    := 4194433,
@Scale      := 1.0,
@Rank       := 0,
@Type       := 7,
@TypeFlags  := 0,
@FlagsExtra := 2,
@AIName     := "SmartAI",
@Script     := "BeastMaster";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 2196, 1906, 0, 18019); -- Haunch of Meat, Torch

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Greetings, $N. If you are looking for a trustful companion on your travels you have come to the right place. I can offer you a variety of tamed pets for you to choose from. If necessary I can also teach you the ways of the hunter so that you can take good care of your pet.');

-- NPC ITEMS
DELETE FROM npc_vendor WHERE entry = @Entry;
INSERT INTO npc_vendor (entry, item) VALUES
-- MEAT
(@Entry,35953), -- (75) -- Mead Blasted Caribou
(@Entry,33454), -- (65) -- Salted Venison
(@Entry,27854), -- (55) -- Smoked Talbuk Venison
(@Entry,8952),  -- (45) -- Roasted Quail
(@Entry,4599),  -- (35) -- Cured Ham Steak
(@Entry,3771),  -- (25) -- Wild Hog Shank
(@Entry,3770),  -- (15) -- Mutton Chop
(@Entry,2287),  -- (5)  -- Haunch of Meat
(@Entry,117),   -- (1)  -- Tough Jerky
-- FUNGUS
(@Entry,35947), -- (75) -- Sparkling Frostcap
(@Entry,33452), -- (65) -- Honey-Spiced Lichen
(@Entry,27859), -- (55) -- Zangar Caps
(@Entry,8948),  -- (45) -- Dried King Bolete
(@Entry,4608),  -- (35) -- Raw Black Truffle
(@Entry,4607),  -- (25) -- Delicious Cave Mold
(@Entry,4606),  -- (15) -- Spongy Morel
(@Entry,4605),  -- (5)  -- Red-Speckled Mushroom
(@Entry,4604),  -- (1)  -- Forest Mushroom Cap
-- BREAD
(@Entry,35950), -- (75) -- Sweet Potato Bread
(@Entry,33449), -- (65) -- Crusty Flatbread
(@Entry,27855), -- (55) -- Mag'har Grainbread
(@Entry,8950),  -- (45) -- Homemade Cherry Pie
(@Entry,4601),  -- (35) -- Soft Banana Bread
(@Entry,4544),  -- (25) -- Mulgore Spice Bread
(@Entry,4542),  -- (15) -- Moist Cornbread
(@Entry,4541),  -- (5)  -- Freshly Baked Bread
(@Entry,4540),  -- (1)  -- Tough Hunk of Bread
-- FRUIT
(@Entry,35948), -- (75) -- Savory Snowplum
(@Entry,35949), -- (65) -- Tundra Berries
(@Entry,27856), -- (55) -- Sklethyl Berries
(@Entry,8953),  -- (45) -- Deep Fried Plantains
(@Entry,4602),  -- (35) -- Moon Harvest Pumpkin
(@Entry,4539),  -- (25) -- Goldenbark Apple
(@Entry,4538),  -- (15) -- Snapvine Watermelon
(@Entry,4537),  -- (5)  -- Tel'Abim Banana
(@Entry,4536),  -- (1)  -- Shiny Red Apple
-- FISH
(@Entry,35951), -- (75) -- Poached Emperor Salmon
(@Entry,33451), -- (65) -- Filet of Icefin
(@Entry,27858), -- (55) -- Sunspring Carp
(@Entry,8957),  -- (45) -- Spinefin Halibut
(@Entry,21552), -- (35) -- Striped Yellowtail
(@Entry,4594),  -- (25) -- Rockscale Cod
(@Entry,4593),  -- (15) -- Bristle Whisker Catfish
(@Entry,4592),  -- (5)  -- Longjaw Mud Snapper
(@Entry,787),   -- (1)  -- Slitherskin Mackeral
-- CHEESE
(@Entry,35952), -- (75) -- Briny Hardcheese
(@Entry,33443), -- (65) -- Sour Goat Cheese
(@Entry,27857), -- (55) -- Gradar Sharp
(@Entry,8932),  -- (45) -- Alterac Swiss
(@Entry,3927),  -- (35) -- Fine Aged Chedder
(@Entry,1707),  -- (25) -- Stormwind Brie
(@Entry,422),   -- (15) -- Dwarven Mild
(@Entry,414),   -- (5)  -- Dalaran Sharp
(@Entry,2070),  -- (1)  -- Darnassian Bleu
-- BUFF
(@Entry,33875), -- Kibler's Bits
-- RARE
(@Entry,21024); -- Chimaerok Tenderloin
-- --------------------------------------------------------------------------------------
--  ALL MOUNTS VENDOR - 601014
-- --------------------------------------------------------------------------------------
SET
@Entry      := 601014,
@Model      := 26571, -- The Black Knight
-- @Model       := 21249, -- Armored Orc
@Name       := "The Mountain",
@Title      := "Mount Trainer",
@Icon       := "Speak",
@GossipMenu := 0,
@MinLevel   := 80,
@MaxLevel   := 80,
@Faction    := 35,
@NPCFlag    := 1,
@Scale      := 1.0,
@Rank       := 0,
@Type       := 7,
@TypeFlags  := 0,
@FlagsExtra := 2,
@AIName     := "SmartAI",
@Script     := "All_Mounts_NPC";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Hail $N. I can teach you to ride.. anything!');
SET
@Entry      := 300000,
@Model      := 24877,
@Name       := "Cromi",
@Title      := "Instance Reset";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, "Speak", 0, 80, 80, 35, 1, 1, 1.14286, 1, 0, 1, 2, 7, 138936390, 3, 1, 2, "instanceReset");


-- Dumping structure for table acore_world.guild_house_spawns
CREATE TABLE IF NOT EXISTS `guild_house_spawns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry` int(11) NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `comment` varchar(500) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry` (`entry`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Dumping data for table acore_world.guild_house_spawns: ~29 rows (approximately)
/*!40000 ALTER TABLE `guild_house_spawns` DISABLE KEYS */;
REPLACE INTO `guild_house_spawns` (`id`, `entry`, `posX`, `posY`, `posZ`, `orientation`, `comment`) VALUES
    (1, 26327, 16216.5, 16279.4, 20.9306, 0.552869, 'Paladin Trainer'),
    (2, 26324, 16221.3, 16275.7, 20.9285, 1.37363, 'Druid Trainer'),
    (3, 26325, 16218.6, 16277, 20.9872, 0.967188, 'Hunter Trainer'),
    (4, 26326, 16224.9, 16274.9, 20.9319, 1.58765, 'Mage Trainer'),
    (5, 26328, 16227.9, 16275.9, 20.9254, 1.9941, 'Priest Trainer'),
    (6, 26329, 16231.4, 16278.1, 20.9222, 2.20026, 'Rogue Trainer'),
    (7, 26330, 16235.5, 16280.8, 20.9257, 2.18652, 'Shaman Trainer'),
    (8, 26331, 16240.8, 16283.3, 20.9299, 1.86843, 'Warlock Trainer'),
    (9, 26332, 16246.6, 16284.5, 20.9301, 1.68975, 'Warrior Trainer'),
    (10, 18649, 16224.1, 16284.2, 13.1755, 4.65225, 'Inkeeper'),
    (11, 30605, 16238.2, 16291.8, 22.9306, 1.55386, 'Banker'),
    (12, 33251, 16252.3, 16284.9, 20.9324, 1.79537, 'Death Knight Trainer'),
    (13, 33609, 16220.5, 16302.3, 13.176, 6.14647, 'Blacksmithing Trainer'),
    (14, 33617, 16220.2, 16299.6, 13.178, 6.22894, 'Mining Trainer'),
    (15, 33611, 16219.8, 16296.9, 13.1746, 6.24465, 'Engineering Trainer'),
    (16, 33614, 16222.4, 16293, 13.1813, 1.51263, 'Jewelcrafting Trainer'),
    (17, 33610, 16227.5, 16292.3, 13.1839, 1.49691, 'Enchanting Trainer'),
    (18, 33615, 16231.6, 16301, 13.1757, 3.07372, 'Inscription Trainer'),
    (19, 33612, 16231.2, 16295, 13.1761, 3.06574, 'Leatherworking Trainer'),
    (20, 33618, 16228.9, 16304.7, 13.1819, 4.64831, 'Skinning Trainer'),
    (21, 33608, 16218.1, 16281.8, 13.1756, 6.1975, 'Alchemy Trainer'),
    (22, 33616, 16218.3, 16284.3, 13.1756, 6.1975, 'Herbalism Trainer'),
    (23, 33613, 16220.4, 16278.7, 13.1756, 1.46157, 'Tailoring Trainer'),
    (24, 33621, 16225, 16310.9, 29.262, 6.22119, 'First Aid Trainer'),
    (25, 33623, 16225.3, 16313.9, 29.262, 6.28231, 'Fishing Trainer'),
    (26, 33619, 16227, 16278, 13.1762, 1.4872, 'Cooking Trainer'),
    (27, 8719, 16242, 16291.6, 22.9311, 1.52061, 'Alliance Auctioneer'),
    (30, 9856, 16242, 16291.6, 22.9311, 1.52061, 'Horde Auctioneer'),
    (31, 184137, 16220.3, 16272, 12.9736, 4.45592, 'Mailbox (Object)'),
    (33, 1685, 16253.8, 16294.3, 13.1758, 6.11938, 'Forge (Object)'),
    (34, 4087, 16254.4, 16298.7, 13.1758, 3.36027, 'Anvil (Object)'),
    (36, 183325, 16214.8, 16218, 1.11903, 1.35357, 'Portal: Stormwind (Object)'),
    (37, 183323, 16214.8, 16218, 1.11903, 1.35357, 'Portal: Orgrimmar (Object)'),
    (38, 183322, 16222.8, 16216.9, 1.22016, 1.57937, 'Portal: Ironforge (Object)'),
    (39, 183327, 16222.8, 16216.9, 1.22016, 1.57937, 'Portal: Undercity (Object)'),
    (40, 183317, 16202.1, 16223.1, 1.03401, 0.829316, 'Portal: Darnassus (Object)'),
    (41, 183326, 16202.1, 16223.1, 1.03401, 0.829316, 'Portal: Thunder Bluff (Object)'),
    (42, 183324, 16196.8, 16227.5, 1.37206, 0.762557, 'Portal: Silvermoon (Object)'),
    (43, 183321, 16196.8, 16227.5, 1.37206, 0.762557, 'Portal: Exodar (Object)'),
    (44, 191164, 16206, 16216, 1.10669, 1.0453, 'Portal: Dalaran (Object)'),
    (45, 187293, 16230.5, 16283.5, 13.9061, 3, 'Guild Vault (Object)'),
    (46, 28692, 16230.2, 16316.4, 20.8455, 6.25643, 'Trade Supplies'),
    (48, 28776, 16236.3, 16316.1, 20.8454, 3.06771, 'Tabard Vendor'),
    (49, 29715, 16223.7, 16293.3, 20.852, 4.57958, 'Food & Drink'),
    (50, 191028, 16255.5, 16304.9, 20.9785, 2.97516, 'Barber Chair (Object)');

/*!40000 ALTER TABLE `guild_house_spawns` ENABLE KEYS */;


REPLACE INTO `creature_template` VALUES (70101, 0, 0, 0, 0, 0, 25901, 0, 0, 0, 'Talamortis', 'Guild House Seller', '', 0, 35, 35, 0, 12, 1, 1, 1.14286, 1, 0, 49, 64, 0, 118, 1, 2000, 2000, 1, 33536, 2048, 0, 0, 0, 0, 0, 0, 33, 49, 11, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 'GuildHouseSeller', 12340),
(18649, 0, 0, 0, 0, 0, 18234, 0, 0, 0, 'Innkeeper Monica', NULL, NULL, 0, 1, 2, 0, 35, 65537, 0.8, 0.28571, 1, 0, 2, 2, 0, 26, 4.6, 2000, 1900, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 1, 1, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 1, 0, 70, 1, 0, 2, 'npc_innkeeper', 12340),
(33251, 0, 0, 0, 0, 0, 28516, 0, 0, 0, 'Death Knight Trainer', '', '', 9691, 80, 80, 2, 35, 51, 1, 1.14286, 1, 1, 422, 586, 0, 642, 7.5, 2000, 2000, 1, 32768, 2048, 0, 0, 0, 0, 6, 0, 345, 509, 103, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 10, 1, 1, 0, 0, 1, 8388624, 0, '', 12340),
(70102, 0, 0, 0, 0, 0, 25901, 0, 0, 0, 'Speedfang', 'Guild House Assistant', '', 0, 35, 35, 0, 12, 1, 1, 1.14286, 1, 0, 49, 64, 0, 118, 1, 2000, 2000, 1, 33536, 2048, 0, 0, 0, 0, 0, 0, 33, 49, 11, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 'GuildHouseSpawner', 12340);

-- ----------------------------
-- Table structure for auctionhousebot
-- ----------------------------
DROP TABLE IF EXISTS `auctionhousebot`;
CREATE TABLE `auctionhousebot` (
  `auctionhouse` int(11) NOT NULL DEFAULT '0' COMMENT 'mapID of the auctionhouse.',
  `name` char(25) DEFAULT NULL COMMENT 'Text name of the auctionhouse.',
  `minitems` int(11) DEFAULT '0' COMMENT 'This is the minimum number of items you want to keep in the auction house. a 0 here will make it the same as the maximum.',
  `maxitems` int(11) DEFAULT '0' COMMENT 'This is the number of items you want to keep in the auction house.',
  `percentgreytradegoods` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the Grey Trade Goods auction items',
  `percentwhitetradegoods` int(11) DEFAULT '27' COMMENT 'Sets the percentage of the White Trade Goods auction items',
  `percentgreentradegoods` int(11) DEFAULT '12' COMMENT 'Sets the percentage of the Green Trade Goods auction items',
  `percentbluetradegoods` int(11) DEFAULT '10' COMMENT 'Sets the percentage of the Blue Trade Goods auction items',
  `percentpurpletradegoods` int(11) DEFAULT '1' COMMENT 'Sets the percentage of the Purple Trade Goods auction items',
  `percentorangetradegoods` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the Orange Trade Goods auction items',
  `percentyellowtradegoods` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the Yellow Trade Goods auction items',
  `percentgreyitems` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the non trade Grey auction items',
  `percentwhiteitems` int(11) DEFAULT '10' COMMENT 'Sets the percentage of the non trade White auction items',
  `percentgreenitems` int(11) DEFAULT '30' COMMENT 'Sets the percentage of the non trade Green auction items',
  `percentblueitems` int(11) DEFAULT '8' COMMENT 'Sets the percentage of the non trade Blue auction items',
  `percentpurpleitems` int(11) DEFAULT '2' COMMENT 'Sets the percentage of the non trade Purple auction items',
  `percentorangeitems` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the non trade Orange auction items',
  `percentyellowitems` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the non trade Yellow auction items',
  `minpricegrey` int(11) DEFAULT '100' COMMENT 'Minimum price of Grey items (percentage).',
  `maxpricegrey` int(11) DEFAULT '150' COMMENT 'Maximum price of Grey items (percentage).',
  `minpricewhite` int(11) DEFAULT '150' COMMENT 'Minimum price of White items (percentage).',
  `maxpricewhite` int(11) DEFAULT '250' COMMENT 'Maximum price of White items (percentage).',
  `minpricegreen` int(11) DEFAULT '800' COMMENT 'Minimum price of Green items (percentage).',
  `maxpricegreen` int(11) DEFAULT '1400' COMMENT 'Maximum price of Green items (percentage).',
  `minpriceblue` int(11) DEFAULT '1250' COMMENT 'Minimum price of Blue items (percentage).',
  `maxpriceblue` int(11) DEFAULT '1750' COMMENT 'Maximum price of Blue items (percentage).',
  `minpricepurple` int(11) DEFAULT '2250' COMMENT 'Minimum price of Purple items (percentage).',
  `maxpricepurple` int(11) DEFAULT '4550' COMMENT 'Maximum price of Purple items (percentage).',
  `minpriceorange` int(11) DEFAULT '3250' COMMENT 'Minimum price of Orange items (percentage).',
  `maxpriceorange` int(11) DEFAULT '5550' COMMENT 'Maximum price of Orange items (percentage).',
  `minpriceyellow` int(11) DEFAULT '5250' COMMENT 'Minimum price of Yellow items (percentage).',
  `maxpriceyellow` int(11) DEFAULT '6550' COMMENT 'Maximum price of Yellow items (percentage).',
  `minbidpricegrey` int(11) DEFAULT '70' COMMENT 'Starting bid price of Grey items as a percentage of the randomly chosen buyout price. Default: 70',
  `maxbidpricegrey` int(11) DEFAULT '100' COMMENT 'Starting bid price of Grey items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpricewhite` int(11) DEFAULT '70' COMMENT 'Starting bid price of White items as a percentage of the randomly chosen buyout price. Default: 70',
  `maxbidpricewhite` int(11) DEFAULT '100' COMMENT 'Starting bid price of White items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpricegreen` int(11) DEFAULT '80' COMMENT 'Starting bid price of Green items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpricegreen` int(11) DEFAULT '100' COMMENT 'Starting bid price of Green items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpriceblue` int(11) DEFAULT '75' COMMENT 'Starting bid price of Blue items as a percentage of the randomly chosen buyout price. Default: 75',
  `maxbidpriceblue` int(11) DEFAULT '100' COMMENT 'Starting bid price of Blue items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpricepurple` int(11) DEFAULT '80' COMMENT 'Starting bid price of Purple items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpricepurple` int(11) DEFAULT '100' COMMENT 'Starting bid price of Purple items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpriceorange` int(11) DEFAULT '80' COMMENT 'Starting bid price of Orange items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpriceorange` int(11) DEFAULT '100' COMMENT 'Starting bid price of Orange items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpriceyellow` int(11) DEFAULT '80' COMMENT 'Starting bid price of Yellow items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpriceyellow` int(11) DEFAULT '100' COMMENT 'Starting bid price of Yellow items as a percentage of the randomly chosen buyout price. Default: 100',
  `maxstackgrey` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackwhite` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackgreen` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackblue` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackpurple` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackorange` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackyellow` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `buyerpricegrey` int(11) DEFAULT '1' COMMENT 'Multiplier to vendorprice when buying grey items from auctionhouse',
  `buyerpricewhite` int(11) DEFAULT '3' COMMENT 'Multiplier to vendorprice when buying white items from auctionhouse',
  `buyerpricegreen` int(11) DEFAULT '5' COMMENT 'Multiplier to vendorprice when buying green items from auctionhouse',
  `buyerpriceblue` int(11) DEFAULT '12' COMMENT 'Multiplier to vendorprice when buying blue items from auctionhouse',
  `buyerpricepurple` int(11) DEFAULT '15' COMMENT 'Multiplier to vendorprice when buying purple items from auctionhouse',
  `buyerpriceorange` int(11) DEFAULT '20' COMMENT 'Multiplier to vendorprice when buying orange items from auctionhouse',
  `buyerpriceyellow` int(11) DEFAULT '22' COMMENT 'Multiplier to vendorprice when buying yellow items from auctionhouse',
  `buyerbiddinginterval` int(11) DEFAULT '1' COMMENT 'Interval how frequently AHB bids on each AH. Time in minutes',
  `buyerbidsperinterval` int(11) DEFAULT '1' COMMENT 'number of bids to put in per bidding interval',
  PRIMARY KEY (`auctionhouse`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auctionhousebot
-- ----------------------------
INSERT INTO `auctionhousebot` VALUES ('2', 'Alliance', '250', '250', '0', '27', '12', '10', '1', '0', '0', '0', '10', '30', '8', '2', '0', '0', '100', '150', '150', '250', '800', '1400', '1250', '1750', '2250', '4550', '3250', '5550', '5250', '6550', '70', '100', '70', '100', '80', '100', '75', '100', '80', '100', '80', '100', '80', '100', '0', '0', '3', '2', '1', '1', '1', '1', '3', '5', '12', '15', '20', '22', '1', '1');
INSERT INTO `auctionhousebot` VALUES ('6', 'Horde', '250', '250', '0', '27', '12', '10', '1', '0', '0', '0', '10', '30', '8', '2', '0', '0', '100', '150', '150', '250', '800', '1400', '1250', '1750', '2250', '4550', '3250', '5550', '5250', '6550', '70', '100', '70', '100', '80', '100', '75', '100', '80', '100', '80', '100', '80', '100', '0', '0', '3', '2', '1', '1', '1', '1', '3', '5', '12', '15', '20', '22', '1', '1');
INSERT INTO `auctionhousebot` VALUES ('7', 'Neutral', '250', '250', '0', '27', '12', '10', '1', '0', '0', '0', '10', '30', '8', '2', '0', '0', '100', '150', '150', '250', '800', '1400', '1250', '1750', '2250', '4550', '3250', '5550', '5250', '6550', '70', '100', '70', '100', '80', '100', '75', '100', '80', '100', '80', '100', '80', '100', '0', '0', '3', '2', '1', '1', '1', '1', '3', '5', '12', '15', '20', '22', '1', '1');

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (999990, 0, 0, 0, 0, 0, 23766, 0, 0, 0, 'Arena Battlemaster 1v1', '', '', 8218, 70, 70, 2, 35, 1048577, 1.1, 1.14286, 1, 0, 252, 357, 0, 304, 1, 2000, 2000, 1, 768, 2048, 0, 0, 0, 0, 0, 0, 215, 320, 44, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 'arena1v1_worldscript', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (999991, 0, 0, 0, 0, 0, 23766, 0, 0, 0, 'Arena Battlemaster 1v1', '', '', 8218, 70, 70, 2, 35, 1048577, 1.1, 1.14286, 3, 0, 252, 357, 0, 304, 1, 2000, 2000, 1, 768, 2048, 0, 0, 0, 0, 0, 0, 215, 320, 44, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 'npc_1v1arena', 12340);
/*
 * Copyright (С) since 2019 Andrei Guluaev (Winfidonarleyan/Kargatum) https://github.com/Winfidonarleyan
 * Licence MIT https://opensource.org/MIT
 */

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1553428344428393600');

-- ----------------------------
-- Table structure for anti_ad_message
-- ----------------------------
DROP TABLE IF EXISTS `anti_ad_message`;
CREATE TABLE `anti_ad_message`  (
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`message`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of anti_ad_message
-- ----------------------------
INSERT INTO `anti_ad_message` VALUES
('(w)(o)(w)'),
('.com'),
('.eu'),
('.fr'),
('.info'),
('.net'),
('.org'),
('.ru'),
('.zapto'),
('.рф'),
('://'),
('http'),
('no-ip'),
('w-o-w'),
('wow'),
('www');

-- ----------------------------
-- Table structure for item_levelup
-- ----------------------------
-- DROP TABLE IF EXISTS `item_levelup`;
-- CREATE TABLE `item_levelup`  (
--   `Entry` int(10) NOT NULL,
--   `MinLevel` int(3) NULL DEFAULT 0,
--   `MaxLevel` int(3) NULL DEFAULT 0,
--   `Comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
--   PRIMARY KEY (`Entry`) USING BTREE
-- ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of item_levelup
-- ----------------------------
-- INSERT INTO `item_levelup` VALUES (80000, 1, 20, '1 - 20 Уровень');
-- INSERT INTO `item_levelup` VALUES (80001, 21, 40, '21 - 40 Уровень');
-- INSERT INTO `item_levelup` VALUES (80002, 41, 60, '41 - 60 Уровень');

-- ----------------------------
-- Table structure for level_reward
-- ----------------------------
DROP TABLE IF EXISTS `level_reward`;
CREATE TABLE `level_reward`  (
  `Level` int(3) NOT NULL DEFAULT 1,
  `Money` int(20) NOT NULL DEFAULT 0,
  `ItemID` int(20) NOT NULL DEFAULT 0,
  `ItemCount` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for online_reward_history
-- ----------------------------
DROP TABLE IF EXISTS `online_reward_history`;
CREATE TABLE `online_reward_history`  (
  `PlayedGuid` bigint(20) NOT NULL DEFAULT 0,
  `Rewarded` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RewardedPerHour` int(20) NULL DEFAULT 0,
  PRIMARY KEY (`PlayedGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for online_reward
-- ----------------------------
DROP TABLE IF EXISTS `online_reward`;
CREATE TABLE `online_reward`  (
  `RewardPlayedTime` int(20) NOT NULL DEFAULT 0,
  `ItemID` int(11) NOT NULL DEFAULT 1,
  `Count` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`RewardPlayedTime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of online_reward
-- ----------------------------
-- INSERT INTO `online_reward` VALUES (700, 49426, 5);
-- INSERT INTO `online_reward` VALUES (900, 49426, 10);
-- INSERT INTO `online_reward` VALUES (930, 49426, 20);

-- ----------------------------
-- Table structure for player_buff
-- ----------------------------
DROP TABLE IF EXISTS `player_buff`;
CREATE TABLE `player_buff`  (
  `SpellID` int(10) NOT NULL COMMENT 'Spell ID',
  `Comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`spellid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- Class buff
INSERT INTO `player_buff` VALUES (25898, '');
INSERT INTO `player_buff` VALUES (48074, '');
INSERT INTO `player_buff` VALUES (48162, '');
INSERT INTO `player_buff` VALUES (48470, '');
INSERT INTO `player_buff` VALUES (57623, '');
INSERT INTO `player_buff` VALUES (61316, '');
-- INSERT INTO `player_buff` VALUES (62276, 'Покров молний (тест)');

-- ----------------------------
-- Table structure for spell_duration
-- ----------------------------
DROP TABLE IF EXISTS `spell_duration`;
CREATE TABLE `spell_duration`  (
  `SpellID` int(11) NOT NULL COMMENT 'Айди спелла',
  `MaxDuration` int(11) NULL DEFAULT NULL COMMENT 'Время в секундах',
  PRIMARY KEY (`SpellID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- Class buff
INSERT INTO `spell_duration` VALUES (25898, -1);
INSERT INTO `spell_duration` VALUES (48074, -1);
INSERT INTO `spell_duration` VALUES (48162, -1);
INSERT INTO `spell_duration` VALUES (48470, -1);
INSERT INTO `spell_duration` VALUES (57623, -1);
INSERT INTO `spell_duration` VALUES (61316, -1);

-- Add trinity_string
DELETE FROM `trinity_string` WHERE `entry` IN (50000, 50001, 50002, 50003);
INSERT INTO `trinity_string`(`entry`, `content_default`, `content_loc8`) VALUES
(50000, '|cFFFF0000[AntiAD]:|r %s |cff6C8CD5said a bad word:|r %s', '|cFFFF0000[Антиреклама]:|r %s |cff6C8CD5сказал запрещённое слово:|r %s'),
(50001, '|cFFFF0000[AntiAD]:|cff6C8CD5 You chat muted on |r %u |cff6C8CD5minutes.', '|cFFFF0000[Антиреклама]:|cff6C8CD5 Ваш чат заблокирован на|r %u |cff6C8CD5минут.'),
(50002, '|cFFFF0000[AntiAD]:|r %s |cff6C8CD5wanted to say:|r %s', '|cFFFF0000[Антиреклама]:|r %s |cff6C8CD5хотел сказать:|r %s'),
(50003, '|cffff0000# |cff00ff00Player|r %s |cff00ff00will not be able to speak yet:|r |cffff0000%s|r', '|cffff0000# |cff00ff00Игрок|r %s |cff00ff00не сможет говорить ещё: |cffff0000%s');
