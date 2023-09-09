'use client'
import { ethers} from "ethers";
import Contract from "../../../out/Token.sol/Token.json";
import { TokenComp } from "@/components/client/token";
import { useEthersProvider, useEthersSigner } from "@/components/server/token";

const getBalance = async () => {
  const owner = useEthersSigner();
  const Token = new ethers.Contract(
    "0x5fbdb2315678afecb367f032d93f642f64180aa3",
    Contract.abi,
    owner,
  );
  const balance = await Token.balanceOf(owner);
  return balance;
};

export default async function Token() {
  const data = await getBalance();
  return (
    <main>
      <TokenComp data={data} />
    </main>
  );
}
