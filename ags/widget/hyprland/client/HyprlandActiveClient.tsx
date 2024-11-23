import Hyprland from "gi://AstalHyprland";
import { bind } from "astal";

type HyprlandActiveClientProps = {
    hyprlandClient: Hyprland.Hyprland;
    };

export default function HyprlandActiveClient({ hyprlandClient }: HyprlandActiveClientProps) {
    return (
        <box className="hyprland-focused-client">
            {bind(hyprlandClient, "focused_client").as((focused_client) => (
                <box className="hyprland-focused-client">
                    {focused_client.get_class()}
                </box>
            ))}
        </box>
    );
}