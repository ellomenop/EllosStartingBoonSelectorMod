ModUtil.RegisterMod("EllosBoonSelectorMod")

local config = {
	showPreview = true
}
EllosBoonSelectorMod.config = config

EllosBoonSelectorMod.RarityFilter = {}
EllosBoonSelectorMod.GodFilter = ""
EllosBoonSelectorMod.CurrentHammerIndex = 1

EllosBoonSelectorMod.RarityColors = {Color.BoonPatchCommon, Color.BoonPatchRare, Color.BoonPatchEpic, Color.BoonPatchLegendary}

EllosBoonSelectorMod.BoonGods = {"Aphrodite", "Ares", "Artemis", "Athena", "Demeter", "Dionysus", "Poseidon", "Zeus"}
EllosBoonSelectorMod.PriorityBoons = {"WeaponTrait","SecondaryTrait","RangedTrait","RushTrait"}
EllosBoonSelectorMod.PriorityBoonsOrder = {WeaponTrait = 1, SecondaryTrait = 2, RangedTrait = 3, RushTrait = 4}
EllosBoonSelectorMod.PriorityBoonCannonicalNameToCodeName = {
		Attack = "WeaponTrait",
		Special = "SecondaryTrait",
		Dash = "RushTrait",
		Cast = "RangedTrait"
}

EllosBoonSelectorMod.HammerOptions = {
	SwordWeapon = {"SwordTwoComboTrait","SwordSecondaryAreaDamageTrait","SwordGoldDamageTrait","SwordBlinkTrait","SwordThrustWaveTrait","SwordHealthBufferDamageTrait","SwordSecondaryDoubleAttackTrait","SwordCriticalTrait","SwordBackstabTrait","SwordDoubleDashAttackTrait","SwordHeavySecondStrikeTrait","SwordCursedLifeStealTrait"},
	SwordWeapon2 = {"SwordTwoComboTrait","SwordSecondaryAreaDamageTrait","SwordGoldDamageTrait","SwordBlinkTrait","SwordThrustWaveTrait","SwordHealthBufferDamageTrait","SwordSecondaryDoubleAttackTrait","SwordCriticalTrait","SwordBackstabTrait","SwordDoubleDashAttackTrait","SwordHeavySecondStrikeTrait","SwordCursedLifeStealTrait"},
	SwordWeapon3 = {"SwordTwoComboTrait","SwordSecondaryAreaDamageTrait","SwordGoldDamageTrait","SwordBlinkTrait","SwordThrustWaveTrait","SwordHealthBufferDamageTrait","SwordSecondaryDoubleAttackTrait","SwordCriticalTrait","SwordBackstabTrait","SwordDoubleDashAttackTrait","SwordHeavySecondStrikeTrait","SwordCursedLifeStealTrait"},
	SwordWeapon4 = {"SwordConsecrationBoostTrait","SwordSecondaryAreaDamageTrait","SwordGoldDamageTrait","SwordThrustWaveTrait","SwordHealthBufferDamageTrait","SwordSecondaryDoubleAttackTrait","SwordBackstabTrait","SwordDoubleDashAttackTrait","SwordCursedLifeStealTrait"},
	SpearWeapon = {"SpearReachAttack", "SpearAutoAttack", "SpearThrowExplode", "SpearThrowBounce", "SpearThrowPenetrate", "SpearThrowCritical", "SpearSpinDamageRadius", "SpearSpinChargeLevelTime", "SpearDashMultiStrike", "SpearThrowElectiveCharge", "SpearSpinChargeAreaDamageTrait", "SpearAttackPhalanxTrait"},
	SpearWeapon2 = {"SpearReachAttack", "SpearAutoAttack", "SpearThrowPenetrate", "SpearThrowCritical", "SpearSpinDamageRadius", "SpearSpinChargeLevelTime", "SpearDashMultiStrike", "SpearSpinChargeAreaDamageTrait", "SpearAttackPhalanxTrait"},
	SpearWeapon3 = {"SpearReachAttack", "SpearThrowExplode", "SpearThrowBounce", "SpearThrowPenetrate", "SpearThrowCritical", "SpearSpinDamageRadius", "SpearSpinChargeLevelTime", "SpearDashMultiStrike", "SpearThrowElectiveCharge", "SpearSpinChargeAreaDamageTrait", "SpearAttackPhalanxTrait"},
	SpearWeapon4 = {"SpearSpinTravelDurationTrait","SpearReachAttack", "SpearThrowPenetrate", "SpearSpinDamageRadius", "SpearSpinChargeLevelTime", "SpearDashMultiStrike", "SpearThrowElectiveCharge", "SpearSpinChargeAreaDamageTrait", "SpearAttackPhalanxTrait"},
	ShieldWeapon = {"ShieldDashAOETrait", "ShieldRushProjectileTrait", "ShieldThrowFastTrait", "ShieldThrowCatchExplode", "ShieldChargeHealthBufferTrait", "ShieldChargeSpeedTrait", "ShieldBashDamageTrait", "ShieldPerfectRushTrait", "ShieldThrowElectiveCharge", "ShieldThrowEmpowerTrait", "ShieldBlockEmpowerTrait", "ShieldThrowRushTrait"},
	ShieldWeapon2 = {"ShieldDashAOETrait", "ShieldRushProjectileTrait", "ShieldThrowFastTrait", "ShieldThrowCatchExplode", "ShieldChargeHealthBufferTrait", "ShieldChargeSpeedTrait", "ShieldBashDamageTrait", "ShieldPerfectRushTrait", "ShieldThrowEmpowerTrait", "ShieldBlockEmpowerTrait", "ShieldThrowRushTrait"},
	ShieldWeapon3 = {"ShieldDashAOETrait", "ShieldRushProjectileTrait", "ShieldThrowCatchExplode", "ShieldChargeHealthBufferTrait", "ShieldChargeSpeedTrait", "ShieldBashDamageTrait", "ShieldPerfectRushTrait", "ShieldThrowEmpowerTrait", "ShieldBlockEmpowerTrait"},
	ShieldWeapon4 = {"ShieldLoadAmmoBoostTrait", "ShieldDashAOETrait", "ShieldRushProjectileTrait", "ShieldThrowFastTrait", "ShieldThrowCatchExplode", "ShieldChargeHealthBufferTrait", "ShieldChargeSpeedTrait", "ShieldBashDamageTrait", "ShieldPerfectRushTrait", "ShieldThrowElectiveCharge", "ShieldThrowEmpowerTrait", "ShieldBlockEmpowerTrait", "ShieldThrowRushTrait"},
	BowWeapon = {"BowDoubleShotTrait", "BowLongRangeDamageTrait", "BowSlowChargeDamageTrait", "BowTapFireTrait", "BowPenetrationTrait", "BowPowerShotTrait", "BowSecondaryBarrageTrait", "BowTripleShotTrait", "BowSecondaryFocusedFireTrait", "BowChainShotTrait", "BowCloseAttackTrait", "BowConsecutiveBarrageTrait"},
	BowWeapon2 = {"BowDoubleShotTrait", "BowLongRangeDamageTrait", "BowSlowChargeDamageTrait", "BowTapFireTrait", "BowPenetrationTrait", "BowPowerShotTrait", "BowSecondaryBarrageTrait", "BowTripleShotTrait", "BowChainShotTrait", "BowCloseAttackTrait", "BowConsecutiveBarrageTrait"},
	BowWeapon3 = {"BowDoubleShotTrait", "BowLongRangeDamageTrait", "BowSlowChargeDamageTrait", "BowTapFireTrait", "BowPenetrationTrait", "BowPowerShotTrait", "BowSecondaryBarrageTrait", "BowTripleShotTrait", "BowSecondaryFocusedFireTrait", "BowChainShotTrait", "BowCloseAttackTrait", "BowConsecutiveBarrageTrait"},
	BowWeapon4 = {"BowBondBoostTrait", "BowDoubleShotTrait", "BowLongRangeDamageTrait", "BowSlowChargeDamageTrait", "BowPowerShotTrait", "BowSecondaryBarrageTrait", "BowTripleShotTrait", "BowSecondaryFocusedFireTrait", "BowChainShotTrait", "BowCloseAttackTrait"},
	FistWeapon = {"FistReachAttackTrait", "FistDashAttackHealthBufferTrait", "FistTeleportSpecialTrait", "FistDoubleDashSpecialTrait", "FistChargeSpecialTrait", "FistKillTrait", "FistSpecialLandTrait", "FistAttackFinisherTrait", "FistConsecutiveAttackTrait", "FistSpecialFireballTrait", "FistAttackDefenseTrait", "FistHeavyAttackTrait"},
	FistWeapon2 = {"FistReachAttackTrait", "FistDashAttackHealthBufferTrait", "FistKillTrait", "FistSpecialLandTrait", "FistAttackFinisherTrait", "FistConsecutiveAttackTrait", "FistAttackDefenseTrait", "FistHeavyAttackTrait", "FistDoubleDashSpecialTrait"},
	FistWeapon3 = {"FistReachAttackTrait", "FistDashAttackHealthBufferTrait", "FistTeleportSpecialTrait", "FistDoubleDashSpecialTrait", "FistChargeSpecialTrait", "FistKillTrait", "FistAttackFinisherTrait", "FistConsecutiveAttackTrait", "FistSpecialFireballTrait", "FistAttackDefenseTrait", "FistHeavyAttackTrait"},
	FistWeapon4 = {"FistDetonateBoostTrait", "FistSpecialLandTrait", "FistChargeSpecialTrait", "FistConsecutiveAttackTrait", "FistDashAttackHealthBufferTrait", "FistAttackFinisherTrait", "FistAttackDefenseTrait", "FistTeleportSpecialTrait", "FistDoubleDashSpecialTrait", "FistKillTrait"},
	GunWeapon = {"GunSlowGrenade", "GunMinigunTrait", "GunShotgunTrait", "GunExplodingSecondaryTrait", "GunGrenadeFastTrait", "GunArmorPenerationTrait", "GunInfiniteAmmoTrait", "GunGrenadeClusterTrait", "GunGrenadeDropTrait", "GunHeavyBulletTrait", "GunChainShotTrait", "GunHomingBulletTrait"},
	GunWeapon2 = {"GunSlowGrenade", "GunMinigunTrait", "GunShotgunTrait", "GunExplodingSecondaryTrait", "GunGrenadeFastTrait", "GunArmorPenerationTrait", "GunInfiniteAmmoTrait", "GunGrenadeClusterTrait", "GunGrenadeDropTrait", "GunHeavyBulletTrait", "GunChainShotTrait", "GunHomingBulletTrait"},
	GunWeapon3 = {"GunSlowGrenade", "GunMinigunTrait", "GunShotgunTrait", "GunExplodingSecondaryTrait", "GunGrenadeFastTrait", "GunArmorPenerationTrait", "GunInfiniteAmmoTrait", "GunGrenadeClusterTrait", "GunGrenadeDropTrait", "GunHeavyBulletTrait", "GunChainShotTrait", "GunHomingBulletTrait"},
	GunWeapon4 = {"GunLoadedGrenadeBoostTrait", "GunLoadedGrenadeLaserTrait", "GunLoadedGrenadeSpeedTrait", "GunLoadedGrenadeWideTrait", "GunLoadedGrenadeInfiniteAmmoTrait", "GunSlowGrenade", "GunGrenadeFastTrait", "GunArmorPenerationTrait", "GunGrenadeDropTrait"},
}

--[[
Modified version of SeedControlScreen.lua
]]
ScreenData.SeedControl =
{
	ItemStartX = 1400,
	ItemStartY = 560,
	ItemSpacing = 100,
	EntryYSpacer = 50,
	ItemsPerPage = 12,
	ScrollOffset = 0,
	Digits = { 1, 2, 3, 4, 5, 6 },
}

function OpenRngSeedSelectorScreen(screen, button)
	CloseAdvancedTooltipScreen()
	UseSeedController(CurrentRun.Hero)
end

function UseSeedController( usee, args )
	PlayInteractAnimation( usee.ObjectId )
	UseableOff({ Id = usee.ObjectId })
	StopStatusAnimation( usee )
	local screen = OpenSeedControlScreen()
	UseableOn({ Id = usee.ObjectId })
end

function OpenSeedControlScreen( args )

	local screen = DeepCopyTable( ScreenData.SeedControl )
	screen.Components = {}
	local components = screen.Components
	screen.CloseAnimation = "QuestLogBackground_Out"

	OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
	FreezePlayerUnit()
	EnableShopGamepadCursor()
	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
	SetConfigOption({ Name = "FreeFormSelectStepDistance", Value = 8 })
	SetConfigOption({ Name = "FreeFormSelectSuccessDistanceStep", Value = 8 })

	components.ShopBackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
	components.ShopBackgroundSplatter = CreateScreenComponent({ Name = "LevelUpBackground", Group = "Combat_Menu" })
	components.ShopBackground = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })

	SetAnimation({ DestinationId = components.ShopBackground.Id, Name = "QuestLogBackground_In", OffsetY = 30 })

	SetScale({ Id = components.ShopBackgroundDim.Id, Fraction = 4 })
	SetColor({ Id = components.ShopBackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })

	PlaySound({ Name = "/SFX/Menu Sounds/FatedListOpen" })

	wait(0.2)

	-- Title
	CreateTextBox({ Id = components.ShopBackground.Id, Text = "Weave a New Thread?", FontSize = 34, OffsetX = 0, OffsetY = -460, Color = Color.White, Font = "SpectralSCLightTitling", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center" })
	CreateTextBox({ Id = components.ShopBackground.Id, Text = "Beware,  the  Fates  Watch  On  with  a  Single  Judging  Eye,  your  Thread  in  Hand", FontSize = 15, OffsetX = 0, OffsetY = -410, Width = 840, Color = {120, 120, 120, 255}, Font = "CrimsonTextItalic", ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 2}, Justification = "Center" })

	-- Description Box
	--components.DescriptionBox = CreateScreenComponent({ Name = "BlankObstacle", X = 815, Y = 290, Group = "Combat_Menu" })

	local itemLocationX = screen.ItemStartX
	local itemLocationY = screen.ItemStartY

	SeedControlScreenSyncDigits( screen )

	for digit, digitValue in ipairs( screen.Digits ) do
		components["DigitUp"..digit] = CreateScreenComponent({ Name = "ButtonCodexUp", X = itemLocationX, Y = itemLocationY - 100, Scale = 1.0, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu" })
		components["DigitUp"..digit].OnPressedFunctionName = "SeedDigitDown"
		components["DigitUp"..digit].ControlHotkey = "MenuLeft"
		components["DigitUp"..digit].Digit = digit

		local digitKey = "DigitButton"..digit
		components[digitKey] = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1, X = itemLocationX, Y = itemLocationY, Group = "Combat_Menu" })
		components[digitKey].Digit = digit
		AttachLua({ Id = components[digitKey].Id, Table = components[digitKey] })

		CreateTextBox({ Id = components[digitKey].Id,
			Text = digitValue,
			Color = {245, 200, 47, 255},
			FontSize = 48,
			OffsetX = 0, OffsetY = 0,
			Font = "AlegreyaSansSCBold",
			OutlineThickness = 0,
			OutlineColor = {255, 205, 52, 255},
			ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 2},
			Justification = "Center",
			DataProperties =
			{
				OpacityWithOwner = true,
			},
			})

		components["DigitDown"..digit] = CreateScreenComponent({ Name = "ButtonCodexDown", X = itemLocationX, Y = itemLocationY + 100, Scale = 1.0, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu" })
		components["DigitDown"..digit].OnPressedFunctionName = "SeedDigitUp"
		components["DigitDown"..digit].ControlHotkey = "MenuRight"
		components["DigitDown"..digit].Digit = digit

		itemLocationX = itemLocationX - screen.ItemSpacing
	end

	UpdateDigitDisplay( screen )

	-- Randomize button
	components.RandomizeButton = CreateScreenComponent({ Name = "ButtonDefault", Scale = 1.0, Group = "Combat_Menu", X = 1150, Y = 760 })
	components.RandomizeButton.OnPressedFunctionName = "SeedControlScreenRandomize"
	CreateTextBox({ Id = components.RandomizeButton.Id,
			Text = "Randomize Seed",
			OffsetX = 0, OffsetY = 0,
			FontSize = 22,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Center",
			DataProperties =
			{
				OpacityWithOwner = true,
			},
		})

	-- Roll seed for filters button
	components.ClearFiltersButton = CreateScreenComponent({ Name = "ButtonDefault", Scale = 1.0, Group = "Combat_Menu", X = 320, Y = 760 })
	components.ClearFiltersButton.OnPressedFunctionName = "ClearFilters"
	CreateTextBox({ Id = components.ClearFiltersButton.Id,
			Text = "Clear Filters",
			OffsetX = 0, OffsetY = 0,
			FontSize = 22,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Center",
			DataProperties =
			{
				OpacityWithOwner = true,
			},
		})

	-- Roll seed for filters button
	components.RollSeedForFiltersButton = CreateScreenComponent({ Name = "ButtonDefault", Scale = 1.0, Group = "Combat_Menu", X = 625, Y = 760 })
	components.RollSeedForFiltersButton.OnPressedFunctionName = "RollSeedForFilters"
	CreateTextBox({ Id = components.RollSeedForFiltersButton.Id,
			Text = "Roll Seed For Filters",
			OffsetX = 0, OffsetY = 0,
			FontSize = 22,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Center",
			DataProperties =
			{
				OpacityWithOwner = true,
			},
		})

	components.FiltersTitle = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1.0, Group = "Combat_Menu", X = 475, Y = 520 })
	CreateTextBox({ Id = components.FiltersTitle.Id,
			Text = "Filter for a Specific God and Boon",
			OffsetX = 0, OffsetY = -100,
			FontSize = 28,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Center",
			DataProperties =
			{
				OpacityWithOwner = true,
			},
		})

	-- God filter buttons
	local x = -250
	local y = 30
	for _, god in pairs(EllosBoonSelectorMod.BoonGods) do
		components[god .. "Filter"] = CreateScreenComponent({ Name = "ButtonDefault", Scale = 0.5, Group = "Combat_Menu", X = 500 + x, Y = 450 + y })
		components[god .. "Filter"].OnPressedFunctionName = "ToggleGodFilter"
		components[god .. "Filter"].GodName = god
		CreateTextBox({ Id = components[god .. "Filter"].Id,
				Text = god,
				OffsetX = 0, OffsetY = 0,
				FontSize = 16,
				Color = Color.BoonPatchCommon,
				Font = "AlegreyaSansSCRegular",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
				Justification = "Center",
				DataProperties =
				{
					OpacityWithOwner = true,
				},
			})

		x = x + 150
		if x > 250 then
			x = -250
			y = y + 50
		end
	end

	-- Rarity filter buttons
	x = -250
	y = 150
	for _, priorityBoon in pairs({"Attack", "Special", "Dash", "Cast"}) do
		components[priorityBoon .. "Filter"] = CreateScreenComponent({ Name = "ButtonDefault", Scale = 0.5, Group = "Combat_Menu", X = 500 + x, Y = 450 + y })
		components[priorityBoon .. "Filter"].OnPressedFunctionName = "CycleRarityFilter"
		components[priorityBoon .. "Filter"].PriorityBoon = EllosBoonSelectorMod.PriorityBoonCannonicalNameToCodeName[priorityBoon]
		CreateTextBox({ Id = components[priorityBoon .. "Filter"].Id,
				Text = priorityBoon,
				OffsetX = 0, OffsetY = 0,
				FontSize = 16,
				Color = Color.White,
				Font = "AlegreyaSansSCRegular",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
				Justification = "Center",
				DataProperties =
				{
					OpacityWithOwner = true,
				},
			})
		x = x + 150
		if x > 250 then
			x = -250
			y = y + 60
		end
	end

	-- Hammer filter button
	x = 480
	y = 675
	components["HammerFilterLeft"] = CreateScreenComponent({ Name = "ButtonCodexDown", X = x - 200, Y = y, Scale = 1.0, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu" })
	SetAngle({ Id = components["HammerFilterLeft"].Id, Angle = -90 })
	SetScale({ Id = components["HammerFilterLeft"].Id, Fraction = .8 })
	components["HammerFilterLeft"].OnPressedFunctionName = "HammerFilterLeft"
	components["HammerFilterRight"] = CreateScreenComponent({ Name = "ButtonCodexDown", X = x + 200, Y = y, Scale = 1.0, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu" })
	SetAngle({ Id = components["HammerFilterRight"].Id, Angle = 90 })
	SetScale({ Id = components["HammerFilterRight"].Id, Fraction = .8 })
	components["HammerFilterRight"].OnPressedFunctionName = "HammerFilterRight"

	components["HammerFilter"] = CreateScreenComponent({ Name = "BlankObstacle", Scale = 0.5, Group = "Combat_Menu", X = x, Y = y })
	EllosBoonSelectorMod.CurrentHammerIndex = 1
	local weapon = GetEquippedWeapon()
	local aspectIndex = GetEquippedWeaponTraitIndex( weapon )
	local hammerIndex = EllosBoonSelectorMod.CurrentHammerIndex
	CreateTextBox({ Id = components["HammerFilter"].Id,
			Text = EllosBoonSelectorMod.HammerOptions[weapon .. aspectIndex][hammerIndex],
			OffsetX = 0, OffsetY = 0,
			FontSize = 22,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Center",
			DataProperties =
			{
				OpacityWithOwner = true,
			},
		})


	-- Icon Display
	components.GodIcon = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1.0, Group = "Combat_Menu", X = 550, Y = 665 })
	Attach({ Id = components.GodIcon.Id, DestinationId = components.ShopBackground.Id, OffsetX = 0, OffsetY = 0})
	components.Reward1 = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1.0, Group = "Combat_Menu", X = 1200, Y = 650 })
	CreateTextBox({ Id = components.Reward1.Id,
			Text = "",
			OffsetX = 400, OffsetY = -50,
			FontSize = 22,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Center",
			DataProperties =
			{
				OpacityWithOwner = true,
			},
		})
	components.Reward2 = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1.0, Group = "Combat_Menu", X = 1200, Y = 650 })
	CreateTextBox({ Id = components.Reward2.Id,
			Text = "",
			OffsetX = 400, OffsetY = -20,
			FontSize = 22,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Center",
			DataProperties =
			{
				OpacityWithOwner = true,
			},
		})
	components.Reward3 = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1.0, Group = "Combat_Menu", X = 1200, Y = 650 })
	CreateTextBox({ Id = components.Reward3.Id,
			Text = "",
			OffsetX = 400, OffsetY = 10,
			FontSize = 22,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Center",
			DataProperties =
			{
				OpacityWithOwner = true,
			},
		})
	components.ChaosRoomIndicator = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1.0, Group = "Combat_Menu", X = 1200, Y = 650 })
	CreateTextBox({ Id = components.ChaosRoomIndicator.Id,
			Text = "",
			OffsetX = 400, OffsetY = 40,
			FontSize = 22,
			Color = Color.Purple,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Center",
			DataProperties =
			{
				OpacityWithOwner = true,
			},
		})

	local roomReward = PredictStartingRoomReward((NextSeeds[1] or 000000))
	UpdateRewardPreview( screen, roomReward )
	ClearFilters(screen)

	-- Close button
	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu" })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = -6, OffsetY = 456 })
	components.CloseButton.OnPressedFunctionName = "CloseSeedControlScreen"
	components.CloseButton.ControlHotkey = "Cancel"

	wait(0.1)
	--TeleportCursor({ OffsetX = screen.ItemStartX - 30, OffsetY = screen.ItemStartY, ForceUseCheck = true })

	screen.KeepOpen = true
	thread( HandleWASDInput, screen )
	HandleScreenInput( screen )
end

function DoesRewardMatchFilters(roomReward)
	local targetReward = "Boon"

	if EllosBoonSelectorMod.GodFilter == "" and next(EllosBoonSelectorMod.RarityFilter) == nil then
		targetReward = "Hammer"
	end

	if roomReward.Type == "Boon" then
		-- If looking for a hammer, return false
		if targetReward == "Hammer" then
			return false
		end

		-- God must match filtered god if specified
		if EllosBoonSelectorMod.GodFilter ~= "" and EllosBoonSelectorMod.GodFilter ~= roomReward.BoonData.God then
			return false
		end

		-- Rarities much match all active rarity filters
		for priorityBoon, rarityFilter in pairs(EllosBoonSelectorMod.RarityFilter) do
			local thisFilterPassed = false;
			for index, boonOption in ipairs(roomReward.BoonData.Options) do
				if rarityFilter == nil or rarityFilter == 0 then
					thisFilterPassed = true
				elseif rarityFilter > 0 and priorityBoon == boonOption.Boon and rarityFilter <= boonOption.Rarity then
					thisFilterPassed = true
				end
			end
			-- If any rarity filter fails, return false
			if not thisFilterPassed then
				return false
			end
		end

		-- All filters passed
		return true
	elseif roomReward.Type == "Hammer" then
		-- If looking for a boon, return false
		if targetReward == "Boon" then
			return false
		end

		local weapon = GetEquippedWeapon()
		local aspectIndex = GetEquippedWeaponTraitIndex( weapon )
		local hammerIndex = EllosBoonSelectorMod.CurrentHammerIndex

		for index, hammerOption in ipairs(roomReward.HammerData.Options) do
			if hammerOption.Name == EllosBoonSelectorMod.HammerOptions[weapon .. aspectIndex][hammerIndex] then
				return true
			end
		end

		return false
	end
end

function RollSeedForFilters( screen, button )
	local roomReward = nil
	local counter = 0
	local seed = (NextSeeds[1] or 000000)
	repeat
		roomReward = PredictStartingRoomReward(seed + counter)
		counter = counter + 1

		-- Cool spinner visual, but searches much slower
		--wait(.05)
		--UpdateRewardPreview( screen, roomReward )
		--SeedControlScreenSyncDigits( screen )
		--UpdateDigitDisplay( screen )
	until DoesRewardMatchFilters(roomReward) or counter > 1000

	if counter > 1000 then
		-- TODO: tell the user we failed to find a seed
	end

	UpdateRewardPreview( screen, roomReward )
	SeedControlScreenSyncDigits( screen )
	UpdateDigitDisplay( screen )
end

function ClearFilters ( screen, button )
	EllosBoonSelectorMod.GodFilter = ""
	EllosBoonSelectorMod.RarityFilter = {}

	-- TODO: Use a constant for the priority boons so we don't hardcode them in multiple places
	for _, god in pairs(EllosBoonSelectorMod.BoonGods) do
		ModifyTextBox({ Id = screen.Components[god .. "Filter"].Id, Color = Color.BoonPatchCommon })
	end
	for _, priorityBoon in pairs({"Attack", "Special", "Dash", "Cast"}) do
		ModifyTextBox({ Id = screen.Components[priorityBoon .. "Filter"].Id, Color = Color.BoonPatchCommon })
	end
end

function ToggleGodFilter ( screen, button )
	local godName = button.GodName

	EllosBoonSelectorMod.GodFilter = godName

	for _, god in pairs(EllosBoonSelectorMod.BoonGods) do
		if god == godName and EllosBoonSelectorMod.GodFilter then
			ModifyTextBox({ Id = screen.Components[god .. "Filter"].Id, Color = Color.BoonPatchCommon })
		else
			ModifyTextBox({ Id = screen.Components[god .. "Filter"].Id, Color = Color.Gray })
		end
	end
end

function CycleRarityFilter ( screen, button )
	local priorityBoon = button.PriorityBoon

	local currentFilterLevel = (EllosBoonSelectorMod.RarityFilter[priorityBoon] or 0)
	currentFilterLevel = (currentFilterLevel + 1) % 3
	EllosBoonSelectorMod.RarityFilter[priorityBoon] = currentFilterLevel

	-- CurrentFilterLevel goes from 0 to 2, add 1 to map to rarity values
	ModifyTextBox({ Id = button.Id, Color = EllosBoonSelectorMod.RarityColors[currentFilterLevel + 1] })
end

function HammerFilterLeft ( screen, button )
	local weapon = GetEquippedWeapon()
	local aspectIndex = GetEquippedWeaponTraitIndex( weapon )
	local hammerIndex = EllosBoonSelectorMod.CurrentHammerIndex

	hammerIndex = hammerIndex - 1
	if hammerIndex == 0 then
		hammerIndex = TableLength(EllosBoonSelectorMod.HammerOptions[weapon .. aspectIndex])
	end
	EllosBoonSelectorMod.CurrentHammerIndex = hammerIndex
	ModifyTextBox({Id = screen.Components["HammerFilter"].Id, Text = EllosBoonSelectorMod.HammerOptions[weapon .. aspectIndex][hammerIndex]})
end

function HammerFilterRight ( screen, button )
	local weapon = GetEquippedWeapon()
	local aspectIndex = GetEquippedWeaponTraitIndex( weapon )
	local hammerIndex = EllosBoonSelectorMod.CurrentHammerIndex

	hammerIndex = hammerIndex + 1
	if hammerIndex == TableLength(EllosBoonSelectorMod.HammerOptions[weapon .. aspectIndex]) + 1 then
		hammerIndex = 1
	end
	EllosBoonSelectorMod.CurrentHammerIndex = hammerIndex
	ModifyTextBox({Id = screen.Components["HammerFilter"].Id, Text = EllosBoonSelectorMod.HammerOptions[weapon .. aspectIndex][hammerIndex]})
end

function SeedDigitUp( screen, button )
	local newDigitValue = screen.Digits[button.Digit]
	newDigitValue = newDigitValue - 1
	if newDigitValue < 0 then
		newDigitValue = 9
	end
	screen.Digits[button.Digit] = newDigitValue
	local newSeed = 0
	for digit, digitValue in ipairs( screen.Digits ) do
		newSeed = newSeed + (digitValue * math.pow(10, digit - 1))
	end
	local roomReward = PredictStartingRoomReward(newSeed)
	UpdateRewardPreview( screen, roomReward )
	UpdateDigitDisplay( screen )
end

function SeedDigitDown( screen, button )
	local newDigitValue = screen.Digits[button.Digit]
	newDigitValue = newDigitValue + 1
	if newDigitValue > 9 then
		newDigitValue = 0
	end
	screen.Digits[button.Digit] = newDigitValue
	local newSeed = 0
	for digit, digitValue in ipairs( screen.Digits ) do
		newSeed = newSeed + (digitValue * math.pow(10, digit - 1))
	end
	local roomReward = PredictStartingRoomReward(newSeed)
	UpdateRewardPreview( screen, roomReward )
	UpdateDigitDisplay( screen )
end

function SeedControlScreenSyncDigits( screen )
	local displayNumber = (NextSeeds[1] or 000000)
	if displayNumber ~= nil then
		for digit = 1, #screen.Digits do
			local digitValue = displayNumber % 10
			screen.Digits[digit] = digitValue
			displayNumber = math.floor( displayNumber / 10 )
		end
	end
end

function UpdateDigitDisplay( screen )
	for digit, digitValue in ipairs( screen.Digits ) do
		local digitKey = "DigitButton"..digit
		ModifyTextBox({ Id = screen.Components["DigitButton"..digit].Id, Text = digitValue })
	end
end

function SeedControlScreenRandomize( screen, button )
	local newSeed = RandomInt(0, 999999)
	local roomReward = PredictStartingRoomReward(newSeed)
	UpdateRewardPreview( screen, roomReward )
	SeedControlScreenSyncDigits( screen )
	UpdateDigitDisplay( screen )
end

function CloseSeedControlScreen( screen, button )

	local newSeed = 0
	local place = 1
	for digit, digitValue in ipairs( screen.Digits ) do
		newSeed = newSeed + (digitValue * math.pow(10, digit - 1))
	end

	DisableShopGamepadCursor()
	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
	SetConfigOption({ Name = "FreeFormSelectStepDistance", Value = 16 })
	SetConfigOption({ Name = "FreeFormSelectSuccessDistanceStep", Value = 8 })
	SetAnimation({ DestinationId = screen.Components.ShopBackground.Id, Name = screen.CloseAnimation })
	PlaySound({ Name = "/SFX/Menu Sounds/FatedListClose" })
	CloseScreen( GetAllIds( screen.Components ), 0.1 )
	UnfreezePlayerUnit()
	screen.KeepOpen = false
	OnScreenClosed({ Flag = screen.Name })
end

--- Takes in a seed and returns the predicted RoomReward object for the starting room.
-- TODO: Update this to use a separate RNG entirely rather than using the current RNG and putting it back again
--
-- @param int seedForPrediction RNG seed to use when predicting the rng calls
-- @param int currentSeed RNG seed to reset to after making the predictions (Optional)
-- @return RoomReward where RoomReward has a {Type} ("Hammer" or "Boon") and the corresponding Data e.g. {BoonData} or {HammerData}
function PredictStartingRoomReward( seedForPrediction, currentSeed )
	local roomReward = {}

	local roomRewardType = PredictRoomRewardType(seedForPrediction, currentSeed)
	roomReward.Type = roomRewardType.Name

	if roomReward.Type == "Boon" then
		roomReward.BoonData = {}
		roomReward.BoonData.God = roomRewardType.God

		-- Get exact boon rewards and rarity and update the menu
		roomReward.BoonData.Options = PredictStartingGodBoonOptions( roomReward.BoonData.God, seedForPrediction, currentSeed )
		roomReward.FirstRoomChaos = PredictChaos(6, seedForPrediction)
	elseif roomReward.Type == "Hammer" then
		roomReward.HammerData = {}
		local currentWeapon = GetEquippedWeapon()
		roomReward.HammerData.Options = PredictHammerOptionsForWeapon(currentWeapon, GetEquippedWeaponTraitIndex( currentWeapon ), seedForPrediction, currentSeed)
		roomReward.FirstRoomChaos = PredictChaos(5, seedForPrediction)
	end

	roomReward.SecondRoomChaos = PredictChaos(2, seedForPrediction)

	return roomReward
end

function GetChaosChance()
	-- TODO: How to retrieve room date for a future room? Just need tile name?
	--local secretChance = room.SecretSpawnChance or RoomData.BaseRoom.SecretSpawnChance
	local secretChance = RoomData.BaseRoom.SecretSpawnChance
	for k, mutator in pairs( GameState.ActiveMutators ) do
		if mutator.SecretSpawnChanceMultiplier ~= nil then
			secretChance = secretChance * mutator.SecretSpawnChanceMultiplier
		end
	end
	return 0.15
end

function PredictFirstRoomChaos(seedForPrediction, currentSeed)
	RandomSetNextInitSeed( {Seed = seedForPrediction} )
	RandomSynchronize(5) -- Known offset at which the RNG rolls reward type
	local chaosPresent = RandomChance(GetChaosChance())

	-- Reset RNG to the pre-call state
	if currentSeed ~= nil then
		RandomSetNextInitSeed( {Seed = currentSeed} )
	end

	return chaosPresent
end

function PredictChaos(offset, seedForPrediction, currentSeed)
	RandomSetNextInitSeed( {Seed = seedForPrediction} )
	RandomSynchronize(offset) -- Known offset at which the RNG rolls reward type
	local chaosPresent = RandomChance(GetChaosChance())

	-- Reset RNG to the pre-call state
	if currentSeed ~= nil then
		RandomSetNextInitSeed( {Seed = currentSeed} )
	end

	return chaosPresent
end

--- Takes in a seed and returns the predicted RoomRewardType object.
-- TODO: Update this to use a separate RNG entirely rather than using the current RNG and putting it back again
--
-- @param int seedForPrediction RNG seed to use when predicting the rng calls
-- @param int currentSeed RNG seed to reset to after making the predictions (Optional)
-- @return RoomRewardType where RoomRewardType has a {Name} ("Hammer" or "Boon") and conditionally a {God}
function PredictRoomRewardType( seedForPrediction, currentSeed )
	local roomRewardType = {}

	-- Save off the current RNG the load the provided seed and offset
	RandomSetNextInitSeed( {Seed = seedForPrediction} )
	RandomSynchronize(4) -- Known offset at which the RNG rolls reward type
	roomRewardType.Name = GetRandomValue({"Boon", "Boon", "Boon", "Hammer"})

	if roomRewardType.Name == "Boon" then
		local godOptions = DeepCopyTable(EllosBoonSelectorMod.BoonGods)
		local rarityTraits = GetHeroTraitValues("RarityBonus", { UnlimitedOnly = false })
		local god = ""
		for i, rarityTraitData in pairs(rarityTraits) do
			if rarityTraitData.RequiredGod ~= nil and rarityTraitData.RequiredGod ~= "TrialUpgrade" then
				god = string.sub(rarityTraitData.RequiredGod, 1, -8)
			end
		end
		if god == "" then
	 		god = RemoveRandomValue(godOptions)
		end
		roomRewardType.God = god -- God RNG roll will happen at the next offset
	end

	-- Reset RNG to the pre-call state
	if currentSeed ~= nil then
		RandomSetNextInitSeed( {Seed = currentSeed} )
	end

	return roomRewardType
end

--- Takes in a weapon name and seed and returns a list of HammerOption objects.
-- TODO: Update this to use a separate RNG entirely rather than using the current RNG and putting it back again
--
-- @param string weapon The name of the weapon used to find the eligible hammers
-- @param int aspectIndex Index corrseponding to the aspect of the weapon (e.g. 1-4 in order of unlock)
-- @param int seedForPrediction RNG seed to use when predicting the rng calls
-- @param int currentSeed RNG seed to reset to after making the predictions (Optional)
-- @return list<HammerOption> where HammerOption has a {Name}
function PredictHammerOptionsForWeapon( weapon, aspectIndex, seedForPrediction, currentSeed )
	local hammerOptions = {}

	-- Save off the current RNG the load the provided seed and offset
	RandomSetNextInitSeed( {Seed = seedForPrediction} )
	RandomSynchronize(1) -- Offset that when the hammer options start being rolled at

	local eligibleHammers = {"SwordTwoComboTrait","SwordSecondaryAreaDamageTrait","SwordGoldDamageTrait","SwordBlinkTrait","SwordThrustWaveTrait","SwordHealthBufferDamageTrait","SwordSecondaryDoubleAttackTrait","SwordCriticalTrait","SwordBackstabTrait","SwordDoubleDashAttackTrait","SwordHeavySecondStrikeTrait","SwordCursedLifeStealTrait"}
	if aspectIndex == 1 then
		eligibleHammers = DeepCopyTable(EllosBoonSelectorMod.HammerOptions[weapon])
	else
		eligibleHammers = DeepCopyTable(EllosBoonSelectorMod.HammerOptions[weapon .. aspectIndex])
	end

	local selectedIndexes = TableLength( eligibleHammers )
	for index = 1, 3 do
		hammerOptions[index] = {}
		local selectedHammer = GetRandomValue(eligibleHammers)
		hammerOptions[index].Name = selectedHammer

		-- Remove the picked hammer from the pool of eligible Hammers
		for i, hammer in ipairs(eligibleHammers) do
			if hammer == selectedHammer then
					table.remove(eligibleHammers, i)
					break
			end
		end
	end

	-- Reset RNG to the pre-call state
	if currentSeed ~= nil then
		RandomSetNextInitSeed( {Seed = currentSeed} )
	end

	return hammerOptions
end

--- Takes in a gods name and seed and returns a list of BoonOption objects for the starting room only.
-- TODO: Update this to use a separate RNG entirely rather than using the current RNG and putting it back again
--
-- @param string god The god for which the boon options should be predicted
-- @param int seedForPrediction RNG seed to use when predicting the rng calls
-- @param int currentSeed RNG seed to reset to after making the predictions (Optional)
-- @return list<BoonOption> where BoonOption has a {God}, {Name} and {Rarity} (numeric)
function PredictStartingGodBoonOptions( god, seedForPrediction, currentSeed )
	local startingBoons = {}

	-- Save off the current RNG the load the provided seed and offset
	RandomSetNextInitSeed( {Seed = seedForPrediction} )
	RandomSynchronize(1) -- Offset that when the boons start being rolled at

	-- First room always offers 3 priority boons (selected by excluding one of the 4 options)
	local boonRewards = DeepCopyTable(EllosBoonSelectorMod.PriorityBoons)
	local excluded = RemoveRandomValue(boonRewards)
	boonRewards = CollapseTableOrdered(boonRewards)

	local rarities = ElloGetBoonRarityChances(god)
	for index = 1, 3 do
		startingBoons[index] = {}
		startingBoons[index].Boon = boonRewards[index]
		RandomChance(0) -- Legendary isn't possible for starting boons
		if RandomChance(rarities.Epic) then -- Skip Heroic because starting boons can't naturally roll Heroic
			startingBoons[index].Rarity = 2
		elseif RandomChance(rarities.Rare) then
			startingBoons[index].Rarity = 1
		else
			startingBoons[index].Rarity = 0
		end
	end

	-- Reset RNG to the pre-call state
	if currentSeed ~= nil then
		RandomSetNextInitSeed( {Seed = currentSeed} )
	end

	table.sort( startingBoons, function(boon1, boon2) return EllosBoonSelectorMod.PriorityBoonsOrder[boon1.Boon] < EllosBoonSelectorMod.PriorityBoonsOrder[boon2.Boon] end)
	return startingBoons
end

function ElloGetBoonRarityChances( godName, roomRarityOverride )
	local name = godName
	--local ignoreTempRarityBonus = args.IgnoreTempRarityBonus
	local referencedTable = "BoonData"
	-- "HermesUpgrade" then referencedTable = "HermesData"

	local legendaryRoll = CurrentRun.Hero[referencedTable].LegendaryChance or 0
	local heroicRoll = CurrentRun.Hero[referencedTable].HeroicChance or 0
	local epicRoll = CurrentRun.Hero[referencedTable].EpicChance or 0
	local rareRoll = CurrentRun.Hero[referencedTable].RareChance or 0

	if roomRarityOverride ~= nil then
		legendaryRoll = roomRarityOverride.Legendary or legendaryRoll
		heroicRoll = roomRarityOverride.Heroic or heroicRoll
		epicRoll = roomRarityOverride.EpicChance or epicRoll
		rareRoll =  roomRarityOverride.RareChance or rareRoll
	end

	local metaupgradeRareBoost = GetNumMetaUpgrades( "RareBoonDropMetaUpgrade" ) * ( MetaUpgradeData.RareBoonDropMetaUpgrade.ChangeValue - 1 )
	local metaupgradeEpicBoost = GetNumMetaUpgrades( "EpicBoonDropMetaUpgrade" ) * ( MetaUpgradeData.EpicBoonDropMetaUpgrade.ChangeValue - 1 ) + GetNumMetaUpgrades( "EpicHeroicBoonMetaUpgrade" ) * ( MetaUpgradeData.EpicBoonDropMetaUpgrade.ChangeValue - 1 )
	local metaupgradeLegendaryBoost = GetNumMetaUpgrades( "DuoRarityBoonDropMetaUpgrade" ) * ( MetaUpgradeData.EpicBoonDropMetaUpgrade.ChangeValue - 1 )
	local metaupgradeHeroicBoost = GetNumMetaUpgrades( "EpicHeroicBoonMetaUpgrade" ) * ( MetaUpgradeData.EpicBoonDropMetaUpgrade.ChangeValue - 1 )
	legendaryRoll = legendaryRoll + metaupgradeLegendaryBoost
	heroicRoll = heroicRoll + metaupgradeHeroicBoost
	rareRoll = rareRoll + metaupgradeRareBoost
	epicRoll = epicRoll + metaupgradeEpicBoost

	local rarityTraits = GetHeroTraitValues("RarityBonus", { UnlimitedOnly = false })
	for i, rarityTraitData in pairs(rarityTraits) do
		if rarityTraitData.RequiredGod == nil or rarityTraitData.RequiredGod == name .. "Upgrade" then
			if rarityTraitData.RareBonus then
				rareRoll = rareRoll + rarityTraitData.RareBonus
			end
			if rarityTraitData.EpicBonus then
				epicRoll = epicRoll + rarityTraitData.EpicBonus
			end
			if rarityTraitData.HeroicBonus then
				heroicRoll = heroicRoll + rarityTraitData.HeroicBonus
			end
			if rarityTraitData.LegendaryBonus then
				legendaryRoll = legendaryRoll + rarityTraitData.LegendaryBonus
			end
		end
	end
	return
	{
		Rare = rareRoll,
		Epic = epicRoll,
		Heroic = heroicRoll,
		Legendary = legendaryRoll,
	}
end

function UpdateRewardPreview( screen, roomReward )
	if config.showPreview == false then
		return
	end
	if roomReward.Type == "Boon" then
		SetAnimation({ Name = "BoonSymbol" .. roomReward.BoonData.God .. "Isometric", DestinationId = screen.Components.GodIcon.Id, OffsetX = 640, OffsetY = -45})

		local roomRewardOptions = roomReward.BoonData.Options
		for index, boonOption in ipairs(roomRewardOptions) do
			ModifyTextBox({ Id = screen.Components["Reward" .. index].Id, Text = roomReward.BoonData.God .. boonOption.Boon, Color = EllosBoonSelectorMod.RarityColors[boonOption.Rarity + 1]})
		end
	elseif roomReward.Type == "Hammer" then
		SetAnimation({ Name = "WeaponUpgradePreview", DestinationId = screen.Components.GodIcon.Id, OffsetX = 640, OffsetY = -45})
		local hammerOptions = roomReward.HammerData.Options

		-- Indices don't match up because hammer options are rotated in comparison to boons.  TODO: fix this in the helper method upstream instead
		ModifyTextBox({ Id = screen.Components.Reward1.Id, Text = hammerOptions[2].Name, Color = Color.BoonPatchCommon })
		ModifyTextBox({ Id = screen.Components.Reward2.Id, Text = hammerOptions[3].Name, Color = Color.BoonPatchCommon })
		ModifyTextBox({ Id = screen.Components.Reward3.Id, Text = hammerOptions[1].Name, Color = Color.BoonPatchCommon })
	end

	if roomReward.FirstRoomChaos then
		ModifyTextBox({ Id = screen.Components.ChaosRoomIndicator.Id, Text = "Room 1 Chaos" })
	elseif roomReward.SecondRoomChaos then
		ModifyTextBox({ Id = screen.Components.ChaosRoomIndicator.Id, Text = "Room 2 Chaos" })
	else
		ModifyTextBox({ Id = screen.Components.ChaosRoomIndicator.Id, Text = "No Chaos" })
	end
end

--[[
Override the advanced tooltip screen (boon menu).  This is a convenient integration point.
Need to make a better system ao we play nice with other mods that also want to use this for menu / informational UI elements
]]
ModUtil.BaseOverride("ShowAdvancedTooltipScreen", function ( args )
	OnScreenOpened( { Flag = "TraitTrayScreen", PersistCombatUI = true, SkipBlockTimer = true, } )
	if args.DontDuckAudio then
		SetAdvancedTooltipMixing( 1 )
	end
	FreezePlayerUnit("AdvancedTooltip", { DisableTray = false })
	thread(MarkObjectiveComplete, "AdvancedTooltipPrompt")

	local firstTrait = nil

	ScreenAnchors.TraitTrayScreen = DeepCopyTable( ScreenData.TraitTrayScreen )
	local components = ScreenAnchors.TraitTrayScreen.Components
	EnableShopGamepadCursor( ScreenAnchors.TraitTrayScreen.Name )
	SetConfigOption({ Name = "ExclusiveInteractGroup", Value = "Combat_Menu_TraitTray" })
	SetConfigOption({ Name = "FreeFormSelectStepDistance", Value = 12.0 })

	components.BackgroundTint = CreateScreenComponent({ Name = "rectangle01", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_UI_Backing" })
	SetScale({ Id = components.BackgroundTint.Id, Fraction = 10 })
	SetColor({ Id = components.BackgroundTint.Id, Color = {20, 20, 20, 255} })
	SetAlpha({ Id = components.BackgroundTint.Id, Fraction = 0.0, Duration = 0 })
	SetAlpha({ Id = components.BackgroundTint.Id, Fraction = 0.66, Duration = 0.25 })

	local possibleAutoPins = {}

	local displayedTrait = 0
	if IsEmpty(CurrentRun.Hero.RecentTraits) then
		displayedTrait = displayedTrait - 5
	else
		displayedTrait = TableLength( CurrentRun.Hero.RecentTraits) - 5
	end
	local displayedTraits = {}
	local highlightedTrait = nil
	for i, trait in pairs( CurrentRun.Hero.Traits ) do
		if not trait.Hidden and (not IsExistingTraitShown(trait) or trait == GetExistingUITrait( trait )) then
			-- two column pairs of 5 and 6

			local itemColumn = math.floor( displayedTrait / 11 )
			local itemNum = displayedTrait % 11
			local traitIcon = nil
			local xOffset = 0
			local yOffset = 0
			if IsShownInTraitTray( trait ) and trait == GetExistingUITrait( trait ) then
				xOffset = CombatUI.TraitUIStart - xOffset
				yOffset = TraitUI.IconStartY + GetTraitIndex(trait) * TraitUI.SpacerY
				if trait.Slot == nil then
					xOffset = 8 + xOffset + TraitUI.SpacerX * 0.5
					yOffset = yOffset - TraitUI.SpacerY * 0.5
				end
			else
				if itemNum < 6 then
					-- first column of the two column pair
					xOffset = 8 + CombatUI.TraitUIStart + ( itemColumn + 1 ) * TraitUI.SpacerX
					yOffset = TraitUI.IconStartY + ( itemNum ) * TraitUI.SpacerY
				else
					-- second column of the two column pair
					xOffset = 8 + CombatUI.TraitUIStart + ( itemColumn + 1.5 ) * TraitUI.SpacerX
					yOffset = TraitUI.IconStartY + ( itemNum - 7 + 1.5 ) * TraitUI.SpacerY
				end
			end

			traitIcon = CreateScreenComponent({ Name = "TraitTrayIconButton", X = xOffset, Y = yOffset, Group = "Combat_Menu_TraitTray" })
			traitIcon.OnPressedFunctionName = "PinTraitDetails"
			if not IsExistingTraitShown( trait ) then
				trait.AnchorId = traitIcon.Id
			end
			SetAnimation({ Name = GetTraitIcon( trait ), DestinationId = traitIcon.Id, Group = "Combat_Menu_TraitTray" })
			traitIcon.OffsetX = xOffset
			traitIcon.OffsetY = yOffset
			CreateTextBox({
				Id = traitIcon.Id,
				UseDescription = true,
				VariableAutoFormat = "BoldFormatGraft",
				Scale = 0.0,
				Hide = true,
			})

			if args.DisableTooltips then
				ModifyTextBox({ Ids = traitIcon.Id, BlockTooltip = true })
			end

			table.insert( components, traitIcon )
			traitIcon.TraitData = trait
			ScreenAnchors.TraitTrayScreen.Icons[ traitIcon.Id ] = traitIcon

			local traitFrameId = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray"  })
			Attach({ Id = traitFrameId, DestinationId = traitIcon.Id })
			if GetTraitFrame(trait) ~= nil then
				local traitFrame = GetTraitFrame( trait )
				local rarityValue = GetRarityValue( trait )
				for i, existingTrait in pairs( CurrentRun.Hero.TraitDictionary[trait.Name]) do
					if (AreTraitsIdentical(trait, existingTrait) and rarityValue < GetRarityValue( existingTrait.Rarity )) then
						rarityValue = GetRarityValue( existingTrait.Rarity )
						traitFrame = GetTraitFrame( existingTrait )
					  end
				end
				SetAnimation({ Name = traitFrame, DestinationId = traitFrameId })
			end
			table.insert( ScreenAnchors.TraitTrayScreen.Frames, traitFrameId )

			if not IsShownInTraitTray(trait) then
				displayedTrait = displayedTrait + 1
			end
			TraitUICreateText( trait, "Combat_Menu_TraitTray_Overlay" )

			if not firstTrait or (not IsEmpty(CurrentRun.Hero.RecentTraits) and AreTraitsIdentical( CurrentRun.Hero.RecentTraits[1], trait )) then
				TeleportCursor({ OffsetX = xOffset, OffsetY = yOffset, ForceUseCheck = true })
				highlightedTrait = traitIcon
				firstTrait = true
			end

			if args.AutoPin and IsPossibleAutoPin( trait ) then
				table.insert( possibleAutoPins, traitIcon )
			end
		end
	end

	local shownColumns = math.ceil( displayedTrait / 11 )
	if displayedTrait % 11 >= 6 then
		shownColumns = shownColumns + 1
	end
	shownColumns = shownColumns + 1
	ScreenAnchors.TraitTrayScreen.ShownColumns = shownColumns

	-- dynamically sized backing

	components.ShopBackground = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "Combat_Menu_TraitTray_Backing", X = 450, Y = ScreenHeight/2 - 118})
	if not args.HideCloseButton then
		components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu_TraitTray" })
		Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = -355 + ( shownColumns * 32 ), OffsetY = 435 })
		components.CloseButton.OnPressedFunctionName = "CloseAdvancedTooltipScreen"
		components.CloseButton.ControlHotkey = "Cancel"
	end

	components.CenterColumn = CreateScreenComponent({ Name = "TraitTray_Center", Group = "Combat_Menu_TraitTray_Backing", X = CombatUI.TraitUIStart, Y = 32 + ScreenHeight/2 - 100 })
	SetScaleX({ Id = components.CenterColumn.Id, Fraction = (shownColumns + 1) / 2 })
	components.EndColumn = CreateScreenComponent({ Name = "TraitTray_Right", Group = "Combat_Menu_TraitTray_Backing", X = CombatUI.TraitUIStart + ( shownColumns + 1 ) * TraitUI.SpacerX / 2, Y = ScreenHeight/2 - 100 })

	-- dynamic sockets
	for i = 0, shownColumns do
		local xOffset = 0
		if i % 2 == 0 then
			xOffset = 8 + CombatUI.TraitUIStart + ( math.floor(i/2) + 1 ) * TraitUI.SpacerX
			local newColumnObject = CreateScreenComponent({ Name = "TraitTray_ShortColumn", Group = "Combat_Menu_TraitTray_Backing", X = xOffset - 64, Y = (TraitUI.IconStartY + 2.5 * TraitUI.SpacerY) - 0 })
			table.insert( ScreenAnchors.TraitTrayScreen.Columns, newColumnObject.Id )
		else
			xOffset = 8 + CombatUI.TraitUIStart + ( math.floor(i/2) + 1.5 ) * TraitUI.SpacerX
			local newColumnObject = CreateScreenComponent({ Name = "TraitTray_LongColumn", Group = "Combat_Menu_TraitTray_Backing", X = xOffset - 64, Y = (TraitUI.IconStartY + 2.5 * TraitUI.SpacerY) - 0 })
			table.insert( ScreenAnchors.TraitTrayScreen.Columns, newColumnObject.Id )
		end
	end

	-- ShrineUpgrades / MetaUpgrades
	local offsetX = 20
	local offsetY = 50
	if GameState.SpentShrinePointsCache ~= nil and GameState.SpentShrinePointsCache > 0 then
		components.ShrineUpgradeBacking = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray_Backing", X = offsetX, Y = offsetY, Scale = 0.5, })
		SetScaleX({ Id = components.ShrineUpgradeBacking.Id, Fraction = 1.0 })
		SetAnimation({ DestinationId = components.ShrineUpgradeBacking.Id, Name = "MetaUpgradeTrayBacking" })
		offsetX = offsetX + 190
		for k, upgradeName in ipairs( ShrineUpgradeOrder ) do
			local upgradeData = MetaUpgradeData[upgradeName]
			if upgradeData.GameStateRequirements ~= nil and not IsGameStateEligible( CurrentRun, upgradeData.GameStateRequirements ) then
				-- Blank
			else
				components["ShrineIcon"..k] = CreateScreenComponent({ Name = "TraitTrayMetaUpgradeIconButton", Group = "Combat_Menu_TraitTray", X = offsetX, Y = offsetY })
				SetAnimation({ DestinationId = components["ShrineIcon"..k].Id, Name = upgradeData.Icon })
				local numUpgrades = GetNumMetaUpgrades( upgradeName )
				if numUpgrades > 0 then
					local totalStatChange = GetTotalStatChange( upgradeData )
					local text = GetMetaUpgradeShortTotalText( upgradeData, true )
					CreateTextBox({
						Id = components["ShrineIcon"..k].Id,
						Text = text,
						LuaKey = "TempTextData",
						LuaValue = { Amount = totalStatChange },
						FontSize = 18,
						OffsetX = 20, OffsetY = 12,
						Color = Color.White,
						Font = "AlegreyaSansSCBold",
						ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0,2},
						Justification = "Center",
						OutlineThickness = 2,
						OutlineColor = {0,0,0,1},
					})
					SetupMetaIconTrayTooltip( components["ShrineIcon"..k], upgradeName, upgradeData, offsetX, args )
				else
					UseableOff({ Id = components["ShrineIcon"..k].Id })
					SetColor({ Id = components["ShrineIcon"..k].Id, Color = {0.5, 0.55, 0.6, 0.55} })
				end
			end
			offsetX = offsetX + 65
		end
	end
	offsetX = 20
	offsetY = offsetY + 60
	GameState.SpentMetaPointsCache = GetTotalSpentMetaPoints()
	if GameState.SpentMetaPointsCache > 0 then
		components.MetaUpgradeBacking = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray_Backing", X = offsetX, Y = offsetY, Scale = 0.5, })
		SetScaleX({ Id = components.MetaUpgradeBacking.Id, Fraction = 1.0 })
		CreateTextBox({ Id = components.MetaUpgradeBacking.Id,
			Text = "InGameUI_ActiveMetaPoints",
			FontSize = 22,
			OffsetX = 20, OffsetY = 0,
			Color = titleColor,
			Font = "AlegreyaSansSCBold",
			ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
			Justification = "Left" })
		SetAnimation({ DestinationId = components.MetaUpgradeBacking.Id, Name = "MetaUpgradeTrayBacking" })
		offsetX = offsetX + 190
		for k, upgradeName in ipairs( GameState.MetaUpgradesSelected ) do
			if k > GetNumLockedMetaUpgrades() then
				-- Blank
			else
				local upgradeData = MetaUpgradeData[upgradeName]
				components["MetaIcon"..k] = CreateScreenComponent({ Name = "TraitTrayMetaUpgradeIconButton", Group = "Combat_Menu_TraitTray", X = offsetX, Y = offsetY })
				SetAnimation({ DestinationId = components["MetaIcon"..k].Id, Name = upgradeData.Icon })
				local numUpgrades = GetNumMetaUpgrades( upgradeName )
				if numUpgrades > 0 then
					local totalStatChange = GetTotalStatChange( upgradeData )
					local text = GetMetaUpgradeShortTotalText( upgradeData, true )
					CreateTextBox({
						Id = components["MetaIcon"..k].Id,
						Text = text,
						LuaKey = "TempTextData",
						LuaValue = { Amount = totalStatChange },
						FontSize = 18,
						OffsetX = 20, OffsetY = 12,
						Color = Color.White,
						Font = "AlegreyaSansSCBold",
						ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0,2},
						Justification = "Center",
						OutlineThickness = 2,
						OutlineColor = {0,0,0,1},
					})
					SetupMetaIconTrayTooltip( components["MetaIcon"..k], upgradeName, upgradeData, offsetX, args )
				else
					UseableOff({ Id = components["MetaIcon"..k].Id })
					SetColor({ Id = components["MetaIcon"..k].Id, Color = {0.5, 0.55, 0.6, 0.55} })
				end
			end
			offsetX = offsetX + 89
		end
	end

	CreatePrimaryBacking()
	if highlightedTrait ~= nil then
		SetHighlightedTraitFrame( highlightedTrait )
	end

	--[[
	ElloBoonSelectorMod edits start
	]]
	-- Add button for RNG seed select menu but only between runs
	if ModUtil.PathGet("CurrentDeathAreaRoom") then
		components.RngSeedButton = CreateScreenComponent({ Name = "ButtonDefault", Scale = 1.0, Group = "Combat_Menu_TraitTray", X = CombatUI.TraitUIStart + 105, Y = 930 })
		components.RngSeedButton.OnPressedFunctionName = "OpenRngSeedSelectorScreen"
		CreateTextBox({ Id = components.RngSeedButton.Id,
				Text = "Set Starting Boon",
				OffsetX = 0, OffsetY = 0,
				FontSize = 22,
				Color = Color.White,
				Font = "AlegreyaSansSCRegular",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
				Justification = "Center",
				DataProperties =
				{
					OpacityWithOwner = true,
				},
			})
		Attach({ Id = components.RngSeedButton.Id, DestinationId = components.RngSeedButton, OffsetX = 500, OffsetY = 500 })
	end
	--[[
	ElloBoonSelectorMod edits end
	]]

	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENULoud" })

	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = true })
	ScreenAnchors.TraitTrayScreen.CanClose = true
	ScreenAnchors.TraitTrayScreen.KeepOpen = true

	if IsEmpty( possibleAutoPins ) then
		if highlightedTrait ~= nil then
			PinTraitDetails( ScreenAnchors.TraitTrayScreen, highlightedTrait, { Hover = true } )
		end
	else
		for k = 1, ScreenAnchors.TraitTrayScreen.MaxPins do
			local traitButton = RemoveRandomValue( possibleAutoPins )
			PinTraitDetails( ScreenAnchors.TraitTrayScreen, traitButton )
			if IsEmpty( possibleAutoPins ) then
				break
			end
		end
	end

	thread( HandleWASDInput, ScreenAnchors.TraitTrayScreen )
	HandleScreenInput( ScreenAnchors.TraitTrayScreen )
end, EllosBoonSelectorMod)
