import React from 'react';
import './App.css';
import { ImageViewer } from './components/image-viewer';

function App() {
	return (
		<div className="App">
			{/* <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a> */}
			<ImageViewer />
		</div>
	);
}

export default App;
