import React from 'react'
import ReactDOM from 'react-dom'

import Menu from './components/Menu.jsx'
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'

class App extends React.Component {
  render(){
    return(
      <div>
        <Menu title="Shrink your URL"/>
        <h1>React APP!</h1>
      </div>
    )
  }
}

ReactDOM.render(
  (
    <MuiThemeProvider>
      <App />
    </MuiThemeProvider>
  ), 
  document.getElementById("main")
)