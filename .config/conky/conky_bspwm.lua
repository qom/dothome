
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

-- List the windows open in a given bspwm desktop/workspace..
function conky_list_window_names(workspace_num)

	-- Use bspc to query list of windows on supplied workspace number
	local winids = ""..os.capture("bspc query -W -d ^" .. workspace_num, true)
	winids = string.gsub(winids, '[\n\r]+', ' ')

	-- xtitle takes window ids and returns window titles.
	local winnames = ""
	if (winids == nil or winids == '') then
		winnames = ""
	else
		winnames = os.capture("xtitle "..winids, true)
		winnames = string.gsub(winnames, "conky [(]surfacenix[)][\n\r]", '')
	end

	return winnames
end
