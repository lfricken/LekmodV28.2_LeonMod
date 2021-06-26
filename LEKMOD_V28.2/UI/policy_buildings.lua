
-- Author: EnormousApplePie & Lek10 & Leon

--=================================================================================================================
--=================================================================================================================
						-- GLOBALS (from JFD)
--=================================================================================================================
--=================================================================================================================

local g_ConvertTextKey  		= Locale.ConvertTextKey
local g_MapGetPlot				= Map.GetPlot
local g_MathCeil				= math.ceil
local g_MathFloor				= math.floor
local g_MathMax					= math.max
local g_MathMin					= math.min

include("PlotIterators")
include("FLuaVector.lua")

--=================================================================================================================
--=================================================================================================================
						--PRACTICAL FUNCTIONS (Eg: Calculations, random, optimizations, utils)
--=================================================================================================================
--=================================================================================================================

-- GetRandom number
function GetRandom(lower, upper)
        return Game.Rand((upper + 1) - lower, "") + lower
 end
--Game_GetRound (from JFD)
function Game_GetRound(num, idp)
	local mult = 10^(idp or 0)
	return g_MathFloor(num * mult + 0.5) / mult
end
local g_GetRound = Game_GetRound


--IscivActive (from JFD)
local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

function JFD_GetNumDomesticRoutesFromThisCity(player, city) -- for both Sea and Land
	local tradeRoutes = player:GetTradeRoutes()
	local numDomesticRoutes = 0
	for tradeRouteID, tradeRoute in ipairs(tradeRoutes) do
		local domain = tradeRoute.Domain
		local originatingCity = tradeRoute.FromCity
		local targetCity = tradeRoute.ToCity
		if targetCity and originatingCity == city then
			numDomesticRoutes = numDomesticRoutes + 1
		end
	end
	
	return numDomesticRoutes
end

-- Returns true if this player now has this policy tree completed
function IsNowComplete(player, newPolicyId, allPolicyIds)
	for _, policyId in ipairs(allPolicyIds) do
		if(not player:HasPolicy(policyId) and newPolicyId ~= policyId) then
			return false; -- they are missing a policy
		end
	end
	return true; -- they have all the policies
end

--=================================================================================================================
--=================================================================================================================
--		Event Handling	
--=================================================================================================================
--=================================================================================================================


function OnPolicyAdopted(playerID, policyID)
	local player = Players[playerID];
	local capitalCity = player:GetCapitalCity();


	if (policyID == GameInfo.Policies["POLICY_ARISTOCRACY"].ID) then
		capitalCity:SetNumRealBuilding(GameInfoTypes["HAS_POLICY_ARISTOCRACY"], 1);
	end
end
GameEvents.PlayerAdoptPolicy.Add(OnPolicyAdopted);

--[[

function Italy_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Tradition Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_ARISTOCRACY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_LANDED_ELITE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MONARCHY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_OLIGARCHY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_LANDED_ELITE"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_ARISTOCRACY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MONARCHY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_OLIGARCHY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_MONARCHY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_LANDED_ELITE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_ARISTOCRACY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_OLIGARCHY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_OLIGARCHY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_LANDED_ELITE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MONARCHY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_ARISTOCRACY"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_TRADITION"], 1);
		end
	end 
end

if bIsActive then
GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted);
end
function Italy_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Liberty Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_REPRESENTATION"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MERITOCRACY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_REPRESENTATION"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MERITOCRACY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_MERITOCRACY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_REPRESENTATION"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_LIBERTY"], 1);
		end
	end 
end
if bIsActive then
GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted);
end

function Italy_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Honor Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_MILITARY_CASTE"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_DISCIPLINE"].ID)) or
			(policyID == GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_CASTE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_DISCIPLINE"].ID)) or
			(policyID == GameInfo.Policies["POLICY_DISCIPLINE"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_CASTE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_HONOR"], 1);
		end
	end 
end
if bIsActive then
GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted);
end

function Italy_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Patronage Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_CONSULATES"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_SCHOLASTICISM"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_PHILANTHROPY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_SCHOLASTICISM"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_CONSULATES"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_PHILANTHROPY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_PHILANTHROPY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_CONSULATES"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_SCHOLASTICISM"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_PATRONAGE"], 1);
		end
	end 
end
if bIsActive then
GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted);
end

function Italy_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Aesthetics Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_FINE_ARTS"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_FLOURISHING_OF_ARTS"].ID)) or
			(policyID == GameInfo.Policies["POLICY_FLOURISHING_OF_ARTS"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_FINE_ARTS"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_AESTHETICS"], 1);
		end
	end 
end

if bIsActive then
GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted);
end
function Italy_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Exploration Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MERCHANT_NAVY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_MERCHANT_NAVY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_EXPLORATION"], 1);
		end
	end 
end
if bIsActive then
GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted);
end

function Italy_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Rationalism Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_SECULARISM"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_HUMANISM"].ID)) or
			(policyID == GameInfo.Policies["POLICY_HUMANISM"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_SECULARISM"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_RATIONALISM"], 1);
		end
	end 
end
if bIsActive then
GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted);
end

function Italy_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Commerce Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_ENTREPRENEURSHIP"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_PROTECTIONISM"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_TRADE_UNIONS"].ID)) or
			(policyID == GameInfo.Policies["POLICY_PROTECTIONISM"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_ENTREPRENEURSHIP"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_TRADE_UNIONS"].ID)) or
			(policyID == GameInfo.Policies["POLICY_TRADE_UNIONS"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_ENTREPRENEURSHIP"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_PROTECTIONISM"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_COMMERCE"], 1);
		end
	end 
end

if bIsActive then
GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted);
end



-- PietyChanges
-- Author: Cirra
-- DateCreated: 10/17/2019 1:22:18 AM
--------------------------------------------------------------

function Piety_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Piety finisher

	if	(policyID == GameInfo.Policies["POLICY_THEOCRACY"].ID 
		and player:HasPolicy(GameInfo.Policies["POLICY_MANDATE_OF_HEAVEN"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_FREE_RELIGION"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_REFORMATION"].ID)) or
		(policyID == GameInfo.Policies["POLICY_MANDATE_OF_HEAVEN"].ID 
		and player:HasPolicy(GameInfo.Policies["POLICY_THEOCRACY"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_FREE_RELIGION"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_REFORMATION"].ID)) or
		(policyID == GameInfo.Policies["POLICY_FREE_RELIGION"].ID 
		and player:HasPolicy(GameInfo.Policies["POLICY_MANDATE_OF_HEAVEN"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_THEOCRACY"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_REFORMATION"].ID)) or
		(policyID == GameInfo.Policies["POLICY_REFORMATION"].ID 
		and player:HasPolicy(GameInfo.Policies["POLICY_MANDATE_OF_HEAVEN"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_FREE_RELIGION"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_THEOCRACY"].ID)) then

		-- The player has finished Piety. Add a Grand Monument to the capital, gives allows buying great people.
		local pCity = player:GetCapitalCity();
		pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_PIETY_FINISHER"], 1);

		local i = 
		local iIndo = GameInfo.Civilizations["CIVILIZATION_INDONESIA"].ID
		local iKhmer = GameInfo.Civilizations["CIVILIZATION_KHMER"].ID
		local iRoma = GameInfo.Civilizations["CIVILIZATION_MC_ROMANIA"].ID
		for pCity in player:Cities() do
			if i >= 4 then break end
			if (player:GetCivilizationType() == iIndo) then pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_CANDI"], 1) 
			elseif (player:GetCivilizationType() == iKhmer) then pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_BARAY"], 1)
			elseif (player:GetCivilizationType() == iRoma) then pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_MC_ROMANIAN_PAINTED_MONASTERY"], 1)
			else pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_GARDEN"], 1) end
			i = i + 1
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(Piety_OnPolicyAdopted);

-- HonorChanges
-- Author: Cirra
-- DateCreated: 7/27/2019 1:22:18 AM
--------------------------------------------------------------

function Honor_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Honor Finisher
	if	(policyID == GameInfo.Policies["POLICY_DISCIPLINE"].ID 
		and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_CASTE"].ID)) or
		(policyID == GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID 
		and player:HasPolicy(GameInfo.Policies["POLICY_DISCIPLINE"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_CASTE"].ID)) or
		(policyID == GameInfo.Policies["POLICY_MILITARY_CASTE"].ID 
		and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID)
		and player:HasPolicy(GameInfo.Policies["POLICY_DISCIPLINE"].ID)) then

		-- The player has finished Honor. Add old ToA to the capital, which gives +10% food everywhere.
		local pCity = player:GetCapitalCity();
		pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_HONOR_FINISHER"], 1);

	end

end
GameEvents.PlayerAdoptPolicy.Add(Honor_OnPolicyAdopted);
		--]]
