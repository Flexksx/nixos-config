import { Variable } from "astal";

const cpuUsageCommand = "awk -v prev_idle=0 -v prev_total=0 'NR==1 {prev_idle=$5; for(i=2; i<=NF; i++) prev_total+=$i} NR==2 {idle=$5; total=0; for(i=2; i<=NF; i++) total+=$i; print 100 * (1 - (idle - prev_idle) / (total - prev_total))}' <(cat /proc/stat; sleep 1; cat /proc/stat)"
// const cpuUsage = Variable("").poll(15000, cpuUsageCommand)
// console.log(cpuUsage);


export default function CpuUsage() {
    try {
        const cpuUsage = Variable("").poll(15000, cpuUsageCommand)
        return <box className="cpu-usage">
            <label label={cpuUsage()} />
        </box>
    }
    catch (e) {
        console.log(e);
    }
    const cpuUsage = Variable("").poll(15000, cpuUsageCommand)
    return <box className="cpu-usage">
        <label label={cpuUsage()} />
    </box>
}

