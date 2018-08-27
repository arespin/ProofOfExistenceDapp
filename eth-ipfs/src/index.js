import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
//import App from './App';
import App from './PoeApp';
import registerServiceWorker from './registerServiceWorker';

/*https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#adding-a-stylesheet
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap/dist/css/bootstrap-theme.css'; */


ReactDOM.render(<App />, document.getElementById('root'));
registerServiceWorker();

