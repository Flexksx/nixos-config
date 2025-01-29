import Apps from "gi://AstalApps";
import { App, Astal, Gdk, Gtk } from "astal/gtk3";
import { Variable } from "astal";
import { bind } from "astal";
function negate(value: boolean) {
    return !value;
}

export default function DynamicNotch(gdkmonitor: Gdk.Monitor) {
    const notchHoveredState = Variable("unhovered");
    const baseNotchClassName = "dynamic-notch";
    const notchClassNameVariable = Variable(baseNotchClassName);
    notchClassNameVariable.subscribe((value: string) => {
        print(`Changed the current class name to ${value}`);

    })
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
                    {/* {bind(notchClassNameVariable).as((currentNotchState) => {
                        <box className={currentNotchState}>
                            {notchClassNameVariable.get()}
                            aaaaa
                        </box>
                        {
                            print("modified - " + notchClassNameVariable.get());
                        }
                    })} */}
                    <box
                        className={bind(notchClassNameVariable)}
                    ></box>
                </button>
            </box>
        </window>
    );
}
