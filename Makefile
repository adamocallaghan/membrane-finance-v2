-include .env

deploy-membrane-to-abstract-testnet:
	forge script script/DeployMorpho.s.sol:DeployMorpho --broadcast --legacy --rpc-url $(ABSTRACT_SEPOLIA_RPC) --account deployer -vvvvv