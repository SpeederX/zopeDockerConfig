import * as React from 'react';
import { DataGrid } from '@material-ui/data-grid';
import { useState } from 'react';

function DataTable(props){

    constructor(props){
        React.Component(props);
        this.state = {
            loading: true,
            data:[],
        }

        if(this.props.api){
            // has api defined to load from
        } else {
            this.columns = this.props.headers
            this.rows = this.props.data;
        }
    }

    componentDidMount(){
        // griglia renderizzata, carico la API se è definita.
        if(this.props.api){

        }

    }

    render () {
        return (
            <div style={{ height: 400, width: '100%' }}>
                <DataGrid rows={this.rows} columns={this.columns} pageSize={5} checkboxSelection />
            </div>
        );
    }

}

export default DataTable;