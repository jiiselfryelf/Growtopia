-- add_smalltext
-- teks kecil
local dialog = [[
add_smalltext|Teks kecil.|left|
end_dialog|demo_add_smalltext|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
