-- statusbar_workspace.lua
--
-- Show current workspace name or number in the statusbar.
-- 
-- Put any of these in cfg_statusbar.lua's template-line:
--  %workspace_name
--  %workspace_frame
--  %workspace_pager
--
-- This is an internal statusbar monitor and does NOT require
-- a dopath statement (effective after a 2006-02-12 build).
--
-- version 1
-- author: Rico Schiekel <fire at paranetic dot de>
--
-- version 2
-- aded 2006-02-14 by Canaan Hadley-Voth:
--  * %workspace_pager shows a list of workspace numbers 
--    with the current one indicated:
--
--    1i  2i  [3f]  4p  5c
--
--    i=WIonWS, f=WFloatWS, p=WPaneWS, c=WClientWin/other
--
--  * %workspace_frame - name of the active frame.
--
--  * Added statusbar_ to the filename (since it *is*
--    an internal statusbar monitor) so that it works without
--    a "dopath" call.
--
--  * Removed timer.  Only needs to run on hook.
--    Much faster this way.
--

local function update_frame()
    local fr
    ioncore.defer( function() 
        local cur=ioncore.current()
        if obj_is(cur, "WClientWin") and
          obj_is(cur:parent(), "WMPlex") then
            cur=cur:parent()
        end
        fr=cur:name()
        mod_statusbar.inform('workspace_frame', fr)
        mod_statusbar.update()
    end)
end

local function update_workspace()
    local scr=ioncore.find_screen_id(0)
    local curws = scr:current()
    local nextws = scr:current()
    local prevws = scr:current()
    local wstype, c
    local pager=""
    local pager_txt=""
    local curindex = scr:get_index(curws)+1
    n = scr:mx_count(1)


    -- OM: This is only needed if you want to put individual 
    -- workspace names in the statusbar instead of the whole list of
    -- workspace names that %workspace_pager provides.
    if curindex==1 then
        nextws = scr:mx_nth(1, curindex)
        prevws = scr:mx_nth(1, n-1)
    elseif curindex==n then
        prevws = scr:mx_nth(1, curindex - 2)
        nextws = scr:mx_nth(1, 0)
    else
        nextws = scr:mx_nth(1, curindex)
        prevws = scr:mx_nth(1, curindex - 2)
    end

    for i=1,n do
        wstype=obj_typename(scr:mx_nth(1, i-1))
        if wstype=="WIonWS" then
            c="i"
        elseif wstype=="WFloatWS" then
            c="f"
        elseif wstype=="WPaneWS" then
            c="p"
        else
            c="c"
        end
        
        local curpage = scr:mx_nth(i-1, i-1)
        if i==curindex then
        pager_txt=pager_txt.."["..curpage:name().."]"
            pager=pager.." ["..(i)..c.."] "
        else
        pager_txt=pager_txt.." "..curpage:name().." "
            pager=pager.." "..(i)..c.." "
        end
    end

    local fr,cur

    -- Older versions without an ioncore.current() should
    -- skip update_frame.
    update_frame()

    ioncore.defer( function()
        mod_statusbar.inform('workspace_pager', pager)
        mod_statusbar.inform('workspace_pager_names', pager_txt)
        mod_statusbar.inform('workspace_name', curws:name())

        mod_statusbar.inform('workspace_cur', curws:name())
        mod_statusbar.inform('workspace_cur_template', "xxxxxx")
        mod_statusbar.inform('workspace_next', nextws:name())
        mod_statusbar.inform('workspace_next_template', "xxxxxx")
        mod_statusbar.inform('workspace_prev', prevws:name())
        mod_statusbar.inform('workspace_prev_template', "xxxxxx")
        mod_statusbar.update()
    end)
end

ioncore.get_hook("region_notify_hook"):add(update_workspace)
