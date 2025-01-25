import Apps from "gi://AstalApps"
import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import { Variable } from "astal"


function negate(value: boolean) {
    return !value;
}

export default function DynamicNotch(gdkmonitor: Gdk.Monitor) {
    const notchHoveredState = Variable("unhovered")

    function setIsHovered() {
        notchHoveredState.set("hovered")
        print("Dynamic notch hovered. Set to " + notchHoveredState.get())
    }

    function setNotHovered() {
        notchHoveredState.set("unhovered")
        print("Dynamic notch unhovered. Set to " + notchHoveredState.get())
    }

    return (
        <window
            // name="dynamic-notch-app"
            className="DynamicNotch"
            gdkmonitor={gdkmonitor}
            anchor={Astal.WindowAnchor.TOP}
            exclusivity={Astal.Exclusivity.IGNORE}
            application={App}
        >
            <box>
                <button onHover={setIsHovered} onHoverLost={setNotHovered} css={"background: transparent"}>

                    <box className={`dynamic-notch ` + notchHoveredState.get()}>
                        Dynamic notch
                    </box>

                </button>
            </box >
        </window >
        // <button className={"dynamic-notch"}>
        //     <label>Dynamic Notch</label>
        // </button>
    );
}