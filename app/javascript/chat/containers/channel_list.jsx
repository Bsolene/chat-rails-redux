import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { selectChannel, fetchMessages } from '../actions/index';

class ChannelList extends Component {
  handleClick = (channel) => {
    this.props.selectChannel(channel);
    this.props.fetchMessages(channel);
  }

  renderChannel = (channel) => {
    return (
      <Link to={`/channels/${channel}`} key={channel}>
        <li
          key={channel}
          className={channel === this.props.selectedChannel ? 'active' : null}
          onClick={() => this.handleClick(channel)}>
          #{channel}
        </li>
      </Link>
    )
  }

  render() {
    return (
      <div className="channels-container">
        <span>Redux Chat</span>
        <ul>
          {this.props.channels.map(this.renderChannel)}
        </ul>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    channels: state.channels,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ selectChannel, fetchMessages }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ChannelList);
