procedure LargeEnum is
  type Colors is (
      AbsoluteZero,
      AcidGreen,
      Aero,
      AeroBlue,
      AfricanViolet,
      AirsuperiorityBlue,
      Alabaster,
      Alizarin,
      AliceBlue,
      AlloyOrange,
      Almond,
      Amaranth,
      AmaranthMP,
      AmaranthPink,
      AmaranthPurple,
      AmaranthRed,
      Amazon,
      Amber,
      AmberSAEECE,
      Amethyst,
      AndroidGreen,
      AntiqueBrass,
      AntiqueBronze,
      Antiquefuchsia,
      Antiqueruby,
      Antiquewhite,
      AoEnglish,
      AppleGreen,
      Apricot,
      Aqua,
      Aquamarine,
      Arcticlime,
      ArmyGreen,
      Artichoke,
      ArylideYellow,
      AshGray,
      Asparagus,
      Astronaut,
      AtomicTangerine,
      Auburn,
      Aureolin,
      Avocado,
      Azure,
      AzureX11Webcolor,
      BabyBlue,
      BabyBlueeyes,
      BabyPink,
      Babypowder,
      BakerMillerPink,
      BananaMania,
      BarbiePink,
      BarnRed,
      Battleshipgrey,
      BeauBlue,
      Beaver,
      Beige,
      BdazzledBlue,
      BigdipoRuby,
      Bisque,
      Bistre,
      BistreBrown,
      Bitterlemon,
      Bitterlime,
      Bittersweet,
      Bittersweetshimmer,
      Black,
      Blackbean,
      Blackchocolate,
      Blackcoffee,
      Blackcoral,
      BlackOlive,
      BlackShadows,
      BlanchedAlmond,
      BlastOffBronze,
      BleudeFrance,
      BlizzardBlue,
      Blond,
      BloodRed,
      Blue,
      BlueCrayola,
      BlueMunsell,
      BlueNCS,
      BluePantone,
      Bluepigment,
      BlueRYB,
      Bluebell,
      BlueGray,
      BlueGreen,
      BlueGreencolorwheel,
      Bluejeans,
      Bluesapphire,
      BlueViolet,
      BlueVioletCrayola,
      BlueVioletcolorwheel,
      Blueyonder,
      Bluetiful,
      Blush,
      Bole,
      Bone,
      BottleGreen,
      Brandy,
      BrickRed,
      BrightGreen,
      Brightlilac,
      Brightmaroon,
      BrightnavyBlue,
      BrightyellowCrayola,
      Brilliantrose,
      BrinkPink,
      BritishracingGreen,
      Bronze,
      Brown,
      Brownsugar,
      BrunswickGreen,
      BudGreen,
      Buff,
      Burgundy,
      Burlywood,
      BurnishedBrown,
      BurntOrange,
      Burntsienna,
      Burntumber,
      Byzantine,
      Byzantium,
      Cadet,
      CadetBlue,
      CadetBlueCrayola,
      Cadetgrey,
      CadmiumGreen,
      CadmiumOrange,
      CadmiumRed,
      CadmiumYellow,
      CafeAulait,
      CafeNoir,
      CambridgeBlue,
      Camel,
      CameoPink,
      Canary,
      CanaryYellow,
      CandyappleRed,
      CandyPink,
      Capri,
      Caputmortuum,
      Cardinal,
      CaribbeanGreen,
      Carmine,
      CarmineMP,
      CarnationPink,
      Carnelian,
      CarolinaBlue,
      CarrotOrange,
      CastletonGreen,
      Catawba,
      CedarChest,
      Celadon,
      CeladonBlue,
      CeladonGreen,
      Celeste,
      CelticBlue,
      Cerise,
      Cerulean,
      CeruleanBlue,
      Ceruleanfrost,
      CeruleanCrayola,
      CGBlue,
      CGRed,
      Champagne,
      ChampagnePink,
      Charcoal,
      CharlestonGreen,
      CharmPink,
      Chartreusetraditional,
      Chartreuseweb,
      CherryblossomPink,
      Chestnut,
      ChiliRed,
      ChinaPink,
      Chinarose,
      ChineseRed,
      ChineseViolet,
      ChineseYellow,
      Chocolatetraditional,
      Chocolateweb,
      ChocolateCosmos,
      ChromeYellow,
      Cinereous,
      Cinnabar,
      CinnamonSatin,
      Citrine,
      Citron,
      Claret,
      CobaltBlue,
      CocoaBrown,
      Coffee,
      ColumbiaBlue,
      CongoPink,
      Coolgrey,
      Copper,
      CopperCrayola,
      Copperpenny,
      CopperRed,
      Copperrose,
      Coquelicot,
      Coral,
      CoralPink,
      Cordovan,
      Corn,
      CornellRed,
      CornflowerBlue,
      CornSilk,
      Cosmiccobalt,
      Cosmiclatte,
      CoyoteBrown,
      Cottoncandy,
      Cream,
      Crimson,
      CrimsonUA,
      Crystal,
      CultuRed,
      Cyan,
      Cyanprocess,
      Cybergrape,
      CyberYellow,
      Cyclamen,
      DarkBlueGray,
      DarkBrown,
      Darkbyzantium,
      DarkcornflowerBlue,
      Darkcyan,
      DarkelectricBlue,
      Darkgoldenrod,
      DarkGreen,
      DarkGreenX11,
      DarkjungleGreen,
      Darkkhaki,
      Darklava,
      Darkliver,
      Darkliverhorses,
      Darkmagenta,
      DarkmossGreen,
      DarkoliveGreen,
      DarkOrange,
      Darkorchid,
      DarkpastelGreen,
      DarkPurple,
      DarkRed,
      Darksalmon,
      DarkseaGreen,
      Darksienna,
      DarkskyBlue,
      DarkslateBlue,
      DarkslateGray,
      DarkspringGreen,
      Darkturquoise,
      DarkViolet,
      DartmouthGreen,
      DavysGrey,
      Deepcerise,
      Deepchampagne,
      Deepchestnut,
      DeepjungleGreen,
      DeepPink,
      Deepsaffron,
      DeepskyBlue,
      DeepSpaceSparkle,
      Deeptaupe,
      Denim,
      DenimBlue,
      Desert,
      Desertsand,
      DimGray,
      DodgerBlue,
      Dogwoodrose,
      Drab,
      DukeBlue,
      Dutchwhite,
      EarthYellow,
      Ebony,
      Ecru,
      EerieBlack,
      Eggplant,
      Eggshell,
      EgyptianBlue,
      Eigengrau,
      ElectricBlue,
      ElectricGreen,
      Electricindigo,
      Electriclime,
      ElectricPurple,
      ElectricViolet,
      Emerald,
      Eminence,
      EnglishGreen,
      EnglishLavender,
      EnglishRed,
      Englishvermillion,
      EnglishViolet,
      Erin,
      EtonBlue,
      Fallow,
      FaluRed,
      Fandango,
      FandangoPink,
      Fashionfuchsia,
      Fawn,
      Feldgrau,
      FernGreen,
      Fielddrab,
      Fieryrose,
      Firebrick,
      FireengineRed,
      Fireopal,
      Flame,
      Flax,
      Flirt,
      Floralwhite,
      FluorescentBlue,
      ForestGreenCrayola,
      ForestGreentraditional,
      ForestGreenweb,
      Frenchbeige,
      Frenchbistre,
      FrenchBlue,
      Frenchfuchsia,
      Frenchlilac,
      Frenchlime,
      Frenchmauve,
      FrenchPink,
      Frenchraspberry,
      Frenchrose,
      FrenchskyBlue,
      FrenchViolet,
      Frostbite,
      Fuchsia,
      FuchsiaCrayola,
      FuchsiaPurple,
      Fuchsiarose,
      Fulvous,
      FuzzyWuzzy,
      Gainsboro,
      Gamboge,
      GenericViridian,
      Ghostwhite,
      Glaucous,
      Glossygrape,
      GOGreen,
      Gold,
      GoldMetallic,
      GoldwebGolden,
      GoldCrayola,
      GoldFusion,
      GoldenBrown,
      Goldenpoppy,
      GoldenYellow,
      Goldenrod,
      GothamGreen,
      GraniteGray,
      GrannySmithapple,
      Grayweb,
      GrayX11Gray,
      Green,
      GreenCrayola,
      Greenweb,
      GreenMunsell,
      GreenNCS,
      GreenPantone,
      Greenpigment,
      GreenRYB,
      GreenBlue,
      GreenBlueCrayola,
      GreenCyan,
      GreenLizard,
      GreenSheen,
      GreenYellow,
      GreenYellowCrayola,
      Grullo,
      Gunmetal,
      HanBlue,
      HanPurple,
      HansaYellow,
      Harlequin,
      HarvestGold,
      HeatWave,
      Heliotrope,
      HeliotropeGray,
      Hollywoodcerise,
      Honeydew,
      HonoluluBlue,
      HookersGreen,
      Hotmagenta,
      HotPink,
      HunterGreen,
      Iceberg,
      Icterine,
      Illuminatingemerald,
      ImperialRed,
      Inchworm,
      Independence,
      IndiaGreen,
      IndianRed,
      IndianYellow,
      Indigo,
      Indigodye,
      InfraRed,
      InternationalKleinBlue,
      InternationalOrangeaerospace,
      InternationalOrangeengineering,
      InternationalOrangeGoldenGateBridge,
      Iris,
      Irresistible,
      Isabelline,
      ItalianskyBlue,
      Ivory,
      Jade,
      Japanesecarmine,
      JapaneseViolet,
      Jasmine,
      Jazzberryjam,
      Jet,
      Jonquil,
      Junebud,
      JungleGreen,
      KellyGreen,
      Keppel,
      Keylime,
      Khakiweb,
      KhakiX11Lightkhaki,
      Kobe,
      Kobi,
      Kobicha,
      KombuGreen,
      KSUPurple,
      LanguidLavender,
      Lapislazuli,
      Laserlemon,
      LaurelGreen,
      Lava,
      Lavenderfloral,
      Lavenderweb,
      LavenderBlue,
      Lavenderblush,
      LavenderGray,
      LawnGreen,
      Lemon,
      Lemonchiffon,
      Lemoncurry,
      Lemonglacier,
      Lemonmeringue,
      LemonYellow,
      LemonyellowCrayola,
      Liberty,
      LightBlue,
      Lightcoral,
      LightcornflowerBlue,
      Lightcyan,
      LightFrenchbeige,
      LightgoldenrodYellow,
      LightGray,
      LightGreen,
      LightOrange,
      Lightperiwinkle,
      LightPink,
      Lightsalmon,
      LightseaGreen,
      LightskyBlue,
      LightslateGray,
      LightsteelBlue,
      LightYellow,
      Lilac,
      LilacLuster,
      Limecolorwheel,
      LimewebX11Green,
      LimeGreen,
      LincolnGreen,
      Linen,
      Lion,
      LiseranPurple,
      LittleboyBlue,
      Liver,
      Liverdogs,
      Liverorgan,
      Liverchestnut,
      Livid,
      MacaroniandCheese,
      MadderLake,
      Magenta,
      MagentaCrayola,
      Magentadye,
      MagentaPantone,
      Magentaprocess,
      Magentahaze,
      Magicmint,
      Magnolia,
      Mahogany,
      Maize,
      MaizeCrayola,
      MajorelleBlue,
      Malachite,
      Manatee,
      Mandarin,
      Mango,
      MangoTango,
      Mantis,
      MardiGras,
      MariGold,
      MaroonCrayola,
      Maroonweb,
      MaroonX11,
      Mauve,
      Mauvetaupe,
      Mauvelous,
      MaximumBlue,
      MaximumBlueGreen,
      MaximumBluePurple,
      MaximumGreen,
      MaximumGreenYellow,
      MaximumPurple,
      MaximumRed,
      MaximumRedPurple,
      MaximumYellow,
      MaximumyellowRed,
      MayGreen,
      MayaBlue,
      Mediumaquamarine,
      MediumBlue,
      MediumcandyappleRed,
      Mediumcarmine,
      Mediumchampagne,
      Mediumorchid,
      MediumPurple,
      MediumseaGreen,
      MediumslateBlue,
      MediumspringGreen,
      Mediumturquoise,
      MediumVioletRed,
      Mellowapricot,
      MellowYellow,
      Melon,
      MetallicGold,
      MetallicSeaweed,
      MetallicSunburst,
      MexicanPink,
      MiddleBlue,
      MiddleBlueGreen,
      MiddleBluePurple,
      Middlegrey,
      MiddleGreen,
      MiddleGreenYellow,
      MiddlePurple,
      MiddleRed,
      MiddleRedPurple,
      MiddleYellow,
      MiddleyellowRed,
      Midnight,
      MidnightBlue,
      MidnightGreeneagleGreen,
      MikadoYellow,
      MimiPink,
      Mindaro,
      Ming,
      MinionYellow,
      Mint,
      Mintcream,
      MintGreen,
      Mistymoss,
      Mistyrose,
      Modebeige,
      MorningBlue,
      MossGreen,
      MountainMeadow,
      MountbattenPink,
      MSUGreen,
      Mulberry,
      MulberryCrayola,
      Mustard,
      MyrtleGreen,
      Mystic,
      Mysticmaroon,
      NadeshikoPink,
      NaplesYellow,
      Navajowhite,
      NavyBlue,
      NavyBlueCrayola,
      NeonBlue,
      NeonCarrot,
      NeonGreen,
      Neonfuchsia,
      NewYorkPink,
      Nickel,
      NonPhotoBlue,
      Nyanza,
      OceanBlue,
      OceanGreen,
      Ochre,
      OldBurgundy,
      OldGold,
      Oldlace,
      OldLavender,
      Oldmauve,
      Oldrose,
      OldSilver,
      Olive,
      OliveDrab3,
      OliveDrab7,
      OliveGreen,
      Olivine,
      Onyx,
      Opal,
      Operamauve,
      Orange,
      OrangeCrayola,
      OrangePantone,
      Orangeweb,
      Orangepeel,
      OrangeRed,
      OrangeRedCrayola,
      Orangesoda,
      OrangeYellow,
      OrangeYellowCrayola,
      Orchid,
      OrchidPink,
      OrchidCrayola,
      OuterspaceCrayola,
      OutrageousOrange,
      Oxblood,
      OxfordBlue,
      OUCrimsonRed,
      PacificBlue,
      PakistanGreen,
      PalatinatePurple,
      Paleaqua,
      Palecerulean,
      PaleDogwood,
      PalePink,
      PalePurplePantone,
      PaleSilver,
      Palespringbud,
      PansyPurple,
      PaoloVeroneseGreen,
      Papayawhip,
      ParadisePink,
      Parchment,
      ParisGreen,
      PastelPink,
      Patriarch,
      PaynesGrey,
      Peach,
      PeachCrayola,
      Peachpuff,
      Pear,
      PearlyPurple,
      Periwinkle,
      PeriwinkleCrayola,
      PermanentGeraniumLake,
      PersianBlue,
      PersianGreen,
      Persianindigo,
      PersianOrange,
      PersianPink,
      Persianplum,
      PersianRed,
      Persianrose,
      Persimmon,
      PewterBlue,
      Phlox,
      PhthaloBlue,
      PhthaloGreen,
      PicoteeBlue,
      Pictorialcarmine,
      PiggyPink,
      PineGreen,
      Pinetree,
      Pink,
      PinkPantone,
      Pinkflamingo,
      Pinklace,
      PinkLavender,
      PinkSherbet,
      Pistachio,
      Platinum,
      Plum,
      Plumweb,
      PlumpPurple,
      PolishedPine,
      PompandPower,
      Popstar,
      PortlandOrange,
      PowderBlue,
      PrincetonOrange,
      ProcessYellow,
      Prune,
      PrussianBlue,
      PsychedelicPurple,
      Puce,
      PullmanBrownUPSBrown,
      Pumpkin,
      Purple,
      Purpleweb,
      PurpleMunsell,
      PurpleX11,
      Purplemountainmajesty,
      Purplenavy,
      Purplepizzazz,
      PurplePlum,
      Purpureus,
      QueenBlue,
      QueenPink,
      QuickSilver,
      Quinacridonemagenta,
      RadicalRed,
      RaisinBlack,
      Rajah,
      Raspberry,
      Raspberryglace,
      Raspberryrose,
      Rawsienna,
      Rawumber,
      Razzledazzlerose,
      Razzmatazz,
      RazzmicBerry,
      RebeccaPurple,
      Red,
      RedCrayola,
      RedMunsell,
      RedNCS,
      RedPantone,
      Redpigment,
      RedRYB,
      RedOrange,
      RedOrangeCrayola,
      RedOrangeColorwheel,
      RedPurple,
      RedSalsa,
      RedViolet,
      RedVioletCrayola,
      RedVioletColorwheel,
      Redwood,
      ResolutionBlue,
      Rhythm,
      RichBlack,
      RichblackFOGRA29,
      RichblackFOGRA39,
      RifleGreen,
      RobineggBlue,
      RocketMetallic,
      RojoSpanishRed,
      RomanSilver,
      Rose,
      Rosebonbon,
      RoseDust,
      Roseebony,
      Rosemadder,
      RosePink,
      RosePompadour,
      Rosequartz,
      RoseRed,
      Rosetaupe,
      Rosevale,
      Rosewood,
      Rossocorsa,
      RosyBrown,
      RoyalBluedark,
      RoyalBluelight,
      RoyalPurple,
      RoyalYellow,
      Ruber,
      RubineRed,
      Ruby,
      RubyRed,
      Rufous,
      Russet,
      RussianGreen,
      RussianViolet,
      Rust,
      RustyRed,
      SacramentoStateGreen,
      SaddleBrown,
      SafetyOrange,
      SafetyOrangeblazeOrange,
      SafetyYellow,
      Saffron,
      Sage,
      StPatricksBlue,
      Salmon,
      SalmonPink,
      Sand,
      Sanddune,
      SandyBrown,
      SapGreen,
      Sapphire,
      SapphireBlue,
      SapphireCrayola,
      SatinsheenGold,
      Scarlet,
      SchaussPink,
      SchoolbusYellow,
      ScreaminGreen,
      SeaGreen,
      SeaGreenCrayola,
      Seance,
      SealBrown,
      Seashell,
      SelectiveYellow,
      Sepia,
      Shadow,
      ShadowBlue,
      ShamrockGreen,
      SheenGreen,
      ShimmeringBlush,
      ShinyShamrock,
      ShockingPink,
      ShockingPinkCrayola,
      Sienna,
      Silver,
      SilverCrayola,
      SilverMetallic,
      Silverchalice,
      SilverPink,
      Silversand,
      Sinopia,
      SizzlingRed,
      SizzlingSunrise,
      Skobeloff,
      SkyBlue,
      SkyBlueCrayola,
      Skymagenta,
      SlateBlue,
      SlateGray,
      SlimyGreen,
      Smitten,
      SmokyBlack,
      Snow,
      SolidPink,
      SonicSilver,
      Spacecadet,
      Spanishbistre,
      SpanishBlue,
      Spanishcarmine,
      SpanishGray,
      SpanishGreen,
      SpanishOrange,
      SpanishPink,
      SpanishRed,
      SpanishskyBlue,
      SpanishViolet,
      SpanishViridian,
      SpringBud,
      SpringFrost,
      SpringGreen,
      SpringGreenCrayola,
      StarcommandBlue,
      SteelBlue,
      SteelPink,
      SteelTeal,
      StildegrainYellow,
      Straw,
      Strawberry,
      StrawberryBlonde,
      SugarPlum,
      Sunglow,
      Sunray,
      Sunset,
      SuperPink,
      SweetBrown,
      SyracuseOrange,
      Tan,
      TanCrayola,
      Tangerine,
      TangoPink,
      TartOrange,
      Taupe,
      TaupeGray,
      TeaGreen,
      Tearose,
      Teal,
      TealBlue,
      Telemagenta,
      Tennetawny,
      Terracotta,
      Thistle,
      ThulianPink,
      TickleMePink,
      TiffanyBlue,
      Timberwolf,
      TitaniumYellow,
      Tomato,
      Tourmaline,
      Tropicalrainforest,
      TrueBlue,
      TrypanBlue,
      TuftsBlue,
      Tumbleweed,
      Turquoise,
      TurquoiseBlue,
      TurquoiseGreen,
      TurtleGreen,
      Tuscan,
      TuscanBrown,
      TuscanRed,
      Tuscantan,
      Tuscany,
      TwilightLavender,
      TyrianPurple,
      UABlue,
      UARed,
      Ultramarine,
      UltramarineBlue,
      UltraPink,
      UltraRed,
      Umber,
      UnbleachedSilk,
      UnitedNationsBlue,
      UniversityofPennsylvaniaRed,
      UnmellowYellow,
      UPForestGreen,
      UPmaroon,
      UpsdellRed,
      UranianBlue,
      USAFABlue,
      VanDykeBrown,
      Vanilla,
      Vanillaice,
      VegasGold,
      VenetianRed,
      Verdigris,
      Vermilion,
      VermilionX,
      Veronica,
      Violet,
      Violetcolorwheel,
      Violetcrayola,
      VioletRYB,
      Violetweb,
      VioletBlue,
      VioletBlueCrayola,
      VioletRed,
      VioletRedPerBang,
      Viridian,
      ViridianGreen,
      VividBurgundy,
      VividskyBlue,
      VividTangerine,
      VividViolet,
      Volt,
      WarmBlack,
      WeezyBlue,
      Wheat,
      White,
      WildBlueyonder,
      WildOrchid,
      WildStrawberry,
      WildWatermelon,
      Windsortan,
      Wine,
      Winedregs,
      WinterSky,
      WinterGreenDream,
      Wisteria,
      WoodBrown,
      Xanadu,
      Xanthic,
      Xanthous,
      YaleBlue,
      Yellow,
      YellowCrayola,
      YellowMunsell,
      YellowNCS,
      YellowPantone,
      Yellowprocess,
      YellowRYB,
      YellowGreen,
      YellowGreenCrayola,
      YellowGreenColorWheel,
      YellowOrange,
      YellowOrangeColorWheel,
      YellowSunshine,
      YInMnBlue,
      Zaffre,
      Zomp
    );
begin
  null;
end LargeEnum;
