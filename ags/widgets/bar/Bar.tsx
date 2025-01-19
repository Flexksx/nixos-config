import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"
import Hyprland from "gi://AstalHyprland";
const hyprland = Hyprland.get_default();
import NumberedWorkspaces from "./hyprland/workspaces/NumberedWorkspaces";
import CpuUsage from "./system/CpuUsage";
import BatteryLevel from "./system/BatteryLevel";
import FocusedClient from "./hyprland/client/FocusedClient";
import HorizontalSlashAngledSeparator from "./separator/HorizontalSlashAngledSeparator";
import WallpaperSelectorButton from "./hyprland/background/BackgroundSelector";
import LeftRoundSeparator from "./separator/LeftRoundSeparator";
import DotWorkspaces from "./hyprland/workspaces/DotWorkspaces";
import DynamicNotch from "./notch/DynamicNotch";


const time = Variable("").poll(1000, "date")


function Left() {
    return (<box hexpand halign={Gtk.Align.START}>
        <FocusedClient />
        {/* <LeftRoundSeparator className="focused_client_separator" /> */}
    </box>)
}

function Center() {
    return (<box>
        <DynamicNotch />
        {/* <DotWorkspaces hyprlandClient={hyprland} /> */}
    </box>)
}

function Right() {
    return (
        <box hexpand halign={Gtk.Align.END}>
            <NumberedWorkspaces hyprlandClient={hyprland} />
            <BatteryLevel />
            <WallpaperSelectorButton />
        </box>
    )
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
    return <window
        className="Bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={Astal.WindowAnchor.TOP
            | Astal.WindowAnchor.LEFT
            | Astal.WindowAnchor.RIGHT}
        application={App}>
        <centerbox>
            <Left />
            <Center />
            <Right />
        </centerbox>
    </window>
}
