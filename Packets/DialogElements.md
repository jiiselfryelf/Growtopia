# Growtopia Dialog UI — OnDialogRequest

Dialog adalah string markup yang menjadi nilai VariantList OnDialogRequest, bukan raw packet tersendiri. Contoh helper menggunakan SendVarlist(var).

## Popup lengkap

~~~lua
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`w
add_label_with_icon|big|Example Dialog|left|32|
add_spacer|small|
add_textbox|Growtopia dialog example.|left|
add_button|confirm|Confirm|noflags|0|0|
add_button|cancel|Cancel|noflags|0|0|
add_quick_exit|
end_dialog|example_dialog|Close|OK|
]]
SendVarlist({[0] = "OnDialogRequest", [1] = dialog, netid = -1})
~~~

## Label dengan ikon

~~~lua
local dialog = [[
add_label_with_icon|big|Title|left|32|
add_label_with_icon|small|Subheading|left|2|
end_dialog|label_demo|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Textbox

~~~lua
local dialog = [[
add_textbox|Ini deskripsi panjang pada dialog.|left|
add_smalltext|Teks kecil.|left|
end_dialog|text_demo|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Tombol biasa

~~~lua
local dialog = [[
add_button|open|Open|noflags|0|0|
add_button|save|Save|noflags|0|0|
end_dialog|button_demo|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Tombol dengan ikon

~~~lua
local dialog = [[
add_button_with_icon|example|Open|staticBlueFrame|32|
end_dialog|icon_demo|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Checkbox

~~~lua
local dialog = [[
add_checkbox|enable_option|Enable option|1|
end_dialog|check_demo|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Input text

~~~lua
local dialog = [[
add_text_input|world|World name|START|24|
end_dialog|input_demo|Cancel|Submit|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Input password

~~~lua
local dialog = [[
add_text_input_password|value|Hidden input||24|
end_dialog|password_demo|Cancel|Submit|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Gambar RTTEX

~~~lua
local dialog = [[
add_image_button|banner|interface/large/news_banner.rttex|noflags|||
end_dialog|image_demo|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Tombol URL

~~~lua
local dialog = [[
add_url_button|website|Open website|NOFLAGS|https://example.com|Open link?|0|0|
end_dialog|url_demo|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Picker item

~~~lua
local dialog = [[
add_item_picker|item_picker|Select Item|Pick one item|
end_dialog|picker_demo|Cancel|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Spacer dan quick exit

~~~lua
local dialog = [[
add_spacer|small|
add_spacer|big|
add_quick_exit|
end_dialog|space_demo|Close|OK|
]]
SendVarlist({[0]="OnDialogRequest",[1]=dialog,netid=-1})
~~~

## Referensi nama elemen dialog

| Elemen | Kegunaan |
|---|---|
| set_default_color | Warna teks default |
| set_border_color | Warna border |
| set_bg_color | Warna latar |
| add_label | Label |
| add_label_with_icon | Label + ikon |
| add_label_with_ele_icon | Label dengan ikon spesial |
| add_textbox | Paragraf |
| add_smalltext | Teks kecil |
| add_smalltext_forced | Teks kecil paksa |
| add_smalltext_forced_alpha | Teks kecil dengan alpha |
| add_spacer | Jarak |
| add_button | Tombol |
| add_button_with_icon | Tombol berikon |
| add_small_font_button | Tombol font kecil |
| add_image_button | Tombol gambar |
| add_url_button | Tombol URL |
| add_checkbox | Kotak centang |
| add_checkicon | Ikon centang |
| add_text_input | Input |
| add_text_input_password | Input tersembunyi |
| add_item_picker | Pilih item |
| add_confirm_item_picker | Konfirmasi pemilihan item |
| add_player_picker | Pilih player |
| add_player_info | Data player |
| add_item | Item |
| add_clothes | Pakaian |
| add_slot | Slot |
| add_fish_info | Data memancing |
| add_notification | Elemen notifikasi |
| add_dual_layer_icon_label | Label dua ikon |
| add_tab_button | Tab |
| add_achieve_button | Achievement |
| add_quick_exit | Keluar cepat |
| end_dialog | Penutup dialog |

Beberapa elemen lama di atas hanya memiliki nama terdokumentasi, tanpa argumen stabil. Contoh tertentu bergantung asset RTTEX yang sudah ada pada client. Warna memakai RGBA (r,g,b,a).

## Bentuk dialog return

~~~text
action|dialog_return
dialog_name|example_dialog
buttonClicked|confirm
~~~

Jika suatu dialog dikirim ke client, hasil kliknya dapat berupa text packet dialog_return. Field yang muncul berbeda menurut tombol, checkbox, dan input yang digunakan.

Sumber:
- https://github.com/DiddoBoi/GrowtopiaServer-Latest/blob/main/GrowtopiaServer-Latest/packet-list.md
