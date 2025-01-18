import { App } from "astal/gtk3"
import style from "./style/main.scss"
import Bar from "./bar/Bar"
import BackgroundSelector from "./background-selector/BackgroundSelector"
App.start({
    css: style,
    main() {
        App.get_monitors().map(Bar)
    },
})
