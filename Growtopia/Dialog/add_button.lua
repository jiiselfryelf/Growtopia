-- add_button
-- tombol
local dialog = [[
add_button|ok|Oke|noflags|0|0|
end_dialog|demo_add_button|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
