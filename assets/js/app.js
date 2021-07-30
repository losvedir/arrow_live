// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import "react-phoenix"
import {Socket} from "phoenix"
import topbar from "topbar"
import {LiveSocket} from "phoenix_live_view"
import DatePicker from "react-datepicker"
import * as React from 'react';
import * as ReactDOM from 'react-dom';

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

function TestComponent(props) {
  const [startDate, setStartDate] = React.useState(new Date());
  return React.createElement(DatePicker, {selected: startDate, onChange: (date) => setStartDate(date), name: "datepicker-comp"});
}

document.querySelectorAll(".date-picker-component").forEach(dpc => {
  console.log(dpc);
  ReactDOM.render(React.createElement(TestComponent, {}, null), dpc);
})

window.TestComponent = TestComponent;
window.React = React;
window.ReactDOM = ReactDOM;
window.Components = {
  DatePicker,
  TestComponent
}
