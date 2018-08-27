To avoid common attacks, I made sure to use require that sanitizes input before any code that could edit the contract's storage. I have not used any .send or .transfer functions, so I did not need to worry about a majority of relevant spending attacks. My contracts do not rely on exposed secrets since it is explicitly to publically proove existence of data. In order to avoid some potential poison data attacks, I limited the datahash to one per user address so that a specific address could not overflow with data. This is a deliberate design choice to limit 1 file to 1 address in the users_datahash state variable. 
I also decided to use block number instead of relying on time since timestamps are unreliable given potential miner attacks. This is not an exhaustive list of potential attacks, though I beieve that I've taken measures to guard again the primary attacks that are relevant to my dapp's use cases.