require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-web3");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  networks: {
    ropsten: {
      url: "https://eth-ropsten.alchemyapi.io/v2/fFMWf_foJSzmusf_OHEfI7q8XzatT_xH",
      accounts: ["a1b65ad50d78a31e6a3020fe5cae366954693d0f6a365e034d1d54073f05d1f0"], 
    },
  },

};
