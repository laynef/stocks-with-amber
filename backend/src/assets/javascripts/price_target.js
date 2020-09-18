import * as React from 'react';
import axios from 'axios';


export default function() {
    const [data, setData] = React.useState({});

    React.useEffect(() => {
        axios.get(`https://finnhub.io/api/v1/stock/price-target?symbol=${window.STOCK.symbol}&token=bthpmc748v6rsb748n50`)
        .then((res) => setData(res.data))
        .catch((error) => console.error(error))
    }, []);

    return (
        <div className="w-100">
            <h2>Price Target</h2>
            <div className="w-100 d-flex flex-column card">
                <div>Date: {data.lastUpdated}</div>
                <div>Target High: {(data.targetHigh || -1).toFixed(2)}</div>
                <div>Target Low: {(data.targetLow || -1).toFixed(2)}</div>
                <div>Target Mean: {(data.targetMean || -1).toFixed(2)}</div>
                <div>Target Median: {(data.targetMedian || -1).toFixed(2)}</div>
            </div>
        </div>
    )
}