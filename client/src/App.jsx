import React from 'react'
import ReactDOM from 'react-dom'
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'

import Menu from './components/Menu.jsx'
import Editor from './components/Editor.jsx'

const styles = {
  editor: {
    width: '60%',
    margin: 'auto'
  }
}
class App extends React.Component {
  render(){
    return(
      <div>
        <Menu title="Shrink your URL"/>
        <div style={styles.editor}>
          <Editor />
          <br/>
        </div>
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