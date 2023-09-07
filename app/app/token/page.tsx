"use client";
import Header from "../../components/header";
import { useAccount } from "wagmi";
import style from "../style/wallet.module.css";

export default function Token() {
  const { address, isConnected } = useAccount();
  return (
    <section>
      <Header />
      {isConnected && (
        <section className={style.section}>
          <div className={style.box}>
            <p className={style.adresse}>{address}</p>
            <p className={style.montant}> Montant </p>
            <p className={style.montant1}> Montant a envoyer </p>
            <input type="number" className={style.form} />
            <p className={style.montant1}> Adresse expediteur </p>
            <input type="text" className={style.form} placeholder="Adresse" />
            <br />
            <input type="submit" value="Envoyer" className={style.sub} />
          </div>
        </section>
      )}
      {!isConnected && <p> No connected</p>}
    </section>
  );
}
