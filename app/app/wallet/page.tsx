"use client";
import Header from "@/components/header";
import style from "../style/wallet.module.css";
import { useAccount } from "wagmi";
import Contract from "../../../out/Token.sol/Token.json";
import { ethers } from "ethers";
import { useSearchParams } from "next/navigation";

export default function Wallet() {
  const searchParams = useSearchParams();
  const adresse = searchParams.get("adresse");
  return (
    <main>
      <Header />
      <section className={style.section}>
        <div className={style.box}>
          <p className={style.adresse}>{adresse}</p>
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
    </main>
  );
}
