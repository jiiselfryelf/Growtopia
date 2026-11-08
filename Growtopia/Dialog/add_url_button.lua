-- add_url_button
-- tombol URL
local dialog = [[
add_url_button|link|Buka link|NOFLAGS|https://example.com|Open?|0|0|
end_dialog|demo_add_url_button|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
