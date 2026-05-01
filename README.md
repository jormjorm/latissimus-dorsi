# latissimus-dorsi (Deltoid KX)

My attempt at making an external Sober executor. For educational purposes, obviously.

## Required packages

**Debian / Ubuntu / WSL:**
```
sudo apt update
sudo apt install -y \
  build-essential \
  gcc \
  make \
  pkg-config \
  libgtk-4-dev \
  libglib2.0-dev
```

**Arch / CachyOS:**
```
sudo pacman -S base-devel gtk4 glib2
```

## Building

```bash
git clone https://github.com/jormjorm/latissimus-dorsi.git
cd latissimus-dorsi
make
cp libdeltoid.so ~  # Copy .so to home directory
```

## Usage

1. Run `./deltoidUI` to open the GUI
2. Click "Setup" to configure Flatpak override for Sober
3. Launch Sober (the injection happens automatically via LD_PRELOAD)
4. Type or load a Lua script in the editor
5. Click "Execute" to run the script in Sober

## How it works

- `libdeltoid.so` is injected into Sober via `LD_PRELOAD` (set up by the Injector)
- The library hooks into Sober's Lua runtime by scanning memory for Lua function patterns
- A script watcher monitors `/tmp/deltoid_exec.lua` for new scripts to execute
- The GUI writes scripts to this file when you click "Execute"

## Troubleshooting

**Issue: "libdeltoid.so not found"**
- Make sure you ran `make` and copied `libdeltoid.so` to your home directory

**Issue: Sober doesn't launch after setup**
- Check if the .so exists: `ls ~/libdeltoid.so`
- Reset overrides: `flatpak override --user --reset org.vinegarhq.Sober`
- Check Sober logs: `flatpak run org.vinegarhq.Sober`

**Issue: Scripts don't execute**
- Make sure Sober is running before clicking Execute
- Check if injection worked: `cat /proc/$(pgrep sober)/maps | grep deltoid`
- The library scans for Lua patterns - these may need updating with new Sober versions

## Note

This is experimental software. Sober updates may break the memory patterns used for hooking.
