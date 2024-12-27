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
  hyprlandClient: Hyprland.Hyprland;
  isFirst: boolean,
  isLast: boolean
};

export default function WorkspaceButton({
  workspace,
  clientsIconsRegex,
  hyprlandClient,
  isLast,
  isFirst,
}: WorkspaceButtonProps) {
  return (
    <button
      className={bind(hyprlandClient, "focused_workspace").as(
        // (focusedWorkspace) => (`workspace_button ` + (focusedWorkspace === workspace ? "focused" : ""))
        (focused_workspace) => {
          let baseClassName = `workspace_button`
          if (isFirst) {
            baseClassName += " first"
          } else if (isLast) {
            baseClassName += " last"
          }
          if (focused_workspace === workspace) {
            baseClassName += " focused"
          }
          return baseClassName;
        }
      )}
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
