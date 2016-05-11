function Initialize()
	print("Starting")

	StaffOnline = false
	MeasurePlayers = SKIN:GetMeasure('MeasurePlayersOnline')
	MeasureAdmins = SKIN:GetMeasure('MeasureAdmins')
	PeopleOnlineSteam = {}
	AdminsSteam = {}
	startup = 0
	timer = 0

	const_antiMapChangeDelay = 5
end

function Update()
	if startup < 6 then
		if startup ==5 then
			print("Searching for admins")
			AdminsSteam = {}
			for AdminSteam, immunity in string.gmatch(MeasureAdmins:GetStringValue(),'"authid": "STEAM_.:.:([^"]*)".-"grpimmunity": (%d)') do
				if tonumber(immunity) > 0 then
					AdminsSteam[#AdminsSteam + 1] = AdminSteam
					print("Found STEAM_?:?:" .. AdminSteam)
				end
			end
			print("Found " .. #AdminsSteam .. " valid admins")
		end
		startup = startup + 1
	end


	PeopleOnlineSteam = {}
	for PersonSteam in string.gmatch(MeasurePlayers:GetStringValue(),'"steamId": "STEAM_.:.:([^"]*)"') do 
		PeopleOnlineSteam[#PeopleOnlineSteam + 1] = PersonSteam 
	end
	--print("Found " .. #PeopleOnlineSteam .. " people online")

	--print(#AdminsSteam .. "admins")

	StaffOnline = false
	for a = 1,#PeopleOnlineSteam do
		local y = 0
		for y = 1,#AdminsSteam do
			if (PeopleOnlineSteam[a] == AdminsSteam[y]) then
				--print("Steam_?:?:" .. AdminsSteam[y])
				StaffOnline = true
			end
			--print(AdminsSteam[i])
		end
		--print(a .. " = " .. PeopleOnlineSteam[a])
	end

	if StaffOnline then
		timer = 0
	else
		timer = timer + 1
	end

	--print("End of Update(), validating.")
	if timer > const_antiMapChangeDelay then
		return 0
	else
		return 1
	end

	
end