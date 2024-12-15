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
  focusedWorkspaceId: number | null;
};

export default function WorkspaceButton({
  workspace,
  clientsIconsRegex,
  focusedWorkspaceId,
}: WorkspaceButtonProps) {
  const isFocused = workspace.get_id() === focusedWorkspaceId;
  return (
    <button
      className={`workspace_button ${isFocused ? "focused" : ""}`}
      onClick={() => workspace.focus()}
    >
      {bind(workspace, "clients").as((clients) => {
        const icons = clients
          .map((client) => getClientIcon(clientsIconsRegex, client))
          .join(" ");
        const workspaceNumber = workspace.get_id();
        return `${workspaceNumber} ${icons}`;
      })}
    </button>
  );
}
