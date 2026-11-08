-- set_default_color
-- warna teks
local dialog = [[
set_default_color|`w
end_dialog|demo_set_default_color|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
