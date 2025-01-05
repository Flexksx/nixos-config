import { bind } from "astal";
import { readFile, readFileAsync, writeFile, writeFileAsync, monitorFile, } from "astal/file"
import { exec } from "astal/process";
const getCurrentColorScheme = () => {
    const command = "gsettings get org.gnome.desktop.interface color-scheme";
    const result = exec(command);
    return result;
}

const parseWallpaperPath = (configLine: string) => {
    const splitLine = configLine.split(" ");
    const path = splitLine[splitLine.length - 1];
    const isDark = path.indexOf("/dark/") !== -1;
    const isLight = path.indexOf("/light/") !== -1;
    const name = path.split("/").pop();
    if (isDark) {
        return { name, path, type: WallpaperColorscheme.DARK } as SelectableWallpaper;
    } else if (isLight) {
        return { name, path, type: WallpaperColorscheme.LIGHT } as SelectableWallpaper;
    }
    printerr("Error parsing wallpaper path" + path);
}

enum WallpaperColorscheme {
    LIGHT = "light",
    DARK = "dark",
}

class SelectableWallpaper {
    name!: string;
    path!: string;
    type!: WallpaperColorscheme;
}



export default function BackgroundSelector() {
    const hyprpaperConfigPath = "/home/flexksx/nixos-config/hyprland/hyprpaper/hyprpaper.conf";
    const hyprpaperConfig = readFile(hyprpaperConfigPath)
        .split("\n")
        .filter((line) => line !== "")
    const darkWallpapers = hyprpaperConfig.filter((line) => line.indexOf("/dark/") !== -1);
    const lightWallpapers = hyprpaperConfig.filter((line) => line.indexOf("/light/") !== -1);
    const wallpapers = hyprpaperConfig.map((line) => {
        return parseWallpaperPath(line);
    });
    console.log(wallpapers);
    const currentColorScheme = getCurrentColorScheme();
    console.log(currentColorScheme);



    return (
        <box>
            <button onClick={() => console.log("clicked")}>Change Background</button>
        </box>
    )
}


