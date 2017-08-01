import React from 'react'
import PropTypes from 'prop-types'
import AppBar from 'material-ui/AppBar'

const Menu = (props) => {
  return(
    <AppBar 
      title={props.title}
      showMenuIconButton={false}
    />
  )
}

Menu.propTypes = {
  title: PropTypes.string.isRequired
}

Menu.defaultProps = {
  title: 'Title'
}

export default Menu