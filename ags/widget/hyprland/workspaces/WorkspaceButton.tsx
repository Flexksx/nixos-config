import Hyprland from "gi://AstalHyprland";

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
  const clients = workspace.get_clients();
  const icons = clients
    .map((client) => getClientIcon(clientsIconsRegex, client))
    .join(" ");
  return <button onClick={() => workspace.focus()}>{icons}</button>;
}
