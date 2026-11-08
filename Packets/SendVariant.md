# SendVariant / VariantList — Growtopia

VariantList adalah kumpulan nilai bertipe yang dipanggil melalui PACKET_CALL_FUNCTION (TankPacket 1), umumnya arah server -> client. v0 (atau index 0) adalah nama event. SendVarlist(var) dalam contoh merupakan helper dari implementasi proxy Lua, bukan fungsi asli dari game.

Contoh di bawah diarahkan ke client lokal dengan netid = -1 pada helper yang mendukungnya. Struktur, efek, dan asset bisa berbeda antar versi.

## OnConsoleMessage — Console/chat

~~~lua
local var = {
    [0] = "OnConsoleMessage",
    [1] = "Halo dari JimiProxy",
    netid = -1
}
SendVarlist(var)
~~~

## OnTextOverlay — Teks di layar

~~~lua
local var = {
    [0] = "OnTextOverlay",
    [1] = "Packet loaded",
    netid = -1
}
SendVarlist(var)
~~~

## OnTalkBubble — Bubble di karakter

~~~lua
local playerNetID = GetLocal().netid
local var = {
    [0] = "OnTalkBubble",
    [1] = playerNetID,
    [2] = "Halo!",
    [3] = 0,
    [4] = 0,
    netid = -1
}
SendVarlist(var)
~~~

## OnDialogRequest — Popup dialog

~~~lua
local dialog = [[
set_default_color|`w
add_label_with_icon|big|Growtopia Packet Demo|left|32|
add_spacer|small|
add_textbox|Ini contoh popup Growtopia.|left|
add_button|close|Close|noflags|0|0|
add_quick_exit|
end_dialog|packet_demo|Cancel|OK|
]]
local var = {
    [0] = "OnDialogRequest",
    [1] = dialog,
    netid = -1
}
SendVarlist(var)
~~~

## OnAddNotification — Notifikasi ikon dan suara

~~~lua
local var = {
    [0] = "OnAddNotification",
    [1] = "interface/atomic_button.rttex",
    [2] = "Notifikasi contoh",
    [3] = "audio/hub_open.wav",
    [4] = 0,
    netid = -1
}
SendVarlist(var)
~~~

## OnPlayPositioned — Audio/sound

~~~lua
local var = {
    [0] = "OnPlayPositioned",
    [1] = "audio/change_clothes.wav",
    netid = -1
}
SendVarlist(var)
~~~

## OnParticleEffect — Efek partikel

~~~lua
local p = GetLocal()
local var = {
    [0] = "OnParticleEffect",
    [1] = 73,
    [2] = {p.pos_x + 10, p.pos_y + 15},
    [3] = 0,
    [4] = 0,
    netid = -1
}
SendVarlist(var)
~~~

## OnParticleEffectV2 — Partikel versi kedua

~~~lua
-- ID efek dan argumen lain bergantung versi.
local p = GetLocal()
local var = {
    [0] = "OnParticleEffectV2",
    [1] = 73,
    [2] = {p.pos_x, p.pos_y},
    [3] = 0,
    [4] = 0,
    netid = -1
}
SendVarlist(var)
~~~

## OnCountryState — Tampilan bendera

~~~lua
local var = {
    [0] = "OnCountryState",
    [1] = "id",
    netid = GetLocal().netid
}
SendVarlist(var)
~~~

## OnSetCurrentWeather — Cuaca

~~~lua
local weatherID = 1
local var = {
    [0] = "OnSetCurrentWeather",
    [1] = weatherID,
    netid = -1
}
SendVarlist(var)
~~~

## OnSetFreezeState — Status freeze

~~~lua
local var = {
    [0] = "OnSetFreezeState",
    [1] = 0,
    netid = GetLocal().netid
}
SendVarlist(var)
~~~

## OnSetClothing — Pakaian karakter (visual)

~~~lua
local var = {
    [0] = "OnSetClothing",
    [1] = {0, 0, 0},
    [2] = {0, 0, 0},
    [3] = {0, 0, 0},
    [4] = 3033464831,
    [5] = {0, 0, 0},
    netid = GetLocal().netid
}
SendVarlist(var)
~~~

## OnSetBux — Jumlah gems di UI

~~~lua
-- Tampilan dari pesan client-side, bukan penambahan gems server.
local var = {
    [0] = "OnSetBux",
    [1] = 100,
    netid = -1
}
SendVarlist(var)
~~~

## OnSetPos — Posisi player

~~~lua
-- Contoh struktur nilai posisi; pengiriman hanya pada sistem
-- yang memiliki otoritas untuk mengubah posisi tersebut.
local var = {
    [0] = "OnSetPos",
    [1] = {64, 64},
    netid = GetLocal().netid
}
-- SendVarlist(var) -- tidak dikirim otomatis
~~~

## OnSpawn — Data spawn

~~~lua
-- Format spawn string lengkap tidak konstan di semua versi.
local var = {
    [0] = "OnSpawn",
    [1] = "spawn|avatar\nnetID|10\nname|Example",
    netid = -1
}
-- SendVarlist(var) -- skema ilustrasi, jangan kirim tanpa validasi
~~~

## OnRemove — Menghapus avatar dari world view

~~~lua
local var = {
    [0] = "OnRemove",
    [1] = "netID|10",
    netid = -1
}
-- SendVarlist(var) -- ilustrasi data, tidak otomatis dikirim
~~~

## Daftar nama event VariantList teramati

Nama-nama di bawah bersumber dari ekstraksi event client lama dan implementasi komunitas. Tidak semuanya masih dipakai oleh client terbaru; event yang belum diketahui tipe argumennya sengaja tidak diberi contoh kirim palsu.

### UI, teks, menu
- OnConsoleMessage
- OnTextOverlay
- OnTalkBubble
- OnSDBroadcast
- OnDialogRequest
- OnRequestWorldSelectMenu
- OnPersistentNPCMessage
- OnPersistentNPCMessageInputDependent
- OnClearNPCMessage
- OnDailyRewardRequest
- OnWinterRallyRequest
- OnCardBattleDialogRequest
- OnHideMenusRequest
- OnHideInventoryRequest
- OnResetInventoryPosRequest
- OnHideChatRequest
- OnActivateMenusRequest
- OnShowInventoryRequest
- OnShowChatRequest
- OnAutoSetChatToWorldRequest
- OnStoreRequest
- OnStorePurchaseResult
- OnSurveyRequest
- OnHelpRequest
- OnCommunityHubRequest
- OnUbiclubRequest
- OnZoomCamera
- OnPinchMod

### Player, world, efek
- OnSpawn
- OnRemove
- OnSetPos
- OnSetClothing
- OnCountryState
- OnNameChanged
- OnSetFreezeState
- OnInvis
- OnDisguiseChanged
- OnGuildDataChanged
- OnSetBux
- OnSetDungeonToken
- OnSetBaseWeather
- OnSetCurrentWeather
- OnParticleEffect
- OnParticleEffectV2
- OnItemEffect
- OnPlayPositioned
- OnEmoticonDataChanged
- OnPaw2018SkinColor1Changed
- OnPaw2018SkinColor2Changed
- OnSetRoleSkinsAndTitles
- OnMagicCompassTrackingItemIDChanged
- OnPlanterActivated
- OnKilled
- SetRespawnPos

### Tutorial
- OnFTUECameraLock
- OnTutorialArrow
- OnClearTutorialArrow
- OnClearAllTutorialArrows
- OnFTUEWorldSwitchSetActive
- OnWorldMenuFTUEMessageRequest
- FTUESetBeginingState
- FTUESetLastState
- FTUESetInventoryUIHeightPercent
- CloseWorldMenuFTUEMessage
- ShowStartFTUEPopup

### Sosial, event, achievement
- OnStartTrade
- OnForceTradeEnd
- OnTradeStatus
- OnPartyInvite
- OnPartyInviteEnd
- OnPartyUIUpdate
- OnFriendOnlineID
- InviteEnterFailed
- OnAchievementCompleted
- OnAchievementProgress
- OnAchievementListLogon
- OnClashEventIsActiveChanged
- OnUbiClubRewardGiven
- OnTodaysDate
- OnReceivedZodiacMode

### Koneksi, akun, sistem
- OnRender
- OnUpdate
- OnReconnect
- OnSendToServer
- OnSendToCaptcha
- OnRedirectServer
- OnFailedToEnterWorld
- OnWrongDetails
- OnThrowToStartMenu
- OnSuperMainStart
- OnSuperMainStartAcceptLogonHrdxs47254722215a
- SetHasGrowID
- SetHasAccountSecured
- GrowIDChanged
- SetShowChatOnlyFromFriends
- OnToggleBetaMode
- OnSetBetaMode
- OnSetBetaSilent
- OnSendIAPConfirmation
- OnRestorePurchases
- OnDisableRemoveIAPScreen
- OnOverrideGDPRFromServer
- onShowCaptcha
- OnCaptchaFailed
- OnProgressUI
- OnProgressUISet
- OnProgressUIUpdateValue
- OnProgressUIPlayAnim
- OnOpenTapjoyTV
- OnUpdatePVENPC
- OnActivatePVENPCManager
- NPC_target_update
- OnDeactivatePVENPCManager

Catatan: OnRender, OnUpdate, dan beberapa nama lain adalah string/event internal dari hasil ekstraksi, bukan janji bahwa semuanya merupakan VariantList yang bebas dipanggil. OnSetBux, OnCountryState, dan OnSetClothing dapat mengubah tampilan lokal, bukan status authoritative milik server.

Sumber:
- https://gist.github.com/ReimarPB/b893979201a93450a4d3719a62f8351e
- https://github.com/DiddoBoi/GrowtopiaServer-Latest/blob/main/GrowtopiaServer-Latest/packet-list.md
- https://github.com/GrowtopiaNoobs/Growtopia-Bot/blob/master/Growtopia_Bot/corefunc.h
