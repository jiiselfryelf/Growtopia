-- add_checkbox
-- checkbox
local dialog = [[
add_checkbox|checked|Centang|1|
end_dialog|demo_add_checkbox|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
