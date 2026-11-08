-- add_spacer
-- jarak
local dialog = [[
add_spacer|small|
end_dialog|demo_add_spacer|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
