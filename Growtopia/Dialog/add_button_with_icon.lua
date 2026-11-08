-- add_button_with_icon
-- button icon
local dialog = [[
add_button_with_icon|ok|Oke|staticBlueFrame|32|
end_dialog|demo_add_button_with_icon|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
