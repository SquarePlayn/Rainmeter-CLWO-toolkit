# Rainmeter-CLWO-toolkit
A toolkit with rainmeter skins made for the clwo.eu community<br>
<br>
<b>Includes the following skins:</b><br>
-Dock<br>
-DockSettings<br>
-Shoutbox<br>
<br>
<b>How to install</b><br>
1. Download and install Rainmeter (<a href="https://www.rainmeter.net/">www.rainmeter.net</a>)<br>
2. Download the CLWO Toolkit_2.0.rmskin <br>
3. Open the CLWO Toolkit_2.0.rmskin and install it. The dock-skin should load by default.<br>
If you want to use the shoutbox: <br>
4. Open Rainmeter<br>
5. Open the following path: CLWO/Shoutbox<br>
6. Doubleclick on the shoutbox.ini<br>
7. Enjoy!<br>
<br>
<b>Dock:</b><br />
The dock displays information about the current state of the clwo.eu jailbreak server.<br>
It displays the amount of players online, as well as the current map.<br>
This info updates roughly once every 2 seconds.<br>
This feature utilises the following api: <br>
https://clwo.eu/jailbreak/api/v1/server/info.php<br>
<br>
When there is no staff online, the background will turn red.<br>
This info is dependent on the updaterate of the server/players api it uses and therefor only updates roughly every 5 minutes.<br>
This feature utilises the following api's:<br>
https://clwo.eu/jailbreak/api/v1/server/players.php<br>
https://clwo.eu/jailbreak/api/v1/admins.php<br>
<br>
When hovering over the dock for roughly 2 seconds, a settings-icon will apear underneath the bottom-right corner of the skin. If you click this icon, the settings-skin will load.<br>
<br>
<b>Settings:</b><br>
The settings-skin is used to make changes to the Dock-skin.<br>
It allowes you to turn the background of the skin  off or on.<br>
The same goes for the pads's backgrounds.<br>
It also has a button to open the settings-file in which you can set a custom color and transparency.<br>
After you have edited and saved the settings-file, the Update button should be pressed to update the colors.<br>
<br>
<b>Shoutbox:</b><br>
First note: the shoutbox skin is functional, but it is still a 'work in progress'.<br>
It currently shows the last 8 messages sent in the shoutbox.<br>
The messaged do not include private shouts.<br>
When you hover over the shoutbox, it expands to the right, allowing you to read long messages that don't fit in the default size.<br>
This feature utilises the following xmlhttp request:<br>
https://clwo.eu/xmlhttp.php?action=dvz_sb_get_shouts<br>
