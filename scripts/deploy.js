const deploy = async () => {
  // Deployer allow us to deploy smart contracts to the configured network
  // getSigners is fill automatically with the information from our configuration where we have our private key
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contract with the account:", deployer.address);

  const ztrore = await ethers.getContractFactory("ztrore"); // access the smart contract

  const deployed = await ztrore.deploy();

  console.log("ztrore is deployed at:", deployed.address);
};

deploy()
  .then(() => {
    process.exit(0);
  })
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
