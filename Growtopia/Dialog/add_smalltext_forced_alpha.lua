-- add_smalltext_forced_alpha
-- teks kecil alpha
local dialog = [[
add_smalltext_forced_alpha|Teks|1|left|
end_dialog|demo_add_smalltext_forced_alpha|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
