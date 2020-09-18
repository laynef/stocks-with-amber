import * as React from 'react';
import { finnhubClient } from './finnhub';

export default function() {
    const [data, setData] = React.useState(null);

    finnhubClient.recommendationTrends("AAPL", (error, data, response) => {
        setData(data);
    });

    return (
        <div className="w-100">
            <h2>Recommendations</h2>
        </div>
    )
}