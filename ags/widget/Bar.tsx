import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"
import Hyprland from "gi://AstalHyprland";
const hyprland = Hyprland.get_default();
import Workspaces from "./hyprland/workspaces/Workspaces";
import CpuUsage from "./system/CpuUsage";
import BatteryLevel from "./system/BatteryLevel";
import FocusedClient from "./hyprland/client/FocusedClient";
import HorizontalSlashAngledSeparator from "./separator/HorizontalSlashAngledSeparator";


const time = Variable("").poll(1000, "date")


function Left() {
    return (<box>
        <FocusedClient />
        <HorizontalSlashAngledSeparator className="focused_client_separator" />
    </box>)
}

function Center() {
    return (<box>
        <Workspaces hyprlandClient={hyprland} />
    </box>)
}

function Right() {
    return (
        <box>
            <BatteryLevel />
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
