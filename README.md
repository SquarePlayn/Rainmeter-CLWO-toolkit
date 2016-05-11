# Rainmeter-CLWO-toolkit
A toolkit with rainmeter skins made for the clwo.eu community

Includes the following skins:
-Dock
-DockSettings
-Shoutbox

Dock:<br />
The dock displays information about the current state of the clwo.eu jailbreak server.
It displays the amount of players online, as well as the current map.
This info updates roughly once every 2 seconds.
This feature utilises the following api: 
https://clwo.eu/jailbreak/api/v1/server/info.php

When there is no staff online, the background will turn red.
This info is dependent on the updaterate of the server/players api it uses and therefor only updates roughly every 5 minutes.
This feature utilises the following api's:
https://clwo.eu/jailbreak/api/v1/server/players.php
https://clwo.eu/jailbreak/api/v1/admins.php

When hovering over the dock for roughly 2 seconds, a settings-icon will apear underneath the bottom-right corner of the skin. If you click this icon, the settings-skin will load.

Settings:
The settings-skin is used to make changes to the Dock-skin.
It allowes you to turn the background of the skin  off or on.
The same goes for the pads's backgrounds.
It also has a button to open the settings-file in which you can set a custom color and transparency.
After you have edited and saved the settings-file, the Update button should be pressed to update the colors.

Shoutbox:
First note: the shoutbox skin is a work in progress.
It currently shows the last 8 messages sent in the shoutbox.
The messaged do not include private shouts.
When you hover over the shoutbox, it expands to the right, allowing you to read long messages that don't fit in the default size.
This feature utilises the following xmlhttp request:
https://clwo.eu/xmlhttp.php?action=dvz_sb_get_shouts
