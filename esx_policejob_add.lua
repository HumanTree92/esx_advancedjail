-- Add to citizen_interaction
{label = _U('jail'), value = 'jail'},
elseif action == 'jail' then
	JailMenu(GetPlayerServerId(closestPlayer))

function JailMenu(player)
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'jailmenu', {
		title = _U('jail_menu'),
		align = 'top-left',
		elements = {
			{label = _U('mission_row'), value = 'mission_row'},
			{label = _U('bolingbroke_pen'), value = 'bolingbroke_pen'}
	}}, function(data, menu)
		if data.current.value == 'mission_row' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mission_row', {
				title    = _U('mission_row'),
				align    = 'top-left',
				elements = {
					{label = _U('mission_row_1'),	value = 'mission_row_1'},
					{label = _U('mission_row_2'),	value = 'mission_row_2'},
					{label = _U('mission_row_3'),	value = 'mission_row_3'}
			}}, function(data2, menu2)
				local action = data2.current.value

				if action == 'mission_row_1' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'mr1')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				elseif action == 'mission_row_2' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'mr2')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				elseif action == 'mission_row_3' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'mr3')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'bolingbroke_pen' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'bolingbroke_pen', {
				title    = _U('bolingbroke_pen'),
				align    = 'top-left',
				elements = {
					{label = _U('bolingbroke_pen_1'),	value = 'bolingbroke_pen_1'}
			}}, function(data2, menu2)
				local action = data2.current.value

				if action == 'bolingbroke_pen_1' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'bp1')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function (data, menu)
		menu.close()
	end)
end
