local huntingLocations = Harmony.ui.side.top.addButton("walkToHunting", "Hunting")

local huntingLevel1 = Harmony.ui.side.top.addChildFlyout(huntingLocations, "hunting1k", "1000+")
huntingLevel1:setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel1, "actarValleyHunting", "Actar Valley", "mmp.gotoRoom", 12066):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel1, "bopalopiaHunting", "Bopalopia", "mmp.gotoRoom", 23021):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel1, "beastlordHunting", "Beastlords", "mmp.gotoRoom", 4230):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel1, "bogOfAshtanHunting", "Bog of Ashtan", "mmp.gotoRoom", 10266):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel1, "manara1Hunting", "Manara F1", "mmp.gotoRoom", 16349):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel1, "manara2Hunting", "Manara F2", "mmp.gotoRoom", 18316):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel1, "mhojaveDesert", "Mhojave Desert", "mmp.gotoRoom", 328):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel1, "tasurkeCavesHunting", "Tasur'ke Caves", "mmp.gotoRoom", 18560):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel1, "xhaidenDaleHunting", "Xhaiden Dale (Lower)", "mmp.gotoRoom", 26420):setStyleSheet(Harmony.ui.styles.huntingButton)

local huntingLevel2 = Harmony.ui.side.top.addChildFlyout(huntingLocations, "hunting2k", "2000+ A-K")
huntingLevel2:setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "aeraithianFallsHunting", "Aeraithian Falls", "mmp.gotoRoom", 11027):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "aranroidHunting", "Aran'roid (W - NW)", "mmp.gotoRoom", 7584):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "azdunFloor1Hunting", "Azdun Upper", "mmp.gotoRoom", 1772):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "beastlordsOphidianHunting", "Beastlords", "mmp.gotoRoom", 4277):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "blackForestHunting", "Black Forest", "mmp.gotoRoom", 23544):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "enverrenCastleHunting", "Enverren Castle", "mmp.gotoRoom", 17865):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "enverrenMarshHunting", "Enverren Marsh", "mmp.gotoRoom", 19239):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "dunValleyCavemenHunting", "Dun Valley Cavemen", "mmp.gotoRoom", 4695):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "dunFortressEntranceHunting", "Dun Fortress Entrance", "mmp.gotoRoom", 3886):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "dwarvenCampHunting", "Dwarven Camp", "mmp.gotoRoom", 10837):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "forestWatchHunting", "Forest Watch", "mmp.gotoRoom", 7694):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "goblinVillageHunting", "Goblin Village", "mmp.gotoRoom", 6625):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "greenLakeHunting", "Green Lake", "mmp.gotoRoom", 8328):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "jaruHunting", "Jaru (Targossas)", "mmp.gotoRoom", 5587):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel2, "kamleikanHunting", "Kamleikan (W - NW)", "mmp.gotoRoom", 7584):setStyleSheet(Harmony.ui.styles.huntingButton)

local huntingLevelLZ = Harmony.ui.side.top.addChildFlyout(huntingLocations, "hunting2klz", "2000+ L-Z")
huntingLevelLZ:setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "lakeMuurnHunting", "Lake Muurn", "mmp.gotoRoom", 9567):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "manara3Hunting", "Manara F3", "mmp.gotoRoom", 16490):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "manticoresUpperHunting", "Manticore (Upper)", "mmp.gotoRoom", 10129):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "manushaHunting", "Manusha", "mmp.gotoRoom", 8729):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "northReachHunting", "Northreach", "mmp.gotoRoom", 7367):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "orcCampHunting", "Orc Camp", "mmp.gotoRoom", 10865):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "polyargosHunting", "Polyargos (F)", "mmp.gotoRoom", 6557):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "rheodadHunting", "Rheodad (W - W)", "mmp.gotoRoom", 7537):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "sangrePlainsHunting", "Sangre Plains", "mmp.gotoRoom", 7626):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "shalaKhuliaHunting", "Shala-Khulia (F)", "mmp.gotoRoom", 6557):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "shalajenHunting", "Shala'jen", "mmp.gotoRoom", 7060):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "ulangiHunting", "Ulangi (F)", "mmp.gotoRoom", 2864):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "undergroundLakeHunting", "Underground Lake", "mmp.gotoRoom", 8609):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevelLZ, "xhaidenDalteUpperHunting", "Xhaden Dale", "mmp.gotoRoom", 24954):setStyleSheet(Harmony.ui.styles.huntingButton)

local huntingLevel3 = Harmony.ui.side.top.addChildFlyout(huntingLocations, "hunting3k", "3000+ A-H")
huntingLevel3:setStyleSheet(Harmony.ui.styles.huntingButton)

Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "aalenHunting", "Aalen", "mmp.gotoRoom", 1856):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "adrynHunting", "Adryn's Keep", "mmp.gotoRoom", 25842):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "arcadiaHunting", "Arcadia", "mmp.gotoRoom", 16064):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "ashtanHunting", "Ashtan Sewer", "mmp.gotoRoom", 2576):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "azdunLowerHunting", "Azdun Lower", "mmp.gotoRoom", 3106):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "belladonaHunting", "Belladona", "mmp.gotoRoom", 3273):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "bitterforkHunting", "Bitterfork", "mmp.gotoRoom", 25093):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "blackrockHunting", "Blackrock", "mmp.gotoRoom", 14046):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "crevilleHunting", "Creville Asylum", "mmp.gotoRoom", 26220):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "darkenwoodHunting", "Darkenwood", "mmp.gotoRoom", 9031):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "dunValleySwampHunting", "Dun Valley Swamp", "mmp.gotoRoom", 24495):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "eirenwaarHunting", "Eirenwaar (W - NW)", "mmp.gotoRoom", 7584):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "haraeHunting", "Harae", "mmp.gotoRoom", 18404):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3, "hashanHunting", "Hashan Sewer", "mmp.gotoRoom", 5282):setStyleSheet(Harmony.ui.styles.huntingButton)

local huntingLevel3IP = Harmony.ui.side.top.addChildFlyout(huntingLocations, "hunting3kIP", "3000+ I-P")
huntingLevel3IP:setStyleSheet(Harmony.ui.styles.huntingButton)

Harmony.ui.side.top.addFlyoutChild(huntingLevel3IP, "inbhirNessHunting", "Inbhir Ness (W - W)", "mmp.gotoRoom", 10913):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3IP, "istarHunting", "Istar Jungle (W - N)", "mmp.gotoRoom", 7584):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3IP, "ivorytowerHunting", "Ivory Tower", "mmp.gotoRoom", 29778):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3IP, "kadolokiHunting", "Ka'doloki", "mmp.gotoRoom", 25089):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3IP, "kasmarkinHunting", "Kasmarkin", "mmp.gotoRoom", 9952):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3IP, "maimHunting", "Maim's Mansion", "mmp.gotoRoom", 10293):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3IP, "mhojave3kHunting", "Mhojave", "mmp.gotoRoom", 4312):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3IP, "mogheduUpperHunting", "Moghedu (Upper)", "mmp.gotoRoom", 6):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3IP, "mountPiraeusHunting", "Mount Piraeus", "mmp.gotoRoom", 28453):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3IP, "mysiaHunting", "Mysia (F)", "mmp.gotoRoom", 2864):setStyleSheet(Harmony.ui.styles.huntingButton)

local huntingLevel3QX = Harmony.ui.side.top.addChildFlyout(huntingLocations, "hunting3kIP", "3000+ Q-X")
huntingLevel3QX:setStyleSheet(Harmony.ui.styles.huntingButton)

Harmony.ui.side.top.addFlyoutChild(huntingLevel3QX, "phereklosHunting", "Phereklos", "mmp.gotoRoom", 25323):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3QX, "quisalisHunting", "Quisalis Caves (Upper)", "mmp.gotoRoom", 23083):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3QX, "scorpionHunting", "Scorpion Pit (Mhojave)", "mmp.gotoRoom", 322):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3QX, "seaLionCoveHunting", "Sea Lion Cove", "mmp.gotoRoom", 21727):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3QX, "shastaanHunting", "Shastaan", "mmp.gotoRoom", 2856):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3QX, "southVashnarHunting", "South Vashnars", "mmp.gotoRoom", 10181):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3QX, "tomaculaHunting", "Tomacula", "mmp.gotoRoom", 1520):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3QX, "tundraHunting", "Tundra (W - NW)", "mmp.gotoRoom", 7595):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3QX, "ulangiLowerHunting", "Ulangi (F)", "mmp.gotoRoom", 2864):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel3QX, "westernVashnarHunting", "Western Vashnar", "mmp.gotoRoom", 2008):setStyleSheet(Harmony.ui.styles.huntingButton)

local huntingLevel4 = Harmony.ui.side.top.addChildFlyout(huntingLocations, "hunting4k", "4000+")
huntingLevel4:setStyleSheet(Harmony.ui.styles.huntingButton)

Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "annwynHunting", "Annwyn", "mmp.gotoRoom", 4840):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "belladonaHunting", "Belladona's Keep", "mmp.gotoRoom", 3273):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "dunValleyFullHunting", "Dun Valley", "mmp.gotoRoom", 3886):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "grimlathHunting", "Grimlath", "mmp.gotoRoom", 10502):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "hillGiantHunting", "Hill Giants", "mmp.gotoRoom", 7628):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "isaiaHunting", "Isaia (W - WNW)", "mmp.gotoRoom", 7584):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "manticoreHunting", "Manticore (Lower)", "mmp.gotoRoom", 15961):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "mogedhu2fHunting", "Moghedu F2", "mmp.gotoRoom", 103):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "morindarHunting", "Morindar (W - NNW)", "mmp.gotoRoom", 7584):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "khuledraHunting", "Khulhedra", "mmp.gotoRoom", 8765):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "mourningPassHunting", "Mourning Pass (M)", "mmp.gotoRoom", 27967):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "newHopePantherHunting", "New Hope Panthers", "mmp.gotoRoom", 24056):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "nuskuweHunting", "Nuskuwe Caverns", "mmp.gotoRoom", 17118):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "quartzPeakHunting", "Quartz Peak", "mmp.gotoRoom", 14547):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "qurnokVillageHunting", "Qurnok Village", "mmp.gotoRoom", 24931):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "riagathHunting", "Riagath (W - N)", "mmp.gotoRoom", 7584):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "siroccoFortressHunting", "Sirocco Fortress (M)", "mmp.gotoRoom", 22537):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "tirMurannHunting", "Tir Murann", "mmp.gotoRoom", 21552):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "tenwatPrisonHunting", "Tenwat Prison (W - NE)", "mmp.gotoRoom", 7584):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel4, "underworldHunting", "Underworld", "mmp.gotoRoom", 14594):setStyleSheet(Harmony.ui.styles.huntingButton)

local huntingLevel7 = Harmony.ui.side.top.addChildFlyout(huntingLocations, "hunting7k", "7000+")
huntingLevel7:setStyleSheet(Harmony.ui.styles.huntingButton)

Harmony.ui.side.top.addFlyoutChild(huntingLevel7, "siroccoDucalHunting", "Sirocco Fortress (M)", "mmp.gotoRoom", 22537):setStyleSheet(Harmony.ui.styles.huntingButton)
Harmony.ui.side.top.addFlyoutChild(huntingLevel7, "squallCleftHunting", "Squall Cleft (M)", "mmp.gotoRoom", 44695):setStyleSheet(Harmony.ui.styles.huntingButton)
