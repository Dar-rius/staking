import style from "../style/wallet.module.css";
import { ethers } from "ethers";
import Contract from "../../../out/Token.sol/Token.json";
import Header from "../../components/header";

const getBalance = async (address: string) => {
  const provider = new ethers.JsonRpcProvider("http://127.0.0.1:8545");
  const Token = new ethers.Contract(
    "0x5fbdb2315678afecb367f032d93f642f64180aa3",
    Contract.abi,
    provider,
  );
  return await Token.balanceOf(address);
};

export default async function Token() {
  return (
    <main>
      <Header />
      {  && (
        <section className={style.section}>
          <div className={style.box}>
            <p className={style.adresse}>{}</p>
            <p className={style.montant}> {} Mate</p>
            <p className={style.montant1}> Montant a envoyer </p>
            <input type="number" className={style.form} />
            <p className={style.montant1}> Adresse expediteur </p>
            <input type="text" className={style.form} placeholder="Adresse" />
            <br />
            <input type="submit" value="Envoyer" className={style.sub} />
          </div>
        </section>
      )}

      <p> No connexted </p>
    </main>
  );
}
