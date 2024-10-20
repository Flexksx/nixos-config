import Variable from "resource:///com/github/Aylur/ags/variable.js";
import { pollInterval } from "./settings.js";

const divide = ([total, free]) => Number.parseInt(free) / Number.parseInt(total);

const cpu = Variable(0, {
    poll: [pollInterval, 'top -b -n 1', out => divide([100, out.split('\n')
        .find(line => line.includes('Cpu(s)'))
        .split(/\s+/)[1]
        .replace(',', '.')])],
})

export const cpuProgress = () => {
    return Widget.CircularProgress({
        css: 'font-size: 5px;',
        class_name: "cpu-progress",
        value: cpu.bind(),
        rounded: true,
        child:
            Widget.Label({
                css: 'font-size: 15px;',
                label: cpu.bind("value").as(p => `${Math.floor(p)}%`),
            }),
    })
}
