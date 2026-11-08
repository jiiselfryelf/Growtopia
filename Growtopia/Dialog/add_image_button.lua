-- add_image_button
-- RTTEX bawaan
local dialog = [[
add_image_button|banner|interface/large/news_banner.rttex|noflags|||
end_dialog|demo_add_image_button|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
