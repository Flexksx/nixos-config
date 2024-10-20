import Variable from "resource:///com/github/Aylur/ags/variable.js";
import { pollInterval } from "./settings.js";

const temperaturePath = "/sys/class/thermal/thermal_zone0/temp";
const command = "cat " + temperaturePath;
export const temp = Variable(0, {
    poll: [
        pollInterval,
        command,
        out => Number.parseInt(out) / 1000,
    ],
});


export const Temperature = () => {
    console.log(temp.bind("value"));
    return Widget.Box({
        class_name: "temperature",
        children: [
            Widget.Label({
                label: temp.bind("value").as(v => `${v.toFixed(1)}°C`),
            }),
        ],
    });
}
