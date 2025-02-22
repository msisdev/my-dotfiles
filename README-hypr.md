# /hypr

In basic stage - minimum functionality

Below is just quick setup for me.
Read `README-hypr-guide.md` for general guide.





## 1. Install
### 1.1. /os/tumbleweed/hyprland
Run `./zypper.sh`





## 2. Configure
### 2.1. /hypr/.config/hypr
#### 2.1.1. `hyprland.conf`
Notes:

middle click emul: `middle_button_emulation`

### 2.2. /waybar/.config/waybar
Grab one of the [examples](https://github.com/Alexays/Waybar/wiki/Examples)

#### 2.2.1. `config.jsonc`
#### 2.2.2. `style.css`

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
