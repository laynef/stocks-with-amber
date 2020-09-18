import * as React from 'react';
import Recommendations from './recommends';
import PriceTarget from './price_target';


export default function() {
    return (
        <div className="w-100">
            <Recommendations />
            <PriceTarget />
        </div>
    )
}