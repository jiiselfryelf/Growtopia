-- end_dialog
-- penutup dialog
local dialog = [[
add_textbox|Halo.|left|
end_dialog|demo|Cancel|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
