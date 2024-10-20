import Workspaces from "./workspaces/workspaces.js";

const Center = () => {
    return Widget.Box({
        class_name: "center",
        children: [
            Workspaces(),
        ],
    })
}

export default Center;