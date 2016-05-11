function Initialize()
	lastId = 0
	maxLines = 40
	URL = "https://clwo.eu/xmlhttp.php?action=dvz_sb_get_shouts&from="
	amountOfLines = 8
	ids={}
	avatars = {}
	names = {}
	messages = {}
	init = true	
	filling = false

	finishedSite = false
	finishedAvatar = false
	finished = false

	secondTimeGetId0 = 0

	siteMeasure = SKIN:GetMeasure('MeasureSite')

	disable(1)

	--Build all meters--
	for i=1,amountOfLines do
		SetOption("MeasureAvatar",i,"URL","https://clwo.eu/images/default_avatar.png")
		SetOption("MeasureAvatar",i,"Download","1")
		SetOption("MeterAvatar",i,"MeterStyle","#AvatarMeterStyle#")
		SetOption("MeterAvatar",i,"MeasureName","MeasureAvatar"..i)
		SetOption("MeterName",i,"MeterStyle","#NameMeterStyle#")
		SetOption("MeterMessage",i,"MeterStyle","#MessageMeterStyle#")
	end
end


function Update()
	
	if secondTimeGetId0 < 2 then
		print("Updating")
	end

	if finished then	
		if init then
			lastId = getId()
			print("INIT: Trying this lastId: "..lastId)
			if lastId > 0 then
				print("Aight, that's a nice lastId!")
				init = false
				downloadNewInfo(lastId)
				--filling = true
			end
		elseif filling then
			--print("filling")
			--print("filling")
			--Fill it
		else
			if getId() > 0 then
				lastId = getId()
				print("LastId: "..lastId)
				print(getId())
				print(getAvatar())
				print(getName())
				print(getMessage())
				downloadNewInfo(lastId)
				secondTimeGetId0 = 0
			elseif getId() >= 0 then
				--downloadNewInfo(lastId)
				--IDK
				if secondTimeGetId0 == 1 then
					print("Second time that GetId=0. Now going to wait for new messages.")
					secondTimeGetId0 = 2
				elseif secondTimeGetId0 == 0 then
					print("GetId= 0. Nothing to worry about yet.")
					SKIN:Bang('!SetOption "MeasureSite" "UpdateDivider" "100"')
					secondTimeGetId0 = 1
				end
				--SKIN:Bang('!SetOption "MeasureLua" "UpdateDivider" "10000"')
			else
				print("Wuut how")
			end
		end
	else
		print("Not finished yet")
	end

	--print(SKIN:GetMeasure('MeasureAvatar'):GetStringValue())

end


function downloadNewInfo(postNumber)
	if(ids[#ids] == nil or getId() > ids[#ids]) then
		ids[#ids + 1] = getId()
		avatars[#avatars + 1] = getAvatar()
		names[#names + 1] = getName()
		messages[#messages + 1] = getMessage()

		for i=1,math.min(#messages,amountOfLines) do
			SetOption("MeasureAvatar",i,"URL",avatars[#avatars-i+1])
			SetOption("MeterName",i,"Text",names[#names-i+1])
			SetOption("MeterMessage",i,"Text",messages[#messages-i+1])
			SKIN:Bang('!UpdateMeasure "MeasureAvatar'..i..'"')
			SKIN:Bang('!UpdateMeter "MeterAvatar'..i..'"')
			SKIN:Bang('!UpdateMeter "MeterName'..i..'"')
			SKIN:Bang('!UpdateMeter "MeterMessage'..i..'"')
		end
	end
	
	disable(1)

	finishedSite = false
	finishedAvatar = false
	finished = false
	SKIN:Bang('!SetOption "MeasureSite" "UpdateDivider" "1"')
	--SKIN:Bang('!SetOption "MeasureLua" "UpdateDivider" "1"')
	print("Downloading for: "..postNumber)
	SKIN:Bang('!SetOption "MeasureSite" "URL" "'..URL..postNumber..'"')
	--newRegExp = '"#prefix#('..postNumber..')#suffix#.*#GET#"'
	SKIN:Bang('!SetVariable searchingFor '..postNumber)
	--SKIN:Bang('!SetVariable preFix "(?siU)(?(?=data-id=)(.*)data-id=..)"')
	SKIN:Bang('!UpdateMeasure "MeasureSite"')
	SKIN:Bang('!UpdateMeasure "MeasureAvatar"')

end

function setMessage(id, text)
	SKIN:Bang('!SetOption "MeterMessage'..id..'" "Text" "'..text..'"')
end

function setAvatar(id, path)
	SKIN:Bang('!SetOption "MeterAvatar'..id..'" "ImageName" "'..text..'"')
end

function setName(id, text)
	SKIN:Bang('!SetOption "MeterName'..id..'" "Text" "'..text..'"')
end

function SetOption(name, id, option, value)
	SKIN:Bang('!SetOption "'..name..id..'" "'..option..'" "'..value..'"')
end

function getId()
	return(SKIN:GetMeasure('MeasureId'):GetValue())
end

function getName()
	return(SKIN:GetMeasure('MeasureName'):GetStringValue())
end

function getAvatar()
	return(SKIN:GetMeasure('MeasureAvatar'):GetStringValue())
end

function getMessage()
	return(SKIN:GetMeasure('MeasureMessage'):GetStringValue())
end


function finishSite()
	finishedSite = true
	finished = true
	if finished then
		SKIN:Bang('!SetOption "MeasureSite" "UpdateDivider" "100"')
		--SKIN:Bang('!SetOption "MeasureLua" "UpdateDivider" "10"')
		disable(0)
		--SKIN:Bang('!SetOption', MeasureSite, UpdateDivider, 10)
		--SKIN:Bang('!UpdateMeasure "MeasureSite"')
		--SKIN:Bang('!SetOption', MeasureLua, UpdateDivider, 10)
		--SKIN:Bang('!UpdateMeasure "MeasureLua"')
		--print("finish---------------------------------------------------------------------------------------")
	end
end

function finishAvatar()
	finishedAvatar = true
	finished = finishedSite
	if finished then
		--SKIN:Bang('!SetOption', MeasureSite, UpdateDivider, 10)
		--SKIN:Bang('!SetOption', MeasureLua, UpdateDivider, 10)
	end
end

function disable(onoff)
	SKIN:Bang('!SetOption "MeasureId" "Disabled" "'..onoff..'"')
	SKIN:Bang('!SetOption "MeasureName" "Disabled" "'..onoff..'"')
	SKIN:Bang('!SetOption "MeasureProfileLink" "Disabled" "'..onoff..'"')
	SKIN:Bang('!SetOption "MeasureAvatar" "Disabled" "'..onoff..'"')
	SKIN:Bang('!SetOption "MeasureUserId" "Disabled" "'..onoff..'"')
	SKIN:Bang('!SetOption "MeasureName2" "Disabled" "'..onoff..'"')
	SKIN:Bang('!SetOption "MeasureMessage" "Disabled" "'..onoff..'"')
	SKIN:Bang('!SetOption "MeasureDate" "Disabled" "'..onoff..'"')
end