-- set_border_color
-- border (RGBA)
local dialog = [[
set_border_color|112,86,191,255
end_dialog|demo_set_border_color|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
