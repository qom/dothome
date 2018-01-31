local cjson = require "cjson"

-- List the windows open in a given bspwm desktop/workspace..
function conky_list_window_names(workspace_num)

	-- Use bspc to query list of windows on supplied workspace number
	local winids = ""..os.capture("bspc query -N -d ^" .. workspace_num, true)
	winids = string.gsub(winids, '[\n\r]+', ' ')

	-- xtitle takes window ids and returns window titles.
	local winnames = ""
	if (winids == nil or winids == '') then
		winnames = ""
	else
		winnames = os.capture("xtitle "..winids, true)
		winnames = string.gsub(winnames, "conky [(]miniom[)][\n\r]", '')
	end

	local winnames_t = splitstr(winnames, "\n\r")
	winnames = table.concat(winnames_t, '\n')..'\n'

	return winnames
end

-- Get the workspace name given a workspace number
function conky_get_current_workspace_name()

	local monitorjson = os.capture("bspc query -T -m", true)

	local monitordetail = cjson.decode(monitorjson);
	local focuseddesktopid = monitordetail.focusedDesktopId
	local desktops = monitordetail.desktops

	local name = ""
	local i = 0
	for k,desktop in pairs(desktops) do
		i = i + 1
		if desktop.id == focuseddesktopid then
			name = desktop.name 
		end
	end

	return name
end

-- Get the workspace name given a workspace number
function conky_get_workspace_name(workspace_num)

	local monitorjson = os.capture("bspc query -T -m", true)

	local monitordetail = cjson.decode(monitorjson);
	local desktops = monitordetail.desktops

	local name = ""
	local i = 0
	for k,desktop in pairs(desktops) do
		i = i + 1
		if i == tonumber(workspace_num) then
			name = desktop.name
		end
	end

	return name
end

-- ### Utility Methods ###

-- Return the output from cmd.
function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

-- Split a string on a delimiter character
function splitstr(inputstr, sep)
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            t[i] = str
            i = i + 1
    end
    return t
end

