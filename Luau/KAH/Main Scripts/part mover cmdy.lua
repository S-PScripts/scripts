-- // to be added to kohlslite \\ --

-- // variables \\ --
	local Player = game.Players.LocalPlayer
	local PlayerService = game:GetService("Players")

-- // list \\ --
	local ogcframes = {
		["SmoothBlockModel178"] = {-13.0650005, 45.4300003, 57.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel176"] = {-15.0650005, 37.6300011, 51.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel140"] = {-13.0650005, 37.0300026, 57.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel137"] = {-19.0650005, 31.0300007, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel135"] = {-11.0650005, 36.4300003, 57.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel131"] = {-15.0650005, 37.6300011, 57.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel129"] = {-17.0650005, 38.2300034, 54.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel124"] = {-30.0650005, 38.2300034, 48.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel123"] = {-9.06500053, 25.0300007, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel118"] = {-11.0650005, 36.4300003, 53.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel117"] = {-3.06500006, 13.6300011, 63.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel116"] = {-3.06500006, 13.6300011, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel128"] = {-21.0650005, 32.2300034, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel110"] = {-25.0650005, 34.6300011, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel105"] = {-57.0650024, 13.6300011, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel125"] = {-17.0650005, 29.8300018, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel104"] = {-7.06500053, 23.8300018, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel119"] = {-30.0650005, 37.0300026, 54.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel100"] = {-5.06500006, 22.6300011, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel97"] = {-41.0650024, 19.6300011, 72.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel89"] = {-3.06500006, 15.4300003, 61.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel88"] = {-13.0650005, 27.4300022, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel147"] = {-57.0650024, 18.4300003, 73.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel160"] = {-15.0650005, 45.4300003, 51.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel84"] = {-35.0650024, 34.6300011, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel81"] = {-3.06500006, 5.23000002, 71.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel80"] = {-57.0650024, 21.4300003, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel111"] = {-37.0650024, 33.4300003, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel87"] = {-15.0650005, 28.6300011, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel78"] = {-41.0650024, 31.0300007, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel77"] = {-39.0650024, 32.2300034, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel165"] = {-11.0650005, 45.4300003, 53.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel76"] = {-35.0650024, 34.6300011, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel75"] = {-30.0650005, 28.6300011, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel106"] = {-57.0650024, 15.4300003, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel74"] = {-39.0650024, 32.2300034, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel69"] = {-3.06500006, 13.6300011, 57.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel67"] = {-16.0650005, 15.4300003, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel98"] = {-30.0650005, 26.2300014, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel66"] = {-57.5650024, 7.03000021, 61.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel65"] = {-3.06500006, 13.6300011, 58.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel63"] = {-33.0650024, 35.8300018, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel62"] = {-33.0650024, 35.8300018, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel68"] = {-30.0650005, 31.0300007, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel109"] = {-30.0650005, 37.0300026, 66.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel162"] = {-17.0650005, 45.4300003, 55.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel61"] = {-35.0650024, 34.6300011, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel58"] = {-43.0650024, 29.8300018, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel57"] = {-3.06500006, 10.0300007, 57.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel55"] = {-55.0650024, 22.6300011, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel108"] = {-3.06500006, 15.4300003, 72.3430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel48"] = {-57.0650024, 11.2300005, 50.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel102"] = {-3.06500006, 21.4300003, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel46"] = {-38.5650024, 13.6300011, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel44"] = {-51.0650024, 25.0300007, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel43"] = {-22.5650005, 10.0300007, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel41"] = {-30.0650005, 21.4300003, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel39"] = {-57.0650024, 13.6300011, 57.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel82"] = {-57.0650024, 10.0300007, 64.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel127"] = {-23.0650005, 33.4300003, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel95"] = {-27.0650005, 35.8300018, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel114"] = {-30.0650005, 34.6300011, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel37"] = {-30.0650005, 23.8300018, 45.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel36"] = {-30.0650005, 33.4300003, 45.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel130"] = {-13.0650005, 37.0300026, 51.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel56"] = {-30.0650005, 29.8300018, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel53"] = {-19.0650005, 7.03000021, 44.7430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel35"] = {-57.0650024, 13.6300011, 58.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel34"] = {-45.0650024, 28.6300011, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel32"] = {-43.0650024, 29.8300018, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel54"] = {-39.0650024, 32.2300034, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel120"] = {-30.0650005, 38.2300034, 60.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel49"] = {-57.0650024, 15.4300003, 58.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel29"] = {-30.0650005, 15.4300003, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel27"] = {-41.0650024, 15.4300003, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel26"] = {-30.0650005, 32.2300034, 45.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel51"] = {-30.0650005, 27.4300022, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel21"] = {-47.0650024, 27.4300022, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel17"] = {-49.0650024, 26.2300014, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel83"] = {-19.0650005, 15.4300003, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel16"] = {-47.0650024, 27.4300022, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel50"] = {-21.5650005, 13.6300011, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel115"] = {-3.06500006, 15.4300003, 58.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel15"] = {-50.5650024, 11.2300005, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel14"] = {-30.0650005, 9.43000031, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel13"] = {-44.0650024, 15.4300003, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel42"] = {-41.0650024, 31.0300007, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel12"] = {-53.0650024, 23.8300018, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel64"] = {-57.0650024, 13.6300011, 63.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel11"] = {-50.5650024, 5.23000002, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel28"] = {-49.0650024, 26.2300014, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel113"] = {-3.06500006, 11.2300005, 51.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel10"] = {-44.5650024, 8.2300005, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel7"] = {-43.5650024, 13.6300011, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel6"] = {-57.0650024, 21.4300003, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel99"] = {-2.56500006, 7.03000021, 61.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel143"] = {-30.0650005, 37.0300026, 45.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel3"] = {-41.0650024, 4.63000011, 44.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel122"] = {-3.06500006, 18.4300003, 73.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel9"] = {-41.0650024, 2.83000016, 42.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel19"] = {-51.0650024, 25.0300007, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel8"] = {-44.5650024, 13.6300011, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel45"] = {-15.5650005, 10.0300007, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel72"] = {-15.5650005, 13.6300011, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel18"] = {-51.0650024, 25.0300007, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel103"] = {-30.0650005, 25.0300007, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel33"] = {-55.0650024, 22.6300011, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel31"] = {-30.0650005, 18.4300003, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel71"] = {-3.06500006, 10.0300007, 64.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel30"] = {-30.0650005, 22.6300011, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel60"] = {-57.0650024, 15.4300003, 61.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel59"] = {-47.0650024, 27.4300022, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel86"] = {-11.0650005, 26.2300014, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel52"] = {-19.0650005, 19.6300011, 72.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel23"] = {-45.0650024, 28.6300011, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel79"] = {-37.0650024, 33.4300003, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel4"] = {-37.5650024, 8.2300005, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel2"] = {-55.0650024, 22.6300011, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel20"] = {-20.5650005, 5.23000002, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel24"] = {-57.0650024, 10.0300007, 57.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel47"] = {-53.0650024, 23.8300018, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel5"] = {-41.0650024, 1.63000011, 39.243, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel25"] = {-43.0650024, 29.8300018, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel70"] = {-8.56500053, 11.2300005, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel73"] = {-16.5650005, 13.6300011, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel22"] = {-30.0650005, 13.6300011, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel126"] = {-57.0650024, 5.23000002, 71.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel1"] = {-41.0650024, 1.03000009, 37.243, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel232"] = {-30.1660023, 5.82995605, 70.4320068, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel231"] = {-43.0650024, 29.8300018, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel230"] = {-49.0650024, 26.2300014, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel229"] = {-53.0650024, 23.8300018, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel227"] = {-43.0650024, 29.8300018, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel226"] = {-30.0650005, 32.2300034, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel225"] = {-51.0650024, 25.0300007, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel224"] = {-50.5650024, 11.2300005, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel223"] = {-30.0650005, 34.6300011, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel222"] = {-55.0650024, 22.6300011, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel221"] = {-37.0650024, 33.4300003, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel218"] = {-44.0650024, 15.4300003, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel217"] = {-43.5650024, 13.6300011, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel216"] = {-39.0650024, 32.2300034, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel214"] = {-35.0650024, 34.6300011, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel213"] = {-30.0650005, 31.0300007, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel211"] = {-30.0650005, 29.8300018, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel208"] = {-30.0650005, 26.2300014, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel204"] = {-22.5650005, 10.0300007, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel203"] = {-30.0650005, 23.8300018, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel201"] = {-30.1650009, 21.4300003, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel196"] = {-30.0650005, 9.43000031, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel193"] = {-43.0650024, 29.8300018, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel191"] = {-30.0650005, 18.4300003, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel187"] = {-33.0650024, 35.8300018, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel185"] = {-44.5650024, 13.6300011, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel205"] = {-30.0650005, 15.4300003, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel197"] = {-30.0650005, 22.6300011, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel184"] = {-55.0650024, 22.6300011, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel180"] = {-33.0650024, 35.8300018, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel174"] = {-57.0650024, 10.0300007, 86.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel171"] = {-57.0650024, 15.4300003, 83.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel167"] = {-47.0650024, 27.4300022, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel164"] = {-9.56500053, 11.2300005, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel161"] = {-3.06500006, 10.0300007, 86.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel159"] = {-3.06500006, 13.6300011, 85.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel157"] = {-39.0650024, 32.2300034, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel155"] = {-30.0650005, 5.23000002, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel154"] = {-30.0650005, 13.6300011, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel173"] = {-57.0650024, 13.6300011, 86.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel152"] = {-41.0650024, 31.0300007, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel151"] = {-57.0650024, 21.4300003, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel150"] = {-57.5650024, 7.03000021, 83.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel206"] = {-37.5650024, 10.0300007, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel148"] = {-3.06500006, 10.0300007, 79.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel177"] = {-35.0650024, 34.6300011, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel144"] = {-3.06500006, 13.6300011, 80.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel198"] = {-16.0650005, 15.4300003, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel142"] = {-3.06500006, 13.6300011, 86.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel141"] = {-37.0650024, 33.4300003, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel138"] = {-55.0650024, 22.6300011, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel136"] = {-51.0650024, 25.0300007, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel134"] = {-3.06500006, 11.2300005, 93.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel133"] = {-47.0650024, 27.4300022, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel132"] = {-3.06500006, 15.4300003, 86.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel145"] = {-57.0650024, 10.0300007, 79.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel146"] = {-57.0650024, 13.6300011, 80.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel175"] = {-57.0650024, 13.6300011, 85.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel202"] = {-30.0650005, 38.2300034, 96.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel209"] = {-30.0650005, 25.0300007, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel168"] = {-39.0650024, 32.2300034, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel186"] = {-57.0650024, 11.2300005, 93.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel139"] = {-41.0650024, 31.0300007, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel188"] = {-30.0650005, 37.0300026, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel195"] = {-19.0650005, 7.03000021, 99.7430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel219"] = {-57.0650024, 21.4300003, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel200"] = {-51.0650024, 25.0300007, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel183"] = {-21.5650005, 13.6300011, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel101"] = {-3.06500006, 15.4300003, 83.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel207"] = {-30.0650005, 28.6300011, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel153"] = {-30.0650005, 37.0300026, 90.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel194"] = {-16.5650005, 13.6300011, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel210"] = {-30.0650005, 27.4300022, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel181"] = {-41.0650024, 7.03000021, 99.7430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel93"] = {-57.0650024, 9.43000031, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel90"] = {-45.0650024, 28.6300011, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel156"] = {-35.0650024, 34.6300011, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel166"] = {-15.5650005, 13.6300011, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel179"] = {-57.0650024, 15.4300003, 86.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel220"] = {-41.0650024, 31.0300007, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel163"] = {-49.0650024, 26.2300014, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel91"] = {-49.0650024, 26.2300014, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel228"] = {-41.0650024, 15.4300003, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel94"] = {-30.0650005, 38.2300034, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel189"] = {-45.0650024, 28.6300011, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel190"] = {-30.0650005, 33.4300003, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel107"] = {-57.0650024, 21.4300003, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel96"] = {-33.0650024, 35.8300018, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel149"] = {-30.0650005, 37.0300026, 78.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel158"] = {-30.0650005, 38.2300034, 84.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["SmoothBlockModel215"] = {-47.0650024, 27.4300022, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel212"] = {-44.5650024, 10.0300007, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel169"] = {-53.0650024, 23.8300018, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel172"] = {-45.0650024, 28.6300011, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel199"] = {-15.5650005, 10.0300007, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel182"] = {-38.5650024, 13.6300011, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel121"] = {-2.56500006, 7.03000021, 83.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel92"] = {-53.0650024, 23.8300018, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel170"] = {-37.0650024, 33.4300003, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel192"] = {-19.0650005, 15.4300003, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["Spawn1"] = {-29, 0.0999880284, -25.5900097, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["Spawn2"] = {-53, 0.0999999493, -25.5900097, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["Spawn3"] = {-41, 0.0999999493, -25.5899963, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["Regen"] = {-7.16499996, 5.42998981, 94.7429962, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Baseplate"] = {0, 0.100000001, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Jump"] = {-41.0650024, 1.30000007, -5.95700026, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Jump1"] = {-41.0650024, 1.30000007, 0.243000016, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Jump2"] = {-41.0650024, 1.30000007, -11.9570007, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Jump3"] = {-41.0650024, 1.30000007, 11.0430002, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Jump4"] = {-41.0650024, 1.30000007, 16.0430012, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Jump5"] = {-41.0650024, 1.30000007, 6.24300051, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Jump6"] = {-41.0650024, 1.30000007, 21.2430019, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Jump7"] = {-41.0650024, 1.30000007, 26.4430008, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Jump8"] = {-41.0650024, 1.30000007, 31.2430019, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Jump9"] = {-41.0650024, 1.30000007, -17.757, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Left Wall"] = {-23.0650024, 16.5000019, 0.243000031, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Right Wall"] = {-59.0650101, 16.5000038, 0.243000031, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Ceiling Wall"] = {-41.0649872, 31.6999989, 1.24301004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Back Wall"] = {-41.0649948, 16.5000076, -30.757, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["Pad8"] = {-40.7649879, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Pad7"] = {-36.7649803, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Pad6"] = {-32.7649765, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Pad3"] = {-20.7649632, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Pad9"] = {-44.7649994, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Pad1"] = {-12.7649641, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Pad5"] = {-28.7649689, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Pad2"] = {-16.7649612, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Pad4"] = {-24.764967, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["SmoothBlockModel40"] = {-30.0650005, 1.03000009, 72.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel38"] = {-30.0650005, 2.83000016, 72.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["SmoothBlockModel112"] = {-30.0650005, 4.63000011, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Divider1"] = {-10.7649708, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Divider2"] = {-14.7649689, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Divider3"] = {-18.7649689, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Divider4"] = {-22.7649727, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Divider5"] = {-26.7649746, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Divider6"] = {-30.7649822, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Divider7"] = {-34.7649841, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Divider8"] = {-38.7649918, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Divider9"] = {-42.7650032, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Divider10"] = {-46.7649994, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Back"] = {-28.7649994, 6.42999983, 96.3430023, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["SmoothBlockModel85"] = {-3.06500006, 9.43000031, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part57"] = {-101.076004, 1.20200002, 13.4760008, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part55"] = {-101.076004, 1.70000005, 17.4740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part54"] = {-97.576004, 0.900000036, 17.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part53"] = {-95.0770035, 0.90200007, 7.47400045, 1, 0, 0, 0, -1, 0, 0, 0, -1},
		["Part52"] = {-95.076004, 1.20200002, 10.4760008, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part50"] = {-89.576004, 1.20000005, 17.9740009, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Part47"] = {-93.576004, 1.20000005, 17.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part49"] = {-85.576004, 1.20000005, 17.9740009, 0, 0, 1, 0, -1, 0, 1, 0, -0},
		["Part46"] = {-93.576004, 1.20000005, 13.9740009, 0, 0, 1, 0, 1, -0, -1, 0, 0},
		["Part44"] = {-74.576004, 1.30000007, 14.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part43"] = {-78.576004, 1.30000007, 14.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part40"] = {-85.576004, 1.20000005, 13.9740009, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["Part60"] = {-101.076004, 0.90200007, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1},
		["Part36"] = {-89.0770035, 1.20200002, 10.4740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part56"] = {-101.076004, 0.90200007, 10.4760008, 1, 0, 0, 0, -1, 0, 0, 0, -1},
		["Part35"] = {-86.0780029, 0.900000036, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1},
		["Part33"] = {-77.0770035, 1.20200002, 10.4740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part32"] = {-83.0770035, 1.20200002, 10.4740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part41"] = {-89.576004, 0.900000036, 13.9740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part31"] = {-77.076004, 2.70000005, 7.47400045, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part27"] = {-72.6300049, 2.5, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part42"] = {-89.0780029, 0.900000036, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1},
		["Part26"] = {-72.6300049, 6.10000038, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part30"] = {-83.0780029, 0.900000036, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1},
		["Part39"] = {-86.0770035, 1.20200002, 10.4740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part25"] = {-72.6300049, 3.70000029, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part24"] = {-72.6300049, 7.30000019, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part34"] = {-80.0770035, 1.20200002, 10.4740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part21"] = {-68.0300064, 8.5, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part22"] = {-72.6300049, 1.30000007, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part58"] = {-98.076004, 0.90200007, 10.4760008, 1, 0, 0, 0, -1, 0, 0, 0, -1},
		["Part17"] = {-68.0300064, 6.10000038, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part19"] = {-68.0300064, 2.5, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part20"] = {-68.0300064, 4.9000001, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part23"] = {-72.6300049, 8.5, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part15"] = {-68.0300064, 7.30000019, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part13"] = {-67.5, 8.5, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part12"] = {-67.5, 7.30000019, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part48"] = {-92.0770035, 1.20200002, 10.4760008, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part8"] = {-67.5, 4.9000001, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part59"] = {-98.076004, 1.20200002, 13.4760008, 0, 0, -1, 0, 1, 0, 1, 0, 0},
		["Part10"] = {-67.5, 1.30000007, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part7"] = {-69, 8.5, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part28"] = {-72.6300049, 4.9000001, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part6"] = {-69, 7.30000019, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part9"] = {-67.5, 6.10000038, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part5"] = {-69, 6.0999999, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part16"] = {-68.0300064, 1.30000007, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part18"] = {-68.0300064, 3.70000029, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part11"] = {-67.5, 3.70000029, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part4"] = {-69, 4.9000001, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part3"] = {-69, 3.70000005, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part2"] = {-69, 2.5, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part1"] = {-69, 1.30000007, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part37"] = {-76.576004, 1.30000007, 14.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part14"] = {-67.5, 2.5, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part45"] = {-82.576004, 1.30000007, 14.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part38"] = {-80.576004, 1.30000007, 14.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		["Part29"] = {-80.076004, 0.900000036, 7.47400045, -1, 0, 0, 0, 1, 0, 0, 0, -1},
		["Part61"] = {-98.0770035, 0.90200007, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1},
		["Part51"] = {-92.0770035, 0.900000036, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1}
	}

local function moveobject(part, o)
		if movestatus == false then
			movestatus = true
			if o == 1 then
				if allclear() == true then
					removelimbs()
					task.wait()
					workspace.Gravity = 0
					act("size me .5")
					workspace.FallenPartsDestroyHeight = 0/0
					act("gear me 0000000000000000000000000000000000000108158379")
					repeat fwait() until Player.Backpack:FindFirstChild("IvoryPeriastron")
					Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("IvoryPeriastron"))
					local ivory = Player.Character:FindFirstChild("IvoryPeriastron")
					local randcoord = CFrame.new(math.random(-30593, -23388), math.random(-30593, -10455), math.random(-30593, -10455))
					Player.Character.HumanoidRootPart.CFrame = randcoord
					PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					if Player.Character.Torso:FindFirstChild("Weld") then
						Player.Character.Torso:FindFirstChild("Weld"):Destroy()
					end
					task.wait(.25)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.25)
					attach(part)
					task.wait(.25)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.25)
					movestatus = false
				else
					prompt("Something went wrong removing the parts.")
					forcerespawn()
					fixgame()
				end
			elseif o == 2 then
				local loop = false
				if allclear() == true then
					removelimbs()
					task.wait()
					act("size me .5")
					workspace.Gravity = 0
					workspace.FallenPartsDestroyHeight = 0/0
					act("gear me 0000000000000000000000000000000000000108158379")
					repeat fwait() until Player.Backpack:FindFirstChild("IvoryPeriastron")
					Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("IvoryPeriastron"))
					local ivory = Player.Character:FindFirstChild("IvoryPeriastron")
					local newcoord = CFrame.new(ogcframes[part.Name][1],ogcframes[part.Name][2],ogcframes[part.Name][3],ogcframes[part.Name][4],ogcframes[part.Name][5],ogcframes[part.Name][6],ogcframes[part.Name][7],ogcframes[part.Name][8],ogcframes[part.Name][9],ogcframes[part.Name][10],ogcframes[part.Name][11],ogcframes[part.Name][12]) * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0)
					loop = true
					task.spawn(function()
						while loop do
							fwait() 
							Player.Character.HumanoidRootPart.CFrame = newcoord
							if loop == false then break end
						end
					end)
					repeat fwait() 
					until Player.Character.HumanoidRootPart.CFrame == newcoord
					loop = false
					if Player.Character.Torso:FindFirstChild("Weld") then
						Player.Character.Torso:FindFirstChild("Weld"):Destroy()
					end
					PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					task.wait(.25)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.25)
					attach(part)
					task.wait(.25)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.25)
					movestatus = false
				else
					loop = false
					forcerespawn()
					fixgame()
					prompt("Something went wrong removing the parts.")
				end
			elseif o == 3 then
				if allclear() == true then
					removelimbs()
					task.wait()
					act("size me .5")
					workspace.Gravity = 0
					workspace.FallenPartsDestroyHeight = 0/0
					act("gear me 0000000000000000000000000000000000000108158379")
					repeat fwait() until Player.Backpack:FindFirstChild("IvoryPeriastron")
					Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("IvoryPeriastron"))
					local ivory = Player.Character:FindFirstChild("IvoryPeriastron")
					local randcoord = CFrame.new(0, math.random(-14950, -15000), 0)
					Player.Character.HumanoidRootPart.CFrame = randcoord
					if Player.Character.Torso:FindFirstChild("Weld") then
						Player.Character.Torso:FindFirstChild("Weld"):Destroy()
					end
					PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					task.wait(.25)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.05)
					attach(part)
					task.wait(.05)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.25)
					movestatus = false
				else
					prompt("Something went wrong removing the parts.")
					forcerespawn()
					fixgame()
				end
			end
		end
	end

	local function removelimbs()
		for i,v in pairs(PlayerService.LocalPlayer.Character.Torso:GetChildren()) do
			if v.Name == "Left Shoulder" then
				v:Destroy()
			end
			if v.Name == "Left Hip" then
				v:Destroy()
			end
			if v.Name == "Right Hip" then
				v:Destroy()
			end
		end
	end

local function attach(part)
		if Player.Character.Torso:FindFirstChild("Weld") then
			Player.Character.Torso:FindFirstChild("Weld"):Destroy()
		end
		PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
		local looping = true
		task.spawn(function()
			if Player.Character.Torso:FindFirstChild("Weld") then
				Player.Character.Torso:FindFirstChild("Weld"):Destroy()
			end
			while true do
				fwait()
				if allclear() == true then
					PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					Player.Character.HumanoidRootPart.CFrame = part.CFrame * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0) 
				elseif allclear() == false then
					forcerespawn()
					fixgame()
					prompt("Something went wrong moving the parts. Fixing game and respawning..")
					looping = false
				end
				if looping == false then break end
			end
		end)
		task.spawn(function() 
			while looping do 
				fwait()
				act("unpunish me")
				if allclear() == false then 
					forcerespawn()
					fixgame()
					prompt("Something went wrong moving the parts. Fixing game and respawning..")
					looping = false
				end 
				if looping == false then break end
			end
		end)
		
		repeat fwait() Player.Character.HumanoidRootPart.CFrame = part.CFrame * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0) 
		until Player.Character.HumanoidRootPart.CFrame == part.CFrame * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0)
		repeat 
			fwait() 
			if allclear() == false then
				break
			end
		until 
			Player.Character.Torso:FindFirstChild("Weld")
		looping = false
	end

	local function fixgame()
		workspace.Gravity = 198.6
		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("Part") then
				v.CanCollide = true
			end
		end
	end

	local function forcerespawn()
		if respawning == true then
			return
		else
			respawning = true
			local char = PlayerService.LocalPlayer.Character
			if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
			char:ClearAllChildren()
			local newChar = Instance.new("Model")
			newChar.Parent = workspace
			PlayerService.LocalPlayer.Character = newChar
			wait()
			PlayerService.LocalPlayer.Character = char
			newChar:Destroy()
			respawning = false
		end
	end
