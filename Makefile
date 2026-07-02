-include .env

deploy-busd:
	forge script script/DeployBUSD.s.sol --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify -vvvv

deploy-ccnft:
	forge script script/DeployCCNFT.s.sol --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify -vvvv
