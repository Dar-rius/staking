"use client";
import Header from "@/components/header";
import style from "../style/wallet.module.css";
import { useAccount } from "wagmi";

export default function Wallet() {
  const { address, isConnected } = useAccount();
  return (
    <main>
      <Header />
      {isConnected && (
        <section className={style.section}>
          <div className={style.box}>
            <p className={style.adresse}>{address}</p>
            <p className={style.montant}> Montant </p>
            <p className={style.montant1}> Montant a staker </p>
            <input type="number" className={style.form} />
            <div className={style.infos}>
              <p>
                Taux par seconde: <span>%</span>
              </p>
              <p>
                Duree totale: <span>s</span>
              </p>
            </div>
            <input type="submit" value="Staker" className={style.sub} />
          </div>
        </section>
      )}
      {!isConnected && <p> No connected</p>}
    </main>
  );
}
