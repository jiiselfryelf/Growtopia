-- add_textbox
-- teks
local dialog = [[
add_textbox|Ini textbox.|left|
end_dialog|demo_add_textbox|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
