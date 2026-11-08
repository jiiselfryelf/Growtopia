-- add_quick_exit
-- quick exit
local dialog = [[
add_quick_exit|
end_dialog|demo_add_quick_exit|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
