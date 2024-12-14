import { Variable } from "astal";
import Battery from "gi://AstalBattery";
import { bind } from "astal";

export default function BatteryLevel() {
    const bat = Battery.get_default()
    print(bat)
    print(bat.isPresent)
    print(bat.batteryIconName)
    return <box className="Battery"
        visible={bind(bat, "isPresent")}>
        <icon icon={bind(bat, "batteryIconName")} />
        <label label={bind(bat, "percentage").as(p =>
            `${Math.floor(p * 100)} %`
        )} />
    </box>
}