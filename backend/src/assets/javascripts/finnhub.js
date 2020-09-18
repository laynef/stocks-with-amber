const finnhub = require('finnhub');
 
const api_key = finnhub.ApiClient.instance.authentications['api_key'];
api_key.apiKey = "bthpmc748v6rsb748n50"

export const finnhubClient = new finnhub.DefaultApi()
