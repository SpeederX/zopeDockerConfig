import logo from './logo.svg';
//import './App.css';
import DataTable from './DataTable'
import CssBaseline from '@material-ui/core/CssBaseline';

function App() {
  return (
    <div className="App">
      <CssBaseline />
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
        <DataTable
        data={[{id:1,message:'test1'},{id:2,message:'test2'}]}
        headers={[{field:'id',headerName:'ID',type:'number',width:100},{field:'message',headerName:'Messaggio',width:100}]} />
    </div>
  );
}

export default App;
