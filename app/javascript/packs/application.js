import "channels"
import "./applications.scss"
import "./components/_field.scss"
import "./components/_button.scss"
import "./components/_table.scss"
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
