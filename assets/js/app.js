// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
// import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import React, { Component, PropTypes } from 'react';
import { render } from 'react-dom';
import thunkMiddleware from 'redux-thunk';
import { compose, createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import { createLogger } from 'redux-logger'
import  modules  from './modules/index'
let { LoginForm } = modules.components;



// Reducers qill be combined from modules
import { combineReducers } from 'redux';
function testReducer(state = {foo: "bar"}) {
  return state
}

// React store, contains all middleware and reducers
const reducers = combineReducers({test: testReducer})
const middleware = applyMiddleware(createLogger())
const store = middleware(createStore)(reducers);

// Some Main Component
import { connect } from 'react-redux';
class App extends Component {
    render() {
        let { test } = this.props;
        return (
            <LoginForm  />
        )
    }
}

let allState = (state) => state;
App = connect(allState)(App);

render(
  <div>
    <Provider store={store}>
        <App />
    </Provider>
  </div>,
  document.getElementById('root')
);