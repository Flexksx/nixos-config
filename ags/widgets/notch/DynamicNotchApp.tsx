import Apps from "gi://AstalApps";
import { App, Astal, Gdk, Gtk } from "astal/gtk3";
import { Variable } from "astal";
import { bind } from "astal";
import Mpris from "gi://AstalMpris";
import Cava from "gi://AstalCava";
function negate(value: boolean) {
  return !value;
}

export default function DynamicNotch(gdkmonitor: Gdk.Monitor) {
  const notchHoveredState = Variable("unhovered");
  const baseNotchClassName = "dynamic-notch";
  const notchClassNameVariable = Variable(
    baseNotchClassName + " " + notchHoveredState.get()
  );
  const time = Variable("").poll(1000, "date");

  const cava = Cava.get_default();
  notchClassNameVariable.subscribe((value: string) => {
    print(`Changed the current class name to ${value}`);
  });
  function setIsHovered() {
    notchHoveredState.set("hovered");
    // notchClassName.set(notchClassName.get() + notchHoveredState.get())
    notchClassNameVariable.set(
      baseNotchClassName + " " + notchHoveredState.get()
    );
  }

  function setNotHovered() {
    notchHoveredState.set("unhovered");
    notchClassNameVariable.set(
      baseNotchClassName + " " + notchHoveredState.get()
    );
  }

  function Time() {
    return (
      <box className="current-time">
        <label>
          {notchHoveredState.get() === "hovered"
            ? time.get()
            : time.get().split(" ")[3]}
        </label>
      </box>
    );
  }

  function CavaVisualizer() {
    cava.connect("notify::values", () => {
      print(cava.get_values());
    });
  }

  function UnhoveredNotch() {
    return (
      <box className={bind(notchClassNameVariable)}>
        <Time />
      </box>
    );
  }

  function HoveredNotch() {
    return (
      <box className={bind(notchClassNameVariable)}>
        <Time />
      </box>
    );
  }

  function Player() {}

  return (
    <window
      // name="dynamic-notch-app"
      className="DynamicNotch"
      namespace="DynamicNotchAstal"
      gdkmonitor={gdkmonitor}
      anchor={Astal.WindowAnchor.TOP}
      exclusivity={Astal.Exclusivity.IGNORE}
      application={App}
    >
      <box>
        <button
          onHover={setIsHovered}
          onHoverLost={setNotHovered}
          className="dynamic-notch-button"
        >
          {/* <box
                        className={bind(notchClassNameVariable)}
                    >

                    </box>                        */}
          {bind(notchHoveredState).as((currentState) => {
            if (currentState === "hovered") {
              return <HoveredNotch />;
            }
            return <UnhoveredNotch />;
          })}
        </button>
      </box>
    </window>
  );
}
