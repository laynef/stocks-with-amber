import * as React from 'react';
import axios from 'axios';


export default function() {
    const [redData, setRecData] = React.useState([]);

    const getTotal = (data) => data.buy + data.sell + data.hold + data.strongBuy + data.strongSell;
    const getPercentage = (data, type) => ((data[type] / getTotal(data)) * 100).toFixed(2);

    React.useEffect(() => {
        axios.get(`https://finnhub.io/api/v1/stock/recommendation?symbol=${window.STOCK.symbol}&token=bthpmc748v6rsb748n50`)
        .then((res) => setRecData(res.data))
        .catch((error) => console.error(error))
    }, []);

    return (
        <div className="w-100">
            <h2>Recommendations</h2>
            <div className="w-100 d-flex flex-wrap">
                {redData.slice(0, 3).map((rec, i) => (
                    <div className="col-sm-12 col-md-6 col-lg-4 d-flex flex-column mb-3 card" key={i}>
                        <div>Date: {rec.period}</div>
                        <div>Buy: {getPercentage(rec, 'buy')}%</div>
                        <div>Sell: {getPercentage(rec, 'sell')}%</div>
                        <div>Hold: {getPercentage(rec, 'hold')}%</div>
                        <div>Strong Buy: {getPercentage(rec, 'strongBuy')}%</div>
                        <div>Strong Sell: {getPercentage(rec, 'strongSell')}%</div>
                    </div>
                ))}
            </div>
        </div>
    )
}