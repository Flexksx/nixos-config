import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import GLib from 'gi://GLib';

const fetchInterval = 1000;
const temperaturePath = '/sys/class/thermal/thermal_zone0/temp';

const uptime = Variable('', {
    poll: [60_000, 'cat /proc/uptime', line => {
        const uptime = Number.parseInt(line.split('.')[0]) / 60;
        if (uptime > 18 * 60)
            return 'Go Sleep';

        const h = Math.floor(uptime / 60);
        const s = Math.floor(uptime % 60);
        return `${h}:${s < 10 ? '0' + s : s}`;
    }],
});

const distro = GLib.get_os_info('ID');

const distroIcon = (() => {
    switch (distro) {
        case 'fedora': return '';
        case 'arch': return '';
        case 'nixos': return '';
        case 'debian': return '';
        case 'opensuse-tumbleweed': return '';
        case 'ubuntu': return '';
        case 'endeavouros': return '';
        default: return '';
    }
})



/** @type {function([string, string] | string[]): number} */
const divide = ([total, free]) => Number.parseInt(free) / Number.parseInt(total);

const cpu = Variable(0, {
    poll: [fetchInterval, 'top -b -n 1', out => divide(['100', out.split('\n')
        .find(line => line.includes('Cpu(s)'))
        ?.split(/\s+/)[1]
        .replace(',', '.') || '0'])],
});

const ram = Variable(0, {
    poll: [fetchInterval, 'free', out => divide(out.split('\n')
        .find(line => line.includes('Mem:'))
        ?.split(/\s+/)
        .splice(1, 2) || ['1', '1'])],
});

const temp = Variable(0, {
    poll: [fetchInterval, 'cat ' + temperaturePath, n => {
        return Number.parseInt(n) / 100_000;
    }],
});

console.log(temp);

const Temperature = () => {
    return Widget.Box({
        class_name: 'temperature',
        children: [
            Widget.Icon({ icon: '' }),
            Widget.Label({ label: temp.value.toFixed(1) + '°C' }),
            Widget.Icon({ icon: '' }),
            Widget.Label({ label: cpu.value.toFixed(0) + '%' }),
            Widget.Icon({ icon: '' }),
            Widget.Label({ label: ram.value.toFixed(0) + '%' }),
            Widget.Icon({ icon: '' }),
            Widget.Label({ label: uptime.value }),
        ],
    });
}

export default Temperature;