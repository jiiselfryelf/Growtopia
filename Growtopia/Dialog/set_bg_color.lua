-- set_bg_color
-- background (RGBA)
local dialog = [[
set_bg_color|43,34,74,200
end_dialog|demo_set_bg_color|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
