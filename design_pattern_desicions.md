I implemented a circuit breaker on lines 18-21 of PoExistence.sol. I chose to use this emergency stop in the event that the state variable datahash_metadata has a blocknumber that is greater than the current block. This would indicate that the contract has been comprimised because someone was able to upload a file that says it existed in the future ( at a future block).

I chose not to restrict access to PoExistence.sol's variables since the whole point of the contract is that the data is extremely publically available. That being said, I made the circuitBreaker flag private because it is data that is only relevant to attackers. I made stringToBytes32 a pure function since it is the main function for potential input overflow attacks, and it does not need to modify any state variables.I also chose to Fail early and fail loud by using my require statements as early as possible in their corresponding functions. I chose not to include Mortal or Auto Depreciation design patterns since the whole point of the dapp is to prove that data at one point in time existed, and should in theory proof should live on the blockchain in perpetuity. These sorts of design patterns would mainly open up potential for attacks in my eyes.