-include .env

deploy-busd:
	forge script script/DeployBUSD.s.sol --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify -vvvv

deploy-ccnft:
	forge script script/DeployCCNFT.s.sol --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify -vvvv

# No entiendo porque no funcionó. Terminé aprobando los compradores con Remix.
verify-busd:
	forge verify-contract $(BUSD_ADDRESS) src/BUSD.sol:BUSD --chain sepolia --etherscan-api-key $(ETHERSCAN_API_KEY) --compiler-version 0.8.33

verify-ccnft:
	forge verify-contract $(CCNFT_ADDRESS) src/CCNFT.sol:CCNFT --chain sepolia --etherscan-api-key $(ETHERSCAN_API_KEY) --compiler-version 0.8.33
