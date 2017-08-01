import React from 'react'
import PropTypes from 'prop-types'
import TextField from 'material-ui/TextField'
import { Table, TableBody, TableHeader, TableHeaderColumn, TableRow, TableRowColumn } from 'material-ui/Table'
import Config from 'Config'

class Editor extends React.Component {
  constructor(props) {
    super()
    this.state = {
      data: []
    }
    this.fetchURLData = this.fetchURLData.bind(this)
    this.fetchURLData()
  }

  fetchURLData() {
    const host = Config.host
    return fetch(`${host}/api/urls`)
      .then(response => response.json())
      .then(json => this.setState({data: json}))
  }

  render() {
    return(
      <div>
        <br/>
        <TextField
          hintText="e.g.: http:// ..."
          floatingLabelText="input your URL here"
        />
        <br/>
        <br/>
        <Table multiSelectable={false}>
          <TableHeader adjustForCheckbox={false} displaySelectAll={false}>
            <TableRow>
              <TableHeaderColumn colSpan="4" >
                <h2 style={{textAlign: 'center'}}>Dashboard</h2>
              </TableHeaderColumn>
            </TableRow>
            <TableRow>
              <TableHeaderColumn>ID</TableHeaderColumn>
              <TableHeaderColumn>Shorten URL</TableHeaderColumn>
              <TableHeaderColumn>Origin URL</TableHeaderColumn>
              <TableHeaderColumn>Visits</TableHeaderColumn>
            </TableRow>
          </TableHeader>
          <TableBody displayRowCheckbox={false}>
            {
              this.state.data.map((v, index) => {
                return(
                  <TableRow key={v.id}>
                    <TableRowColumn>{v.id}</TableRowColumn>
                    <TableRowColumn>{v.shorten}</TableRowColumn>
                    <TableRowColumn>{v.origin}</TableRowColumn>
                    <TableRowColumn>{v.count}</TableRowColumn>
                  </TableRow>
                )
              })
            }
          </TableBody>
        </Table>
      </div>

    )
  }
}

export default Editor