"use client";
import { useConnect, useAccount } from "wagmi";
import { InjectedConnector } from "wagmi/connectors/injected";
import Image from "next/image";
import logoImg from "../public/logo.svg";
import eth from "../public/eth.svg";
import github from "../public/github-mark-white.svg";
import style from "../app/style/header.module.css";

export default function Header() {
  const { address, isConnected } = useAccount();
  const { connect } = useConnect({
    connector: new InjectedConnector(),
  });
  return (
    <header className={style.header}>
      <div className={style.right}>
        <Image src={logoImg} alt="logo" height={60} className={style.logo} />
        <Image src={github} alt="github" height={60} />
      </div>
      {isConnected && (
        <div className={style.ethereum}>
          <Image src={eth} alt="ethereum" height={60} />
          <p>{address}</p>
        </div>
      )}
      {!isConnected && (
        <div className={style.left}>
          <input type="button" onClick={() => connect()} value="Se connecter" />
        </div>
      )}
    </header>
  );
}
