const hyprland = await Service.import("hyprland")
import { icons } from "./iconsMap.js"

const getIcon = (/** @type {string} */ name) => {
    for (const [pattern, icon] of Object.entries(icons)) {
        if (new RegExp(pattern).test(name)) {
            return icon
        }
    }
    return ""
}

const getClientsInWorkspace = (/** @type {number} */ id) => {
    return hyprland.clients.filter(c => c.workspace.id === id);
}

const getIconsForWorkspace = (/** @type {number} */ id) => {
    const clients = getClientsInWorkspace(id)
    const names = clients.map(c => c.initialClass)
    const icons = names.map(getIcon)
    return icons.join(" ")
}

const getActiveWorkspace = () => {
    return hyprland.active.workspace.bind("id")
}


const getWorkspaces = () => {
    return hyprland.bind("workspaces")
}

const createWorkspaceButton = (/** @type {number} */ id) => {
    const className = getActiveWorkspace().as(i => `${i === id ? "focused" : "notfocused"}`)
    const icons = getIconsForWorkspace(id)

    return Widget.Button({
        on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
        css: "background-color:transparent",
        label: `${id}  ${icons}`,
        class_name: className,
    })
}

const instantiateWorkspaceButtons = () => {
    return getWorkspaces().as(ws => ws.map(({ id }) => createWorkspaceButton(id)))
}

const Workspaces = () => {
    const workspaces = instantiateWorkspaceButtons()
    return Widget.Box({ children: workspaces, class_name: "workspaces" })
}

// const dispatch = (arg: string | number) => hyprland.messageAsync(`dispatch workspace ${arg}`)
export default Workspaces;