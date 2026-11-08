-- add_label
-- label biasa
local dialog = [[
add_label|Label contoh|
end_dialog|demo_add_label|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
