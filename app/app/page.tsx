"use client";
import Header from "@/components/header";
import staking from "../public/proof-of-stake.svg";
import Image from "next/image";
import style from "../app/style/stak.module.css";
import { useAccount } from "wagmi";
import Link from "next/link";

export default function Home() {
  const { address, isConnected } = useAccount();

  function changeType(adresse = "") {
    return adresse.toString();
  }
  const adresse = changeType(address);
  console.log(typeof adresse);
  console.log(adresse);

  return (
    <main>
      <Header />
      <section className={style.princ}>
        <div className={style.ann}>
          <p> Staker vos Mate </p>
          <Link
            href={{
              pathname: "/wallet",
              query: { adresse: JSON.stringify(adresse) },
            }}
          >
            <input
              type="button"
              value="Nouvelle position"
              disabled={true ? !isConnected : false}
            />
          </Link>
        </div>

        <div className={style.bloc}>
          <Image src={staking} alt="staking" height={100} />
          <p>Votre position de staking apparaitra ici</p>
        </div>
      </section>
    </main>
  );
}
