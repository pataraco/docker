import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h1 className="App-title">
              Welcome to Fibonacci Calculator!
              <br/>
              <font size="3">(
                Powered by: <Link to="https://reactjs.org/">React</Link>,
                Created with: <Link to="https://www.terraform.io/">Terraform</Link> & <Link to="https://jenkins.io/">Jenkins</Link>,
                Hosted on: <Link to="https://aws.amazon.com/">AWS</Link>,
                Training/Project from: <Link to="https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/">Udemy</Link>,
                Source files: <Link to="https://github.com/pataraco/docker/tree/master/fibo-web">GitHub</Link>
              )</font>
            </h1>
            | <Link to="/">Home</Link> |
            | <Link to="/otherpage">Another Page</Link> |
            <hr color="blue" size="3" width="50%"/>
          </header>
          <div>
            <br/>
            <br/>
            <Route exact path="/" component={Fib} />
            <Route path="/otherpage" component={OtherPage} />
          </div>
          <footer>
            <p><font size="2">(Version: 0.0.1)</font></p>
          </footer>
        </div>
      </Router>
    );
  }
}

export default App;
