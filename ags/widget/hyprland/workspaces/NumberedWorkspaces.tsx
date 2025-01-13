import Hyprland from "gi://AstalHyprland";
import NumberedWorkspaceButton from "./NumberedWorkspaceButton";
import { bind } from "astal";
import HorizontalSlashAngledSeparator from "../../separator/HorizontalSlashAngledSeparator";

const clientsIconsRegex: Map<string, string> = new Map([
  ["org.telegram.desktop", ""],
  ["kitty", ""],
  ["kitty title<.*top.*>", ""],
  ["kitty title<.*pacman.*>", ""],
  ["com.github.weclaw1.ImageRoll|nomacs", ""],
  ["title<(.*[$%#] *)?nvim.*>", ""],
  ["title<(.*[$%#] *)?([hb]|nv)top.*>", ""],
  ["firefox", ""],
  ["discord", ""],
  ["title<Discord.*>", ""],
  ["title<.[0-9]+. Discord.*>", " °"],
  ["title<Signal>", "󰍡"],
  ["title<(.* - )?(.[0-9]+. )?YouTube.*>", ""],
  ["title<.* - Gmail .*>", "󰊫"],
  ["obsidian", "󱞁"],
  ["ONLYOFFICE Desktop Editors", "󰈙"],
  ["calibre-.*", ""],
  ["org.qbittorrent.qBittorrent", ""],
  ["org.kde.kdeconnect.*", ""],
  ["mpv", ""],
  ["vlc", "󰕼"],
  ["Gimp-.*", ""],
  ["steam.*", "󰓓"], //  for FontAwesome
  ["steam title<Friends List>", ""],
  ["steam_app_[0-9]+", "󰮂"],
  ["title<Winetricks.*>", "󰡶"],
  ["lutris", "🦦"],
  ["Spotify", ""],
  ["jetbrains-idea(-ce)?", ""],
  ["title<.*youtube.*>", ""],
  ["Code", "󰨞"],
  ["com.obsproject.Studio|zoom", ""],
  ["io.github.whoozle.android-file-transfer", ""],
  ["Chromium|Chrome", ""],
  ["slack|Slack", "󰒱"],
  [".*rgb.*", ""],
]);

type WorkspacesProps = {
  hyprlandClient: Hyprland.Hyprland;
};

export default function NumberedWorkspaces({ hyprlandClient }: WorkspacesProps) {
  return (
    <box className="workspaces">
      {bind(hyprlandClient, "workspaces").as((workspaces) => {

        return workspaces
          .sort((a, b) => a.get_id() - b.get_id())
          .map((workspace, index) => (
            <box>
              <NumberedWorkspaceButton
                workspace={workspace}
                hyprlandClient={hyprlandClient}
                clientsIconsRegex={clientsIconsRegex}
                isFirst={(index == 0)}
                isLast={(index == workspaces.length)}
              />
            </box>
          ));
      })}
    </box>
  );
}
