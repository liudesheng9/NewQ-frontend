import { createRoot } from 'react-dom/client';
import './index.css';
import './icomoon/style.css';
import App from './App';
//import {elevate} from './infrastructure/elevator';
import * as serviceWorkerRegistration from './serviceWorkerRegistration';

//elevate();
const container = document.getElementById('root');
const root = createRoot(container); // createRoot(container!) if you use TypeScript
root.render(<App tab="home" />);

serviceWorkerRegistration.register();
