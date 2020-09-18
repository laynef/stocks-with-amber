import * as React from 'react';


export default function() {
    const [tradeData, setTradeData] = React.useState(null)

    const socket = new WebSocket('wss://ws.finnhub.io?token=bthpmc748v6rsb748n50');

    socket.addEventListener('open', function (event) {
        socket.send(JSON.stringify({'type':'subscribe', 'symbol': window.STOCK.symbol }))
    });

    socket.addEventListener('message', function (event) {
        setTradeData(event.data);
    });

    return (
        <div className="w-100">
            <h2>Live Price: {tradeData && tradeData.data && tradeData.data.length ? tradeData.data[0].p : 'N/A'}</h2>
        </div>
    )
}