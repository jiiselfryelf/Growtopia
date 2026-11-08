-- add_text_input
-- input teks
local dialog = [[
add_text_input|nama|Nama|Jimi|24|
end_dialog|demo_add_text_input|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
