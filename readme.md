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

Add smooth benefits to tourism
island gen avoid colliding with other land masses with below algorithm 
you can detect isthmuses via tile types by looping over adjacents and detecting # of changes
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

# Useful Info
Embed other data like so: {TEXT_KEY}


[ICON_HAPPINESS_1]
[ICON_GOLD]
[ICON_RESEARCH]
[ICON_CULTURE]
[ICON_TOURISM]
[ICON_PRODUCTION]



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
