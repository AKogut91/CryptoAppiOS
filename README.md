
## 🧠 Prompt for Generating a SwiftUI Crypto App (MVVM + REST API)

Create a SwiftUI app that fetches cryptocurrency market data and derivatives exchange data from the CoinGecko REST API, using MVVM architecture.

## Requirements:
Use MVVM pattern to separate logic.

Create a reusable NetworkService to perform generic API requests.
Define API base URL https://api.coingecko.com/api/v3/ and two endpoints:
coins/markets (with vs_currency=usd and optional params)
derivatives/exchanges

## Show results in a ListView with a segmented Picker toggle for:
Coin Markets
Derivatives Exchanges

Set the Navigation title to "Crypto Info"

## Each list item should include:
Coin image and price (for market coins)
Exchange name, country, and year (for exchanges)

## API failure
On API failure, display an Alert with the title: "Request is Failured"
