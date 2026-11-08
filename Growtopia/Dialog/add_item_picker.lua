-- add_item_picker
-- picker item
local dialog = [[
add_item_picker|item|Pilih Item|Pilih item|
end_dialog|demo_add_item_picker|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
