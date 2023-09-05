"use client";
import staking from "../public/proof-of-stake.svg";
import Image from "next/image";
import style from "../app/style/stak.module.css";
import { useRouter } from "next/navigation";

export default function Stak() {
  const router = useRouter();
  return (
    <div className={style.princ}>
      <div className={style.ann}>
        <p> Staker vos Mate </p>
        <input
          type="button"
          value="Nouvelle position"
          onClick={() => router.push("/")}
        />
      </div>

      <div className={style.bloc}>
        <Image src={staking} alt="staking" height={100} />
        <p>Votre position de staking apparaitra ici</p>
      </div>
    </div>
  );
}
