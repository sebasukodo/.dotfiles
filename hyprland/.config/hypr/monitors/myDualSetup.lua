-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output   = "DP-3",
    mode     = "2560x1440@144",
    position = "0x0",
    scale    = 1,
})
hl.monitor({
    output    = "HDMI-A-1",
    mode      = "1920x1080@100",
    position  = "-1080x-240",
    scale     = 1,
    transform = 1,
})
