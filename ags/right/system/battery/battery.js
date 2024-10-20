const battery = await Service.import("battery");

const getBatteryValue = () => {
    return battery.bind("percent").as(p => p > 0 ? p / 100 : 0);
}

const getBatteryIcon = () => {
    return battery.bind("percent").as(p => `battery-level-${Math.floor(p / 10) * 10}-symbolic`)
}

const Battery = () => {
    const value = getBatteryValue().as(p => `${Math.floor(p * 100)}%`);
    const icon = getBatteryIcon();
    return Widget.Box({
        class_name: "battery",
        visible: battery.bind("available"),
        children: [
            Widget.Icon({ icon: icon }),
            Widget.Label({ label: value }),
        ],
    })
}

export default Battery;