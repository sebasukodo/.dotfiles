-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output   = "DP-2",
    mode     = "3440x1440@144",
    position = "0x0",
    scale    = "1",
})
hl.monitor({
    output   = "DP-1",
    mode     = "3440x1440@165",
    position = "3440x0",
    scale    = "1",
})
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "3440x1440@100",
    position = "-3440x0",
    scale    = "1",
})
