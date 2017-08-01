import React from 'react'
import PropTypes from 'prop-types'
import TextField from 'material-ui/TextField'
import { Table, TableBody, TableHeader, TableHeaderColumn, TableRow, TableRowColumn } from 'material-ui/Table'

class Editor extends React.Component {
  state = {
    data: [
      { id: 1, shorten: 'el', origin: 'http://www.baidu.com', visit: 4 },
      { id: 2, shorten: 'em', origin: 'http://www.sina.com.cn', visit: 4 },
      { id: 3, shorten: 'en', origin: 'http://www.google.com', visit: 4 },
      { id: 4, shorten: 'eo', origin: 'http://www.github.com', visit: 4 },
      { id: 5, shorten: 'ep', origin: 'http://www.weibo.com', visit: 4 },
      { id: 6, shorten: 'eq', origin: 'http://www.wechat.com', visit: 4 },
      { id: 7, shorten: 'er', origin: 'http://www.tencent.com', visit: 4 }
    ]
  }

  render() {
    return(
      <div>
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
                    <TableRowColumn>{v.visit}</TableRowColumn>
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