import { Variable } from "astal";
import Battery from "gi://AstalBattery";
import { bind } from "astal";

export default function BatteryLevel() {
    const bat = Battery.get_default()
    return <box className="battery_level"
        visible={bind(bat, "isPresent")}
    >
        <circularprogress className="circular_progress" value={bind(bat, "percentage")} >
            <label label={bind(bat, "percentage").as(p =>
                `${Math.floor(p * 100)}`
            )} />
        </circularprogress>
    </box>
}