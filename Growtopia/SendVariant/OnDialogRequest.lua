-- OnDialogRequest
-- popup dialog; markup ditulis di v1
local var = {
    [0] = "OnDialogRequest",
    [1] = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`w
add_label_with_icon|big|Contoh Popup|left|32|
add_spacer|small|
add_textbox|Halo, ini dialog Growtopia.|left|
add_button|oke|Oke|noflags|0|0|
add_quick_exit|
end_dialog|demo_packet|Close|OK|
]],
    netid = -1
}
SendVarlist(var)
