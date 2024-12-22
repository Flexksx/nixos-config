import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"
import Hyprland from "gi://AstalHyprland";
const hyprland = Hyprland.get_default();
import Workspaces from "./hyprland/workspaces/Workspaces";
import CpuUsage from "./system/CpuUsage";
import BatteryLevel from "./system/BatteryLevel";
import FocusedClient from "./hyprland/client/FocusedClient";


const time = Variable("").poll(1000, "date")


export default function Bar(gdkmonitor: Gdk.Monitor) {
    return <window
        className="Bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={Astal.WindowAnchor.TOP
            | Astal.WindowAnchor.LEFT
            | Astal.WindowAnchor.RIGHT}
        application={App}>
        <box>
            <Workspaces hyprlandClient={hyprland} />
            <FocusedClient />
            <button
                onClick={() => print("hello")}
                halign={Gtk.Align.CENTER} >
                <label label={time()} />
            </button>
            <CpuUsage />
            <BatteryLevel />
        </box>
    </window>
}
