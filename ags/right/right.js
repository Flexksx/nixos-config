import SystemInfo from "./system/system.js";

const Right = () => {

    return Widget.Box({
        hpack: "end",
        spacing: 8,
        children: [
            // Volume(),
            SystemInfo(),
            // Clock(),
            // SysTray(),
        ],
    })
}

export default Right;