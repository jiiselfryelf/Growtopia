-- add_smalltext_forced
-- teks kecil
local dialog = [[
add_smalltext_forced|Teks kecil paksa|left|
end_dialog|demo_add_smalltext_forced|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
