-- add_label_with_icon
-- judul sama icon
local dialog = [[
add_label_with_icon|big|Contoh|left|32|
end_dialog|demo_add_label_with_icon|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
