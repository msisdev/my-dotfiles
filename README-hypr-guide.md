# How to properly start using hyprland

## 1. Minimum install
1. Install essentials (install less packages for snapshot)
```bash
sudo zypper in --no-recommends hyprland hyprland-devel hyprland-qtutils hyprpolkitagent kitty qt6-wayland xdg-desktop-portal-hyprland
```

2. Use waybar and save your time.
	Or choose from [here](https://wiki.hyprland.org/Useful-Utilities/Status-Bars/) and dig rabbit hole.
```bash
sudo zypper in --no-recommends waybar
```

3. Create snapshot

4. Carefully choose app launcher and install it.
From [here](https://wiki.hyprland.org/Useful-Utilities/App-Launchers/)





## 2. Minimum config
### 2.1. hyprland
Config file is at `~/.config/hypr/hyprland.conf`

#### 2.1.1. [Monitors](https://wiki.hyprland.org/Configuring/Monitors/)
1. Query monitors
```bash
$ hyprctl monitors -a
Monitor HDMI-A-1 (ID 0):
	...
	availableModes: 2560x1440@59.95Hz 2560x1440@74.98Hz ...
```

2. Edit monitor in `hyprland.conf`
```conf
monitor=HDMI-A-1, 2560x1440@74.98, 0x0, 1
```

#### 2.1.2. Programs
Add programs in `hyprland.conf`
```conf
$terminal 		= kitty   # your terminal emulator
$fileManager	= dolphin	# your file manager
$menu 				= fuzzel  # your app launcher
```

#### 2.1.3. Autostart
Add startup programs in `hyprland.conf`
```conf
exec-once = waybar
exec-once = systemctl --user start hyprpolkitagent
```

### 2.2. waybar
1. Select from one of [examples](https://github.com/Alexays/Waybar/wiki/Examples) 

2. Copy `config.jsonc`, `style.css` into `~/.config/waybar/`

3. `config.jsonc`: replace `xxx/workspaces` with `hyprland/workspaces`

- Style rule follows [Gtk Css](https://docs.gtk.org/gtk3/css-overview.html)

### 2.3. wlogout
> (OpenSUSE TW) Hibernate not working. Don't know how to enable.

<details>
	<summary>(expand) Create `~/.config/wlogout/layout` and edit</summary>
	```json
	{
			"label" : "lock",
			"action" : "loginctl lock-session",
			"text" : "Lock",
			"keybind" : "l"
	}
	{
			"label" : "hibernate",
			"action" : "systemctl hibernate",
			"text" : "Hibernate",
			"keybind" : "h"
	}
	{
			"label" : "logout",
			"action" : "hyprctl dispatch exit",
			"text" : "Logout",
			"keybind" : "e"
	}
	{
			"label" : "shutdown",
			"action" : "systemctl poweroff",
			"text" : "Shutdown",
			"keybind" : "s"
	}
	{
			"label" : "suspend",
			"action" : "systemctl suspend",
			"text" : "Suspend",
			"keybind" : "u"
	}
	{
			"label" : "reboot",
			"action" : "systemctl reboot",
			"text" : "Reboot",
			"keybind" : "r"
	}
	```
</details>

### 2.4. fcitx5
0. Install fcitx5 and your language pack.
1. Edit `hyprland.conf`
```conf
env = GTK_IM_MODULE,fcitx5
env = QT_IM_MODULE,fcitx5
env = XMODIFIERS=@im,fcitx5
exec-once = fcitx5-remote
```
2. Edit `chrome://flags` in chrome
```
Wayland-text-input-v3: Enabled
```


### 2.5. sddm
#### 2.5.1. set default desktop
[SDDM wiki - Autologin](https://wiki.archlinux.org/title/SDDM#Autologin)





## 3. Usage
### 3.1. Basic keybind
#### 3.1.1. Essential
| Keybind | Action |
|---------|--------|
| <kbd>Super</kbd> + <kbd>Q</kbd> | exec kitty |
| <kbd>Super</kbd> + <kbd>M</kbd> | logout |

#### 3.1.2. Window
| Keybind | Action |
|---------|--------|
| <kbd>Super</kbd> + <kbd>&#8592;</kbd>,<kbd>&#8593;</kbd>,<kbd>&#8594;</kbd>,<kbd>&#8595;</kbd> | Change focus |
| <kbd>Super</kbd> + <kbd>Drag</kbd> | swap window |
| <kbd>Super</kbd> + <kbd>C</kbd> | close window |
| <kbd>Super</kbd> + <kbd>0</kbd>, <kbd>1</kbd>... | Go to workspace |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>0</kbd>, <kbd>1</kbd>... | Go to workspace with window |

#### 3.1.3. Others
| Keybind | Action |
|---------|--------|
| <kbd>Super</kbd> + <kbd>R</kbd> | app launcher |





## 4. Decoration
Apply decoration and have a tour on your dotfiles.

### 4.1. hyprland
1. Prepare [`color.conf`](https://github.com/catppuccin/hyprland).
2. Open `~/.config/hypr/hyprland.conf`
3. Open [Variables document](https://wiki.hyprland.org/Configuring/Variables).
4. Search keyword `color` and apply.

### 4.2. GTK3 widgets
I recommend to have a global css file.

1. Prepare [`color.css`](https://github.com/catppuccin/waybar).
2. Place at `~/.config/style/color.css`
3. Import from other css: `@import "../style/color.css";` (in my case, absolute or env path didn't work.)

#### 4.2.1 waybar
Follow [Catppuccin tutorial](https://github.com/catppuccin/waybar)

#### 4.2.2. wlogout
Follow [Catppuccin tutorial](https://github.com/catppuccin/wlogout)

### 4.3. hyprpaper
I recommend to have a asset folder.

1. Place your image at `~/.config/assets/wallpaper.jpg`
2. Edit `~/.config/hypr/hyprpaper.conf`
```conf
preload = $HOME/.config/assets/wallpaper.jpg
wallpaper = , $HOME/.config/assets/wallpaper.jpg
splash = false
```

### 4.4. kitty
Run `kitten themes`




## 5. What's next?
### Install more packages
You can search for alternatives [here](https://github.com/hyprland-community/awesome-hyprland)

| Package | Description |
|---------|-------------|
| [`blueman`](https://github.com/blueman-project/blueman) | Bluetooth GUI |
| [`hyprpaper`](https://wiki.hyprland.org/Hypr-Ecosystem/hyprpaper/) | Wallpaper manager |
| [`wireplumber`](https://wiki.archlinux.org/title/WirePlumber) | Pipewire session manager |
| [`wlogout`](https://github.com/ArtsyMacaw/wlogout) | Logout GUI for wayland |

