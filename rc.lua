awful = require("awful")
naughty = require("naughty")

confdir = awful.util.getdir("config")
local rc, err = loadfile(confdir .. "/config.lua");
if rc then
    rc, err = pcall(rc);
    if rc then
        return;
    end
end

dofile("/etc/xdg/awesome/rc.lua");

for s = 1, screen.count() do
    mypromptbox[s].text = awful.util.escape(err:match("[^\n]*"));
end

error_message = {
        text = "Awesome crashed during startup on " .. os.date("%d/%m/%Y %T:\n\n") .. err .. "\n",
        timeout = 0
}

naughty.notify(error_message);

