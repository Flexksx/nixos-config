import Hyprland from "gi://AstalHyprland";
import { bind } from "../../../../../.local/share/ags";

export default function FocusedClient() {
    const hyprlandClient = Hyprland.get_default();
    return (
        <box className="focused_client">
            {bind(hyprlandClient, "focused_client").as((focusedClient) => {
                if (focusedClient.get_title().length > 53) {
                    return (focusedClient.get_title().slice(0, 50) + "...")
                }
                return focusedClient.get_title();
            })}
        </box>
    )
}