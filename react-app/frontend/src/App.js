import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          <i> Yo, yo, yo - Hello and Welcome! </i> <font size="2">(version: 1.2.0)</font>
        </p>
        <hr color="blue" size="3" width="50%"/>
        <p>
          You can change the file "<code>src/App.js</code>" to customize this page.
	  <br />
          Then <b>save</b> to update.
        </p>
        <hr color="green" size="5" width="100"/>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
