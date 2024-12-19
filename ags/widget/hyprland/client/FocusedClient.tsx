import Hyprland from "gi://AstalHyprland";
import { bind } from "../../../../../.local/share/ags";

export default function FocusedClient() {
    const hyprlandClient = Hyprland.get_default();
    return (
        <box className="focused_client">
            {bind(hyprlandClient, "focused_client").as((focusedClient) => {
                return focusedClient.get_class();
            })}
        </box>
    )
}