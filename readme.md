# Leon Mod
A CIV V mod starting with Lekmod V28.2. Requires all DLC.
* [Lekmod v28.2](https://docs.google.com/document/d/1-i_9E7hD_56WwNgj7LzrkbX7tCuNmud3AVyONijydWs/edit)
* [DLL Code Here](https://github.com/lfricken/nqmod-vs2008)
* Text changes should go in /LEKMOD_V28.2/Override/CIV5Units_Mongol.xml
* Most changes are in /LEKMOD_V28.2/Override/CIV5Units.xml
* AnyWithIslands.lua map file requires this mod and needs to be put in `\Sid Meier's Civilization V\Assets\Maps`



# TODO
Create [Lekmod v28.2](https://docs.google.com/document/d/1-i_9E7hD_56WwNgj7LzrkbX7tCuNmud3AVyONijydWs/edit) Mirror
Create vs2008 iso files and patch Mirror

 -- Uran, Horse, Oil,   Iron, Coal, Alum
 let city states spawn on islands
 canal maint
the colloseum and zoo require a horse

buff other naval melee
Add smooth benefits to tourism - GetInfluenceTradeRouteScienceBonus (unit strength bonus as 
Unit Strength +(min(100, tourismDifference) / 2)% )
See GetUnhappinessCombatPenalty

D:\SteamLibrary\steamapps\common\Sid Meier's Civilization V\Assets\DLC\LEKMOD_V28.2\Mods\No Quitters Mod (v 11)\ui\EnemyUnitPanel.lua:
iModifier = theirUnit:GetUnhappinessCombatPenalty();



cities start with 12 strength, increase with 0.5 pop, do 20 damage


move governors mansion exploration benefits to Expansionist policy tree, rename governors mansion



Stele, or occasionally stela when derived from Latin, is a stone or wooden slab, generally taller than it is wide, erected in the ancient world as a monument. The surface of the stele often has text, ornamentation, or both. These may be inscribed, carved in relief, or painted. Stelae were created for many reasons. Grave stelae were used for funerary or commemorative purposes. Stelae as slabs of stone would also be used as ancient Greek and Roman government notices or as boundary markers to mark borders or property lines.

ironclad takes iron not coal
Battleship and Carrier description
zoo require horses
tourism combat bonus doesn't work yet
naval units should be able to heal outside friendly territory
Add global xml to adjust tourism combat
tourism happiness
great firewall dll changes
great lighthouse shuld give gold per feature
3 gpt for mausoleum
spearman bowmen catapult
panama canal 3 gpt -1 culture per tile
Petra +1 gold per tile
8 science porcelain tower, +5 culture
move porcelain tower down
red fort 6 culture
salt and marble for
revert honor
800 health cities
defense buildings need to add more health
make sure city strength scales appropriately
National Epic 2 culture

Honor
Revert


Liberty
Settler +1+1 in Liberty-Collective Rule.
City Hall starts in opener.
City Hall +1 Gold in Opener
City Hall +1 Happiness Representation
City Hall +1 science Liberty Finisher
Meritocracy Palace +4 Happiness at palace
Remove Happiness Colleseum bonus


Windmill
Workshop
Iron Works

Production Bonuses
Science Bonuses

Exploration > renamve Urbanization
Opener:	
	+10% when constructing buildings

Naval Tradition:
	+2 science per Forge, Windmill, workshop, or Factory

Maritime Infrastructure:
	+2 prod per mountain, +2 prod per city, +15% prod in capital
	
Colonialism:
	Strategic and Bonus Resources +1 Production

Navigation School:
	+1 prod per Sea

Treasure Fleets:
	

Finisher: 
	+1 Gold per sea
	30% for Gold/Science production


Louvre to public
Decrease culture policy cost by 20%

Cultural Centers
	+1 culture from each as well


Worlds fair 50 rather than 66%.

commerce internal to 50%
25 instead of 20 gold purchase price reduction




City Hall - An inscribed stone at the center of a city, declaring the common law that citizens of a large empire must obey and cooperate under.




TXT_KEY_BUILDING_GOVERNORS_MANSION_DESC

island gen avoid colliding with other land masses with below algorithm - you can detect isthmuses via tile types by looping over adjacents and detecting # of changes
HELICOPTERS and SUBMARINES should be bad vs eachother
Most Natural wonders kinda suck
Move louve to low aesthetics
Move uffizi down
Move porcelain tower down and buff a bit
civ 5 minor civ priorities
Piety boost?
Pentagon insta units with upgrade reduction
Nuclear missile less damage, cheaper, less pop damage

buff naval melee strength (including sub and destroyer strength)
subs cannot see other subs
Destroyer 50% bonus vs ranged
Sub 100% bonus vs ranged

Subs and Destroyers <-- for sea domination
Battleships, Carrier, Embarked <-- For attacking land

Destroyers are better than subs in that:
they can take cities
they can defend friendly units against air
they can see subs at a distance

# Useful Info
Embed other data like so: {TEXT_KEY}


[ICON_HAPPINESS_1]
[ICON_GOLD]
[ICON_RESEARCH]
[ICON_CULTURE]
[ICON_TOURISM]
[ICON_PRODUCTION]PROMOTION_NO_CITY_ATTACK


Epic.Access.Referrals.ReferralLookup.Web.ReferralContext
2.75 - 3 - 0.25
2.00 - 2 - 1
1.25 - 1 - 0.25

{self.uranium_ID, uran_amt, 50, 10, 0} };

res_ID[index] = resource_data[1];
res_quantity[index] = resource_data[2];
res_weight[index] = resource_data[3];
res_min[index] = resource_data[4]; -- 10
res_max[index] = resource_data[5]; -- 0



function random(center, range)

rounded = math.floor(0.5 + val);
getResourceAmount
PlaceSpecificNumberOfResources

SetResourceType


elseif resourceType == "RESOURCE_IRON" then
	self.iron_ID = resourceID;
elseif resourceType == "RESOURCE_HORSE" then
	self.horse_ID = resourceID;
elseif resourceType == "RESOURCE_COAL" then
	self.coal_ID = resourceID;
elseif resourceType == "RESOURCE_OIL" then
	self.oil_ID = resourceID;
elseif resourceType == "RESOURCE_ALUMINUM" then
	self.aluminum_ID = resourceID;
elseif resourceType == "RESOURCE_URANIUM" then
	self.uranium_ID = resourceID;

ROUTE_RAILROAD
			<RouteType>ROUTE_RAILROAD</RouteType> 
