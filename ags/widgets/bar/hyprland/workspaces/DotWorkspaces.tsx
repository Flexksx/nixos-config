import Hyprland from "gi://AstalHyprland";
import { bind } from "astal";

interface DotWorkspacesProps {
    hyprlandClient: Hyprland.Hyprland;
}

interface DotWorkspaceButtonProps {
    workspace: Hyprland.Workspace;
    hyprlandClient: Hyprland.Hyprland;
    isFocused: boolean;
}


function DotWorkspaceButton({
    workspace,
    hyprlandClient,
    isFocused,
}: DotWorkspaceButtonProps) {
    print(workspace);
    {
        bind(workspace, "clients").as((clients) => {
            print(clients);

            return (
                <box className={"workspace-dot" + (isFocused ? " focused" : "")}>
                    <label className="workspace-dot-label">{workspace.get_id()}</label>
                </box>
            );
        });
    }
}

export default function DotWorkspaces({ hyprlandClient }: DotWorkspacesProps) {
    return (
        <box className="dotted-workspaces">
            {bind(hyprlandClient, "workspaces").as((workspaces) => {
                {
                    bind(hyprlandClient, "focused_workspace").as((focusedWorkspace) => {
                        return workspaces
                            .sort((a, b) => a.get_id() - b.get_id())
                            .map((workspace, index) => {
                                <DotWorkspaceButton
                                    workspace={workspace}
                                    hyprlandClient={hyprlandClient}
                                    isFocused={focusedWorkspace.get_id() === workspace.get_id()}
                                />;
                            });
                    });
                }
            })}
        </box>
    );
}

