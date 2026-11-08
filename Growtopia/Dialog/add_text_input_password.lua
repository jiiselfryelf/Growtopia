-- add_text_input_password
-- input tersembunyi
local dialog = [[
add_text_input_password|password|Password||24|
end_dialog|demo_add_text_input_password|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
