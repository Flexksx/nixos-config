import { bind } from "astal";
import { readFile, readFileAsync, writeFile, writeFileAsync, monitorFile, } from "astal/file"
import { exec } from "astal/process";
const getCurrentColorScheme = () => {
    const command = "gsettings get org.gnome.desktop.interface color-scheme";
    const result = exec(command);
    return result;
}


function parseWallpaperPath(configLine: string): SelectableWallpaper {
    const splitLine = configLine.split(" ");
    const path = splitLine[splitLine.length - 1];
    const isDark = path.indexOf("/dark/") !== -1;
    const isLight = path.indexOf("/light/") !== -1;
    const nameWithExtension = path.split("/").pop();
    const name = nameWithExtension?.split(".")[0] || "";
    if (isDark) {
        return new SelectableWallpaper(name, path, WallpaperColorscheme.DARK);
    } else if (isLight) {
        return new SelectableWallpaper(name, path, WallpaperColorscheme.LIGHT);
    }
    printerr("Error parsing wallpaper path" + path);
    return new SelectableWallpaper("Error", "", WallpaperColorscheme.LIGHT);
}

enum WallpaperColorscheme {
    LIGHT = "light",
    DARK = "dark",
}

class SelectableWallpaper {
    name!: string;
    path!: string;
    type!: WallpaperColorscheme;
    constructor(name: string, path: string, type: WallpaperColorscheme) {
        this.name = name;
        this.path = path;
        this.type = type;
    }
}
interface WallpaperSelectorOverlayProps {
    wallpapers: SelectableWallpaper[];
}

function WallpaperSelectorOverlay({ wallpapers }: WallpaperSelectorOverlayProps) {
    console.log(wallpapers);
    const wallpaperTypes = wallpapers.map((wallpaper) => wallpaper.type).filter((value, index, self) => self.indexOf(value) === index);

    return (
        wallpaperTypes.map((type) => {
            return (
                <box>
                    <label>{type}</label>
                    <box>
                        {wallpapers.filter((wallpaper) => wallpaper.type === type).map((wallpaper) => {
                            return (
                                <button onClick={() => console.log("clicked")}>{wallpaper.name}</button>
                            )
                        })}
                    </box>
                </box>
            )
        }
        )
    )
}

export default function WallpaperSelectorButton() {
    const hyprpaperConfigPath = "/home/flexksx/config/hyprland/hyprpaper/hyprpaper.conf";
    const hyprpaperConfig = readFile(hyprpaperConfigPath)
        .split("\n")
        .filter((line) => line !== "")
    const wallpapers = hyprpaperConfig.map((line) => {
        return parseWallpaperPath(line);
    });
    // console.log(wallpapers);
    const currentColorScheme = getCurrentColorScheme();
    // console.log(currentColorScheme);



    return (
        <box>
            <button onClick={() => console.log("clicked")}>Change Background</button>
        </box>
        // <WallpaperSelectorOverlay wallpapers={wallpapers} />

    )
}


