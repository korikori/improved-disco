# improved-disco
A basic, persistent power manager without cron

Arch Linux does not ship with cron, so if you want to schedule something, you either have to install a lot of stuff, or mess with ugly systemd "timers." The third approach is to create persistent scripts that run on startup, and this is the approach taken here.
