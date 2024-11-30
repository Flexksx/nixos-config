import Hyprland from "gi://AstalHyprland";
import { bind } from "../../../../../.local/share/ags";

const getClientIcon = (
  clientsIconsRegex: Map<string, string>,
  client: Hyprland.Client
) => {
  for (const [regex, icon] of clientsIconsRegex) {
    if (client.get_class().match(regex)) {
      return icon;
    }
  }
  return "?";
};

type WorkspaceButtonProps = {
  workspace: Hyprland.Workspace;
  clientsIconsRegex: Map<string, string>;
};

export default function WorkspaceButton({
  workspace,
  clientsIconsRegex,
}: WorkspaceButtonProps) {
  return <box className = "workspaceButton">
    {bind(workspace, "clients").as((clients) => {
      const icons = clients
        .map((client) => getClientIcon(clientsIconsRegex, client))
        .join(" ");
      const workspaceNumber = workspace.get_id();
      return (
        <button onClick={() => workspace.focus()}>
          {workspaceNumber + " " + icons}
        </button>
      );
    })}
  </box>
}
