import { App } from "astal/gtk3";
import style from "./style/main.scss";
import Bar from "./widgets/bar/Bar";
import { monitorFile } from "astal";
import BackgroundSelector from "./widgets/background-selector/BackgroundSelector";
import Applauncher from "./widgets/app-launcher/AppLauncher";
import DynamicNotch from "./widgets/notch/DynamicNotchApp";

App.start({
    css: style,
    main() {
        App.get_monitors().map(Bar)
        App.get_monitors().map(DynamicNotch)
    },
})

monitorFile("./style/colors.scss", () => {
    print("Reloading CSS") 
    App.reset_css()
    // App.apply_css("./style/colors.scss")
    // App.apply_css("./style/main.scss")
    App.apply_css(style)
})

