"use client";
import style from "@/app/style/wallet.module.css";
import Header from "../../components/header";
import { useSearchParams } from "next/navigation";

export function TokenComp({ data }) {
  const searchParams = useSearchParams();
  const adresse = searchParams.get("adresse");
  return (
    <main>
      <Header />
      <section className={style.section}>
        <div className={style.box}>
          <p className={style.adresse}>{adresse}</p>
          <p className={style.montant}> {data} Mate</p>
          <p className={style.montant1}> Montant a envoyer </p>
          <input type="number" className={style.form} />
          <p className={style.montant1}> Adresse expediteur </p>
          <input type="text" className={style.form} placeholder="Adresse" />
          <br />
          <input type="submit" value="Envoyer" className={style.sub} />
        </div>
      </section>
      <p> No connexted </p>
    </main>
  );
}
