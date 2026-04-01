const hre = require("hardhat");

async function main() {
  const SBT = await hre.ethers.getContractFactory("SoulboundIdentity");
  const sbt = await SBT.deploy("Web3 Pioneer Badge", "WPIONEER");

  await sbt.waitForDeployment();
  console.log("Soulbound Token deployed to:", await sbt.getAddress());

  // Example: Minting to a contributor
  const contributor = "0x..."; 
  await sbt.safeMint(contributor);
  console.log("Badge issued to soul:", contributor);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
