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
            <h1 className="App-title"> Welcome to Fibonacci Calculator! </h1>
            | <Link to="/">Home</Link> |
            | <Link to="/otherpage">Another Page</Link> |
              <br/>
          </header>
          <div>
            <br/>
            <Route exact path="/" component={Fib} />
            <Route path="/otherpage" component={OtherPage} />
          </div>
          <footer>
            <hr color="blue" size="1" width="50%"/>
	    <h2>
              <font size="2">
                Powered by: <a href="https://reactjs.org/">React</a> |
                Created with: <a href="https://kubernetes.io/">Kubernetes</a>, <a href="https://www.terraform.io/">Terraform (WIP)</a> & <a href="https://jenkins.io/">Jenkins (WIP)</a>
              <br/>
                Hosted on: <a href="https://aws.amazon.com/">AWS</a> |
                Training/Project from: <a href="https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/">Udemy</a> |
                Source files: <a href="https://github.com/pataraco/d4r-k8s/tree/master/fibo-k8s">GitHub</a>
              </font>
	    </h2>
            <hr color="blue" size="1" width="50%"/>
            <p><font size="2">(Version: 0.1.1)</font></p>
          </footer>
        </div>
      </Router>
    );
  }
}

export default App;
